package com.tencent.mm.ext.luckymoney;

import android.app.ext.utils.Log;

import com.tencent.mm.ext.WXConfig;
import com.tencent.mm.ext.msg.MessageListener;
import com.tencent.mm.ext.msg.MsgInfo;

/**
 * 红包消息处理
 */
public class LuckyMsgWatcher implements MessageListener {

    @Override
    public boolean onReceiveMsg(MsgInfo msgInfo) {
        if (msgInfo.isLuckyMoney()) {
            if (!WXConfig.ENABLE_MYSELF_LUCKY) {
                if (msgInfo.isSend()) {
                    // 自己发送的不抢
                    return true;
                }
            }
            // 红包消息监听
            LuckyInfo info = LuckyInfo.parse(msgInfo.content, msgInfo.talker);
            Log.d(info.toString());
            LuckyMoneyReceiveUIController.launchLuckyMoneyUI(info);
            return true;
        }
        return false;
    }

}
