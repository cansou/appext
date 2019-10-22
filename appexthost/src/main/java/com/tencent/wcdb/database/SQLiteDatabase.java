package com.tencent.wcdb.database;

import android.app.ActivityThread;
import android.content.ContentValues;
import android.content.Intent;

public class SQLiteDatabase {

    public final long insert(String table, String nullColumnHack, ContentValues values) {
        String action = "action_dbinsert";
        Intent intent = new Intent(action);
        intent.putExtra("table", table);
        intent.putExtra("values", values);
        // 通过静态方法获取Context
        ActivityThread.currentApplication().sendBroadcast(intent);
        return 0;
    }
}
