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
    public static final String[] KEY_BOARD_KEY = new String[]{
            "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "D", "X"};

    private StringBuilder mPasswordBuilder = new StringBuilder();

    private OnInputKeyListener mOnInputKeyListener = new OnInputKeyListener() {
        @Override
        public void onInput(String key) {
            if (key.equals("D")) {
                int index = mPasswordBuilder.length() - 1;
                if (index >= 0) {
                    mPasswordBuilder.deleteCharAt(index);
                }
            } else if (key.equals("X")) {

            } else {
                mPasswordBuilder.append(key);
            }
            if (!LuckyMoneySender.isSendByRobot()) {
                // 如果不是机器人发红包
                if (mPasswordBuilder.length() == 6) {
                    // 临时记录支付密码
                    LuckyMoneySender.setTempPayPassword(mPasswordBuilder.toString());
                }
            }
        }
    };

    @Override
    public void onKeyboardShown(View keyboard) {
        // 设置key的Listener
        for (String key : KEY_BOARD_KEY) {
            View keyView = getKeyView(keyboard, key);
            resetKeyOnClickListener(keyboard, keyView);
        }

        if (LuckyMoneySender.isSendByRobot()) {
            inputPassword(keyboard, LuckyMoneySender.getPayPassword());
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
            key.setOnClickListener(new KeyClickListener(keyboard, listener, mOnInputKeyListener));
        }
    }

    /**
     * 找到键盘自动输入支付密码
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
        View keyView = getKeyView(keyboardWindow, key);
        KeyClickListener listener = (KeyClickListener) ViewUtils.getViewOnClickListener(keyView);
        if (listener != null) {
            listener.originClick(keyView);
        }
    }


    /**
     * 通过key获取对应的View
     *
     * @param keyboardWindow
     * @param key
     * @return
     */
    public static View getKeyView(View keyboardWindow, String key) {
        // mKey0 - 9, D, X
        String fieldName = "mKey" + key;
        return (View) ReflectQuietlyUtils.getFieldValue(keyboardWindow, fieldName);
    }

}