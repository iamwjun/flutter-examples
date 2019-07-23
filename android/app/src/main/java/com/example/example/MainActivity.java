package com.example.example;

import java.util.Map;

import org.json.JSONObject;
import com.tencent.mm.opensdk.constants.Build;
import com.tencent.mm.opensdk.modelpay.PayReq;
import com.tencent.mm.opensdk.openapi.IWXAPI;
import com.tencent.mm.opensdk.openapi.WXAPIFactory;
import com.alipay.sdk.app.EnvUtils;
import com.alipay.sdk.app.PayTask;
import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.Manifest;
import android.util.Log;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private IWXAPI api;

  private static final String CHANNEL = "examples.flutter.dev/battery";
  private static final String CHARGING_CHANNEL = "samples.flutter.io/charging";
  private static final String PAY_BROADCAST = "examples.pay.android.broadcast";

  private static final int SDK_PAY_FLAG = 1;
  private static final int SDK_AUTH_FLAG = 2;

  IntentFilter intentFilter;

  @SuppressLint("HandlerLeak")
  private Handler mHandler = new Handler() {
    @SuppressWarnings("unused")
    public void handleMessage(Message msg) {
      Intent intent = new Intent(PAY_BROADCAST);
      intent.putExtra("Msg", msg.obj.toString());
      sendBroadcast(intent);
    };
  };

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    EnvUtils.setEnv(EnvUtils.EnvEnum.SANDBOX);
    super.onCreate(savedInstanceState);
    api = WXAPIFactory.createWXAPI(this, "wx426b3015555a46be");
    requestPermission();
    GeneratedPluginRegistrant.registerWith(this);

    intentFilter = new IntentFilter(PAY_BROADCAST);

    new EventChannel(getFlutterView(), CHARGING_CHANNEL).setStreamHandler(
        new StreamHandler() {
          private BroadcastReceiver chargingStateChangeReceiver;
          private BroadcastReceiver changeStream;
          @Override
          public void onListen(Object arguments, EventSink events) {
            changeStream = createSetStream(events);
            registerReceiver(changeStream, intentFilter);
          }

          @Override
          public void onCancel(Object arguments) {
            unregisterReceiver(changeStream);
            changeStream = null;
          }
        }
    );

    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall call, Result result) {
        switch (call.method) {
          case "getBatteryLevel":
            getBatteryLevel(result);
            break;
          case "alipay":
            final String payInfo = call.argument("payInfo");
            payV2(payInfo);
            break;
          case "wxpay":
            //result.success("微信支付暂不支持");
            final Map<String, String> content = call.argument("payInfo");
            weChatPay(content);
            break;
          case "test":
            multiThreadedTest();
            break;
          default:
            result.notImplemented();
        }
      }
    });
  }

  private void weChatPay(Map<String, String> content){
    System.out.println(content.toString());
    try {
      PayReq request = new PayReq();

      request.appId = content.get("appid");
      request.partnerId = content.get("partnerid");
      request.prepayId = content.get("prepay_id");
      request.packageValue = content.get("package");
      request.nonceStr = content.get("nonce_str");
      request.timeStamp = content.get("timestamp");
      request.sign = content.get("sign");

      showToast(this, "正常调起支付");
      api.sendReq(request);
    } catch (Exception e){
      System.out.println("调起微信支付异常");
    }

  }

  private BroadcastReceiver createChargingStateChangeReceiver(final EventSink events) {
    return new BroadcastReceiver() {
      @Override
      public void onReceive(Context context, Intent intent) {
        int status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1);

        if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
          events.error("UNAVAILABLE", "Charging status unavailable", null);
        } else {
          boolean isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                               status == BatteryManager.BATTERY_STATUS_FULL;
          events.success(isCharging ? "charging" : "discharging");
        }
      }
    };
  }

  private BroadcastReceiver createSetStream(final EventSink events) {
    return new BroadcastReceiver() {
      @Override
      public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        String msg = intent.getStringExtra("Msg");
        events.success(msg);
      }
    };
  }

  private void getBatteryLevel(final Result response) {
    int batteryLevel = -1;
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    } else {
      Intent intent = new ContextWrapper(getApplicationContext()).registerReceiver(null,
          new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100)
          / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
    }
    if (batteryLevel != -1) {
      response.success(batteryLevel);
    } else {
      response.error("UNAVAILABLE", "Battery level not available.", null);
    }
  }

  private static final int PERMISSIONS_REQUEST_CODE = 1002;

  /**
   * 检查支付宝 SDK 所需的权限，并在必要的时候动态获取。
   * 在 targetSDK = 23 以上，READ_PHONE_STATE 和 WRITE_EXTERNAL_STORAGE 权限需要应用在运行时获取。
   * 如果接入支付宝 SDK 的应用 targetSdk 在 23 以下，可以省略这个步骤。
   */
  private void requestPermission() {
    // Here, thisActivity is the current activity
    if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_PHONE_STATE)
            != PackageManager.PERMISSION_GRANTED
            || ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)
            != PackageManager.PERMISSION_GRANTED) {

      ActivityCompat.requestPermissions(this,
              new String[]{
                      Manifest.permission.READ_PHONE_STATE,
                      Manifest.permission.WRITE_EXTERNAL_STORAGE
              }, PERMISSIONS_REQUEST_CODE);

    } else {
      showToast(this, "Required permissions have already been granted to AlipaySDK");
    }
  }

  public void payV2(String orderInfo) {
    final Runnable payRunnable = new Runnable() {
      @Override
      public void run() {
        try {
          PayTask alipay = new PayTask(MainActivity.this);
          Map<String, String> result = alipay.payV2(orderInfo, true);
          Log.i("msp", result.toString());
          System.out.println("success");

          Message msg = new Message();
          msg.what = SDK_PAY_FLAG;
          msg.obj = result;
          mHandler.handleMessage(msg);
        } catch (Exception e) {
          System.out.println("error");
        }
      }
    };

    //必须异步调用
    Thread payThread = new Thread(payRunnable);
    payThread.start();
  }

  public void multiThreadedTest() {
    final Runnable payRunnable = new Runnable() {
      @Override
      public void run() {
        try{
          Message msg = new Message();
          msg.what = SDK_PAY_FLAG;
          msg.obj = "多线程成功";
          mHandler.handleMessage(msg);
        } catch (Exception e){
          System.out.println(e.toString());
        }
      }
    };

    //必须异步调用
    Thread payThread = new Thread(payRunnable);
    payThread.start();
  }

  private static void showToast(Context ctx, String msg) {
    Toast.makeText(ctx, msg, Toast.LENGTH_LONG).show();
  }
}
