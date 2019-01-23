package com.baidu.hi.ext;

import android.app.ext.utils.Log;

import com.baidu.hi.luckymoney.logic.LuckyMoneyTryOpenEvent;

import java.util.HashMap;
import java.util.Map;

/**
 * 钱包消息解析
 */
public class LuckyMoneyParser {

    private static final String KEY_WORD_END = "processObjToConversation conv 02:";

    private static MsgObject sMsgObject = null;


    /**
     * 解析钱包消息， 通过分析log能够获取到打开钱包的Activity的所有数据
     *
     * @param msg
     * @return
     */
    public static LuckyMoneyTryOpenEvent parse(String msg) {
        if (!isLuckyMoneyMsg(msg)) {
            return null;
        }
        Log.d(msg);

        if (msg.contains("MessageChat")) {
            Map<String, String> map = parseMessageChat(msg);
            String msgId = map.get("messageId");
            if (sMsgObject == null) {
                sMsgObject = new MsgObject();
                sMsgObject.msgId = msgId;
                sMsgObject.map = map;
            } else {
                sMsgObject.map.putAll(map);
            }
        } else if (msg.contains(KEY_WORD_END)) {
            if (sMsgObject == null) {
                return null;
            }
            String displayName = parseDisplayName(msg);
            sMsgObject.setDisplayName(displayName);
            LuckyMoneyTryOpenEvent event = sMsgObject.toLuckyMoneyTryOpenEvent();
            sMsgObject = null;
            return event;
        } else {
            Map<String, String> map = parseMessageResponse(msg);
            String msgId = map.get("msgid");
            if (sMsgObject == null) {
                sMsgObject = new MsgObject();
                sMsgObject.msgId = msgId;
                sMsgObject.map = map;
            } else {
                sMsgObject.map.putAll(map);
            }
        }
        return null;
    }

    /**
     * 是否是红包信息
     *
     * @param msg
     * @return
     */
    private static boolean isLuckyMoneyMsg(String msg) {
        if (msg == null) {
            return false;
        }
        if (msg.contains("MessageChat") && msg.contains("luckymoney")) {
            return true;
        }

        if (msg.contains(KEY_WORD_END)) {
            return true;
        }
        // 以有一些关键字来判断是否为聊天消息
        return msg.contains("response.header[UTF-8]") && msg.contains("is_luckymoney:1");
    }


    /**
     * [pool-10-thread-1:SyncConversationLogic][LOGIN_READLY]: MsgToConvOpt::processReceiveMessageSync --->
     * msg: MessageChat
     * <p>
     * {
     * cutCount=0,
     * msgId=55,
     * baseMessageId=0000000000,
     * messageId=00000,
     * msgKeyOne=000000000000000,
     * subId=0,
     * sMsgId2=00000,
     * msgBody='<msg><font c="0" b="0" i="0" n="宋体" ul="0" s="10" cs="134" />
     * <text c="" cfn="3" apns="[百度红包]22222">
     * <luckymoney
     * id="1234567659abcd3e"
     * message="22222"
     * type="1"
     * source="1"
     * sender_uid="000000"
     * sender_header=".jpg"
     * sender_name="sender_name" />
     * </text><text c="发红包了，快用新版手机Hi去抢：" cfn="999" /><url ref="http://im.baidu.com/upgrade?t=luckymoney" c="http://im.baidu.com/upgrade?t=luckymoney" cfn="999" t="2" /></msg>',
     * inOut=false,
     * readOrNot=false,
     * sentStatus=-1,
     * oppositeUid=000000,
     * msgType=1,
     * oppositeOwner=0,
     * needNotification=true,
     * hasUnreadCount=false,
     * unreadCount=0,
     * isGroupAt=false,
     * isGroupAt2=false,
     * followUid=''}
     * <p>
     * com.baidu.hi.entity.ac@2a1943a
     *
     * @param msg
     * @return
     */
    private static Map<String, String> parseMessageChat(String msg) {
        Map<String, String> map = new HashMap<>();
        String text = findJsonString(msg);
        text = text.substring(1);
        text = text.substring(0, text.length() - 1);
        String[] array = text.split(",");
        for (String line : array) {
            if (line.contains("=")) {
                String[] kv = line.split("=", 2);
                map.put(kv[0].trim(), kv[1].trim());
            }
        }
        return map;
    }

    /**
     * [pool-12-thread-7:NetManager][LOGIN_READLY]: response.header[UTF-8]:
     * msg 1.3 N 20
     * baiduid:xxx
     * basemsgid:00000
     * content-length:508
     * content-type:text
     * from:0000000
     * is_luckymoney:1
     * method:msg_notify
     * msgid:000
     * nextsubid:0
     * s_basemsgid:00000000
     * s_msgid:0000
     * s_msgid2:0000
     * subid:0
     * sys_sess:00000000000000000000000000000000
     * time:1548074616209
     * to:0000
     * type:1
     * uid:0000
     * waitack:120
     *
     * @param msg
     * @return
     */
    private static Map<String, String> parseMessageResponse(String msg) {
        Map<String, String> map = new HashMap<>();
        String[] array = msg.split("\n");
        for (String line : array) {
            if (line.contains(":")) {
                String[] kv = line.split(":", 2);
                map.put(kv[0].trim(), kv[1].trim());
            }
        }
        return map;
    }

    /**
     * 在字符串在查找Json字符串
     *
     * @param result
     * @return
     */
    public static String findJsonString(String result) {
        int start = result.indexOf('{');
        int end = result.lastIndexOf('}') + 1;
        return result.substring(start, end);
    }

    /**
     * 解析显示名称
     *
     * @param msg
     * @return
     */
    private static String parseDisplayName(String msg) {
// [pool-10-thread-5:SyncConversationLogic][LOGIN_READLY]: MsgToConvOpt::processObjToConversation conv 02:
// null | xxx | [百度红包]恭喜发财，一起来Hi
        int start = msg.indexOf(KEY_WORD_END) + KEY_WORD_END.length();
        String text = msg.substring(start);
        String[] array = text.split("\\|");
        if (array.length == 3) {
            return array[1].trim();
        }
        return "";
    }
}
