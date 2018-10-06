package com.tencent.mm.ext;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.utils.ReflectionUtils;
import android.os.Bundle;

public class WeChatSplashActivityHook extends ActivityLifecycleHook {

    public static final String ACTIVITY_NAME = "com.tencent.mm.app.WeChatSplashActivity";

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) {
        super.onActivityCreated(activity, bundle);
        replaceClassLoader(activity);
    }

    private static void replaceClassLoader(Activity activity) {
        ClassLoader classLoader = WeChatSplashActivityHook.class.getClassLoader();
        ClassLoader parent = activity.getClass().getClassLoader();
        ReflectionUtils.setFieldValue(classLoader, "parent", parent);
    }
}
