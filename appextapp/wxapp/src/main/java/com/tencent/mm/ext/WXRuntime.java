package com.tencent.mm.ext;

import android.app.Application;
import android.app.ext.utils.ReflectionUtils;
import android.content.Context;

import com.tencent.mm.ext.log.WXLog;
import com.tencent.mm.ext.log.WXMatrixLog;

/**
 * App运行环境配置
 */
public class WXRuntime {

    /**
     * 微信6.7.3版本
     */
    public static final String WX_VERSION_6_7_3_1360 = "6_7_3_1360";

    /**
     * 微信7.0.7版本
     */
    public static final String WX_VERSION_7_0_7_1521 = "7_0_7_1521";
    public static final String WX_VERSION_7_0_9_1560 = "7_0_9_1560";
    public static final String WX_VERSION_7_0_14_1660 = "7_0_14_1660";

    /**
     * 是否运行在系统插件中
     */
    public static final boolean USE_APP_EXT = true;

    /**
     * 微信运行的版本
     */
    public static final String RUN_VERSION = WX_VERSION_7_0_14_1660;

    /**
     * 微信Application对象
     */
    private static Application sContext;


    public static void setApplicationContext(Application applicationContext) {
        sContext = applicationContext;
    }

    public static Context getApplicationContext() {
        return sContext;
    }


    public static void enableWXLog() {
        if (RUN_VERSION.equals(WX_VERSION_7_0_14_1660)) {
//            enableWXMatrixLog();
            ReflectionUtils.setStaticFieldValue("com.tencent.mm.sdk.platformtools.ad", "Exc", new WXLog());
            ReflectionUtils.setStaticFieldValue("com.tencent.mm.sdk.platformtools.ad", "Exd", new WXLog());
        }
    }

    private static void enableWXMatrixLog() {
        if (RUN_VERSION.equals(WX_VERSION_7_0_14_1660)) {
            ReflectionUtils.setStaticFieldValue("com.tencent.matrix.g.c", "cJh", new WXMatrixLog());
            ReflectionUtils.setStaticFieldValue("com.tencent.matrix.g.c", "cJi", new WXMatrixLog());
        }
    }

}
