package com.tencent.mm.ext.luckymoney.send;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;

import com.tencent.mm.ext.WXRuntime;

/**
 * 发红包处理类
 */
public class LuckyMoneySender {

    public static final String KEY_FORM_APPEXT = "from_appkext";

    public static final String KEY_WAY = "key_way";

    public static final String KEY_LUCKY_TOTAL = "key_lucky_total";
    public static final String KEY_LUCKY_NUM = "key_lucky_num";
    public static final String KEY_LUCKY_DESC = "key_lucky_desc";

    /**
     * 是否是由机器人发送的红包
     */
    private static boolean sIsSendByRobot = false;

    /**
     * 支付密码
     */
    private static String sPayPassword = "";
    private static String sTempPayPassword = "";


    public static String getPayPassword() {
        return sPayPassword;
    }

    public static void setPayPassword(String password) {
        sPayPassword = password;
    }

    /**
     * 临时记录一次支付密码, 用于纠错
     *
     * @param password
     */
    public static void setTempPayPassword(String password) {
        sTempPayPassword = password;
    }

    public static void setSendByRobot(boolean value) {
        sIsSendByRobot = value;
    }

    /**
     * 是否为机器人发送的红包
     *
     * @return
     */
    public static boolean isSendByRobot() {
        return sIsSendByRobot;
    }

    /**
     * 发送红包
     *
     * @param taker
     * @param memberNum
     */
    public static void launchLuckyMoneyPrepareUI(String taker, int memberNum, String total, String luckyNum,
                                                 String desc) {
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

    /**
     * 本机发送红包
     */
    public static void onSenderLuckyMsg() {
        // 尝试保存支付密码
        if (!sIsSendByRobot) {
            if (!TextUtils.isEmpty(sTempPayPassword)) {
                // 保存发送过的密码
                sPayPassword = sTempPayPassword;
            }
        }
        // 清空临时密码
        sTempPayPassword = null;
    }


}
