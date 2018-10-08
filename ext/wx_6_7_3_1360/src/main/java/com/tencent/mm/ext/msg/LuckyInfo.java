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
     * &sendid=1000034901201611227020350998827&ver=6&sign
     * =d3b5014b900b97a7442b5df1234426adc5b79cd6cec0dcfba0f9ca94758643e253896fa0755009abfe0a773b37e3e37817d7d5821e6d3e1e2fe368e12ef991a6435014d401f3b8ecd0fe9343214a9fe248990fb3ff4f7ede532008a3fed5c919]]>
     * </url>
     * <type><![CDATA[2001]]></type>
     * <title><![CDATA[微信红包]]></title>
     * <thumburl><![CDATA[http://wx.gtimg.com/hongbao/1605/hb.png]]></thumburl>
     * <wcpayinfo>
     * <templateid><![CDATA[7a2a165d31da7fce6dd77e05c300028a]]></templateid>
     * <url><![CDATA[https://wxapp.tenpay.com/mmpayhb/wxhb_personalreceive?showwxpaytitle=1&msgtype=1&channelid=1
     * &sendid=1000034901201611227020350998827&ver=6&sign
     * =d3b5014b900b97a7442b5df1234426adc5b79cd6cec0dcfba0f9ca94758643e253896fa0755009abfe0a773b37e3e37817d7d5821e6d3e1e2fe368e12ef991a6435014d401f3b8ecd0fe9343214a9fe248990fb3ff4f7ede532008a3fed5c919]]></url>
     * <iconurl><![CDATA[http://wx.gtimg.com/hongbao/1605/hb.png]]></iconurl>
     * <receivertitle><![CDATA[恭喜发财，大吉大利！]]></receivertitle>
     * <sendertitle><![CDATA[恭喜发财，大吉大利！]]></sendertitle>
     * <scenetext><![CDATA[微信红包]]></scenetext>
     * <senderdes><![CDATA[查看红包]]></senderdes>
     * <receiverdes><![CDATA[领取红包]]></receiverdes>
     * <nativeurl><![CDATA[wxpay://c2cbizmessagehandler/hongbao/receivehongbao?msgtype=1&channelid=1&sendid
     * =1000034901201611227020350998827&sendusername=wxid_wrsbka9vy0zd21&ver=6&sign
     * =d3b5014b900b97a7442b5df1234426adc5b79cd6cec0dcfba0f9ca94758643e253896fa0755009abfe0a773b37e3e37817d7d5821e6d3e1e2fe368e12ef991a6435014d401f3b8ecd0fe9343214a9fe248990fb3ff4f7ede532008a3fed5c919]]>
     * </nativeurl>
     * <sceneid><![CDATA[1002]]></sceneid>
     * <innertype><![CDATA[0]]></innertype>
     * <scenetext>微信红包</scenetext></wcpayinfo>
     * </appmsg>
     * <fromusername><![CDATA[wxid_wrsbka9vy0zd21]]></fromusername>
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