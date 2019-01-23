package com.baidu.hi.ext;

import android.content.Context;
import android.content.SharedPreferences;

import com.baidu.hi.luckymoney.logic.LuckyMoneyTryOpenEvent;

import java.util.HashMap;
import java.util.Map;

/**
 * 解析出的红包页面所需要的信息
 */
public class MsgObject {

    public String msgId;
    public Map<String, String> map = new HashMap<>();

    public String displayName;

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public LuckyMoneyTryOpenEvent toLuckyMoneyTryOpenEvent() {
        LuckyMoneyTryOpenEvent event = new LuckyMoneyTryOpenEvent();
        event.setSuccess(false);
        event.setResponseCode(100);
        event.setTransactionID(0);

        event.setBaiduId(getLoginBaiduId());
        event.setDisplayName(displayName);
//
        event.setHeaderMd5(null);
        event.setSender(false);

        int fromChatType = Integer.parseInt(map.get("type"));
        event.setFromChatType(fromChatType);

        long from = Long.parseLong(map.get("from"));
        event.setFromChatId(from);

        MsgBody msgBody = MsgBody.parse(map.get("msgBody"));

        event.setMessage(msgBody.luckymoneyMessage);
        event.setMoneyId(msgBody.luckymoneyId);

        int moneyType = Integer.parseInt(msgBody.luckymoneyType);
        event.setMoneyType(moneyType);

        long senderUid = Long.parseLong(msgBody.luckymoneySenderUid);
        event.setSenderUid(senderUid);
        event.setSource(msgBody.luckymoneySource);
        return event;
    }

    /**
     * 获取当前登陆的baidu id
     *
     * @return
     */
    public static String getLoginBaiduId() {
        Context context = HiExtApp.get().getApplicationContext();
        SharedPreferences preferences = context.getSharedPreferences("crab_user_info", Context.MODE_PRIVATE);
        String userName = preferences.getString("userName", null);
        return userName;
    }
}
