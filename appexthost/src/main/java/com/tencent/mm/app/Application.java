package com.tencent.mm.app;

import android.util.Log;

public class Application extends android.app.Application {

    @Override
    public void onCreate() {
        super.onCreate();
        try {
            Log.d("AppExt", "Prepare ext apk name:===========");
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }


}
