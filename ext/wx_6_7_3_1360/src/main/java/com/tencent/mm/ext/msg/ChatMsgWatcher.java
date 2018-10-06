package com.tencent.mm.ext.msg;

import android.app.ext.DbHook;
import android.content.ContentValues;
import android.text.TextUtils;
import android.util.Log;

import com.tencent.mm.ext.lucky.LuckyMsgWatcher;

/**
 * 用于交流消息监控
 */
public class ChatMsgWatcher implements DbHook {


    /**
     * 监控数据库写
     *
     * @param table
     * @param values
     */
    @Override
    public void watchDataInsert(String table, ContentValues values) {
        Log.d("ChatMsgWatcher", "table:" + table + ", values:" + values);
        if ("message".equals(table)) {
            MsgInfo msgInfo = parse(values);
            if (msgInfo != null) {
                LuckyMsgWatcher.onReceiveChatMsg(msgInfo);
                TextMsgWatcher.onReceiveChatMsg(msgInfo);
            }
        }
    }

    /**
     * table:message,
     * values:
     * <p>
     * talker=wxid_wrsbka9vy0zd21
     * flag=0
     * bizChatId=-1
     * msgId=11
     * type=436207665
     * <p>
     * content=<msg>
     * <appmsg appid="" sdkver="">
     * <des><![CDATA[我给你发了一个红包，赶紧去拆!]]></des>
     * <url><![CDATA[https://wxapp.tenpay.com/mmpayhb/wxhb_personalreceive?showwxpaytitle=1&msgtype=1&channelid=1
     * &sendid=1000039401201801267034710415487&ver=6&sign
     * =f38ba3fa433b1396249345cac44865268e6fc2c09e7afc261c62287f2010047e799d4ac7a95cef3d024b1e106720a2fbcdd34ec1306b4590620c2f6d4c91ea1dcd3cbd0417de80306d5d6c23b764410f]]></url>
     * <type><![CDATA[2001]]></type>
     * <title><![CDATA[微信红包]]></title>
     * <thumburl><![CDATA[https://wx.gtimg.com/hongbao/1800/hb.png]]></thumburl>
     * <wcpayinfo>
     * <templateid><![CDATA[7a2a165d31da7fce6dd77e05c300028a]]></templateid>
     * <url><![CDATA[https://wxapp.tenpay.com/mmpayhb/wxhb_personalreceive?showwxpaytitle=1&msgtype=1&channelid=1
     * &sendid=1000039401201801267034710415487&ver=6&sign
     * =f38ba3fa433b1396249345cac44865268e6fc2c09e7afc261c62287f2010047e799d4ac7a95cef3d024b1e106720a2fbcdd34ec1306b4590620c2f6d4c91ea1dcd3cbd0417de80306d5d6c23b764410f]]></url>
     * <iconurl><![CDATA[https://wx.gtimg.com/hongbao/1800/hb.png]]></iconurl>
     * <receivertitle><![CDATA[恭喜发财，大吉大利]]></receivertitle>
     * <sendertitle><![CDATA[恭喜发财，大吉大利]]></sendertitle>
     * <scenetext><![CDATA[微信红包]]></scenetext>
     * <senderdes><![CDATA[查看红包]]></senderdes>
     * <receiverdes><![CDATA[领取红包]]></receiverdes>
     * <nativeurl><![CDATA[wxpay://c2cbizmessagehandler/hongbao/receivehongbao?msgtype=1&channelid=1&sendid
     * =1000039401201801267034710415487&sendusername=wxid_wrsbka9vy0zd21&ver=6&sign
     * =f38ba3fa433b1396249345cac44865268e6fc2c09e7afc261c62287f2010047e799d4ac7a95cef3d024b1e106720a2fbcdd34ec1306b4590620c2f6d4c91ea1dcd3cbd0417de80306d5d6c23b764410f]]></nativeurl>
     * <sceneid><![CDATA[1002]]></sceneid>
     * <innertype><![CDATA[0]]></innertype>
     * <paymsgid><![CDATA[1000039401201801267034710415487]]></paymsgid>
     * <scenetext>微信红包</scenetext>
     * <locallogoicon><![CDATA[c2c_hongbao_icon_cn]]></locallogoicon>
     * <invalidtime><![CDATA[1517029182]]></invalidtime>
     * </wcpayinfo>
     * </appmsg>
     * <fromusername><![CDATA[wxid_wrsbka9vy0zd21]]></fromusername>
     * </msg>
     * <p>
     * msgSvrId=2958421444683491822
     * lvbuffer=[B@5caaba9
     * createTime=1516971239745
     * reserved=~SEMI_XML~��#.msg.appmsg
     * .wcpayinfo.receivertitle��	恭喜发财，大吉大利��.msg��
     * ��.msg.fromusername��wxid_wrsbka9vy0zd21��.msg.appmsg.des��我给你发了一个红包，赶紧去拆!�� .msg.appmsg��
     * ��!.msg.appmsg.wcpayinfo.receiverdes��领取红包��.msg.appmsg.wcpayinfo.sceneid��1002��!.msg.appmsg.wcpayinfo
     * .sendertitle��	恭喜发财，大吉大利��.msg.appmsg.wcpayinfo.paymsgid��1000039401201801267034710415487��!.msg.appmsg
     * .wcpayinfo.invalidtime��
     * 1517029182�� .msg.appmsg.wcpayinfo.templateid�� 7a2a165d31da7fce6dd77e05c300028a��.msg.appmsg.title��微信红包��
     * .msg.appmsg.type��2001��.msg.appmsg.url��įhttps://wxapp.tenpay
     * .com/mmpayhb/wxhb_personalreceive?showwxpaytitle=1&msgtype=1&channelid=1&sendid
     * =1000039401201801267034710415487&ver=6&sign
     * =f38ba3fa433b1396249345cac44865268e6fc2c09e7afc261c62287f2010047e799d4ac7a95cef3d024b1e106720a2fbcdd34ec1306b4590620c2f6d4c91ea1dcd3cbd0417de80306d5d6c23b764410f��#.msg.appmsg.wcpayinfo.locallogoicon��c2c_hongbao_icon_cn��.msg.appmsg.wcpayinfo��
     * ��.msg.appmsg.wcpayinfo.url��įhttps://wxapp.tenpay
     * .com/mmpayhb/wxhb_personalreceive?showwxpaytitle=1&msgtype=1&channelid=1&sendid
     * =1000039401201801267034710415487&ver=6&sign
     * =f38ba3fa433b1396249345cac44865268e6fc2c09e7afc261c62287f2010047e799d4ac7a95cef3d024b1e106720a2fbcdd34ec1306b4590620c2f6d4c91ea1dcd3cbd0417de80306d5d6c23b764410f��.msg.appmsg.wcpayinfo.iconurl��(https://wx.gtimg.com/hongbao/1800/hb.png��.msg.appmsg.wcpayinfo.innertype��0��.msg.appmsg.$sdkver������ .msg.appmsg.wcpayinfo.scenetext1��微信红包��.msg.appmsg.wcpayinfo.scenetext��微信红包��.msg.appmsg.$appid������.msg.appmsg.wcpayinfo.senderdes��查看红包��.msg.appmsg.wcpayinfo.nativeurl��Ľwxpay://c2cbizmessage
     * <p>
     * <p>
     * table:AppMessage, values:xml=null appId= msgId=11
     * description=我给你发了一个红包，赶紧去拆! source=null title=微信红包 type=2001
     * <p>
     * talker=wxid_wrsbka9vy0zd21
     * flag=0
     * bizChatId=-1
     * msgId=20
     * type=1
     * content=弄不好
     * talkerId=51 isSend=0 msgSeq=673235577 status=3
     *
     * @param values
     * @return
     */
    private static MsgInfo parse(ContentValues values) {
        MsgInfo info = new MsgInfo();
        info.type = values.getAsInteger("type");
        info.talker = values.getAsString("talker");
        info.msg_id = values.getAsLong("msgId");
        info.content = values.getAsString("content");
        if (values.containsKey("msgSvrId")) {
            info.msg_svr_id = values.getAsLong("msgSvrId");
        }
        info.create = values.getAsLong("createTime");
        info.issend = values.getAsInteger("isSend");
        return info;
    }

    //  msg:insert:27 talker:wxid_wrsbka9vy0zd21 id:27 type:43 svrid:5140604117545927514  create:1479656096000 issend:0
    private static MsgInfo parse(String msg) {
        if (TextUtils.isEmpty(msg)) {
            return null;
        }
        if (!msg.contains("insert")) {
            return null;
        }
        if (!msg.contains("talker")) {
            return null;
        }
        String[] array = msg.split("\\s+");
        MsgInfo info = new MsgInfo();
        for (String text : array) {
            if (text.startsWith("insert:")) {
                info.msg_id = Long.valueOf(text.replace("insert:", "").trim());
            } else if (text.startsWith("talker:")) {
                info.talker = text.replace("talker:", "").trim();
            } else if (text.startsWith("type:")) {
                info.type = Integer.valueOf(text.replace("type:", "").trim());
            } else if (text.startsWith("svrid:")) {
                info.msg_svr_id = Long.valueOf(text.replace("svrid:", "").trim());
            } else if (text.startsWith("create:")) {
                info.create = Long.valueOf(text.replace("create:", "").trim());
            } else if (text.startsWith("issend:")) {
                info.issend = Integer.valueOf(text.replace("issend:", "").trim());
            }
        }
        int contentStart = msg.indexOf("field_content:") + "field_content:".length();
        info.content = msg.substring(contentStart);
        return info;
    }
}
