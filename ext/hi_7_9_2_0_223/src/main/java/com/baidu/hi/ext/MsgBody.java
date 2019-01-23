package com.baidu.hi.ext;

/**
 * 红包信息
 * * msgBody=
 * '<msg>
 * <font c="0" b="0" i="0" n="宋体" ul="0" s="10" cs="134" />
 * <text c="" cfn="3" apns="[百度红包]22222">
 * <luckymoney
 * id="1234567890abcdef"
 * message="22222"
 * type="1"
 * source="1"
 * sender_uid="1365633864"
 * sender_header=".jpg"
 * sender_name="sender_name"
 * />
 * </text>
 * <text c="发红包了，快用新版手机Hi去抢：" cfn="999" />
 * <url ref="http://im.baidu.com/upgrade?t=luckymoney" c="http://im.baidu.com/upgrade?t=luckymoney" cfn="999" t="2" />
 * </msg>',
 */
public class MsgBody {

    public String luckymoneyId;
    public String luckymoneyMessage;
    public String luckymoneyType;
    public String luckymoneySource;
    public String luckymoneySenderUid;
    public String luckymoneySenderName;

    public static MsgBody parse(String msg) {
        int start = msg.indexOf("luckymoney");
        String text = msg.substring(start);
        int end = text.indexOf("/>");
        text = text.substring(0, end);
        String[] array = text.split(" ");
        MsgBody body = new MsgBody();
        for (String line : array) {
            if (line.contains("=")) {
                String[] kv = line.split("=", 2);
                String key = kv[0].trim();
                String value = kv[1].trim();
                if (key.equals("id")) {
                    body.luckymoneyId = trimText(value);
                } else if (key.equals("message")) {
                    body.luckymoneyMessage = trimText(value);
                } else if (key.equals("type")) {
                    body.luckymoneyType = trimText(value);
                } else if (key.equals("source")) {
                    body.luckymoneySource = trimText(value);
                } else if (key.equals("sender_uid")) {
                    body.luckymoneySenderUid = trimText(value);
                } else if (key.equals("sender_name")) {
                    body.luckymoneySenderName = trimText(value);
                }
            }
        }
        return body;
    }

    private static String trimText(String value) {
        return value.replaceAll("\"", "").trim();
    }
}
