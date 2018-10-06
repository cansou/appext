package com.tencent.mm.ext.msg;

import android.app.ext.utils.UiUtils;
import android.text.TextUtils;
import android.util.Log;

import com.agmbat.robot.RobotCenter;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 监测试文本消息
 */
public class TextMsgWatcher {
    private static final boolean DEBUG = false;

    private static final String TAG = TextMsgWatcher.class.getSimpleName();

    private static boolean sNeedAtMe = true;
    private static final int FIVE_MINUTES = 5 * 60 * 1000;
    /**
     * 机器在微信中的名称
     */
    private static final List<String> ROBOT_NAME_LIST = new ArrayList<>();

    static {
        if (DEBUG) {
            ROBOT_NAME_LIST.add("@测试机器人");
            ROBOT_NAME_LIST.add("测试机器人");
        } else {
            ROBOT_NAME_LIST.add("@机器人");
            ROBOT_NAME_LIST.add("机器人");
        }
    }

    /**
     * 本机控制器是否启用
     */
    private static boolean sEnable = true;

    /**
     * 后台线程为单线程
     */
    private static final ExecutorService SINGLE_THREAD_EXECUTOR = Executors.newSingleThreadExecutor();

    public static void setEnable(boolean enable) {
        sEnable = enable;
    }

    public static void onReceiveChatMsg(final MsgInfo msgInfo) {
        if (!isTextMsg(msgInfo)) {
            return;
        }
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
    }

    /**
     * 获取答复
     *
     * @param msgInfo
     * @return
     */
    private static String getAnswer(MsgInfo msgInfo) {
        String msg = msgInfo.content;
        int index = msg.indexOf("\n");
        if (index != -1) {
            msg = msg.substring(index + 1).trim();
        }
        if (sNeedAtMe && !isTalkWithRobot(msg)) {
            return null;
        }
        sNeedAtMe = false;
        setNeedAtMeAfter(FIVE_MINUTES);
        msg = removeRobotName(msg);
        msg = msg.trim();
        Log.i(TAG, "receive content:" + msg);
        RobotCenter robotCenter = new RobotCenter();
        return robotCenter.talk(msg);
    }

    /**
     * 在消息中移除机器人名称
     *
     * @param msg
     * @return
     */
    private static String removeRobotName(String msg) {
        for (String selfName : ROBOT_NAME_LIST) {
            msg = msg.replace(selfName + " ", "").replace(selfName, "");
        }
        return msg;
    }

    /**
     * 是否在和机器人对话
     *
     * @param message
     * @return
     */
    private static boolean isTalkWithRobot(String message) {
        for (String selfName : ROBOT_NAME_LIST) {
            if (message.contains(selfName)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 是否为文字消息
     *
     * @param msgInfo
     * @return
     */
    private static boolean isTextMsg(MsgInfo msgInfo) {
        return !msgInfo.isSend() && msgInfo.type == 1;
    }

    private static void setNeedAtMeAfter(int mills) {
        UiUtils.removeCallbacks(mSetNeedAtMe);
        UiUtils.runOnUiThreadDelay(mSetNeedAtMe, mills);
    }

    private static Runnable mSetNeedAtMe = new Runnable() {
        @Override
        public void run() {
            sNeedAtMe = true;
        }
    };
}
