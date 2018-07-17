package com.zylaoshi.flutterlearn;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.os.Bundle;
import android.text.TextUtils;
import android.widget.Toast;

import java.text.SimpleDateFormat;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "com.zylaoshi.flutterlearn/android";
  private static final String NET_CHANGE_CHANNEL = "com.zylaoshi.flutterlearn/netChanged";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    new MethodChannel(getFlutterView(),CHANNEL)
            .setMethodCallHandler(new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                System.out.println(methodCall.method);
                if(methodCall.method.equals("showToast")){
                  if (methodCall.hasArgument("msg") && !TextUtils.isEmpty(methodCall.argument("msg").toString())) {
                    Toast.makeText(MainActivity.this, methodCall.argument("msg").toString(), Toast.LENGTH_SHORT).show();
                  } else {
                    Toast.makeText(MainActivity.this, "toast text must not null", Toast.LENGTH_SHORT).show();
                  }
                } else if (methodCall.method.equals("getAndroidTime")) {
                    result.success(getCurrentTime());
                }else if(methodCall.method.equals("netConnection")){
                    boolean networkConnected = NetUtil.isNetworkConnected(getApplicationContext());
                    result.success(networkConnected);
                }

              }
            });
      new EventChannel(getFlutterView(), NET_CHANGE_CHANNEL).setStreamHandler(
              new EventChannel.StreamHandler() {
                  private BroadcastReceiver netStateChangeReceiver;

                  @Override
                  public void onListen(Object arguments, EventChannel.EventSink events) {

                      netStateChangeReceiver = createNetStateChangeReceiver(events);
                      registerReceiver(netStateChangeReceiver, new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION));
                  }

                  @Override
                  public void onCancel(Object arguments) {
                      unregisterReceiver(netStateChangeReceiver);
                      netStateChangeReceiver = null;
                  }
              }
      );
  }
  private String getCurrentTime(){
      return  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis());
  }
  private BroadcastReceiver createNetStateChangeReceiver(final EventChannel.EventSink events) {
      return new BroadcastReceiver() {
          @Override
          public void onReceive(Context context, Intent intent) {
              boolean networkConnected = NetUtil.isNetworkConnected(context);
              events.success(networkConnected?"网络可用":"网络不可用");
          }
      };
  }

}
