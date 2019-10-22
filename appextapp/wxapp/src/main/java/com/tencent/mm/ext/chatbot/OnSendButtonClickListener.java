package com.tencent.mm.ext.chatbot;

import android.view.View;
import android.widget.EditText;

import com.tencent.mm.ext.luckymoney.send.LuckyMoneySender;

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
        } else if (trimText.equals("f")) {
            editText.setText("");
            LuckyMoneySender.launchLuckyMoneyPrepareUI("", 3, "0.01", "1", "");
            return;
        }
        onOriginalClick(button);
    }

}
