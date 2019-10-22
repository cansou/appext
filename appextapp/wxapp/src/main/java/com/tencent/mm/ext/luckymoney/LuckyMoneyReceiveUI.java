package com.tencent.mm.ext.luckymoney;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.utils.Log;
import android.os.Bundle;

/**
 * 监听LuckyMoneyReceiveUI这个Activity的生命周期
 * 此Activity显示拆红包界面, 找到对应的button模拟点击拆开红包
 */
public class LuckyMoneyReceiveUI extends ActivityLifecycleHook {

    private static final String TAG = "LuckyMoneyReceiveUI";

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) {
        super.onActivityCreated(activity, bundle);
        Log.d(TAG, "onActivityCreated");
        LuckyMoneyReceiveUIController.onLuckyMoneyUICreated(activity, bundle);
    }

    @Override
    public void onActivityResumed(Activity activity) {
        super.onActivityResumed(activity);
        Log.d(TAG, "onActivityResumed");
        LuckyMoneyReceiveUIController.onLuckyMoneyUIDisplay(activity);
    }


}
