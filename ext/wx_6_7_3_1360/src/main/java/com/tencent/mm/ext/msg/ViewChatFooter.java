package com.tencent.mm.ext.msg;

import android.app.Activity;
import android.app.ext.utils.Debug;
import android.app.ext.utils.ViewUtils;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import com.agmbat.utils.ReflectionUtils;

//import com.tencent.mm.pluginsdk.ui.chat.ChatFooter;
//import com.tencent.mm.ui.LauncherUI;
//import com.tencent.mm.ui.widget.MMEditText;

public class ViewChatFooter {

//    private static View sChatFooter;

    private static View.OnClickListener sSendClickListener;

//    public static View get() {
//        return sChatFooter;
//    }

    private static Activity sActivity;

    public static void openChatSendMsg(String talker, String msg) {
        try {
            openChatUi(talker);
            sendMsg(talker, msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void hookOnClickSendButton(View button, EditText editText) {
        String text = editText.getText().toString();
        String trimText = text.trim();
        if (trimText.equalsIgnoreCase("jqr")) {
            TextMsgWatcher.setEnable(true);
            editText.setText("我变成机器人啦~~~");
        } else if (trimText.equalsIgnoreCase("xx")) {
            TextMsgWatcher.setEnable(false);
            editText.setText("机器人要休息了~~~");
        }
        clickSend();
    }


    private static void openChatUi(String talker) {
//        LauncherUI.aTU().a(talker, null, false);
//        public final void com.tencent.mm.ui.LauncherUI.startChatting(java.lang.String,android.os.Bundle,boolean);
        ReflectionUtils.invokeMethod(sActivity, "startChatting",
                new Class[]{String.class, Bundle.class, boolean.class},
                new Object[]{talker, null, false});
    }

    private static void sendMsg(String talker, String msg) {
        final View sendButton = getSendButton();
        final EditText editText = getEditText();
        if (sSendClickListener == null) {
            sSendClickListener = ViewUtils.getViewOnClickListener(sendButton);
        }
        if (sSendClickListener != null) {
            sendButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    try {
                        hookOnClickSendButton(sendButton, editText);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            });
        }
        Debug.printStackTrace();
        setMsg(msg);
        clickSend();
    }

    private static void clickSend() {
        View sendButton = getSendButton();
        sSendClickListener.onClick(sendButton);
    }

    private static void setMsg(String msg) {
        final EditText editText = getEditText();
        editText.setText(msg);
    }

    private static View getSendButton() {
//        return ViewUtils.findButtonByText(getChatFooter(), "发送");
//        ViewGroup viewGroup = sActivity.findViewById(android.R.id.content);
        return ViewUtils.findViewByIdName(sActivity, "aik");
    }

    private static EditText getEditText() {
//        return (EditText) ViewUtils.findViewByClassName(getChatFooter(), "com.tencent.mm.ui.widget.MMEditText");
//        ViewGroup viewGroup = sActivity.findViewById(android.R.id.content);
        return (EditText) ViewUtils.findViewByIdName(sActivity, "aie");
    }

    public static void initView(Activity activity) {
        sActivity = activity;
//        sChatFooter = null;
    }

//    private static View getChatFooter() {
//        if (sChatFooter == null) {
//            ViewGroup viewGroup = sActivity.findViewById(android.R.id.content);
//            sChatFooter = ViewUtils.findViewByClassName(viewGroup, "com.tencent.mm.pluginsdk.ui.chat.ChatFooter").get(0);
//
//
//        }
//        return sChatFooter;
//    }
}
