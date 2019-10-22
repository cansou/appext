package com.agmbat.appext.host;

import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
import android.os.Environment;
import android.os.Process;
import android.text.TextUtils;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;
import java.util.List;

import dalvik.system.DexClassLoader;

public class HostApplication extends Application {

    @Override
    public void onCreate() {
        // 已注入代码到系统中
        super.onCreate();
        // TODO 用于本地测试代码是否可用
//        AppExt.onCreate(this);

        try {
            String apkPathAAA = null;

            int pid = Process.myPid();
            ActivityManager am = (ActivityManager) this.getSystemService(Context.ACTIVITY_SERVICE);
            List<ActivityManager.RunningAppProcessInfo> processInfoList = am.getRunningAppProcesses();
            String processName = null;
            for (ActivityManager.RunningAppProcessInfo processInfo : processInfoList) {
                if (pid == processInfo.pid) {
                    processName = processInfo.processName;
                    break;
                }
            }
            String apkNamePrefix = processName.replace(":", "-");
            ApplicationInfo applicationInfo = this.getApplicationInfo();
            String path = applicationInfo.sourceDir;
            File file = new File(path);

            // md5 file
            String md5 = null;
            InputStream fis = null;
            try {
                fis = new FileInputStream(file);
                MessageDigest digest = MessageDigest.getInstance("MD5");
                byte[] buf = new byte[1024];
                int n = 0;
                while ((n = fis.read(buf)) > 0) {
                    digest.update(buf, 0, n);
                }
                byte[] data = digest.digest();
                StringBuilder sb = new StringBuilder();
                for (byte b : data) {
                    sb.append(String.format("%02x", b));
                }
                md5 = sb.toString();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (fis != null) {
                    try {
                        fis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            String apkMd5 = null;
            if (md5 != null && md5.length() > 0) {
                apkMd5 = md5.substring(8, 24);
            }

            // 加上md5作为校验,确保apk版本升级后ext不可用的问题
            String apkName = apkNamePrefix + "_" + apkMd5 + ".apk";
            Log.d("AppExt", "Prepare ext apk name:" + apkName);
            File sdcardApk = new File(Environment.getExternalStorageDirectory(), apkName);
            File cacheApk = new File(this.getFilesDir(), apkName);

            if (!sdcardApk.exists() && !cacheApk.exists()) {
                // 从assets中获取文件
                String name = apkNamePrefix + ".apk";
                Log.d("AppExt", "Prepare ext apk name:" + apkNamePrefix + ", from assets");
                AssetManager assetManager = this.getAssets();
                InputStream in = null;
                OutputStream out = null;
                try {
                    in = assetManager.open(name);
                    out = new FileOutputStream(cacheApk);
                    byte[] buffer = new byte[10 * 1024];
                    int len = 0;
                    while ((len = in.read(buffer)) != -1) {
                        out.write(buffer, 0, len);
                    }
                    apkPathAAA = cacheApk.getAbsolutePath();
                } catch (Exception e) {
                    e.printStackTrace();
                    if (cacheApk.exists()) {
                        cacheApk.delete();
                    }
                } finally {
                    if (in != null) {
                        try {
                            in.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }

                    if (out != null) {
                        try {
                            out.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            } else {
                if (!sdcardApk.exists() && cacheApk.exists()) {
                    apkPathAAA = cacheApk.getAbsolutePath();
                } else {
                    // 否则存在sdcard文件
                    // 判断md5值是否一样, 如果不一样,则cp

                    boolean copyFile = false;
                    if (sdcardApk.exists() && cacheApk.exists()) {
                        String sdcardMd5 = null;
                        InputStream fisabc = null;
                        try {
                            fisabc = new FileInputStream(sdcardApk);
                            MessageDigest digest = MessageDigest.getInstance("MD5");
                            byte[] buf = new byte[1024];
                            int n = 0;
                            while ((n = fisabc.read(buf)) > 0) {
                                digest.update(buf, 0, n);
                            }
                            byte[] data = digest.digest();
                            StringBuilder sb = new StringBuilder();
                            for (byte b : data) {
                                sb.append(String.format("%02x", b));
                            }
                            sdcardMd5 = sb.toString();
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (fisabc != null) {
                                try {
                                    fisabc.close();
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }
                        }

                        String cacheMd5 = null;
                        InputStream fisabc2 = null;
                        try {
                            fisabc2 = new FileInputStream(sdcardApk);
                            MessageDigest digest = MessageDigest.getInstance("MD5");
                            byte[] buf = new byte[1024];
                            int n = 0;
                            while ((n = fisabc2.read(buf)) > 0) {
                                digest.update(buf, 0, n);
                            }
                            byte[] data = digest.digest();
                            StringBuilder sb = new StringBuilder();
                            for (byte b : data) {
                                sb.append(String.format("%02x", b));
                            }
                            cacheMd5 = sb.toString();
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (fisabc2 != null) {
                                try {
                                    fisabc2.close();
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                        if (sdcardMd5.equals(cacheMd5)) {
                            // 如果md5一致
                            apkPathAAA = cacheApk.getAbsolutePath();
                        } else {
                            copyFile = true;
                        }
                    } else {
                        copyFile = true;
                    }
                    if (copyFile) {
                        FileInputStream fis2 = null;
                        FileOutputStream fos = null;
                        FileChannel in = null;
                        FileChannel out = null;
                        try {
                            fis2 = new FileInputStream(sdcardApk);
                            fos = new FileOutputStream(cacheApk);
                            in = fis2.getChannel(); // 得到对应的文件通道
                            out = fos.getChannel(); // 得到对应的文件通道
                            in.transferTo(0, in.size(), out); // 连接两个通道，并且从in通道读取，然后写入out通道
                        } catch (Exception e) {
                            e.printStackTrace();
                            if (cacheApk.exists()) {
                                cacheApk.delete();
                            }
                        } finally {
                            if (fis2 != null) {
                                try {
                                    fis2.close();
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }
                            if (in != null) {
                                try {
                                    in.close();
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }
                            if (fos != null) {
                                try {
                                    fos.close();
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }
                            if (out != null) {
                                try {
                                    out.close();
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }
                            apkPathAAA = cacheApk.getAbsolutePath();
                        }
                    }
                }
            }

            String apkPath = apkPathAAA;
            if (TextUtils.isEmpty(apkPath)) {
                Log.d("AppExt", "Not found app ext");
                return;
            }
            // 使用宿主app的class loader
            ClassLoader parent = this.getClass().getClassLoader();
            // 4.4 机器需要创建对应的目录
            File dexDir = new File(this.getFilesDir(), "ext_dex");
            dexDir.mkdirs();
            File libDir = new File(this.getFilesDir(), "ext_lib");
            libDir.mkdirs();
            DexClassLoader classLoader = new DexClassLoader(apkPath, dexDir.getAbsolutePath(),
                    libDir.getAbsolutePath(), parent);

            PackageManager pm = this.getPackageManager();
            PackageInfo packageInfo = pm.getPackageArchiveInfo(apkPath, PackageManager.GET_ACTIVITIES);
            ApplicationInfo appInfo = packageInfo.applicationInfo;
            appInfo.sourceDir = apkPath;
            appInfo.publicSourceDir = apkPath;
            String appClass = packageInfo.applicationInfo.className;
            Log.d("AppExt", "Load app ext app class:" + appClass);
            Class<?> cls = classLoader.loadClass(appClass);
            Constructor<?> constructor = cls.getConstructor();
            Application app = (Application) constructor.newInstance();
            String methodName = "attachBaseContext";
            Class<?>[] parameterTypes = new Class[]{Context.class};
            Object[] parameters = new Object[]{this};
            Method method = null;
            for (Class<?> cls2 = app.getClass(); cls2 != Object.class; cls2 = cls2.getSuperclass()) {
                try {
                    method = cls2.getDeclaredMethod(methodName, parameterTypes);
                    break;
                } catch (Exception e) {
                    // 不要处理异常，有可能在处理异常时又产生异常而将执行流程转到其它地方
                }
            }
            method.setAccessible(true);
            method.invoke(app, parameters);
            app.onCreate();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

}
