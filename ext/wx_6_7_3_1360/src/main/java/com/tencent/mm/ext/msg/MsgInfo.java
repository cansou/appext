package com.tencent.mm.ext.msg;

/**
 * 消息信息
 */
public class MsgInfo {

    /**
     * 文本消息类型
     */
    public static final int TYPE_TEXT = 1;

    /**
     * 红包消息类型
     */
    public static final int TYPE_LUCKY_MONEY = 436207665;
    public String chatroom_name;

    /**
     * 消息类型
     */
    public int type;

    public String talker;

    public long msg_svr_id;

    public long msg_id;

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

    public boolean isSend() {
        return issend != 0;
    }

//    String img_gallery_chatroom_name = intent.getStringExtra("img_gallery_chatroom_name");
//    long img_gallery_msg_svr_id = intent.getLongExtra("img_gallery_msg_svr_id", 0);
//    long img_gallery_msg_id = intent.getLongExtra("img_gallery_msg_id", 0);
//    String img_gallery_talker = intent.getStringExtra("img_gallery_talker");
//
//    Log.i("ActivityCallback","img_gallery_chatroom_name:"+img_gallery_chatroom_name+","
//            +"img_gallery_msg_svr_id:"+img_gallery_msg_svr_id+",img_gallery_msg_id:"+img_gallery_msg_id
//    +",img_gallery_talker:"+img_gallery_talker);

}
