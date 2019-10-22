package com.tencent.mm.ext.msg;

import android.app.ext.DbHook;
import android.app.ext.utils.Log;
import android.content.ContentValues;

import java.util.ArrayList;
import java.util.List;

/**
 * 用于交流消息监控
 */
public class ChatMsgWatcher implements DbHook {

    /**
     * msg 表
     */
    private static final String TABLE_MESSAGE = "message";

    /**
     * 消息监听器
     */
    private List<MessageListener> listeners = new ArrayList<>();

    /**
     * 添加消息监听
     *
     * @param listener
     */
    public void addMessageListener(MessageListener listener) {
        listeners.add(listener);
    }

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
            for (MessageListener listener : listeners) {
                boolean handled = listener.onReceiveMsg(msgInfo);
                if (handled) {
                    // 如果有消息处理器处理了, 则不在继续下发处理, 要求越明确的消息处理器在最前面
                    return;
                }
            }
        }
    }
}
