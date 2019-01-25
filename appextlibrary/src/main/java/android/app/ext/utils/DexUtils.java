package android.app.ext.utils;

import android.content.Context;

import java.lang.reflect.Array;
import java.lang.reflect.Field;

import dalvik.system.DexClassLoader;
import dalvik.system.PathClassLoader;

public class DexUtils {

    public static void addClassLoader(Context context, ClassLoader dexClassLoader) {
        try {
            PathClassLoader pathClassLoader = getPathClassLoader(context);
            Object pathList = getPathList(pathClassLoader);

            Object baseDexElements = getDexElements(getPathList(pathClassLoader));
            Object newDexElements = getDexElements(getPathList(dexClassLoader));
            Object allDexElements = combineArray(baseDexElements, newDexElements);
            setField(pathList, pathList.getClass(), "dexElements", allDexElements);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 将类声明放在第一行
     *
     * @param context
     * @param dexPath
     * @param optimizedDirectory
     * @param librarySearchPath
     * @return
     */
    public static boolean injectDexAtFirst(Context context, String dexPath, String optimizedDirectory,
                                           String librarySearchPath) {
        try {
            PathClassLoader pathClassLoader = getPathClassLoader(context);
            DexClassLoader dexClassLoader = new DexClassLoader(dexPath, optimizedDirectory, librarySearchPath, pathClassLoader);
            Object pathList = getPathList(pathClassLoader);
            Object baseDexElements = getDexElements(pathList);
            Object newDexElements = getDexElements(getPathList(dexClassLoader));
            Object allDexElements = combineArray(newDexElements, baseDexElements);
            setField(pathList, pathList.getClass(), "dexElements", allDexElements);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 获取Path ClassLoader
     *
     * @param context
     * @return
     */
    private static PathClassLoader getPathClassLoader(Context context) {
        PathClassLoader pathClassLoader = (PathClassLoader) context.getClassLoader();
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


    /**
     * 合并数组得到新的数组
     *
     * @param firstArray
     * @param secondArray
     * @return
     */
    private static Object combineArray(Object firstArray, Object secondArray) {
        Class<?> componentType = firstArray.getClass().getComponentType();
        int firstArrayLength = Array.getLength(firstArray);
        int allLength = firstArrayLength + Array.getLength(secondArray);
        Object result = Array.newInstance(componentType, allLength);
        for (int i = 0; i < allLength; ++i) {
            if (i < firstArrayLength) {
                Array.set(result, i, Array.get(firstArray, i));
            } else {
                Array.set(result, i, Array.get(secondArray, i - firstArrayLength));
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
