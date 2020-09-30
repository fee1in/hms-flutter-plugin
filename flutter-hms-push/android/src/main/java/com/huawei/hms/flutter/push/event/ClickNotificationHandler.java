package com.huawei.hms.flutter.push.event;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import com.huawei.hms.flutter.push.constants.Method;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class ClickNotificationHandler {
    private static ClickNotificationHandler instance ;
    private boolean isRegister;
    private Intent mIntent;
    private MethodChannel channel;
    private static final String TAG = "ClickNotification";

    public static ClickNotificationHandler getInstance() {
        if(instance == null){
            instance = new ClickNotificationHandler();
        }
        return instance;
    }


    public void setChannel(MethodChannel channel) {
        this.channel = channel;
    }


    public void register(MethodCall call, MethodChannel.Result result) {
        if (isRegister) {
            result.success(true);
            return;
        }

        isRegister = true;

        if (mIntent != null) {
            handleIntent(mIntent);
        }
        result.success(isRegister);
    }

    public  void unRegister(){
        instance = null;
    }

    public void handleIntent(Intent intent) {
        Log.d(TAG, "handleIntent:" + intent.getExtras());
        if (!isRegister) {
            mIntent = intent;
            return;
        }
        mIntent = null;

        Map<String, Object> map = new HashMap<>();
        Bundle bundle = intent.getExtras();
        if (bundle != null) {
            for (String key : bundle.keySet()) {
                Object content = bundle.get(key);
                map.put(key, content);
            }
        }
        handleClickNotification(map);
    }


    void handleClickNotification(Map<String, Object> message) {
        Log.d(TAG, "handleClickNotification:" + message);
        if (channel != null) {
            channel.invokeMethod(Method.onClickNotification.name(), message);
        }
    }

}


