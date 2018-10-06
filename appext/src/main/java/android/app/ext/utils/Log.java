package android.app.ext.utils;

public class Log {

    private static final String TAG = "AppExt";

    public static void d(String msg) {
        android.util.Log.d(TAG, msg);
    }

    public static void d(String tag, String msg) {
        msg = "[" + tag + "]" + msg;
        d(msg);
    }

    public static void w(String tag, Exception e) {
        d(tag, e.getMessage());
    }

    public static void w(String tag, String msg) {
        d(tag, msg);
    }
}
