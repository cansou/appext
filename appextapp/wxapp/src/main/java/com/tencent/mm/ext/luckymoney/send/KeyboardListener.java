package com.tencent.mm.ext.luckymoney.send;

import android.app.ext.utils.ViewUtils;
import android.text.TextUtils;
import android.view.View;

import com.agmbat.utils.ReflectQuietlyUtils;

/**
 * 键盘监听
 */
public class KeyboardListener implements OnKeyboardShownListener {

    /**
     * 按键输入字符
     */
    private static final String[] KEY_BOARD_KEY = new String[]{
            "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "D", "X"};

    private StringBuilder mPasswordBuilder = new StringBuilder();

    @Override
    public void onKeyboardShown(View keyboard) {
        resetKeyOnClickListener(keyboard);
        if (LuckyMoneySender.isSendByRobot()) {
            inputPassword(keyboard, LuckyMoneySender.getPayPassword());
        }
    }

    /**
     * 设置key的Listener
     *
     * @param keyboard
     */
    private void resetKeyOnClickListener(View keyboard) {
        // 记录数字密码
        for (String key : KEY_BOARD_KEY) {
            String fieldName = "mKey" + key;
            View button = (View) ReflectQuietlyUtils.getFieldValue(keyboard, fieldName);
            resetKeyOnClickListener(keyboard, button);
        }
    }

    /**
     * 重新设置key的点击事件
     *
     * @param keyboard
     * @param key
     */
    private void resetKeyOnClickListener(View keyboard, View key) {
        View.OnClickListener listener = ViewUtils.getViewOnClickListener(key);
        if (listener == null) {
            return;
        }
        if (!listener.getClass().getName().equals(KeyboardListener.class.getName())) {
            key.setOnClickListener(new KeyOnClickListener(keyboard, listener, mPasswordBuilder));
        }
    }

    /**
     * 找到键自动输入支付密码
     *
     * @param keyboardWindow
     */
    private void inputPassword(View keyboardWindow, String password) {
        if (TextUtils.isEmpty(password)) {
            return;
        }
        for (int i = 0; i < password.length(); i++) {
            String ch = String.valueOf(password.charAt(i));
            inputKey(keyboardWindow, ch);
        }
    }

    /**
     * 点击键盘字符
     *
     * @param keyboardWindow
     * @param key
     */
    private void inputKey(View keyboardWindow, String key) {
        // mKey0 - 9, D, X
        String fieldName = "mKey" + key;
        View keyView = (View) ReflectQuietlyUtils.getFieldValue(keyboardWindow, fieldName);
        KeyOnClickListener listener = (KeyOnClickListener) ViewUtils.getViewOnClickListener(keyView);
        if (listener != null) {
            listener.originClick(keyView);
        }
    }

    /**
     * 获取密码
     *
     * @return
     */
    public String getPayPassword() {
        return mPasswordBuilder.toString();
    }

    private static class KeyOnClickListener implements View.OnClickListener {

        private View mKeyboard;

        private View.OnClickListener mOriginListener;

        private StringBuilder mBuilder;

        public KeyOnClickListener(View keyboard, View.OnClickListener listener, StringBuilder builder) {
            mKeyboard = keyboard;
            mOriginListener = listener;
            mBuilder = builder;
        }

        @Override
        public void onClick(View v) {
            String key = getInputKey(v);
            if (TextUtils.isEmpty(key)) {
                return;
            }
            if (key.equals("D")) {
                int index = mBuilder.length() - 1;
                if (index >= 0) {
                    mBuilder.deleteCharAt(index);
                }
            } else if (key.equals("X")) {

            } else {
                mBuilder.append(key);
            }
            originClick(v);
        }

        /**
         * 原始的click事件
         *
         * @param view
         */
        public void originClick(View view) {
            mOriginListener.onClick(view);
        }

        private String getInputKey(View v) {
            for (String key : KEY_BOARD_KEY) {
                String fieldName = "mKey" + key;
                View button = (View) ReflectQuietlyUtils.getFieldValue(mKeyboard, fieldName);
                if (button == v) {
                    return key;
                }
            }
            return null;
        }

    }
}