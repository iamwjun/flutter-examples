package com.example.example;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.os.Handler;
import android.os.Message;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.os.Message;
import android.Manifest;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;

import com.alipay.sdk.app.EnvUtils;
import com.alipay.sdk.app.PayTask;

import java.util.Map;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "examples.flutter.dev/battery";

  private static final int SDK_PAY_FLAG = 1;
  private static final int SDK_AUTH_FLAG = 2;

  @SuppressLint("HandlerLeak")
  private Handler mHandler = new Handler() {
    @SuppressWarnings("unused")
    public void handleMessage(Message msg, final MethodChannel.Result result) {
      System.out.println(msg.obj.toString());
      result.success("支付成功");
    };
  };

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    EnvUtils.setEnv(EnvUtils.EnvEnum.SANDBOX);
    super.onCreate(savedInstanceState);
    requestPermission();
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodCallHandler() {
      @Override
      public void onMethodCall(final MethodCall call, final Result result) {
        switch (call.method) {
          case "getBatteryLevel":
            int batteryLevel = getBatteryLevel();

            if (batteryLevel != -1) {
              result.success(batteryLevel);
            } else {
              result.error("UNAVAILABLE", "Battery level not available.", null);
            }
            break;
          case "alipay":
            final String payInfo = call.argument("payInfo");
            payV2(payInfo);
            break;
          case "wxpay":
            result.success("微信支付暂不支持");
            break;
          case "test":
            multiThreadedTest();
            break;
          default:
            result.notImplemented();
        }
        // if (call.method.equals("getBatteryLevel")) {
        //   int batteryLevel = getBatteryLevel();

        //   if (batteryLevel != -1) {
        //     result.success(batteryLevel);
        //   } else {
        //     result.error("UNAVAILABLE", "Battery level not available.", null);
        //   }
        // } else if (call.method.equals("sendPaymentParameters")) {
        //   final String payInfo = call.argument("payInfo");
        //   payV2(payInfo);
        // } else {
        //   result.notImplemented();
        // }
      }
    });
  }

  private int getBatteryLevel() {
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

    return batteryLevel;
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
      //showToast(this, getString(R.string.permission_already_granted));
    }
  }

  public void payV2(String orderInfo) {
    final Runnable payRunnable = new Runnable() {
      @Override
      public void run() {
        PayTask alipay = new PayTask(MainActivity.this);
        Map<String, String> result2 = alipay.payV2(orderInfo, true);
        Log.i("msp", result2.toString());
        System.out.println("success");

        Message msg = new Message();
        msg.what = SDK_PAY_FLAG;
        msg.obj = result2;
//        result1.success(result);
        mHandler.handleMessage(msg);
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

        Message msg = new Message();
        msg.what = SDK_PAY_FLAG;
        msg.obj = "测试多线程";
//        result1.success(result);
        mHandler.handleMessage(msg);
      }
    };

    //必须异步调用
    Thread payThread = new Thread(payRunnable);
    payThread.start();
  }

  /*
   * 参考 https://www.programcreek.com/java-api-examples/?code=markmooibroek/apn_fb_login/apn_fb_login-master/android/src/main/java/com/appnormal/plugin/fblogin/ApnFbLoginPlugin.java#
   */
//  private void resultWithCallback(FacebookCallback<LoginResult> callback) {
//    mCallbackManager = CallbackManager.Factory.create();
//    LoginManager.getInstance().registerCallback(mCallbackManager, callback);
//    LoginManager.getInstance().logInWithReadPermissions(activity, Arrays.asList("public_profile", "email"));
//  }
//
//  private void queryMe(Result result) {
//    GraphRequest request = GraphRequest.newMeRequest(
//            AccessToken.getCurrentAccessToken(),
//            (object, response) -> {
//              try {
//                result.success(JsonConverter.convertToMap(object));
//              } catch (JSONException e) {
//                result.error(TAG, "Error", e.getMessage());
//              }
//            });
//
//    Bundle parameters = new Bundle();
//    parameters.putString("fields", "id,name,email");
//    request.setParameters(parameters);
//    request.executeAsync();
//  }
}
