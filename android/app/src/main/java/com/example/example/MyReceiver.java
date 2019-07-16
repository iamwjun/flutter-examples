package com.example.example;

import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.Context;

public class MyReceiver extends BroadcastReceiver {
    public MyReceiver() {
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        System.out.println("广播开始");
    }
}