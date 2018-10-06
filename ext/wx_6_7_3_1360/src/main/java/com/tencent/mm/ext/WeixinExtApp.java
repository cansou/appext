package com.tencent.mm.ext;

import android.annotation.SuppressLint;
import android.app.Application;
import android.app.ext.ActivityCallback;
import android.app.ext.DbReceiver;
import android.app.ext.utils.DexUtils;
import android.app.ext.utils.ZipUtils;
import android.content.Context;

import com.tencent.mm.ext.lucky.LuckyMoneyReceiveUI;
import com.tencent.mm.ext.msg.ChatMsgWatcher;

import java.io.File;

public class WeixinExtApp extends Application {

    private static Application sContext;

    public static Context get() {
        return sContext;
    }

    @SuppressLint("MissingSuperCall")
    @Override
    public void onCreate() {
        // 不要调用super.onCreate
//        super.onCreate();
        Application app = (Application) getBaseContext();
        sContext = app;
        unzipPatch(app);
        app.registerActivityLifecycleCallbacks(new ActivityCallback());

//        ActivityCallback.register(WeChatSplashActivityHook.ACTIVITY_NAME, new WeChatSplashActivityHook());
        ActivityCallback.register(LauncherUI.ACTIVITY_NAME, new LauncherUI());
        ActivityCallback.register(LuckyMoneyReceiveUI.ACTIVITY_NAME, new LuckyMoneyReceiveUI());
        DbReceiver.addHook(new ChatMsgWatcher());
        DbReceiver.register(app);
    }

    private static void unzipPatch(Context context) {
        String apkName = "com.tencent.mm_844a7871663f7f79.apk";
        File extApk = new File(context.getFilesDir(), apkName);
        String dexName = "assets/db.dex";
        File outFile = new File(context.getFilesDir(), "db.dex");
        ZipUtils.unzipChild(extApk, dexName, outFile);

        File extDir = new File(context.getFilesDir(), "ext");
        extApk.mkdirs();

        try {
            DexUtils.injectDexAtFirst(context, outFile.getAbsolutePath(), extDir.getAbsolutePath());
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
