package com.tencent.mm.ext;

import android.annotation.SuppressLint;
import android.app.Application;
import android.app.ext.ActivityCallback;
import android.app.ext.DbReceiver;
import android.app.ext.utils.DexUtils;
import android.app.ext.utils.ExtAppUtils;
import android.app.ext.utils.ReflectionUtils;
import android.app.ext.utils.UiUtils;
import android.app.ext.utils.ZipUtils;
import android.content.Context;
import android.text.TextUtils;

import com.tencent.mm.ext.chatbot.TextMsgWatcher;
import com.tencent.mm.ext.luckymoney.LuckyMoneyReceiveUI;
import com.tencent.mm.ext.luckymoney.LuckyMsgWatcher;
import com.tencent.mm.ext.luckymoney.PageV6_7_3_1360;
import com.tencent.mm.ext.luckymoney.PageV7_0_7_1521;
import com.tencent.mm.ext.luckymoney.send.LuckyMoneyPrepareUI;
import com.tencent.mm.ext.luckymoney.send.LuckyMoneyPrepareUIV7_0_9_1560;
import com.tencent.mm.ext.luckymoney.send.UIPageFragmentActivity;
import com.tencent.mm.ext.luckymoney.send.WalletPayUI;
import com.tencent.mm.ext.msg.ChatMsgWatcher;
import com.tencent.mm.ext.settings.SettingsUI;

import java.io.File;

/**
 * AppExt 入口类
 */
public class WeixinExtApp extends Application {


    @SuppressLint("MissingSuperCall")
    @Override
    public void onCreate() {
        // 不要调用super.onCreate
//        super.onCreate();
        Application app = (Application) getBaseContext();

        // 如果当前类名不是真正的Application则直接返回
        if (!app.getClass().getName().equals(app.getApplicationInfo().className)) {
            return;
        }

        if (ActivityCallback.isRegisterCallback(app)) {
            return;
        }

        WXRuntime.setApplicationContext(app);
        // 如果是系统注入，则需要开启以下代码, 反编译形式已直接注入到smali,而不需要采用热修复方案
        if (WXRuntime.USE_APP_EXT) {
            extraPatch(app);
        }

        // 注册Activity回调
        app.registerActivityLifecycleCallbacks(new ActivityCallback());
        ActivityCallback.register(LauncherUI.ACTIVITY_NAME, new LauncherUI());
        ActivityCallback.register(PageV6_7_3_1360.ACTIVITY_NAME, new LuckyMoneyReceiveUI());
        ActivityCallback.register(PageV7_0_7_1521.ACTIVITY_NAME, new LuckyMoneyReceiveUI());
        if (WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_7_0_9_1560)) {
            ActivityCallback.register(LuckyMoneyPrepareUIV7_0_9_1560.ACTIVITY_NAME,
                    new LuckyMoneyPrepareUIV7_0_9_1560());
        } else if (WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_7_0_7_1521)) {
            ActivityCallback.register(LuckyMoneyPrepareUI.ACTIVITY_NAME, new LuckyMoneyPrepareUI());
        }

        ActivityCallback.register(UIPageFragmentActivity.ACTIVITY_NAME, new UIPageFragmentActivity());
        ActivityCallback.register(WalletPayUI.ACTIVITY_NAME, new WalletPayUI());
        ActivityCallback.register(SettingsUI.ACTIVITY_NAME, new SettingsUI());
        // 注册数据库操作回调
        ChatMsgWatcher msgWatcher = new ChatMsgWatcher();
        msgWatcher.addMessageListener(new LuckyMsgWatcher());
        msgWatcher.addMessageListener(new TextMsgWatcher());
        DbReceiver.addHook(msgWatcher);
        DbReceiver.register(app);

        UiUtils.runOnUiThreadDelay(new Runnable() {
            @Override
            public void run() {
//                package com.tencent.mm.sdk.platformtools;
//                public class ab {
//                    private static com.tencent.mm.sdk.platformtools.ab.a AIh;
//                    private static com.tencent.mm.sdk.platformtools.ab.a AIi;

                ReflectionUtils.setStaticFieldValue("com.tencent.mm.sdk.platformtools.ab", "AIi", new WXLog());
            }
        }, 5000);
    }


    /**
     * 解压asset中的patch文件并应用, 达到修改com.tencent.wcdb.database.SQLiteDatabase类, 注入数据库插入数据的监听
     *
     * @param context
     */
    private static void extraPatch(Context context) {
        String dexName = "classes_patch.dex"; // getDexName();
        if (TextUtils.isEmpty(dexName)) {
            return;
        }
        String apkName = ExtAppUtils.getPluginApkName(context);
        File extApk = new File(context.getFilesDir(), apkName);
        File outFile = new File(context.getFilesDir(), "db.dex");
        ZipUtils.unzipChild(extApk, "assets/" + dexName, outFile);
        File dexDir = new File(context.getFilesDir(), "ext_app_dex");
        dexDir.mkdirs();
        File libDir = new File(context.getFilesDir(), "ext_app_lib");
        libDir.mkdirs();
        String dexPath = outFile.getAbsolutePath();
        String optimizedDirectory = dexDir.getAbsolutePath();
        String librarySearchPath = libDir.getAbsolutePath();
        DexUtils.injectDexAtFirst(context, dexPath, optimizedDirectory, librarySearchPath);
    }

    private static String getDexName() {
        if (WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_7_0_7_1521)
                || WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_7_0_9_1560)) {
            return "db_7_0_7_1521.dex";
        } else if (WXRuntime.RUN_VERSION.equals(WXRuntime.WX_VERSION_6_7_3_1360)) {
            return "db_6_7_3_1360.dex";
        }
        return null;
    }


}
