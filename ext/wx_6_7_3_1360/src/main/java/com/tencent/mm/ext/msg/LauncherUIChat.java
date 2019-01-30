package com.tencent.mm.ext.msg;

import android.app.Activity;
import android.app.ext.utils.Debug;
import android.app.ext.utils.ViewUtils;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import com.agmbat.utils.ReflectionUtils;

public class LauncherUIChat {

    private static View.OnClickListener sSendClickListener;

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


    /**
     * 打开聊天界面
     *
     * @param talker
     */
    private static void openChatUi(String talker) {
        Object currentFragment = ReflectionUtils.invokeMethod(sActivity, "getCurrentFragmet");
        if (currentFragment != null) {
            if (currentFragment.getClass().getName().equals("com.tencent.mm.ui.chatting.y")) {
                ReflectionUtils.invokeMethod(sActivity, "closeChatting",
                        new Class[]{boolean.class},
                        new Object[]{false});
            }
        }
//        public final void com.tencent.mm.ui.LauncherUI.closeChatting(boolean)
//       public com.tencent.mm.ui.x com.tencent.mm.ui.LauncherUI.getCurrentFragmet()
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
        getEditText().setText(msg);
        clickSend();
    }

    private static void clickSend() {
        View sendButton = getSendButton();
        sSendClickListener.onClick(sendButton);
    }

    /**
     * 查找发送按键
     *
     * @return
     */
    private static View getSendButton() {
//        return ViewUtils.findButtonByText(getChatFooter(), "发送");
//        ViewGroup viewGroup = sActivity.findViewById(android.R.id.content);
        return ViewUtils.findViewByIdName(sActivity, "aik");
    }

    /**
     * 查找聊天输入框
     *
     * @return
     */
    private static EditText getEditText() {
//        return (EditText) ViewUtils.findViewByClassName(getChatFooter(), "com.tencent.mm.ui.widget.MMEditText");
//        ViewGroup viewGroup = sActivity.findViewById(android.R.id.content);
        return (EditText) ViewUtils.findViewByIdName(sActivity, "aie");
    }

    public static void initView(Activity activity) {
        sActivity = activity;
    }

}
