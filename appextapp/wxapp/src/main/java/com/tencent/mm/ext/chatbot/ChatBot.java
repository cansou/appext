package com.tencent.mm.ext.chatbot;

import android.app.ext.utils.UiUtils;
import android.text.TextUtils;
import android.util.Log;

import com.agmbat.robot.RobotCenter;
import com.tencent.mm.ext.luckymoney.send.LuckyMoneySender;
import com.tencent.mm.ext.msg.MsgInfo;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 聊天机器人
 */
public class ChatBot {

    private static final String TAG = TextMsgWatcher.class.getSimpleName();

    /**
     * 设置在指定时间段内聊天不需要@
     */
    private static final long FIVE_MINUTES = 5 * 60 * 1000;

    private static final boolean FORCE_NEED_AT = true;
    /**
     * 机器在微信中的名称
     */
    private static final List<String> ROBOT_NAME_LIST = new ArrayList<>();

    /**
     * 本机控制器是否启用
     */
    private static boolean sEnable = true;

    private static boolean sNeedAtMe = true;

    /**
     * 后台线程为单线程
     */
    private static final ExecutorService SINGLE_THREAD_EXECUTOR = Executors.newSingleThreadExecutor();

    private static final String BOT_NICK_NAME = "机器人";
    private static final String AT_BOT_NICK_NAME = "@" + BOT_NICK_NAME;

    private static Runnable mSetNeedAtMe = new Runnable() {
        @Override
        public void run() {
            sNeedAtMe = true;
        }
    };

    public static void setEnable(boolean enable) {
        sEnable = enable;
    }

    /**
     * 收到聊天消息
     *
     * @param msgInfo
     */
    public static void onReceiveMsg(final MsgInfo msgInfo) {
        // 聊天机器人只在群聊中处理
        if (msgInfo.isChatroomMsg()) {
            if (!sEnable) {
                return;
            }
            SINGLE_THREAD_EXECUTOR.execute(new Runnable() {
                @Override
                public void run() {
                    final String answer = getAnswer(msgInfo);
                    if (!TextUtils.isEmpty(answer)) {
                        UiUtils.post(new Runnable() {
                            @Override
                            public void run() {
                                LauncherUIChat.openChatSendMsg(msgInfo.talker, answer);
                            }
                        });
                    }
                }
            });
        } else {
            // 单聊不处理
        }
    }

    /**
     * 获取答复
     *
     * @param msgInfo
     * @return
     */
    private static String getAnswer(MsgInfo msgInfo) {
        String content = msgInfo.textContext;
        if (!isTalkWithRobot(content)) {
            return null;
        }
        if (!FORCE_NEED_AT) {
            setNeedAtMeAfter(FIVE_MINUTES);
        }
        String msg = removeRobotName(content);


        Log.i(TAG, "receive content:" + msg);
        if (msg.equals("发红包")) {
            if (TextUtils.isEmpty(LuckyMoneySender.getPayPassword())) {
                return "需要配置支付密码!";
            }
            sendLuckMoney(msgInfo);
            return "";
        } else if (msg.startsWith("发红包")) {
            String password = msg.replace("发红包", "").trim();
            if (password.length() == 6) {
                if (isNumber(password)) {
                    LuckyMoneySender.setPayPassword(password);
                    sendLuckMoney(msgInfo);
                    return "";
                }
            }
        }
        RobotCenter robotCenter = new RobotCenter(); // 亲爱的，当天请求次数已用完。
        return robotCenter.talk(msg);
    }

    public static boolean isNumber(String str) {
        for (int i = 0; i < str.length(); i++) {
            System.out.println(str.charAt(i));
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    /**
     * 发送红包
     *
     * @param msgInfo
     */
    private static void sendLuckMoney(MsgInfo msgInfo) {
        LuckyMoneySender.launchLuckyMoneyPrepareUI(msgInfo.talker, 3, "0.01", "1", "");
    }

    /**
     * 在消息中移除机器人名称
     *
     * @param msg
     * @return
     */
    private static String removeRobotName(String msg) {
        msg = msg.replace(AT_BOT_NICK_NAME + " ", "")
                .replace(AT_BOT_NICK_NAME, "")
                .replace(BOT_NICK_NAME, "").trim();
        return msg;
    }

    /**
     * 是否在和机器人对话
     *
     * @param message
     * @return
     */
    private static boolean isTalkWithRobot(String message) {
        if (message.startsWith("@")) {
            // parse list, 判断是否有机器,如果没有则返回false
            return message.contains(AT_BOT_NICK_NAME);
        }
        if (!sNeedAtMe) {
            return true;
        }
        for (String selfName : ROBOT_NAME_LIST) {
            if (message.contains(selfName)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 设置在指定时间段内聊天不需要@
     *
     * @param mills
     */
    private static void setNeedAtMeAfter(long mills) {
        sNeedAtMe = false;
        UiUtils.removeCallbacks(mSetNeedAtMe);
        UiUtils.runOnUiThreadDelay(mSetNeedAtMe, mills);
    }


}
