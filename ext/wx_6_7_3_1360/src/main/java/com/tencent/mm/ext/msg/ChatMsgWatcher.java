package com.tencent.mm.ext.msg;

import android.app.ext.DbHook;
import android.app.ext.utils.Log;
import android.content.ContentValues;

/**
 * 用于交流消息监控
 */
public class ChatMsgWatcher implements DbHook {

    /**
     * msg 表
     */
    private static final String TABLE_MESSAGE = "message";

    /**
     * 监控数据库写
     *
     * @param table
     * @param values
     */
    @Override
    public void watchDataInsert(String table, ContentValues values) {
        Log.d("ChatMsgWatcher", "table:" + table + ", values:" + values);
        if (TABLE_MESSAGE.equals(table)) {
            MsgInfo msgInfo = MsgInfo.parse(values);
            if (msgInfo == null) {
                return;
            }
            if (msgInfo.isLuckyMoney()) {
                // 红包消息监听
                LuckyInfo info = LuckyInfo.parse(msgInfo.content, msgInfo.talker);
                LuckyMoneyReceiveUI.launchLuckyMoney(info);
            } else if (msgInfo.isTextMsg()) {
                TextMsgWatcher.onReceiveChatMsg(msgInfo);
            }
        }
    }
}
