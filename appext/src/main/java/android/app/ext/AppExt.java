package android.app.ext;

import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
import android.os.Environment;
import android.os.Process;
import android.text.TextUtils;
import android.util.Log;

import java.io.Closeable;
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

/**
 * android-9.0.0_r1/frameworks/base/core/java/android/app/ext/
 * <p>
 * 该包下的代码是用于插入到宿主app启动位置[Application.onCreate]
 * 在系统层插入代码, 加载app扩展代码运行
 * <p>
 * 或者将smali代码插入到app的Application.onCreate方法中
 * <p>
 * 此类剥离只用到的一些工具类, 尽量减少代码大小
 *
 * @hide
 */
public class AppExt {

    private static final String TAG = AppExt.class.getSimpleName();

    /**
     * 在application初始化时调用
     *
     * @param application
     * @hide
     */
    public static void onCreate(Application application) {
        try {
            loadExt(application);
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

    /**
     * 加载扩展apk, 路径名
     */
    private static void loadExt(Context context) {
        String apkPath = prepareExtApk(context);
        if (TextUtils.isEmpty(apkPath)) {
            Log.d(TAG, "Not found app ext");
            return;
        }
        // 使用宿主app的class loader
        ClassLoader parent = context.getClass().getClassLoader();
        // 4.4 机器需要创建对应的目录
        File dexDir = new File(context.getFilesDir(), "ext_dex");
        dexDir.mkdirs();
        File libDir = new File(context.getFilesDir(), "ext_lib");
        libDir.mkdirs();
        DexClassLoader classLoader = new DexClassLoader(apkPath, dexDir.getAbsolutePath(),
                libDir.getAbsolutePath(), parent);
        PackageInfo packageInfo = getPackageArchiveInfo(context, apkPath);
        String appClass = packageInfo.applicationInfo.className;
        Log.d(TAG, "Load app ext app class:" + appClass);
        if (TextUtils.isEmpty(appClass)) {
            return;
        }
        Application app = (Application) newInstance(classLoader, appClass);
        if (app != null) {
            attachBaseContext(app, context);
            app.onCreate();
        } else {
            Log.d(TAG, "Load application is null:" + appClass);
        }
    }

    /**
     * 准备ext apk
     *
     * @return
     */
    private static String prepareExtApk(Context context) {
        String processName = getProcessName(context);
        if (TextUtils.isEmpty(processName)) {
            return null;
        }
        String apkNamePrefix = processName.replace(":", "-");
        String apkMd5 = getApkMd516(context);
        // 加上md5作为校验,确保apk版本升级后ext不可用的问题
        String apkName = apkNamePrefix + "_" + apkMd5 + ".apk";
        Log.d(TAG, "Prepare ext apk name:" + apkName);
        File sdcardApk = new File(Environment.getExternalStorageDirectory(), apkName);
        File cacheApk = new File(context.getFilesDir(), apkName);
        // 如果sdcard文件不存在
        if (!sdcardApk.exists()) {
            // 如果缓存文件不存在
            if (!cacheApk.exists()) {
                // 从assets中获取文件
                return prepareExtApkFromAsset(context, apkNamePrefix);
            }
            return cacheApk.getAbsolutePath();
        }
        // 否则存在sdcard文件
        // 判断md5值是否一样, 如果不一样,则cp
        String sdcardMd5 = md5File(sdcardApk);
        String cacheMd5 = md5File(cacheApk);
        if (sdcardMd5.equals(cacheMd5)) {
            // 如果md5一致
            return cacheApk.getAbsolutePath();
        }
        // md5不一致, 表示有更新, copy一份
        // cp file
        boolean success = copyFileNio(sdcardApk, cacheApk);
        if (success) {
            return cacheApk.getAbsolutePath();
        }
        return null;
    }

    /**
     * 准备ext.apk,从assets目录中复制出来, 用于只安装apk插件的场景
     *
     * @param context
     * @return
     */
    private static String prepareExtApkFromAsset(Context context, String apkNamePrefix) {
        String name = apkNamePrefix + ".apk";
        Log.d(TAG, "Prepare ext apk name:" + apkNamePrefix + ", from assets");
        File cacheApk = new File(context.getFilesDir(), name);
        AssetManager assetManager = context.getAssets();
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
            return cacheApk.getAbsolutePath();
        } catch (Exception e) {
            e.printStackTrace();
            if (cacheApk.exists()) {
                cacheApk.delete();
            }
        } finally {
            closeQuietly(in);
            closeQuietly(out);
        }
        return null;
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

    /**
     * 获取apk文件的md5值
     *
     * @param context
     * @return
     */
    private static String getApkMd516(Context context) {
        ApplicationInfo applicationInfo = context.getApplicationInfo();
        String path = applicationInfo.sourceDir;
        String md5 = md5File(new File(path));
        return getMd516bit(md5);
    }

    /**
     * 计算文件的md5值
     *
     * @param file
     * @return
     */
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
            closeQuietly(fis);
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

    /**
     * Closes the specified closeable.
     *
     * @param closeable The closeable to close.
     */
    private static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 通过apk路径获取包信息
     *
     * @param apkPath
     * @return
     */
    private static PackageInfo getPackageArchiveInfo(Context context, String apkPath) {
        PackageManager pm = context.getPackageManager();
        PackageInfo info = pm.getPackageArchiveInfo(apkPath, PackageManager.GET_ACTIVITIES);
        if (info != null) {
            ApplicationInfo appInfo = info.applicationInfo;
            appInfo.sourceDir = apkPath;
            appInfo.publicSourceDir = apkPath;
        }
        return info;
    }

    /**
     * 复制文件,使用nio以提高性能
     *
     * @param src  源文件
     * @param dest 目标文件
     */
    private static boolean copyFileNio(File src, File dest) {
        FileInputStream fis = null;
        FileOutputStream fos = null;
        FileChannel in = null;
        FileChannel out = null;
        try {
            fis = new FileInputStream(src);
            fos = new FileOutputStream(dest);
            in = fis.getChannel(); // 得到对应的文件通道
            out = fos.getChannel(); // 得到对应的文件通道
            in.transferTo(0, in.size(), out); // 连接两个通道，并且从in通道读取，然后写入out通道
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            if (dest.exists()) {
                dest.delete();
            }
        } finally {
            closeQuietly(fis);
            closeQuietly(in);
            closeQuietly(fos);
            closeQuietly(out);
        }
        return false;
    }

    /**
     * 使用无参构造函数和指定的classLoader创建实例, 多用于插件加载
     *
     * @param classLoader
     * @param className
     * @return
     */
    private static Object newInstance(ClassLoader classLoader, String className) {
        try {
            Class<?> cls = classLoader.loadClass(className);
            Constructor<?> constructor = cls.getConstructor();
            return constructor.newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 使用反射调用attachBaseContext
     *
     * @param wrapper
     * @param context
     */
    private static void attachBaseContext(ContextWrapper wrapper, Context context) {
        String methodName = "attachBaseContext";
        Class<?>[] parameterTypes = new Class[]{Context.class};
        Object[] parameters = new Object[]{context};
        Method method = getDeclaredMethod(wrapper, methodName, parameterTypes);
        if (method != null) {
            method.setAccessible(true);
            try {
                method.invoke(wrapper, parameters);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 循环向上转型, 获取对象的DeclaredMethod, 根据 对象、方法名和对应的方法参数 通过反射 调用上面的方法获取 Method 对象
     *
     * @param object         the object
     * @param methodName     the name of method
     * @param parameterTypes the parameter types of the requested method. {@code (Class[]) null} is equivalent to the
     *                       empty array.
     * @return the method
     */
    private static Method getDeclaredMethod(Object object, String methodName, Class<?>... parameterTypes) {
        for (Class<?> cls = object.getClass(); cls != Object.class; cls = cls.getSuperclass()) {
            try {
                return cls.getDeclaredMethod(methodName, parameterTypes);
            } catch (Exception e) {
                // 不要处理异常，有可能在处理异常时又产生异常而将执行流程转到其它地方
            }
        }
        return null;
    }
}
