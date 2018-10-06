package android.app.ext.utils;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * 反射常用工具类
 */
public class ReflectionUtils {

    /**
     * Returns a new instance of the class represented by the name of Class
     *
     * @param className the name of Class
     * @param args      the arguments to the constructor
     * @return the new, initialized, object
     */
    public static Object newInstance(String className, Object... args) {
        try {
            Class<?> cls = Class.forName(className);
            return newInstance(cls, args);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Returns a new instance of the class represented by this Class
     *
     * @param cls  the class
     * @param args the arguments to the constructor
     * @return the new, initialized, object
     */
    public static Object newInstance(Class<?> cls, Object... args) {
        try {
            if (args == null || args.length == 0) {
                return cls.newInstance();
            }
            int len = args.length;
            Class<?>[] parameterTypes = new Class[len];
            for (int i = 0; i < len; ++i) {
                parameterTypes[i] = args[i].getClass();
            }
            Constructor<?> con = cls.getConstructor(parameterTypes);
            return con.newInstance(args);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Returns the result of dynamically invoking static method.
     *
     * @param className      the name of Class
     * @param methodName     the name of method
     * @param parameterTypes the parameter types of the requested method.
     *                       {@code (Class[]) null} is equivalent to the empty array.
     * @param parameters     the arguments to the method
     * @return the result
     */
    public static Object invokeStaticMethod(String className, String methodName, Class<?>[] parameterTypes,
                                            Object[] parameters) {
        try {
            Class<?> c = Class.forName(className);
            Method method = c.getDeclaredMethod(methodName, parameterTypes);
            if (method != null) {
                method.setAccessible(true);
                return method.invoke(null, parameters);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Returns the value of the static field in the specified object.
     *
     * @param className the name of Class
     * @param fieldName the name of field
     * @return the field value, possibly boxed
     */
    public static Object getStaticFieldValue(String className, String fieldName) {
        try {
            Class<?> cls = Class.forName(className);
            Field field = cls.getDeclaredField(fieldName);
            field.setAccessible(true);
            return field.get(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Sets the value of the static field in the specified object to the value.
     *
     * @param className the name of Class
     * @param fieldName the name of field
     * @param value     the new value
     */
    public static void setStaticFieldValue(String className, String fieldName, Object value) {
        try {
            Class<?> cls = Class.forName(className);
            Field field = cls.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(null, value);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 直接调用对象方法, 而忽略修饰符(private, protected, default)
     *
     * @param object         the object
     * @param methodName     the name of method
     * @param parameterTypes the parameter types of the requested method.
     *                       {@code (Class[]) null} is equivalent to the empty array.
     * @param parameters     the arguments to the method
     * @return the result
     */
    public static Object invokeMethod(Object object, String methodName, Class<?>[] parameterTypes,
                                      Object[] parameters) {
        Method method = getDeclaredMethod(object, methodName, parameterTypes);
        if (method != null) {
            method.setAccessible(true);
            try {
                return method.invoke(object, parameters);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * Returns the result of dynamically invoking this method.
     *
     * @param className      the name of Class, 解决父类和子类中同名函数问题
     * @param methodName     the name of method
     * @param object         the object
     * @param parameterTypes the parameter types of the requested method.
     *                       {@code (Class[]) null} is equivalent to the empty array.
     * @param parameters     the arguments to the method
     * @return the result
     */
    public static Object invokeMethod(String className, String methodName, Object object, Class<?>[] parameterTypes,
                                      Object[] parameters) {
        try {
            Class<?> cls = Class.forName(className);
            Method method = cls.getMethod(methodName, parameterTypes);
            return method.invoke(object, parameters);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    /**
     * 直接设置对象属性值, 忽略 private/protected 修饰符, 也不经过 setter
     *
     * @param object    the object
     * @param fieldName the name of field
     * @param value     the new value
     */
    public static void setFieldValue(Object object, String fieldName, Object value) {
        Field field = getDeclaredField(object, fieldName);
        if (field != null) {
            field.setAccessible(true);
            try {
                field.set(object, value);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 设置对象属性
     *
     * @param className the name of Class, 解决父类与子类有同名成员变量问题，需要传入指定类名
     * @param fieldName the name of field
     * @param object    the object
     * @param value     the new value
     */
    public static void setFieldValue(String className, String fieldName, Object object, Object value) {
        try {
            Class<?> cls = Class.forName(className);
            Field field = cls.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(object, value);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 设置对象属性,支持 mObject.field格式
     *
     * @param object      the object
     * @param elFieldName the name of field
     * @param value       the field value
     */
    public static void setElFieldValue(Object object, String elFieldName, Object value) {
        String[] fieldNames = elFieldName.split("[.]");
        int length = fieldNames.length - 1;
        for (int i = 0; i < length; i++) {
            String fName = fieldNames[i];
            object = getFieldValue(object, fName);
            if (object == null) {
                return;
            }
        }
        setFieldValue(object, fieldNames[length], value);
    }

    /**
     * 获取对象属性,支持 mObject.field格式
     *
     * @param object      the object
     * @param elFieldName the name of field
     * @return the field value, possibly boxed
     */
    public static Object getElFieldValue(Object object, String elFieldName) {
        String[] fieldNames = elFieldName.split("[.]");
        for (String fName : fieldNames) {
            object = getFieldValue(object, fName);
            if (object == null) {
                return null;
            }
        }
        return object;
    }

    /**
     * 直接读取对象的属性值, 忽略 private/protected 修饰符, 也不经过 getter
     *
     * @param object    the object
     * @param fieldName the name of field
     * @return the field value, possibly boxed
     */
    public static Object getFieldValue(Object object, String fieldName) {
        Field field = getDeclaredField(object, fieldName);
        if (field != null) {
            field.setAccessible(true);
            try {
                return field.get(object);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 获取对象属性
     *
     * @param className the name of Class
     * @param object    the object
     * @param fieldName the name of field
     * @return the field value, possibly boxed
     */
    public static Object getFieldValue(String className, Object object, String fieldName) {
        try {
            Class<?> cls = Class.forName(className);
            Field field = cls.getDeclaredField(fieldName);
            field.setAccessible(true);
            return field.get(object);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 循环向上转型, 获取对象的DeclaredMethod, 根据 对象、方法名和对应的方法参数 通过反射 调用上面的方法获取 Method 对象
     *
     * @param object         the object
     * @param methodName     the name of method
     * @param parameterTypes the parameter types of the requested method.
     *                       {@code (Class[]) null} is equivalent to the empty array.
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

    /**
     * 循环向上转型, 获取对象的 DeclaredField
     *
     * @param object    the object
     * @param fieldName the name of field
     * @return the field
     */
    private static Field getDeclaredField(Object object, String fieldName) {
        for (Class<?> cls = object.getClass(); cls != Object.class; cls = cls.getSuperclass()) {
            try {
                return cls.getDeclaredField(fieldName);
            } catch (Exception e) {
                // 不要处理异常，有可能在处理异常时又产生异常而将执行流程转到其它地方
            }
        }
        return null;
    }
}
