package com.tencent.mm.ext.luckymoney.send;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.utils.Log;
import android.app.ext.utils.ViewUtils;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;

/**
 * 红包准备页面, 设置发送红包的信息
 */
public class LuckyMoneyPrepareUI extends ActivityLifecycleHook {

    public static final String ACTIVITY_NAME = "com.tencent.mm.plugin.luckymoney.ui.LuckyMoneyPrepareUI";

    private boolean mActivityPaused;

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) {
        super.onActivityCreated(activity, bundle);
        Intent intent = activity.getIntent();
        Bundle data = intent.getExtras();
        Log.d(data.toString());
        mActivityPaused = false;
    }

    @Override
    public void onActivityResumed(Activity activity) {
        super.onActivityResumed(activity);
        if (!mActivityPaused) {
            // 确保只初始化一次
            initView(activity);
        }
        mActivityPaused = false;
    }

    @Override
    public void onActivityPaused(Activity activity) {
        super.onActivityPaused(activity);
        mActivityPaused = true;
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        super.onActivityDestroyed(activity);
        mActivityPaused = false;
        LuckyMoneySender.trySavePlayPassword();
        LuckyMoneySender.setSenderLuckyMsg(null);
    }

    /**
     * 自动配置红包信息
     *
     * @param activity
     */
    private void initView(Activity activity) {
        Intent intent = activity.getIntent();
        boolean fromAppExt = intent.getBooleanExtra(LuckyMoneySender.KEY_FORM_APPEXT, false);
        LuckyMoneySender.setSendByRobot(fromAppExt);
        if (fromAppExt) {
            String total = intent.getStringExtra(LuckyMoneySender.KEY_LUCKY_TOTAL);
            String num = intent.getStringExtra(LuckyMoneySender.KEY_LUCKY_NUM);
            String desc = intent.getStringExtra(LuckyMoneySender.KEY_LUCKY_DESC);

            View parent = ViewUtils.findViewByIdName(activity, "d__");
            // 总金额 d__, id:d7z
            EditText totalEdit = (EditText) ViewUtils.findViewByIdName(parent, "d7z");
            totalEdit.setText(total);

            parent = ViewUtils.findViewByIdName(activity, "d_b");
            // 红包个数 d_b, id:d7z
            EditText numberEdit = (EditText) ViewUtils.findViewByIdName(parent, "d7z");
            numberEdit.setText(num);

            // 恭喜发财，大吉大利,  id:dak
            EditText descEdit = (EditText) ViewUtils.findViewByIdName(activity, "dak");
            if (!TextUtils.isEmpty(desc)) {
                descEdit.setText(desc);
            }

            // 塞钱进红包  id:d_m
            View confirmButton = ViewUtils.findViewByIdName(activity, "d_m");
            confirmButton.performClick();

            // 清除标志
            intent.putExtra(LuckyMoneySender.KEY_FORM_APPEXT, false);
        }
    }
}
