package com.tencent.mm.ext.settings;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.AppExtContext;
import android.os.Bundle;

import com.tencent.mm.ext.WXRuntime;

/**
 * 显示设置页面
 */
public class SettingsUI extends ActivityLifecycleHook {

    public static final String ACTIVITY_NAME = "com.tencent.mm.plugin.setting.ui.setting.SettingsUI";

    private ConfigWindow mConfigWindow;

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) {
        super.onActivityCreated(activity, bundle);
        if (mConfigWindow == null) {
            AppExtContext context = new AppExtContext(WXRuntime.getApplicationContext());
            mConfigWindow = new ConfigWindow(context);
        }
        mConfigWindow.show();
    }

}
