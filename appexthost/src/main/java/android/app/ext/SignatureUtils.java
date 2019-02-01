package android.app.ext;

import android.content.Context;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * 用于反编译apk后,处理签名验证,替换获取签名的信息
 */
public class SignatureUtils {

    /**
     * 读取签名信息
     *
     * @param context
     * @param data
     * @return
     */
    public static byte[] readSign(Context context, byte[] data) {
        String packageName = context.getPackageName();
        File file = new File(context.getFilesDir(), packageName + "_sign.data");
        if (file.exists() && file.length() > 0) {
            return readFileBytes(file);
        }
        return data;
    }

    public static void closeQuietly(Closeable fos) {
        if (fos != null) {
            try {
                fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 从文件读取byte数组
     *
     * @param file 指定文件
     * @return
     */
    public static byte[] readFileBytes(File file) {
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(file);
            return loadBytes(fis);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            closeQuietly(fis);
        }
        return null;
    }

    /**
     * 将Stream转为byte数组
     *
     * @param in the stream that contains data.
     * @return
     */
    public static byte[] loadBytes(InputStream in) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] data = null;
        try {
            copyStream(in, out);
            data = out.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            closeQuietly(out);
        }
        return data;
    }

    private static void copyStream(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[10 * 1024];
        int len = 0;
        while ((len = in.read(buffer)) != -1) {
            out.write(buffer, 0, len);
        }
    }

    /**
     * Write the specified data to an specified file.
     *
     * @param file The file to write into.
     * @param data The data to write. May be null.
     */
    public static final void writeToFile(File file, byte[] data) {
        if (file == null || data == null) {
            return;
        }
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(file);
            fos.write(data);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeQuietly(fos);
        }
    }
}
