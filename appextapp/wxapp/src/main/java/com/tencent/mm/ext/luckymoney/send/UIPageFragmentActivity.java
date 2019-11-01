package com.tencent.mm.ext.luckymoney.send;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.utils.Log;
import android.app.ext.utils.UiUtils;
import android.app.ext.utils.ViewUtils;
import android.view.View;

import java.util.List;

/**
 * 支付页面
 */
public class UIPageFragmentActivity extends ActivityLifecycleHook {

    public static final String ACTIVITY_NAME = "com.tencent.kinda.framework.app.UIPageFragmentActivity";


    @Override
    public void onActivityResumed(Activity activity) {
        super.onActivityResumed(activity);
        watchKeyboardShown(activity, new KeyboardListener());
    }

    /**
     * 监听键盘是否显示
     *
     * @param activity
     * @param onKeyboardShownListener
     */
    private void watchKeyboardShown(Activity activity, final OnKeyboardShownListener onKeyboardShownListener) {
        View content = activity.findViewById(android.R.id.content);
        String viewClassName = "com.tenpay.android.wechat.MyKeyboardWindow";
        final List<View> keyboardWindowList = ViewUtils.findViewByClassName(content, viewClassName);
        if (keyboardWindowList == null || keyboardWindowList.size() == 0) {
            Log.d("Not found com.tenpay.android.wechat.MyKeyboardWindow!");
            return;
        }
        UiUtils.post(new Runnable() {
            @Override
            public void run() {
                // com.tenpay.android.wechat.MyKeyboardWindow
                View keyboardWindow = findKeyboard(keyboardWindowList);
                if (keyboardWindow == null) {
                    UiUtils.post(this);
                } else {
                    if (onKeyboardShownListener != null) {
                        onKeyboardShownListener.onKeyboardShown(keyboardWindow);
                    }
                }
            }
        });
    }

    /**
     * 通过判断View显示在屏幕后有大小了，找到键盘
     *
     * @param keyboardWindowList
     * @return
     */
    private View findKeyboard(List<View> keyboardWindowList) {
        for (View v : keyboardWindowList) {
            if (v.getWidth() > 0 && v.getHeight() > 0) {
                return v;
            }
        }
        return null;
    }
}