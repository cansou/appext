package com.tencent.mm.ext.msg;

public interface MessageListener {

    /**
     * 收到消息回调
     *
     * @param msgInfo
     */
    boolean onReceiveMsg(MsgInfo msgInfo);
}
