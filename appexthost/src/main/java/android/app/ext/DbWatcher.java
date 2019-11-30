package android.app.ext;

import android.app.ActivityThread;
import android.content.ContentValues;
import android.content.Intent;

/**
 * 在smail文件中通过广播发送数据库事件
 */
public class DbWatcher {

    public static void watchDataInsert(String table, ContentValues values) {
        new Exception().printStackTrace();
        String action = "action_dbinsert";
        Intent intent = new Intent(action);
        intent.putExtra("table", table);
        intent.putExtra("values", values);
        // 通过静态方法获取Context
        ActivityThread.currentApplication().sendBroadcast(intent);
    }
}

