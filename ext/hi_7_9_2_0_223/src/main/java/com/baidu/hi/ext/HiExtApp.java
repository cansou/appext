package com.baidu.hi.ext;

import android.annotation.SuppressLint;
import android.app.Application;
import android.app.ext.ActivityCallback;
import android.app.ext.utils.Log;
import android.app.ext.utils.ReflectionUtils;
import android.app.ext.utils.UiUtils;
import android.content.Context;

import com.baidu.hi.utils.HiLogCenter;

public class HiExtApp extends Application {

    /**
     * hi的application名称
     */
    private static final String HI_APPLICATION_CLASS_NAME = "com.baidu.hi.HiApplication";

    private static Application sContext;

    private static volatile boolean sInited = false;

    public static Context get() {
        return sContext;
    }

    @SuppressLint("MissingSuperCall")
    @Override
    public synchronized void onCreate() {
        // 不要调用super.onCreate
//        super.onCreate();
        // 解决非ui线程问题
        if (!UiUtils.isOnUiThread()) {
            return;
        }
        Application app = (Application) getBaseContext();
        String className = app.getClass().getName();

        // 解决插件创建application的问题
        if (!HI_APPLICATION_CLASS_NAME.equals(className)) {
            return;
        }

        // 解决多个class loader问题
        if (ActivityCallback.isRegisterCallback(app)) {
            return;
        }

        Log.d("init ... appp start ");
        if (sInited) {
            // 已经初始化过
            return;
        }

        Log.d("init ... appp ");
        sInited = true;
        sContext = app;

        app.registerActivityLifecycleCallbacks(new ActivityCallback());

        UiUtils.runOnUiThreadDelay(new Runnable() {
            @Override
            public void run() {
                Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
                    @Override
                    public void uncaughtException(Thread t, Throwable e) {
                        e.printStackTrace();
                    }
                });
                enableLog();
            }
        }, 5000);
        ActivityCallback.register(LuckyMoneyActivity.ACTIVITY_NAME, new LuckyMoneyActivity());
    }

    /**
     * 开始拦截log
     */
    private static void enableLog() {
        String logClassName = "com.baidu.hi.utils.LogUtil";
        HiLogCenter logCenter = (HiLogCenter) ReflectionUtils.getStaticFieldValue(logClassName, "logCenter");
        ReflectionUtils.setStaticFieldValue(logClassName, "logCenter", ExtHiLogCenter.getHiLogCenter(logCenter));

        ReflectionUtils.invokeStaticMethod(logClassName, "setLogLevel", new Class[]{int.class, int.class},
                new Object[]{2, 2});
//
        Object hiLogCenter = ReflectionUtils.invokeStaticMethod(logClassName, "getHiLogCenter", null, null);
        Object logcatLog = ReflectionUtils.invokeMethod(hiLogCenter, "getLogcatLog", null, null);

        // LogcatLog.setConsoleLogOpen(true)
        ReflectionUtils.invokeMethod(logcatLog, "setConsoleLogOpen", new Class[]{boolean.class}, new Object[]{true});
    }
}
