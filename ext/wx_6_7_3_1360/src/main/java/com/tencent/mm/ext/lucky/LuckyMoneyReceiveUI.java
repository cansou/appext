package com.tencent.mm.ext.lucky;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.utils.ViewUtils;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.Button;

/**
 * 监听LuckyMoneyReceiveUI这个Activity的生命周期
 * 此Activity显示拆红包界面
 * <p>
 * com.tencent.mm.plugin.lukymoney.ui.LuckyMoneyReceiveUI
 */
public class LuckyMoneyReceiveUI extends ActivityLifecycleHook {

    private static final String TAG = "LuckyMoneyReceiveUI";

    /**
     * 显示红包界面的Activity
     */
    public static final String ACTIVITY_NAME = "com.tencent.mm.plugin.luckymoney.ui.LuckyMoneyReceiveUI";

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) {
        super.onActivityCreated(activity, bundle);
        Log.d(TAG, "onActivityCreated");
        Intent intent = activity.getIntent();
        int way = intent.getIntExtra("key_way", 0);
        String nativeUrl = intent.getStringExtra("key_native_url");
        String name = intent.getStringExtra("key_username");
        Log.d(TAG, "way:" + way + ",nativeUrl:" + nativeUrl + ",name:" + name);
        ViewUtils.wakeupScreen(activity);
    }

    @Override
    public void onActivityResumed(Activity activity) {
        super.onActivityResumed(activity);
        Log.d(TAG, "onActivityResumed");
        Button button = findOpenButton(activity);
        ViewUtils.performClick(button);
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        super.onActivityDestroyed(activity);
    }

    @Override
    public void onActivityPaused(Activity activity) {
        super.onActivityPaused(activity);
    }

    /**
     * 查找打开的Button
     *
     * @return
     */
    private Button findOpenButton(Activity activity) {
        ViewGroup contentView = (ViewGroup) activity.findViewById(android.R.id.content);
        Button button = (Button) ViewUtils.findViewByIdName(contentView, "cb1");
        return button;
    }
}
