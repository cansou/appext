package com.tencent.mm.ext.luckymoney;

import android.app.Activity;
import android.os.Bundle;

import com.tencent.mm.ext.WXRuntime;

/**
 * 抢红包页面控制器
 */
public class LuckyMoneyReceiveUIController {

    private static LuckyMoneyPageController sPageController;

    static {
        if (WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_7_0_14_1660)) {
            // TODO
            sPageController = new PageV7_0_9_1560();
        } else if (WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_7_0_9_1560)) {
            sPageController = new PageV7_0_9_1560();
        } else if (WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_7_0_7_1521)) {
            sPageController = new PageV7_0_7_1521();
        } else if (WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_6_7_3_1360)) {
            sPageController = new PageV6_7_3_1360();
        }
    }

    /**
     * 启动抢红包页面
     *
     * @param info
     */
    public static void launchLuckyMoneyUI(LuckyInfo info) {
        if (sPageController != null) {
            sPageController.launchLuckyMoney(info);
        }
    }

    public static void onLuckyMoneyUICreated(Activity activity, Bundle bundle) {
        if (sPageController != null) {
            sPageController.onLuckyMoneyUICreated(activity, bundle);
        }
    }

    public static void onLuckyMoneyUIDisplay(Activity activity) {
        if (sPageController != null) {
            sPageController.onLuckyMoneyUIDisplay(activity);
        }
    }

}
