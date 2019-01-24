package com.agmbat.appext.host;

import android.app.Application;
import android.app.ext.AppExt;

public class HostApplication extends Application {

    @Override
    public void onCreate() {
        // 已注入代码到系统中
        super.onCreate();
        // TODO 用于本地测试代码是否可用
        AppExt.onCreate(this);
    }
}
