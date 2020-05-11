package com.tencent.mm.ext.log;

import android.app.ext.utils.Log;

public class WXMatrixLog implements com.tencent.matrix.g.c.a {

    @Override
    public void d(String s, String s1, Object... objects) {
        printLog(s, s1, objects);
    }

    @Override
    public void e(String s, String s1, Object... objects) {
        printLog(s, s1, objects);
    }

    @Override
    public void i(String s, String s1, Object... objects) {
        printLog(s, s1, objects);
    }

    @Override
    public void printErrStackTrace(String s, Throwable throwable, String s1, Object... objects) {
        printLog(s, s1, objects);
    }

    @Override
    public void v(String s, String s1, Object... objects) {
        printLog(s, s1, objects);
    }

    @Override
    public void w(String s, String s1, Object... objects) {
        printLog(s, s1, objects);
    }

    private void printLog(String s, String s1, Object... objects) {
        String msg = String.format(s1, objects);
        Log.d(s, msg);
    }
}
