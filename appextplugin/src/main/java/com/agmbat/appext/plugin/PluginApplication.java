package com.agmbat.appext.plugin;

import android.app.Application;
import android.util.Log;

public class PluginApplication extends Application {

    @Override
    public void onCreate() {
        // 千万不要调用 super.onCreate();
        // super.onCreate();
        Log.d("PluginApplication", "onCreate");
    }
}
