package android.app.ext.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class ZipUtils {

    /**
     * 读取Zip文件中指定文件的内容
     *
     * @param zipFile
     * @param name
     * @return
     */
    public static void unzipChild(File zipFile, String name, File outFile) {
        ZipFile zipfile = null;
        InputStream in = null;
        try {
            zipfile = new ZipFile(zipFile);
            in = openZipFile(zipfile, name);
            IoUtils.copyStream(in, outFile);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            IoUtils.closeQuietly(in);
            IoUtils.closeQuietly(zipfile);
        }
    }

    /**
     * 打开zip文件中子文件流
     *
     * @param zipfile
     * @param name
     * @return
     */
    public static InputStream openZipFile(ZipFile zipfile, String name) {
        try {
            ZipEntry entry = zipfile.getEntry(name);
            if (entry != null) {
                long size = entry.getSize();
                if (size > 0) {
                    return zipfile.getInputStream(entry);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}
