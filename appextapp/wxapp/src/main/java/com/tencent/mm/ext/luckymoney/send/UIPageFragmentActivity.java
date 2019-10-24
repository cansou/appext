package com.tencent.mm.ext.luckymoney.send;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.utils.UiUtils;
import android.app.ext.utils.ViewUtils;
import android.text.TextUtils;
import android.view.View;

import java.util.List;

/**
 * 支付页面
 */
public class UIPageFragmentActivity extends ActivityLifecycleHook {

    public static final String ACTIVITY_NAME = "com.tencent.kinda.framework.app.UIPageFragmentActivity";

    private KeyboardListener mKeyboardListener;

    @Override
    public void onActivityResumed(Activity activity) {
        super.onActivityResumed(activity);
        mKeyboardListener = new KeyboardListener();
        watchKeyboardShown(activity, mKeyboardListener);
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        super.onActivityDestroyed(activity);
        if (mKeyboardListener != null) {
            if (!LuckyMoneySender.isSendByRobot()) {
                // 如果不是机器人发红包
                String password = mKeyboardListener.getPayPassword();
                if (!TextUtils.isEmpty(password)) {
                    // 临时记录支付密码
                    LuckyMoneySender.setTempPayPassword(password);
                }
            }
            mKeyboardListener = null;
        }
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
        if (keyboardWindowList == null) {
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