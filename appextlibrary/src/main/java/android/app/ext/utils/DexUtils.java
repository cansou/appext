package android.app.ext.utils;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

import dalvik.system.DexClassLoader;
import dalvik.system.PathClassLoader;

public class DexUtils {

    public static void addClassLoader(Context context, ClassLoader dexClassLoader) {
        try {
            Object baseDexElements = getDexElements(getPathList(getPathClassLoader(context)));
            Object newDexElements = getDexElements(getPathList(dexClassLoader));
            Object allDexElements = combineArray(baseDexElements, newDexElements);
            Object pathList = getPathList(getPathClassLoader(context));
            setField(pathList, pathList.getClass(), "dexElements", allDexElements);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 创建插件资源
     *
     * @param pluginPath
     * @return
     */
    public static void addResources(Resources resources, String pluginPath) {
        try {
            AssetManager assets = resources.getAssets();
            Method addAssetPath = AssetManager.class.getMethod("addAssetPath", String.class);
            addAssetPath.invoke(assets, pluginPath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void injectDexAtFirst(Context context, String dexPath, String defaultDexOptPath) throws NoSuchFieldException, IllegalAccessException, ClassNotFoundException {
        PathClassLoader pathClassLoader = getPathClassLoader(context);
        DexClassLoader dexClassLoader = new DexClassLoader(dexPath, defaultDexOptPath, dexPath, pathClassLoader);
        Object baseDexElements = getDexElements(getPathList(pathClassLoader));
        Object newDexElements = getDexElements(getPathList(dexClassLoader));

        Object allDexElements = combineArray(newDexElements, baseDexElements);

        Object pathList = getPathList(pathClassLoader);
        setField(pathList, pathList.getClass(), "dexElements", allDexElements);
    }

    private static PathClassLoader getPathClassLoader(Context context) {
        PathClassLoader pathClassLoader = (PathClassLoader) context.getClassLoader();
        // (PathClassLoader) DexUtils.class.getClassLoader();
        return pathClassLoader;
    }

    private static Object getDexElements(Object paramObject)
            throws IllegalArgumentException, NoSuchFieldException, IllegalAccessException {
        return getField(paramObject, paramObject.getClass(), "dexElements");
    }

    private static Object getPathList(Object baseDexClassLoader)
            throws IllegalArgumentException, NoSuchFieldException, IllegalAccessException, ClassNotFoundException {
        return getField(baseDexClassLoader, Class.forName("dalvik.system.BaseDexClassLoader"), "pathList");
    }

    private static Object combineArray(Object firstArray, Object secondArray) {
        Class<?> localClass = firstArray.getClass().getComponentType();
        int firstArrayLength = Array.getLength(firstArray);
        int allLength = firstArrayLength + Array.getLength(secondArray);
        Object result = Array.newInstance(localClass, allLength);
        for (int k = 0; k < allLength; ++k) {
            if (k < firstArrayLength) {
                Array.set(result, k, Array.get(firstArray, k));
            } else {
                Array.set(result, k, Array.get(secondArray, k - firstArrayLength));
            }
        }
        return result;
    }

    public static Object getField(Object obj, Class<?> cl, String field)
            throws NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
        Field localField = cl.getDeclaredField(field);
        localField.setAccessible(true);
        return localField.get(obj);
    }

    public static void setField(Object obj, Class<?> cl, String field, Object value)
            throws NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
        Field localField = cl.getDeclaredField(field);
        localField.setAccessible(true);
        localField.set(obj, value);
    }

}
