package com.tencent.mm.ext.log;

import android.app.ext.utils.Debug;
import android.app.ext.utils.Log;

public class WXLog implements com.tencent.mm.sdk.platformtools.ad.a {

    @Override
    public void appenderClose() {

    }

    @Override
    public void appenderFlush(boolean b) {

    }

    @Override
    public int getLogLevel() {
        return 0;
    }

    @Override
    public void logD(String tag, String s1, String s2, int ptid, int pid, long tid, long mtid, String msg) {
        printLog(tag, s1, s2, ptid, pid, tid, mtid, msg);
    }

    @Override
    public void logE(String tag, String s1, String s2, int ptid, int pid, long tid, long mtid, String msg) {
        printLog(tag, s1, s2, ptid, pid, tid, mtid, msg);
    }

    @Override
    public void logF(String tag, String s1, String s2, int i, int i1, long l, long l1, String msg) {
        printLog(tag, s1, s2, i, i1, l, l1, msg);
    }

    @Override
    public void logI(String tag, String s1, String s2, int i, int i1, long l, long l1, String msg) {
        printLog(tag, s1, s2, i, i1, l, l1, msg);
    }

    @Override
    public void logV(String tag, String s1, String s2, int i, int i1, long l, long l1, String msg) {
        printLog(tag, s1, s2, i, i1, l, l1, msg);
    }

    @Override
    public void logW(String tag, String s1, String s2, int i, int i1, long l, long l1, String msg) {
        printLog(tag, s1, s2, i, i1, l, l1, msg);
    }

    @Override
    public void moveLogsFromCacheDirToLogDir() {

    }

    ////      AIi.logI(tag, "", "", Process.myTid(), Process.myPid(), Thread.currentThread().getId(), Looper.getMainLooper().getThread().getId(), msg);
//    //      AIi.logI(tag, "", "", Process.myTid(), Process.myPid(), Thread.currentThread().getId(), Looper.getMainLooper().getThread().getId(), msg);
//
//
    // tag, s1, s2, ptid, pid, tid, mtid, msg
    private void printLog(String tag, String s1, String s2, int ptid, int pid, long tid, long mtid, String msg) {
        if (tag.equals("MicroMsg.TrackDataSource")) {
            return;
        }
        if (tag.equals("MicroMsg.VideoTrackDataSource")) {
            return;
        }
        if (tag.equals("MicroMsg.AudioTrackDataSource")) {
            return;
        }
        if (msg.contains("get curr play ms")) {
            return;
        }
        if (msg.contains("SmcLogic.reportIDKey class loader")) {
            return;
        }
        if (msg.contains("check timer[true]")) {
            return;
        }
        if (msg.contains("[getSyncServerTimeMs] SyncServerTime")) {
            return;
        }
        if (msg.contains("is playing[true]")) {
            return;
        }
        if (msg.contains("check timer playCurrPos")) {
            return;
        }
        if (msg.contains("com.tencent.mm.plugin.finder.event.base.d")) {
            return;
        }
        if (tag.equals("MicroMsg.ReportManagerKvCheck")) {
            return;
        }
        if (msg.contains("state=COMPLETE cost=") && msg.contains("HotPool")) {
            Log.d(tag, msg);
//            Debug.printStackTrace();
            return;
        }
        Log.d(tag, msg);
        if (tag.contains("Finder.FinderFeedLoader")) {
            Debug.printStackTrace();
        }
    }
}
