package android.app.ext;

import android.content.ContentValues;

public interface DbHook {

    public void watchDataInsert(String table, ContentValues values);

}
