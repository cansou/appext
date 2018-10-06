package com.tencent.mm.ext;

import android.annotation.SuppressLint;
import android.app.Application;
import android.app.ext.ActivityCallback;

import com.tencent.mm.ext.lucky.LuckyMoneyReceiveUI;

public class WeixinExtApp extends Application {

    @SuppressLint("MissingSuperCall")
    @Override
    public void onCreate() {
        // 不要调用super.onCreate
//        super.onCreate();
        Application app = (Application) getBaseContext();
        app.registerActivityLifecycleCallbacks(new ActivityCallback());

        ActivityCallback.register(WeChatSplashActivityHook.ACTIVITY_NAME, new WeChatSplashActivityHook());
        ActivityCallback.register(LauncherUI.ACTIVITY_NAME, new LauncherUI());
        ActivityCallback.register(LuckyMoneyReceiveUI.ACTIVITY_NAME, new LuckyMoneyReceiveUI());
    }

}
