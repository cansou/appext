package android.app.ext.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * 用于调试
 */
public class Debug {

    private static final boolean DEBUG = true;

    private static final String TAG = "Performance";

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("MM-dd HH:mm:ss.SSS", Locale.getDefault());

    private static final SimpleDateFormat SHORT_FORMAT = new SimpleDateFormat("mm:ss.SSS", Locale.getDefault());

    /**
     * 存储方法开始时调用的相关Log信息
     */
    private static final Map<String, LogInfo> sMap = new HashMap<>();

    /**
     * 传入的base time
     */
    private static long sBaseTime = 0;

    /**
     * 重置base time
     */
    public static void resetBaseTime() {
        if (!DEBUG) {
            return;
        }
        sBaseTime = System.currentTimeMillis();
    }

    /**
     * 以Debug方式打印Log
     *
     * @param msg
     */
    public static void print(String msg) {
        if (!DEBUG) {
            return;
        }
        print(msg, System.currentTimeMillis());
    }

    /**
     * 以Debug方式打印Log
     *
     * @param msg
     * @param now
     */
    public static void print(String msg, long now) {
        if (!DEBUG) {
            return;
        }
        String time = null;
        if (sBaseTime > 0) {
            long relativeTime = now - sBaseTime;
            time = shortLogTime(relativeTime);
        } else {
            time = androidLogTime();
        }
        String logMsg = "[" + time + "]" + msg;
        Log.d(TAG, logMsg);
    }

    /**
     * 方法开始时调用
     */
    public static void onMethodStart() {
        onMethodStartOfName(null);
    }

    /**
     * 方法结束时调用
     */
    public static void onMethodEnd() {
        onMethodEndOfName(null);
    }

    /**
     * 方法开始时调用
     *
     * @param object 实例名称，用于区分多个实例
     */
    public static void onMethodStart(Object object) {
        if (!DEBUG) {
            return;
        }
        String name = (object == null) ? null : String.valueOf(object.hashCode());
        onMethodStartOfName(name);
    }

    /**
     * 方法结束时调用
     *
     * @param object 实例名称，用于区分多个实例
     */
    public static void onMethodEnd(Object object) {
        if (!DEBUG) {
            return;
        }
        String name = (object == null) ? null : String.valueOf(object.hashCode());
        onMethodEndOfName(name);
    }

    /**
     * 方法开始时调用
     *
     * @param instance 实例名称，用于区分多个实例
     */
    private static void onMethodStartOfName(String instance) {
        if (!DEBUG) {
            return;
        }
        LogInfo info = genLogInfo();
        info.mStartTime = System.currentTimeMillis();
        info.mInstanceName = instance;
        sMap.put(info.key(), info);
        info.printStartTime();
    }

    /**
     * 方法结束时调用
     *
     * @param instance 实例名称，用于区分多个实例
     */
    private static void onMethodEndOfName(String instance) {
        if (!DEBUG) {
            return;
        }
        long time = System.currentTimeMillis();
        LogInfo info = genLogInfo();
        info.mInstanceName = instance;
        LogInfo exist = sMap.remove(info.key());
        if (exist == null) {
            Log.d(TAG, "miss start method:" + info);
            return;
        }
        exist.mEndTime = time;
        exist.printEndTime();
    }

    /**
     * 创建LogInfo
     *
     * @return
     */
    private static LogInfo genLogInfo() {
        StackTraceElement[] elements = new Throwable().getStackTrace();
        final String currentClsName = Debug.class.getName();
        StackTraceElement ele = null;
        for (StackTraceElement e : elements) {
            if (!currentClsName.equals(e.getClassName())) {
                ele = e;
                break;
            }
        }
        String fileName = ele.getFileName();
        String className = ele.getClassName();
        String methodName = ele.getMethodName();
        LogInfo info = new LogInfo();
        info.mFileName = fileName;
        info.mClassName = className;
        info.mMethodName = methodName;
        return info;
    }

    /**
     * 格式化为android log显示时间
     *
     * @return
     */
    private static String androidLogTime() {
        return DATE_FORMAT.format(new Date());
    }

    /**
     * 格式化时间
     *
     * @param time
     * @return
     */
    private static String shortLogTime(long time) {
        return SHORT_FORMAT.format(new Date(time));
    }

    /**
     * Log信息
     */
    private static class LogInfo {

        /**
         * 文件名
         */
        public String mFileName;

        /**
         * 类名
         */
        public String mClassName;

        /**
         * 方法名
         */
        public String mMethodName;

        /**
         * 实例名称
         */
        public String mInstanceName;

        /**
         * 方法开始时间
         */
        public long mStartTime;

        /**
         * 方法结束时间
         */
        public long mEndTime;

        /**
         * 计算方法执行时间
         *
         * @return
         */
        public long calcCost() {
            return mEndTime - mStartTime;
        }

        public String key() {
            return mFileName + ":" + mClassName + ":" + mInstanceName + ":" + mMethodName;
        }

        @Override
        public String toString() {
            return key();
        }

        @Override
        public boolean equals(Object o) {
            if (o == this) {
                return true;
            }
            if (o != null) {
                if (o instanceof LogInfo) {
                    LogInfo other = (LogInfo) o;
                    return equalsText(key(), other.key());
                }
            }
            return false;
        }

        /**
         * 打印方法开始时间
         */
        public void printStartTime() {
            StringBuilder builder = new StringBuilder();
            builder.append(getClassSimpleName()).append("::");
            builder.append(mMethodName).append("--");
            builder.append("start");
            if (!isEmpty(mInstanceName)) {
                builder.append(":").append(mInstanceName);
            }
            String msg = builder.toString();
            print(msg, mStartTime);
        }

        /**
         * 打印方法结束时间
         */
        public void printEndTime() {
            StringBuilder builder = new StringBuilder();
            builder.append(getClassSimpleName()).append("::");
            builder.append(mMethodName).append("--");
            builder.append("end");
            if (!isEmpty(mInstanceName)) {
                builder.append(":").append(mInstanceName);
            }
            builder.append(",cost:").append(calcCost());
            String msg = builder.toString();
            print(msg, mEndTime);
        }

        /**
         * 获取简单的类名
         *
         * @return
         */
        private String getClassSimpleName() {
            String name = mClassName;
            int dot = name.lastIndexOf('.');
            if (dot != -1) {
                return name.substring(dot + 1);
            }
            return name;
        }
    }

    /**
     * 打印函数调用栈
     */
    public static void printStackTrace() {
        printStackTrace(null);
    }

    /**
     * 打印函数调用栈
     */
    public static void printStackTrace(Object object) {
        printStackTrace(object, 10);
    }

    public static void printStackTrace(Object object, int stackMaxCount) {
        StackTraceElement[] elements = new Throwable().getStackTrace();
        final String currentClsName = Debug.class.getName();
        List<StackTraceElement> list = new ArrayList<StackTraceElement>();
        for (StackTraceElement e : elements) {
            if (!currentClsName.equals(e.getClassName())) {
                list.add(e);
            }
        }
        int count = Math.min(stackMaxCount, list.size());
        list = list.subList(0, count);
        StackTraceElement[] array = list.toArray(new StackTraceElement[count]);
        String msg = getStackTraceText(array);
        String name = (object == null) ? null : String.valueOf(object.hashCode());
        msg = "=========begin=========\n" + msg + "=========end=========\n";
        if (!isEmpty(name)) {
            msg = "[object:" + name + "]" + msg;
        }
        Log.d("CallStack", msg);
    }

    /**
     * @param stack the parent stack trace to suppress duplicates from, or
     *              null if this stack trace has no parent.
     */
    private static String getStackTraceText(StackTraceElement[] stack) {
        StringBuilder builder = new StringBuilder();
        for (StackTraceElement ele : stack) {
            builder.append(ele.toString());
            builder.append("\n");
        }
        return builder.toString();
    }

    private static boolean isEmpty(CharSequence charSequence) {
        return charSequence == null || charSequence.length() == 0;
    }

    /**
     * Determine whether two strings are equal.
     *
     * @param a the first object.
     * @param b the second object.
     */
    public static boolean equalsText(String a, String b) {
        if (a != null && b != null) {
            return a.equals(b);
        }
        return a == b;
    }
}
