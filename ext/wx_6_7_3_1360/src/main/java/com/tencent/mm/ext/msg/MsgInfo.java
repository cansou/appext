package com.tencent.mm.ext.msg;

import android.content.ContentValues;

/**
 * 消息信息
 */
public class MsgInfo {

    /**
     * 文本消息类型
     */
    private static final int TYPE_TEXT = 1;

    /**
     * 红包消息类型
     */
    private static final int TYPE_LUCKY_MONEY = 436207665;

    private static final String KEY_TYPE = "type";
    private static final String KEY_TALKER = "talker";
    private static final String KEY_MSG_ID = "msgId";
    private static final String KEY_CONTENT = "content";
    private static final String KEY_MSG_SVR_ID = "msgSvrId";
    private static final String KEY_CREATE_TIME = "createTime";
    private static final String KEY_IS_SEND = "isSend";

    public String chatroom_name;

    /**
     * 消息类型
     */
    public int type;

    /**
     * 聊天的人
     */
    public String talker;

    public long msgSvrId;

    public long msgId;

    /**
     * 消息创建时间
     */
    public long create;

    /**
     * 是否为自己发送
     */
    public int issend;

    /**
     * 消息内容
     */
    public String content;

    /**
     * 解析红包消息, 可以将值打印出来进行协议分析
     *
     * @param values
     * @return
     */
    public static MsgInfo parse(ContentValues values) {
        MsgInfo info = new MsgInfo();
        info.type = values.getAsInteger(KEY_TYPE);
        info.talker = values.getAsString(KEY_TALKER);
        info.msgId = values.getAsLong(KEY_MSG_ID);
        info.content = values.getAsString(KEY_CONTENT);
        if (values.containsKey(KEY_MSG_SVR_ID)) {
            info.msgSvrId = values.getAsLong(KEY_MSG_SVR_ID);
        }
        info.create = values.getAsLong(KEY_CREATE_TIME);
        info.issend = values.getAsInteger(KEY_IS_SEND);
        return info;
    }

    /**
     * 是否为自己发送的消息
     *
     * @return
     */
    public boolean isSend() {
        return issend != 0;
    }

    /**
     * 是否为红包消息
     *
     * @return
     */
    public boolean isLuckyMoney() {
        return type == MsgInfo.TYPE_LUCKY_MONEY;
    }

    /**
     * 是否为文字消息
     *
     * @return
     */
    public boolean isTextMsg() {
        return !isSend() && type == TYPE_TEXT;
    }
}
