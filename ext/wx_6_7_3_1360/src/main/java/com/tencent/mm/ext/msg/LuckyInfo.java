package com.tencent.mm.ext.msg;

public class LuckyInfo {

    public int way;
    public String nativeurl;
    public String name;

    /**
     * <msg>
     * <appmsg appid="" sdkver="">
     * <des><![CDATA[我给你发了一个红包，赶紧去拆!]]></des>
     * <url>
     * <![CDATA[https://wxapp.tenpay.com/mmpayhb/wxhb_personalreceive?showwxpaytitle=1&msgtype=1&channelid=1
     * &sendid=1234567
     * &ver=6
     * &sign=1234556]]>
     * </url>
     * <type><![CDATA[2001]]></type>
     * <title><![CDATA[微信红包]]></title>
     * <thumburl><![CDATA[http://wx.gtimg.com/hongbao/xxxx/hb.png]]></thumburl>
     * <wcpayinfo>
     * <templateid><![CDATA[1a1a1as11a]]></templateid>
     * <url>
     * <![CDATA[https://wxapp.tenpay.com/mmpayhb/wxhb_personalreceive?showwxpaytitle=1&msgtype=1&channelid=1
     * &sendid=1234567&ver=6
     * &sign=1234556]]></url>
     * <iconurl><![CDATA[http://wx.gtimg.com/hongbao/1605/hb.png]]></iconurl>
     * <receivertitle><![CDATA[恭喜发财，大吉大利！]]></receivertitle>
     * <sendertitle><![CDATA[恭喜发财，大吉大利！]]></sendertitle>
     * <scenetext><![CDATA[微信红包]]></scenetext>
     * <senderdes><![CDATA[查看红包]]></senderdes>
     * <receiverdes><![CDATA[领取红包]]></receiverdes>
     * <nativeurl><![CDATA[wxpay://c2cbizmessagehandler/hongbao/receivehongbao?msgtype=1&channelid=1
     * &sendid=xxxxxxxx&sendusername=xxxxxx&ver=6&sign=xxxxxxx]]>
     * </nativeurl>
     * <sceneid><![CDATA[1002]]></sceneid>
     * <innertype><![CDATA[0]]></innertype>
     * <scenetext>微信红包</scenetext></wcpayinfo>
     * </appmsg>
     * <fromusername><![CDATA[xxxxx]]></fromusername>
     * </msg>
     *
     * @param content
     * @return
     */
    public static LuckyInfo parse(String content, String talker) {
        int start = content.indexOf("<nativeurl><![CDATA[") + "<nativeurl><![CDATA[".length();
        int end = content.indexOf("]]></nativeurl>");
        String nativeurl = content.substring(start, end);
        LuckyInfo info = new LuckyInfo();
        info.nativeurl = nativeurl;
        info.way = 1;
        info.name = talker;
        return info;
    }
}