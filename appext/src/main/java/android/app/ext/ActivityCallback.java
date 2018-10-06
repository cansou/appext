package android.app.ext;

import android.app.Activity;
import android.app.Application;
import android.app.ext.utils.Log;
import android.os.Bundle;

import java.util.HashMap;

/**
 * Activity回调
 */
public class ActivityCallback implements Application.ActivityLifecycleCallbacks {

    private static HashMap<String, ActivityLifecycleHook> ACTIVITY_MAP = new HashMap<>();

    /**
     * 注册需要监听的Activity
     *
     * @param activityClassName
     * @param activity
     */
    public static void register(String activityClassName, ActivityLifecycleHook activity) {
        ACTIVITY_MAP.put(activityClassName, activity);
    }

    private static ActivityLifecycleHook getActivity(Activity activity) {
        String className = activity.getClass().getName();
        return getActivity(className);
    }

    public static ActivityLifecycleHook getActivity(String className) {
        return ACTIVITY_MAP.get(className);
    }

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) {
        Log.d("ActivityCallback", "onActivityCreated:" + activity.getClass());
        Application.ActivityLifecycleCallbacks callback = getActivity(activity);
        if (callback != null) {
            callback.onActivityCreated(activity, bundle);
        }
    }

    @Override
    public void onActivityStarted(Activity activity) {
        Log.d("ActivityCallback", "onActivityStarted:" + activity.getClass());
        Application.ActivityLifecycleCallbacks callback = getActivity(activity);
        if (callback != null) {
            callback.onActivityStarted(activity);
        }
    }

    @Override
    public void onActivityResumed(Activity activity) {
        Log.d("ActivityCallback", "onActivityResumed:" + activity.getClass());
        Application.ActivityLifecycleCallbacks callback = getActivity(activity);
        if (callback != null) {
            callback.onActivityResumed(activity);
        }
    }

    @Override
    public void onActivityPaused(Activity activity) {
        Log.d("ActivityCallback", "onActivityPaused:" + activity.getClass());
        Application.ActivityLifecycleCallbacks callback = getActivity(activity);
        if (callback != null) {
            callback.onActivityPaused(activity);
        }
    }

    @Override
    public void onActivityStopped(Activity activity) {
        Log.d("ActivityCallback", "onActivityStopped:" + activity.getClass());
        Application.ActivityLifecycleCallbacks callback = getActivity(activity);
        if (callback != null) {
            callback.onActivityStopped(activity);
        }
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        Log.d("ActivityCallback", "onActivityDestroyed:" + activity.getClass());
        Application.ActivityLifecycleCallbacks callback = getActivity(activity);
        if (callback != null) {
            callback.onActivityDestroyed(activity);
        }
    }

    @Override
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        Application.ActivityLifecycleCallbacks callback = getActivity(activity);
        if (callback != null) {
            callback.onActivitySaveInstanceState(activity, bundle);
        }
    }

}
