package android.app.ext;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

/**
 */
public class ActivityLifecycleHook implements Application.ActivityLifecycleCallbacks {

    protected Activity mThisActivity;

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) {
        mThisActivity = activity;
    }

    @Override
    public void onActivityStarted(Activity activity) {
    }

    @Override
    public void onActivityResumed(Activity activity) {
    }

    @Override
    public void onActivityPaused(Activity activity) {
    }

    @Override
    public void onActivityStopped(Activity activity) {
    }

    @Override
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        if (mThisActivity == activity) {
            mThisActivity = null;
        }
    }

    public void onBackPressed() {
        if (mThisActivity != null) {
            mThisActivity.onBackPressed();
        }
    }

    public void close() {
        onBackPressed();
    }
}
