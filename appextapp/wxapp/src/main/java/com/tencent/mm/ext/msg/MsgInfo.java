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

    private static final String KEY_MSGSEQ = "msgSeq";
    private static final String KEY_STATUS = "status";
    private static final String KEY_TALKERID = "talkerId";
    private static final String KEY_LVBUFFER = "lvbuffer";
    private static final String KEY_RESERVED = "reserved";
    private static final String KEY_FLAG = "flag";
    private static final String KEY_BIZCHATID = "bizChatId";
    private static final String KEY_BIZCLIENTMSGID = "bizClientMsgId";
    private static final String KEY_IMGPATH = "imgPath";

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

    public long msgSeq;
    public int status;
    public int talkerId;
    public byte[] lvbuffer;
    public Object reserved;
    public int flag;
    public long bizChatId;
    public String bizClientMsgId;
    public String imgPath;


    /**
     * 消息发送者
     */
    public String sender;

    /**
     * 文本内容
     */
    public String textContext;

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

        if (values.containsKey(KEY_MSGSEQ)) {
            info.msgSeq = values.getAsLong(KEY_MSGSEQ);
        }

        if (values.containsKey(KEY_STATUS)) {
            info.status = values.getAsInteger(KEY_STATUS);
        }
        if (values.containsKey(KEY_TALKERID)) {
            info.talkerId = values.getAsInteger(KEY_TALKERID);
        }
        if (values.containsKey(KEY_LVBUFFER)) {
            info.lvbuffer = values.getAsByteArray(KEY_LVBUFFER);
        }
        if (values.containsKey(KEY_FLAG)) {
            info.flag = values.getAsInteger(KEY_FLAG);
        }
        if (values.containsKey(KEY_BIZCHATID)) {
            info.bizChatId = values.getAsLong(KEY_BIZCHATID);
        }
        if (values.containsKey(KEY_BIZCLIENTMSGID)) {
            info.bizClientMsgId = values.getAsString(KEY_BIZCLIENTMSGID);
        }

        // 个人聊天中没有
        if (values.containsKey(KEY_IMGPATH)) {
            info.imgPath = values.getAsString(KEY_IMGPATH);
        }
        if (values.containsKey(KEY_RESERVED)) {
            info.reserved = values.get(KEY_RESERVED);
        }

        // 解析文本消息内容
        if (info.isTextMsg()) {
            if (info.isChatroomMsg()) {
                // 如果是群聊消息, 解析出发送者与文本内容
                String msg = info.content;
                int index = msg.indexOf("\n");
                if (index != -1) {
                    info.textContext = msg.substring(index + 1).trim();
                    info.sender = msg.substring(0, index - 1);
                }
            } else {
                info.sender = info.talker;
                info.textContext = info.content;
            }
        }
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

    /**
     * 是否为群消息
     *
     * @return
     */
    public boolean isChatroomMsg() {
        return talker.endsWith("@chatroom");
    }


//            3 = "talker" // 19123787090@chatroom 群
//            10 = "content" // 19123787090@chatroom:
//<sysmsg type="sysmsgtemplate">
//	<sysmsgtemplate>
//		<content_template type="tmpl_type_profile">
//			<plain><![CDATA[]]></plain>
//			<template><![CDATA["$username$"邀请你和"$names$"加入了群聊]]></template>
//			<link_list>
//				<link name="username" type="link_profile">
//					<memberlist>
//						<member>
//							<username><![CDATA[wxid_wrsbka9vy0zd21]]></username>
//							<nickname><![CDATA[陈明]]></nickname>
//						</member>
//					</memberlist>
//				</link>
//				<link name="names" type="link_profile">
//					<memberlist>
//						<member>
//							<username><![CDATA[liulu524888]]></username>
//							<nickname><![CDATA[liulu]]></nickname>
//						</member>
//					</memberlist>
//					<separator><![CDATA[、]]></separator>
//				</link>
//			</link_list>
//		</content_template>
//	</sysmsgtemplate>
//</sysmsg>

    // wxid_wrsbka9vy0zd21:\n 测试2


}
