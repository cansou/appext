package com.tencent.mm.ext.msg;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.utils.Log;
import android.app.ext.utils.ViewUtils;
import android.content.Intent;
import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.Button;

import com.tencent.mm.ext.WeixinExtApp;

/**
 * 监听LuckyMoneyReceiveUI这个Activity的生命周期
 * 此Activity显示拆红包界面, 找到对应的button模拟点击拆开红包
 */
public class LuckyMoneyReceiveUI extends ActivityLifecycleHook {

    private static final String TAG = "LuckyMoneyReceiveUI";

    /**
     * 显示红包界面的Activity
     */
    public static final String ACTIVITY_NAME = "com.tencent.mm.plugin.luckymoney.ui.LuckyMoneyReceiveUI";

    private static final String KEY_WAY = "key_way";
    private static final String KEY_NATIVE_URL = "key_native_url";
    private static final String KEY_USERNAME = "key_username";

    private static final String KEY_FORM_APPEXT = "from_appkext";

    /**
     * 打开抢红包页面
     *
     * @param info
     */
    public static void launchLuckyMoney(LuckyInfo info) {
        String native_url = info.nativeurl;
        Intent intent = new Intent();
        intent.putExtra(KEY_WAY, info.way);
        intent.putExtra(KEY_NATIVE_URL, native_url);
        intent.putExtra(KEY_USERNAME, info.name);
        intent.putExtra(KEY_FORM_APPEXT, true);
        intent.setClassName(WeixinExtApp.get(), LuckyMoneyReceiveUI.ACTIVITY_NAME);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        WeixinExtApp.get().startActivity(intent);
    }

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) {
        super.onActivityCreated(activity, bundle);
        Log.d(TAG, "onActivityCreated");
        if (isFromAppExt(activity)) {
            Intent intent = activity.getIntent();
            int way = intent.getIntExtra(KEY_WAY, 0);
            String nativeUrl = intent.getStringExtra(KEY_NATIVE_URL);
            String name = intent.getStringExtra(KEY_USERNAME);
            Log.d(TAG, "way:" + way + ",nativeUrl:" + nativeUrl + ",name:" + name);
            ViewUtils.wakeupScreen(activity);
        }
    }

    @Override
    public void onActivityResumed(Activity activity) {
        super.onActivityResumed(activity);
        Log.d(TAG, "onActivityResumed");
        if (isFromAppExt(activity)) {
            Button button = findOpenButton(activity);
            // 如果点击时小于300毫秒会存在点击事件丢失的情况
            int delay = ViewUtils.random(300, 500);
            ViewUtils.performClick(button, delay);
            clearFromFlag(activity);
        }
    }

    /**
     * 查找打开的Button
     *
     * @return
     */
    private Button findOpenButton(Activity activity) {
        ViewGroup contentView = (ViewGroup) activity.findViewById(android.R.id.content);
        // 每个版本的button id值不一样, 也没找到一个比较通用的方案,可能都会存在问题
        Button button = (Button) ViewUtils.findViewByIdName(contentView, "cnu");
        return button;
    }

    /**
     * 清除标记
     *
     * @param activity
     */
    private void clearFromFlag(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent != null) {
            intent.putExtra(KEY_FORM_APPEXT, false);
        }
    }

    private boolean isFromAppExt(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent != null) {
            return intent.getBooleanExtra(KEY_FORM_APPEXT, false);
        }
        return false;
    }
}
