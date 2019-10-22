package com.tencent.mm.ext;

import android.app.Application;
import android.content.Context;

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

    /**
     * 是否运行在系统插件中
     */
    public static final boolean USE_APP_EXT = true;

    /**
     * 微信运行的版本
     */
    public static final String RUN_VERSION = WX_VERSION_7_0_7_1521;

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

}
