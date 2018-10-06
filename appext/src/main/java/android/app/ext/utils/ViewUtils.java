package android.app.ext.utils;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.os.PowerManager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Random;

public class ViewUtils {

    private static final String TAG = "ViewUtils";

    /**
     * 生成随机数, 在[min, max]区间
     *
     * @param min
     * @param max
     * @return
     */
    public static int random(int min, int max) {
        Random random = new Random();
        return min + random.nextInt(max - min);
    }

    /**
     * 点击Button
     *
     * @param view
     */
    public static void performClick(final View view) {
        long delayMillis = random(10, 300);
        performClick(view, delayMillis);
    }

    public static void performClick(final View view, long delayMillis) {
        if (view == null) {
            Log.d(TAG, "view is null");
            return;
        }
        view.postDelayed(new Runnable() {
            @Override
            public void run() {
                view.performClick();
                Log.d(TAG, "click view:" + view);
            }
        }, delayMillis);
    }

    /**
     * 获取view的onClickListener
     *
     * @param view
     * @return
     */
    public static View.OnClickListener getViewOnClickListener(View view) {
        Object listenerInfo = ReflectionUtils.invokeMethod(view, "getListenerInfo", null, null);
        if (listenerInfo != null) {
            return (View.OnClickListener) ReflectionUtils.getFieldValue(listenerInfo, "mOnClickListener");
        }
        return null;
    }

    public static List<View> findViewByClassName(View view, String className) {
        try {
            Class cls = Class.forName(className);
            return findViewByClass(view, cls);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }

    public static View findViewByIdName(View view, String idName) {
        int id = getId(view.getContext(), idName);
        return view.findViewById(id);
    }

    public static View findViewByIdName(Activity activity, String idName) {
        int id = getId(activity, idName);
        return activity.findViewById(id);
    }

    private static int getId(Context context, String idName) {
        Resources res = context.getResources();
        String pkgName = context.getPackageName();
        return res.getIdentifier(idName, "id", pkgName);
    }

    /**
     * 通过class 类型查看View
     *
     * @param view
     * @param cls
     * @return
     */
    public static List<View> findViewByClass(View view, Class<?> cls) {
        List<View> list = new ArrayList<>();
        Queue<ViewGroup> groups = new LinkedList<>();
        if (cls.isAssignableFrom(view.getClass())) {
            list.add(view);
        }
        if (view instanceof ViewGroup) {
            groups.add((ViewGroup) view);
        }
        while (!groups.isEmpty()) {
            ViewGroup group = groups.poll();
            int count = group.getChildCount();
            for (int i = 0; i < count; i++) {
                View v = group.getChildAt(i);
                if (cls.isAssignableFrom(v.getClass())) {
                    list.add(v);
                }
                if (v instanceof ViewGroup) {
                    groups.add((ViewGroup) v);
                }
            }
        }
        return list;
    }

    /**
     * 根据文本查找button
     *
     * @param view
     * @param text
     * @return
     */
    public static Button findButtonByText(View view, String text) {
        List<View> list = findViewByClass(view, Button.class);
        if (list == null) {
            return null;
        }
        for (View button : list) {
            boolean isButton = isTargetButton(button, text);
            if (isButton) {
                return (Button) button;
            }
        }
        return null;
    }


    private static boolean isTargetButton(View view, String text) {
        if (view instanceof Button) {
            Button button = (Button) view;
            String buttonText = button.getText().toString();
            return (buttonText.equals(text));
        }
        return false;
    }

    private static boolean isVisibleButton(View view) {
        if (view instanceof Button) {
            if (view.getVisibility() == View.VISIBLE) {
                return true;
            }
        }
        return false;
    }

    /**
     * 点亮屏幕
     *
     * @param activity
     */
    public static void wakeupScreen(Activity activity) {
        // 获取电源管理器对象
        PowerManager pm = (PowerManager) activity.getSystemService(Context.POWER_SERVICE);
        PowerManager.WakeLock wl = pm.newWakeLock(PowerManager.ACQUIRE_CAUSES_WAKEUP
                | PowerManager.SCREEN_DIM_WAKE_LOCK, "bright");
        // 获取PowerManager.WakeLock对象，后面的参数|表示同时传入两个值，最后的是LogCat里用的Tag
        // 点亮屏幕
        wl.acquire();
        // 释放
        wl.release();
    }
}
