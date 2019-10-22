package com.tencent.mm.ext.chatbot;

import com.tencent.mm.ext.msg.MessageListener;
import com.tencent.mm.ext.msg.MsgInfo;

/**
 * 监测试文本消息
 */
public class TextMsgWatcher implements MessageListener {

    @Override
    public boolean onReceiveMsg(final MsgInfo msgInfo) {
        if (msgInfo.isTextMsg()) {
            ChatBot.onReceiveMsg(msgInfo);
            return true;
        }
        return false;
    }

}
