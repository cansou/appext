package com.tencent.mm.ext.chatbot;

import android.app.Activity;
import android.app.ext.utils.Debug;
import android.app.ext.utils.Log;
import android.app.ext.utils.ViewUtils;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import com.agmbat.utils.ReflectQuietlyUtils;

public abstract class AbsChatUIController implements IChatUIController {

    protected Activity mActivity;

    private OnSendButtonClickListener mOnSendButtonClickListener;

    public AbsChatUIController(Activity activity) {
        mActivity = activity;
    }

    @Override
    public void openChatSendMsg(String talker, String msg) {
        closeChatUi();
        openChatUi(talker);
        sendMsg(talker, msg);
    }

    /**
     * 关闭对话窗口
     */
    protected abstract void closeChatUi();

    /**
     * 打开聊天界面
     *
     * @param talker
     */
    private void openChatUi(String talker) {
//        public final void com.tencent.mm.ui.LauncherUI.closeChatting(boolean)
//       public com.tencent.mm.ui.x com.tencent.mm.ui.LauncherUI.getCurrentFragmet()
//        public final void com.tencent.mm.ui.LauncherUI.startChatting(java.lang.String,android.os.Bundle,boolean);
        ReflectQuietlyUtils.invokeMethod(mActivity, "startChatting",
                new Class[]{String.class, Bundle.class, boolean.class},
                new Object[]{talker, null, false});
    }

    private void sendMsg(String talker, String msg) {
        final View sendButton = findSendButton();
        if (sendButton == null) {
            Log.d("Not found send button");
            return;
        }
        if (mOnSendButtonClickListener == null) {
            final EditText editText = findEditText();
            View.OnClickListener listener = ViewUtils.getViewOnClickListener(sendButton);
            mOnSendButtonClickListener = new OnSendButtonClickListener(listener, editText);
            sendButton.setOnClickListener(mOnSendButtonClickListener);
        }
        Debug.printStackTrace();
        findEditText().setText(msg);
        if (mOnSendButtonClickListener != null) {
            mOnSendButtonClickListener.onOriginalClick(sendButton);
        }
    }

    /**
     * 查找发送按键
     *
     * @return
     */
    protected abstract View findSendButton();

    /**
     * 查找聊天输入框
     *
     * @return
     */
    protected abstract EditText findEditText();
}
