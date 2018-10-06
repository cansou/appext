package com.tencent.mm.ext;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.utils.UiUtils;
import android.os.Bundle;

import com.tencent.mm.ext.msg.ViewChatFooter;

import java.lang.reflect.Field;
import java.lang.reflect.Method;


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
        UiUtils.post(new Runnable() {
            @Override
            public void run() {
                try {
                    ViewChatFooter.initView(activity);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
//        Log.setLogger(new Log.LogCallback() {
//            @Override
//            public void println(int priority, String tag, String msg) {
//                android.util.Log.println(priority, tag, msg);
//            }
//        });
//        ReflectionUtils.setStaticFieldValue("com.tencent.mm.sdk.platformtools.y", "level", -1);
    }

//            private static int level = 6;

    @Override
    public void onActivityResumed(Activity activity) {
        super.onActivityResumed(activity);
//        printLog();
//        Log.setLogger(new Log.LogCallback() {
//            @Override
//            public void println(int priority, String tag, String msg) {
//                android.util.Log.println(priority, tag, msg);
//            }
//        });
    }

    public void printLog() {
//        Log.d("ClassLoader", "mThisActivity:" + mThisActivity.getClass().getClassLoader().hashCode());
//        Log.d("ClassLoader", "Application:" + mThisActivity.getApplication().getClass().getClassLoader().hashCode());
//        Log.d("ClassLoader", "LauncherUI:" + LauncherUI.class.getClassLoader().hashCode());

//        y.clb()
//        y.DP(0);
//        y.a(new Logger());
        try {
            ClassLoader classLoader = mThisActivity.getClass().getClassLoader();


            Class cls = classLoader.loadClass("com.tencent.mm.sdk.platformtools.y");
            Field field = cls.getDeclaredField("level");
            field.setAccessible(true);
            field.set(null, 0);


            Class xlog = classLoader.loadClass("com.tencent.mars.xlog.Xlog");
            Method setConsoleLogOpen = xlog.getDeclaredMethod("setConsoleLogOpen", boolean.class);
            if (setConsoleLogOpen != null) {
                setConsoleLogOpen.setAccessible(true);
                setConsoleLogOpen.invoke(null, true);
            }

            // 由于微信class  load的问题
            Class parameterTypes = classLoader.loadClass("com.tencent.mm.sdk.platformtools.y$a");
            Method method = cls.getDeclaredMethod("a", parameterTypes);
            if (method != null) {
                method.setAccessible(true);
                ClassLoader loader = AppExt.loadExt(mThisActivity);
                Object o = loader.loadClass("com.tencent.mm.ext.Logger").newInstance();
                method.invoke(null, o);
            }
//            int value = y.getLogLevel();
//        (int) ReflectionUtils.getStaticFieldValue("com.tencent.mm.sdk.platformtools.y", "level");
//            Log.d("LogLevel", "log:" + value);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}