package com.tencent.mm.ext.chatbot;

import android.app.Activity;
import android.app.ext.utils.ViewUtils;
import android.view.View;
import android.widget.EditText;

public class ChatUIV7_0_7_1521 extends AbsChatUIController {

    public ChatUIV7_0_7_1521(Activity activity) {
        super(activity);
    }

    @Override
    protected void closeChatUi() {

    }

    @Override
    protected View findSendButton() {
//        return ViewUtils.findButtonByText(getChatFooter(), "发送");
//        ViewGroup viewGroup = sActivity.findViewById(android.R.id.content);
        return ViewUtils.findViewByIdName(mActivity, "aqj");


    }

    @Override
    protected EditText findEditText() {
//        ViewGroup viewGroup = sActivity.findViewById(android.R.id.content);
        return (EditText) ViewUtils.findViewByIdName(mActivity, "aqc");
    }

}
