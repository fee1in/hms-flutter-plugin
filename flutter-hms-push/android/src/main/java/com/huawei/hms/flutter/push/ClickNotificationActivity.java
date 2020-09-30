package com.huawei.hms.flutter.push;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import com.huawei.hms.flutter.push.event.ClickNotificationHandler;

public class ClickNotificationActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            ClickNotificationHandler.getInstance().handleIntent(getIntent());
        } catch (Exception e) {

//            finish()
        } finally {
            startSpecifiedActivity();
        }
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        try {
            ClickNotificationHandler.getInstance().handleIntent(intent);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            startSpecifiedActivity();
        }

    }

    private void startSpecifiedActivity() {
        try {
            Intent intent = new Intent();
            intent.setAction("android.intent.action.CLICK_NOTIFICATION");
            intent.addCategory(Intent.CATEGORY_DEFAULT);
            startActivity(intent);
            finish();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}