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

public class LuckyMoneyPrepareUI extends ActivityLifecycleHook {

    public static final String ACTIVITY_NAME = "com.tencent.mm.plugin.luckymoney.ui.LuckyMoneyPrepareUI";

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) {
        super.onActivityCreated(activity, bundle);
        Intent intent = activity.getIntent();
        Bundle data = intent.getExtras();
        Log.d(data.toString());
    }

    @Override
    public void onActivityResumed(Activity activity) {
        super.onActivityResumed(activity);
        initView(activity);
    }

    private void initView(Activity activity) {
        View parent = ViewUtils.findViewByIdName(activity, "d__");
        // 总金额 d__, id:d7z
        EditText mTotalEdit = (EditText) ViewUtils.findViewByIdName(parent, "d7z");
        parent = ViewUtils.findViewByIdName(activity, "d_b");
        // 红包个数 d_b, id:d7z
        EditText mNumberEdit = (EditText) ViewUtils.findViewByIdName(parent, "d7z");
        /**
         * 恭喜发财，大吉大利
         * id:dak
         */
        EditText mDetailEdit = (EditText) ViewUtils.findViewByIdName(activity, "dak");
        /**
         * 塞钱进红包
         * id:d_m
         */
        View mConfirmButton = ViewUtils.findViewByIdName(activity, "d_m");

        Intent intent = activity.getIntent();
        Bundle data = intent.getExtras();
        boolean fromAppext = intent.getBooleanExtra(LuckyMoneySender.KEY_FORM_APPEXT, false);
        if (fromAppext) {
            mTotalEdit.setText(data.getString(LuckyMoneySender.KEY_LUCKY_TOTAL));
            mNumberEdit.setText(data.getString(LuckyMoneySender.KEY_LUCKY_NUM));
            String desc = data.getString(LuckyMoneySender.KEY_LUCKY_DESC);
            if (!TextUtils.isEmpty(desc)) {
                mDetailEdit.setText(desc);
            }
            mConfirmButton.performClick();
            intent.putExtra(LuckyMoneySender.KEY_FORM_APPEXT, false);
        }
    }
    // com.tencent.kinda.framework.app.UIPageFragmentActivity
}
