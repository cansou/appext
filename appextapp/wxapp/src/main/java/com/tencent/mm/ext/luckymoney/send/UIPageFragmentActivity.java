package com.tencent.mm.ext.luckymoney.send;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.utils.UiUtils;
import android.app.ext.utils.ViewUtils;
import android.view.View;

import com.agmbat.utils.ReflectQuietlyUtils;

import java.util.List;

public class UIPageFragmentActivity extends ActivityLifecycleHook {

    public static final String ACTIVITY_NAME = "com.tencent.kinda.framework.app.UIPageFragmentActivity";

    @Override
    public void onActivityResumed(Activity activity) {
        super.onActivityResumed(activity);
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
                View mKeyboardWindow = findKeyboard(keyboardWindowList);
                if (mKeyboardWindow == null) {
                    UiUtils.post(this);
                } else {
                    inputPassword(mKeyboardWindow);
                }
            }
        });
    }

    /**
     * 输入密码
     *
     * @param keyboardWindow
     */
    private void inputPassword(View keyboardWindow) {
        String password = "000000";
        for (int i = 0; i < password.length(); i++) {
            String ch = String.valueOf(password.charAt(i));
            // mKey0 - 9, D, X
            String fieldName = "mKey" + ch;
            View button = (View) ReflectQuietlyUtils.getFieldValue(keyboardWindow, fieldName);
            if (button != null) {
                button.performClick();
            } else {
                return;
            }
        }
    }

    private View findKeyboard(List<View> keyboardWindowList) {
        for (View v : keyboardWindowList) {
            if (v.getWidth() > 0 && v.getHeight() > 0) {
                return v;
            }
        }
        return null;
    }
}