package com.tencent.mm.ext.luckymoney.send;


import android.text.TextUtils;
import android.view.View;

/**
 * 键盘点击事件监听
 */
public class KeyClickListener implements View.OnClickListener {

    /**
     * 键盘
     */
    private View mKeyboard;

    private View.OnClickListener mOriginListener;

    private OnInputKeyListener mInputKeyListener;

    public KeyClickListener(View keyboard, View.OnClickListener listener, OnInputKeyListener inputKeyListener) {
        mKeyboard = keyboard;
        mOriginListener = listener;
        mInputKeyListener = inputKeyListener;
    }

    @Override
    public void onClick(View v) {
        String key = getInputKey(v);
        if (TextUtils.isEmpty(key)) {
            return;
        }
        if (mInputKeyListener != null) {
            mInputKeyListener.onInput(key);
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

    /**
     * 获取输入的字符
     *
     * @param v
     * @return
     */
    private String getInputKey(View v) {
        for (String key : KeyboardListener.KEY_BOARD_KEY) {
            View button = KeyboardListener.getKeyView(mKeyboard, key);
            if (button == v) {
                return key;
            }
        }
        return null;
    }

}