package com.tencent.mm.ext;

import android.app.ActivityManager;
import android.content.Context;
import android.os.Process;

import java.io.File;
import java.util.List;

import dalvik.system.DexClassLoader;

/**
 * 该包下的代码是用于插入到宿主app启动位置[Application.onCreate]
 * 在系统层插入代码, 加载app扩展代码运行
 */
public class AppExt {

    private static final String TAG = AppExt.class.getSimpleName();

    /**
     * 加载扩展apk, 路径名
     */
    public static ClassLoader loadExt(Context context) {
        String apkPath = prepareExtApk(context);
        // 使用宿主app的class loader
        ClassLoader parent = context.getClass().getClassLoader();
        DexClassLoader classLoader = new DexClassLoader(apkPath, null, null, parent);
        return classLoader;
    }

    /**
     * 准备apk
     *
     * @return
     */
    private static String prepareExtApk(Context context) {
        String processName = getProcessName(context);
        String apkName = processName.replace(":", "-") + ".apk";
        File cacheApk = new File(context.getFilesDir(), apkName);
        return cacheApk.getAbsolutePath();
    }

    /**
     * 获取进程名称
     *
     * @param context
     * @return
     */
    private static String getProcessName(Context context) {
        int pid = Process.myPid();
        ActivityManager am = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        if (am == null) {
            return null;
        }
        List<ActivityManager.RunningAppProcessInfo> processInfoList = am.getRunningAppProcesses();
        if (processInfoList == null || processInfoList.size() == 0) {
            return null;
        }
        for (ActivityManager.RunningAppProcessInfo processInfo : processInfoList) {
            if (pid == processInfo.pid) {
                return processInfo.processName;
            }
        }
        return null;
    }

}
