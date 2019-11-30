package com.tencent.mm.ext;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.os.Bundle;

import com.tencent.mm.ext.chatbot.LauncherUIChat;

public class LauncherUI extends ActivityLifecycleHook {

    /**
     * 显示红包界面的Activity
     */
    public static final String ACTIVITY_NAME = "com.tencent.mm.ui.LauncherUI";

    @Override
    public void onActivityCreated(final Activity activity, Bundle bundle) {
        super.onActivityCreated(activity, bundle);
        Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
            @Override
            public void uncaughtException(Thread thread, Throwable ex) {
                ex.printStackTrace();
            }
        });
        LauncherUIChat.initView(activity);
    }
}