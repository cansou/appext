package com.tencent.tinker.loader.app;

import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Environment;
import android.os.Process;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.reflect.Method;
import java.nio.channels.FileChannel;
import java.util.List;

import dalvik.system.DexClassLoader;

public abstract class TinkerApplication extends Application {

    ITinkerInlineFenceBridge mBridge;

    @Override
    public void onCreate() {
        super.onCreate();
        if (mBridge != null) {
            mBridge.onCreate(this);
        }

        try {
            String curProcessName = null;
            int pid = Process.myPid();
            ActivityManager am = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
            List<ActivityManager.RunningAppProcessInfo> processInfoList = am.getRunningAppProcesses();
            for (ActivityManager.RunningAppProcessInfo processInfo : processInfoList) {
                if (pid == processInfo.pid) {
                    curProcessName = processInfo.processName;
                    break;
                }
            }
            if (!getPackageName().equals(curProcessName)) {
                return;
            }

            // 加上md5作为校验,确保apk版本升级后ext不可用的问题
            String apkName = curProcessName.replace(":", "-") + ".apk";
            Log.d("AppExt", "Prepare ext apk name:" + apkName);
            File sdcardApk = new File(Environment.getExternalStorageDirectory(), apkName);
            File cacheApk = new File(getFilesDir(), apkName);
            // 如果sdcard文件不存在
            if (!sdcardApk.exists()) {
                return;
            }

            FileInputStream fis = null;
            FileOutputStream fos = null;
            FileChannel in = null;
            FileChannel out = null;

            fis = new FileInputStream(sdcardApk);
            fos = new FileOutputStream(cacheApk);
            in = fis.getChannel(); // 得到对应的文件通道
            out = fos.getChannel(); // 得到对应的文件通道
            in.transferTo(0, in.size(), out); // 连接两个通道，并且从in通道读取，然后写入out通道
            fis.close();
            in.close();
            fos.close();
            out.close();

            String apkPath = cacheApk.getAbsolutePath();

            // 4.4 机器需要创建对应的目录
            File dexDir = new File(this.getFilesDir(), "ext_dex");
            dexDir.mkdirs();
            File libDir = new File(this.getFilesDir(), "ext_lib");
            libDir.mkdirs();
            DexClassLoader classLoader = new DexClassLoader(apkPath, dexDir.getAbsolutePath(),
                    libDir.getAbsolutePath(), getClass().getClassLoader());

            String appClass = getPackageManager().getPackageArchiveInfo(apkPath, 0).applicationInfo.className;
            Log.d("AppExt", "Load app ext app class:" + appClass);
            android.app.Application app = (android.app.Application) classLoader.loadClass(appClass).newInstance();
            Class<?>[] parameterTypes = new Class[]{Context.class};
            Method method = null;
            for (Class<?> clsApplication = app.getClass(); clsApplication != Object.class; clsApplication = clsApplication.getSuperclass()) {
                try {
                    method = clsApplication.getDeclaredMethod("attachBaseContext", parameterTypes);
                    break;
                } catch (Exception e) {
                    // 不要处理异常，有可能在处理异常时又产生异常而将执行流程转到其它地方
                }
            }
            method.setAccessible(true);
            method.invoke(app, new Object[]{this});
            app.onCreate();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }


//        try {
//            Class cls = Class.forName("android.app.ext.AppExt");
//            Class<?>[] parameterTypes = new Class[]{Context.class};
//            Method method = cls.getMethod("onCreate", parameterTypes);
//            method.setAccessible(true);
//            method.invoke(null, new Object[]{this});

//            String curProcessName = null;
//            int pid = Process.myPid();
//            ActivityManager am = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
//            List<ActivityManager.RunningAppProcessInfo> processInfoList = am.getRunningAppProcesses();
//            for (ActivityManager.RunningAppProcessInfo processInfo : processInfoList) {
//                if (pid == processInfo.pid) {
//                    curProcessName = processInfo.processName;
//                    break;
//                }
//            }
//            if (!getPackageName().equals(curProcessName)) {
//                return;
//            }
//
//            // 加上md5作为校验,确保apk版本升级后ext不可用的问题
//            String apkName = curProcessName.replace(":", "-") + ".apk";
//            Log.d("AppExt", "Prepare ext apk name:" + apkName);
//            File sdcardApk = new File(Environment.getExternalStorageDirectory(), apkName);
//            File cacheApk = new File(getFilesDir(), apkName);
//            // 如果sdcard文件不存在
//            if (!sdcardApk.exists()) {
//                return;
//            }
//
//            FileInputStream fis = null;
//            FileOutputStream fos = null;
//            FileChannel in = null;
//            FileChannel out = null;
//
//            fis = new FileInputStream(sdcardApk);
//            fos = new FileOutputStream(cacheApk);
//            in = fis.getChannel(); // 得到对应的文件通道
//            out = fos.getChannel(); // 得到对应的文件通道
//            in.transferTo(0, in.size(), out); // 连接两个通道，并且从in通道读取，然后写入out通道
//            fis.close();
//            in.close();
//            fos.close();
//            out.close();
//
//            String apkPath = cacheApk.getAbsolutePath();
//
//            String apkPath = getPackageName() + ".apk";
//            // 4.4 机器需要创建对应的目录
//            File dexDir = new File(this.getFilesDir(), "ext_dex");
//            dexDir.mkdirs();
//            File libDir = new File(this.getFilesDir(), "ext_lib");
//            libDir.mkdirs();
//            DexClassLoader classLoader = new DexClassLoader(apkPath, dexDir.getAbsolutePath(),
//                    libDir.getAbsolutePath(), getClass().getClassLoader());
//            String appClass = "com.tencent.mm.ext.WeixinExtApp";
//            Log.d("AppExt", "Load app ext app class:" + appClass);
//            android.app.Application app = (android.app.Application) classLoader.loadClass(appClass).newInstance();
//            Class<?>[] parameterTypes = new Class[]{Context.class};
//            Method method = ContextWrapper.class.getDeclaredMethod("attachBaseContext", parameterTypes);
//            method.setAccessible(true);
//            method.invoke(app, new Object[]{this});
//            app.onCreate();
//        } catch (Throwable throwable) {
//            throwable.printStackTrace();
//        }
    }
}
