package com.tencent.mm.ext.chatbot;

import android.view.View;
import android.widget.EditText;

public class OnSendButtonClickListener implements View.OnClickListener {

    private EditText mEditText;
    private View.OnClickListener mOriginalListener;

    public OnSendButtonClickListener(View.OnClickListener listener, EditText editText) {
        mOriginalListener = listener;
        mEditText = editText;
    }

    @Override
    public void onClick(View v) {
        try {
            hookOnClickSendButton(v, mEditText);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void onOriginalClick(View v) {
        if (mOriginalListener != null) {
            mOriginalListener.onClick(v);
        }
    }

    private void hookOnClickSendButton(View button, EditText editText) {
        String text = editText.getText().toString();
        String trimText = text.trim();
        if (trimText.equalsIgnoreCase("jqr")) {
            ChatBot.setEnable(true);
            editText.setText("我变成机器人啦~~~");
        } else if (trimText.equalsIgnoreCase("xx")) {
            ChatBot.setEnable(false);
            editText.setText("机器人要休息了~~~");
        }
        onOriginalClick(button);
    }

}
