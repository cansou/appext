package android.app.ext.utils;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.Set;

public class HttpUtils {

    private static final String TAG = HttpUtils.class.getSimpleName();

    private static final int TIMEOUT = 15000;

    /**
     * Retrieve the content of the URL as string.
     *
     * @param url The URL to retrieve.
     * @return The content of the given URL, or null if error occurred.
     */
    public static String getUrlAsString(String url) {
        return getUrlAsString(url, null);
    }

    public static String getUrlAsString(String url, Map<String, String> header) {
        InputStream is = null;
        HttpURLConnection connection = null;
        try {
            URL urlpath = new URL(url);
            connection = (HttpURLConnection) urlpath.openConnection();
            if (header != null && header.size() > 0) {
                Set<String> keys = header.keySet();
                for (String field : keys) {
                    connection.setRequestProperty(field, header.get(field));
                }
            }
            is = connection.getInputStream();
            return IoUtils.loadContent(is);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            IoUtils.closeQuietly(is);
            connection.disconnect();
        }
        return null;
    }

}