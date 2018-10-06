package com.tencent.mm.ext.lucky;

import android.content.Intent;

import com.tencent.mm.ext.WeixinExtApp;
import com.tencent.mm.ext.msg.MsgInfo;

/**
 * 红包消息监听
 */
public class LuckyMsgWatcher {

    public static void onReceiveChatMsg(MsgInfo msgInfo) {
        if (isLuckyMoney(msgInfo)) {
            LuckyInfo info = LuckyInfo.parse(msgInfo.content, msgInfo.talker);
            launchLuckyMoney(info);
        }
    }

    /**
     * 是否为红包消息
     *
     * @param msgInfo
     * @return
     */
    private static boolean isLuckyMoney(MsgInfo msgInfo) {
        return !msgInfo.isSend() && msgInfo.type == MsgInfo.TYPE_LUCKY_MONEY;
    }

    /**
     * 打开抢红包页面
     *
     * @param info
     */
    public static void launchLuckyMoney(LuckyInfo info) {
        String native_url = info.nativeurl;
        Intent intent = new Intent();
        intent.putExtra("key_way", info.way);
        intent.putExtra("key_native_url", native_url);
        intent.putExtra("key_username", info.name);
        intent.setClassName(WeixinExtApp.get(), LuckyMoneyReceiveUI.ACTIVITY_NAME);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        WeixinExtApp.get().startActivity(intent);
    }

}
