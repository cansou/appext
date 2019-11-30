package com.tencent.mm.ext.chatbot;

import android.app.Activity;

import com.tencent.mm.ext.WXRuntime;

/**
 *
 */
public class LauncherUIChat {

    private static IChatUIController sIChatUIController;

    /**
     * 打开聊天界面并发送消息
     *
     * @param talker
     * @param msg
     */
    public static void openChatSendMsg(String talker, String msg) {
        try {
            if (sIChatUIController != null) {
                sIChatUIController.openChatSendMsg(talker, msg);
            }
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }

    public static void initView(Activity activity) {
        if (sIChatUIController != null) {
            return;
        }
        if (WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_7_0_9_1560)) {
            sIChatUIController = new ChatUIV7_0_9_1560(activity);
        } else if (WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_7_0_7_1521)) {
            sIChatUIController = new ChatUIV7_0_7_1521(activity);
        } else if (WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_6_7_3_1360)) {
            sIChatUIController = new ChatUIV6_7_3_1360(activity);
        }
    }

}
