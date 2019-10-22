package com.tencent.mm.ext.chatbot.friends;

import com.agmbat.text.StringUtils;

import java.util.HashMap;
import java.util.Map;

public class FriendsMap {

    private static Map<String, FriendInfo> sMap = new HashMap<>();

    static {
        FriendInfo friendInfo = new FriendInfo();
        friendInfo.userId = "";
        friendInfo.name = "";
        if (!StringUtils.isEmpty(friendInfo.userId)) {
            sMap.put(friendInfo.userId, friendInfo);
        }
    }
}
