package com.tencent.mm.ext.luckymoney.send;

import android.content.Context;
import android.content.Intent;

import com.tencent.mm.ext.WXRuntime;

public class LuckyMoneySender {

    public static final String KEY_FORM_APPEXT = "from_appkext";

    public static final String KEY_WAY = "key_way";

    public static final String KEY_LUCKY_TOTAL = "key_lucky_total";
    public static final String KEY_LUCKY_NUM = "key_lucky_num";
    public static final String KEY_LUCKY_DESC = "key_lucky_desc";

    /**
     * 发送红包
     *
     * @param taker
     * @param memberNum
     */
    public static void launchLuckyMoneyPrepareUI(String taker, int memberNum, String total, String luckyNum, String desc) {
        Context context = WXRuntime.getApplicationContext();
        Intent intent = new Intent();
        intent.putExtra("pay_channel", 14);
        intent.putExtra(KEY_WAY, 1);
        intent.putExtra("key_from", 1);
        intent.putExtra("key_type", 1);
        intent.putExtra("key_chatroom_num", memberNum);
        intent.putExtra("key_username", taker);
        intent.putExtra(KEY_FORM_APPEXT, true);

        intent.putExtra(KEY_LUCKY_TOTAL, total);
        intent.putExtra(KEY_LUCKY_NUM, luckyNum);
        intent.putExtra(KEY_LUCKY_DESC, desc);

        intent.setClassName(context, LuckyMoneyPrepareUI.ACTIVITY_NAME);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

}
