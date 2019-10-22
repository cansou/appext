package com.tencent.mm.ext.luckymoney;

import android.app.Activity;
import android.os.Bundle;

public interface LuckyMoneyPageController {

    /**
     * 打开抢红包页面
     *
     * @param info
     */
    public void launchLuckyMoney(LuckyInfo info);

    /**
     * 当红包页面开始创建时,回调处理
     *
     * @param activity
     * @param bundle
     */
    public void onLuckyMoneyUICreated(Activity activity, Bundle bundle);

    /**
     * 当红包页面显示时, 回调处理
     *
     * @param activity
     */
    public void onLuckyMoneyUIDisplay(Activity activity);
}