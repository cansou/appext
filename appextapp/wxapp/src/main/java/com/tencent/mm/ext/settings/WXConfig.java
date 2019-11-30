package com.tencent.mm.ext.settings;

import android.content.Context;
import android.content.SharedPreferences;

import com.tencent.mm.ext.WXRuntime;

public class WXConfig {

    /**
     * 是否自动抢自己的发送的红包
     */
    private static final String KEY_ENABLE_MYSELF_LUCKY = "ENABLE_MYSELF_LUCKY";
    private static final String KEY_PAY_PASSWORD = "PAY_PASSWORD";
    private static final String KEY_GRAB_START = "grab_start";
    private static final String KEY_GRAB_END = "grab_end";

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

    public String getPayPassword() {
        return mPrefs.getString(KEY_PAY_PASSWORD, "");
    }

    public void setPayPassword(String password) {
        mPrefs.edit().putString(KEY_PAY_PASSWORD, password).commit();
    }

    // // 300, 500
    public int getGrabStart() {
        return mPrefs.getInt(KEY_GRAB_START, 300);
    }

    public void setGrabStart(int start) {
        mPrefs.edit().putInt(KEY_GRAB_START, start).commit();
    }

    public int getGrabEnd() {
        return mPrefs.getInt(KEY_GRAB_END, 500);
    }

    public void setGrabEnd(int end) {
        mPrefs.edit().putInt(KEY_GRAB_END, end).commit();
    }
}
