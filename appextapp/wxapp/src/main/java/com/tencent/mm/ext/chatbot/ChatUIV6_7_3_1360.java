package com.tencent.mm.ext.chatbot;

import android.app.Activity;
import android.app.ext.utils.ViewUtils;
import android.view.View;
import android.widget.EditText;

import com.agmbat.utils.ReflectQuietlyUtils;

public class ChatUIV6_7_3_1360 extends AbsChatUIController {

    public ChatUIV6_7_3_1360(Activity activity) {
        super(activity);
    }

    /**
     * 关闭对话窗口
     */
    @Override
    protected void closeChatUi() {
        Object currentFragment = ReflectQuietlyUtils.invokeMethod(mActivity, "getCurrentFragmet");
        if (currentFragment != null) {
            if (currentFragment.getClass().getName().equals("com.tencent.mm.ui.chatting.y")) {
                ReflectQuietlyUtils.invokeMethod(mActivity, "closeChatting",
                        new Class[]{boolean.class},
                        new Object[]{false});
            }
        }
    }

    /**
     * 查找发送按键
     *
     * @return
     */
    @Override
    protected View findSendButton() {
//        return ViewUtils.findButtonByText(getChatFooter(), "发送");
//        ViewGroup viewGroup = sActivity.findViewById(android.R.id.content);
        return ViewUtils.findViewByIdName(mActivity, "aik");
    }

    /**
     * 查找聊天输入框
     *
     * @return
     */
    @Override
    protected EditText findEditText() {
//        return (EditText) ViewUtils.findViewByClassName(getChatFooter(), "com.tencent.mm.ui.widget.MMEditText");
//        ViewGroup viewGroup = sActivity.findViewById(android.R.id.content);
        return (EditText) ViewUtils.findViewByIdName(mActivity, "aie");
    }
}
