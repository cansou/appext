package com.baidu.hi.ext;

import android.app.ext.utils.Log;
import android.app.ext.utils.ReflectionUtils;
import android.support.annotation.NonNull;

import com.baidu.hi.luckymoney.logic.LuckyMoneyTryOpenEvent;
import com.baidu.hi.utils.BaseLogCenter;
import com.baidu.hi.utils.HiLogCenter;

/**
 * 替换应用内的log
 */
public class ExtHiLogCenter extends HiLogCenter {

    private static HiLogCenter sLogCenter;

    public ExtHiLogCenter(HiLogCenter source, LogLevel logLevel, LogLevel logLevel1) {
        super(null, logLevel, logLevel1);
        ReflectionUtils.copyProperties(source, this);
    }

    @NonNull
    public static HiLogCenter getHiLogCenter(HiLogCenter source) {
        if (sLogCenter == null) {
            BaseLogCenter.LogLevel localLogLevel = LogLevel.DEBUG;
            sLogCenter = new ExtHiLogCenter(source, localLogLevel, localLogLevel);
            sLogCenter.getLogCenter().e("LogUtil", "Error: LogCenter NULL & Default initialization");
        }
        return sLogCenter;
    }

    @Override
    public void v(String tag, String msg, String fileTag, String fileMsg) {
        printLog(tag, msg, fileTag, fileMsg);
//        super.v(tag, msg, fileTag, fileMsg);
    }

    @Override
    public void v(String tag, String msg, String fileTag, String fileMsg, Throwable throwable) {
        printLog(tag, msg, fileTag, fileMsg);
//        super.v(tag, msg, fileTag, fileMsg, throwable);
    }

    @Override
    public void d(String tag, String msg, String fileTag, String fileMsg) {
        printLog(tag, msg, fileTag, fileMsg);
//        super.d(tag, msg, fileTag, fileMsg);
    }

    @Override
    public void d(String tag, String msg, String fileTag, String fileMsg, Throwable throwable) {
        printLog(tag, msg, fileTag, fileMsg);
//        super.d(tag, msg, fileTag, fileMsg, throwable);
    }

    @Override
    public void i(String tag, String msg, String fileTag, String fileMsg) {
        printLog(tag, msg, fileTag, fileMsg);
//        super.i(tag, msg, fileTag, fileMsg);
    }

    @Override
    public void i(String tag, String msg, String fileTag, String fileMsg, Throwable throwable) {
        printLog(tag, msg, fileTag, fileMsg);
//        super.i(tag, msg, fileTag, fileMsg, throwable);
    }

    @Override
    public void e(String tag, String msg, String fileTag, String fileMsg) {
        printLog(tag, msg, fileTag, fileMsg);
//        super.e(tag, msg, fileTag, fileMsg);
    }

    @Override
    public void e(String tag, String msg, String fileTag, String fileMsg, Throwable throwable) {
        printLog(tag, msg, fileTag, fileMsg);
//        super.e(tag, msg, fileTag, fileMsg, throwable);
    }

    @Override
    public void w(String tag, String msg, String fileTag, String fileMsg) {
        printLog(tag, msg, fileTag, fileMsg);
//        super.w(tag, msg, fileTag, fileMsg);
    }

    @Override
    public void w(String tag, String msg, String fileTag, String fileMsg, Throwable throwable) {
        printLog(tag, msg, fileTag, fileMsg);
//        super.w(tag, msg, fileTag, fileMsg, throwable);
    }

    @Override
    public void wtf(String tag, String msg, String fileTag, String fileMsg) {
        printLog(tag, msg, fileTag, fileMsg);
        super.wtf(tag, msg, fileTag, fileMsg);
    }

    @Override
    public void wtf(String tag, String msg, String fileTag, String fileMsg, Throwable throwable) {
        printLog(tag, msg, fileTag, fileMsg);
//        super.wtf(tag, msg, fileTag, fileMsg, throwable);
    }


    private void printLog(String tag, String msg, String fileTag, String fileMsg) {
        Log.d(tag, msg);
        LuckyMoneyTryOpenEvent event = LuckyMoneyParser.parse(msg);
        if (event != null) {
            LuckyMoneyActivity.openLuckyMoneyActivity(event);
        }
    }

}
