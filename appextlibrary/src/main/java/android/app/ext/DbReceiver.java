package android.app.ext;

import android.content.BroadcastReceiver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

import java.util.ArrayList;
import java.util.List;

public class DbReceiver extends BroadcastReceiver {

    private static final String ACTION = "action_dbinsert";

    private static final DbReceiver DBRECEIVER = new DbReceiver();

    private static final List<DbHook> HOOK_LIST = new ArrayList<>();

    @Override
    public void onReceive(Context context, Intent intent) {
        String table = intent.getStringExtra("table");
        ContentValues values = intent.getParcelableExtra("values");
//        Log.d("table:" + table + ",values:" + values);
        for (DbHook hook : HOOK_LIST) {
            hook.watchDataInsert(table, values);
        }
    }

    public static void register(Context context) {
        IntentFilter filter = new IntentFilter();
        filter.addAction(ACTION);
        context.registerReceiver(DBRECEIVER, filter);
    }

    public static void addHook(DbHook hook) {
        HOOK_LIST.add(hook);
    }

}
