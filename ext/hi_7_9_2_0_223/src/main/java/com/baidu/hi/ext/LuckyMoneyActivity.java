package com.baidu.hi.ext;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.utils.Log;
import android.app.ext.utils.ViewUtils;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.Button;

import com.baidu.hi.luckymoney.logic.LuckyMoneyTryOpenEvent;

/**
 * 抢红包界面
 */
public class LuckyMoneyActivity extends ActivityLifecycleHook {

    private static final String TAG = "LuckyMoneyActivity";

    private static final String FRAGMENT_KEY = "fragment_key";
    private static final String PARCELABLE_KEY = "parcelable_key";

    private static final String KEY_FORM_APPEXT = "from_appkext";
    /**
     * 显示红包界面的Activity
     */
    public static final String ACTIVITY_NAME = "com.baidu.hi.luckymoney.LuckyMoneyActivity";

    private static final boolean DEBUG = false;

    /**
     * 打开抢红包页面
     *
     * @param info
     */
    public static void openLuckyMoneyActivity(LuckyMoneyTryOpenEvent info) {
        Context context = HiExtApp.get();
        Intent intent = new Intent();
        intent.putExtra(FRAGMENT_KEY, 2);
        intent.putExtra(PARCELABLE_KEY, info);
        intent.putExtra(KEY_FORM_APPEXT, true);
        intent.setClassName(context, ACTIVITY_NAME);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    private boolean isFromAppExt(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent != null) {
            return intent.getBooleanExtra(KEY_FORM_APPEXT, false);
        }
        return false;
    }


    @Override
    public void onActivityCreated(final Activity activity, Bundle bundle) {
        Log.d(TAG, "onActivityCreated");
        if (isFromAppExt(activity)) {
            if (DEBUG) {
                Intent intent = activity.getIntent();
                Bundle data = intent.getExtras();
                int key = data.getInt(FRAGMENT_KEY);
                LuckyMoneyTryOpenEvent object = data.getParcelable(PARCELABLE_KEY);
            }
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
        Button button = (Button) ViewUtils.findViewByIdName(contentView, "envelope_open");
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
}
