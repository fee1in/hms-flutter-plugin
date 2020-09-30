/*
Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

package com.huawei.hms.flutter.push.receiver.common;

import android.content.Intent;
import android.os.Bundle;

import com.huawei.hms.flutter.push.constants.PushIntent;
import com.huawei.hms.flutter.push.utils.RemoteMessageUtils;
import com.huawei.hms.flutter.push.utils.Utils;
import com.huawei.hms.push.RemoteMessage;

import org.json.JSONObject;

import io.flutter.Log;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.NewIntentListener;

/**
 * class NotificationIntentListener
 *
 * Description: Listens and Handles Notification Open App Intents and Remote Message Notification Custom Intents
 *
 * @since 5.0.2
 */
public class NotificationIntentListener implements NewIntentListener {
    private static RemoteMessage initialNotification;

    private String initialIntent;

    @Override
    public boolean onNewIntent(Intent intent) {
        handleIntent(intent);
        return false;
    }

    public static RemoteMessage getInitialNotification() {
        return NotificationIntentListener.initialNotification;
    }

    private static synchronized void setInitialNotification(RemoteMessage remoteMessage) {
        initialNotification = remoteMessage;
    }

    public void getInitialIntent(final MethodChannel.Result result) {
        result.success(initialIntent);
    }

    public void handleIntent(Intent intent) {
        String action = intent.getAction();
        String dataString = intent.getDataString();
        Bundle extras = intent.getExtras();
        if (Intent.ACTION_VIEW.equals(action)) {
            initialIntent = dataString;
            Utils.sendIntent(PushIntent.REMOTE_MESSAGE_NOTIFICATION_INTENT_ACTION, PushIntent.CUSTOM_INTENT,
                    initialIntent);
            if (extras != null) sendNotificationOpenedAppEvent(extras);
        } else if (Intent.ACTION_MAIN.equals(action) || PushIntent.LOCAL_NOTIFICATION_ACTION.name().equals(action)) {
            if (extras != null) sendNotificationOpenedAppEvent(extras);
        } else {
            Log.i("NotificationIntentListener", "Unsupported action intent:" + action);
        }
    }

    private void sendNotificationOpenedAppEvent(Bundle extras) {
        setInitialNotification(new RemoteMessage(extras));
        JSONObject jsonObject = new JSONObject(RemoteMessageUtils.fromMap(initialNotification));
        Utils.sendIntent(PushIntent.NOTIFICATION_OPEN_ACTION, PushIntent.NOTIFICATION_OPEN, jsonObject.toString());
    }

}