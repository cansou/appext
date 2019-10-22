package com.tencent.tinker.loader.app;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Configuration;
import android.content.res.Resources;

public interface ITinkerInlineFenceBridge {

    public abstract void attachBaseContext(TinkerApplication application, Context context);


    public abstract AssetManager getAssets(AssetManager assetManager);


    public abstract Context getBaseContext(Context context);


    public abstract ClassLoader getClassLoader(ClassLoader classLoader);


    public abstract Resources getResources(Resources resources);


    public abstract Object getSystemService(String text, Object o);

    public abstract void onConfigurationChanged(Configuration configuration);

    public abstract void onCreate(TinkerApplication application);

    public abstract void onLowMemory();

    public abstract void onTerminate();

    public abstract void onTrimMemory(int i);
}
