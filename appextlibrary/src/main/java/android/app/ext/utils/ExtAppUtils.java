package android.app.ext.utils;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Process;

import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.util.List;

public class ExtAppUtils {

    public static String getPluginApkName(Context context) {
        // 加上md5作为校验,确保apk版本升级后ext不可用的问题
        String processName = getProcessName(context);
        String apkMd5 = getApkMd516(context);
        // 加上md5作为校验,确保apk版本升级后ext不可用的问题
        String apkName = processName.replace(":", "-") + "_" + apkMd5 + ".apk";
        return apkName;
    }

    /**
     * 获取进程名称
     *
     * @param context
     * @return
     */
    public static String getProcessName(Context context) {
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

    /**
     * 获取apk文件的md5值
     *
     * @param context
     * @return
     */
    public static String getApkMd516(Context context) {
        ApplicationInfo applicationInfo = context.getApplicationInfo();
        String path = applicationInfo.sourceDir;
        String md5 = md5File(new File(path));
        return getMd516bit(md5);
    }

    private static String md5File(File file) {
        if (file == null || !file.exists() || file.isDirectory()) {
            return null;
        }
        InputStream fis = null;
        try {
            fis = new FileInputStream(file);
            MessageDigest digest = MessageDigest.getInstance("MD5");
            byte[] buf = new byte[1024];
            int n = 0;
            while ((n = fis.read(buf)) > 0) {
                digest.update(buf, 0, n);
            }
            return asHexString(digest.digest());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            IoUtils.closeQuietly(fis);
        }
        return null;
    }

    /**
     * 获取md5 16位值
     *
     * @param md532bit
     * @return
     */
    private static String getMd516bit(String md532bit) {
        if (md532bit == null || md532bit.length() == 0) {
            return md532bit;
        }
        return md532bit.substring(8, 24);
    }

    /**
     * 将给定的二进制数据转换为十六进制字符串。
     *
     * @param data 要转换的二进制数据。
     * @return data 的十六进制字符串表示。
     */
    private static String asHexString(byte[] data) {
        StringBuilder sb = new StringBuilder();
        for (byte b : data) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

}
