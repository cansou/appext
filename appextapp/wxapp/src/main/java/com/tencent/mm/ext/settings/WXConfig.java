package com.tencent.mm.ext.settings;

import android.content.Context;
import android.content.SharedPreferences;

import com.tencent.mm.ext.WXRuntime;

public class WXConfig {

    /**
     * 是否自动抢自己的发送的红包
     */
    public static final String KEY_ENABLE_MYSELF_LUCKY = "ENABLE_MYSELF_LUCKY";

    private static WXConfig sInstance = null;

    private SharedPreferences mPrefs;

    public static WXConfig get() {
        if (sInstance == null) {
            sInstance = new WXConfig();
        }
        return sInstance;
    }

    private WXConfig() {
        mPrefs = WXRuntime.getApplicationContext().getSharedPreferences("wx_ext_config", Context.MODE_PRIVATE);
    }

    public void setEnableMySelfLucky(boolean isChecked) {
        mPrefs.edit().putBoolean(KEY_ENABLE_MYSELF_LUCKY, isChecked).commit();
    }

    public boolean isEnableMySelfLucky() {
        return mPrefs.getBoolean(KEY_ENABLE_MYSELF_LUCKY, true);
    }
}
