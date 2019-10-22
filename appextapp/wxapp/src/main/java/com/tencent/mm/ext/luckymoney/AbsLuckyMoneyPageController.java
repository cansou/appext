package com.tencent.mm.ext.luckymoney;

import android.app.Activity;
import android.app.ext.utils.Log;
import android.app.ext.utils.ViewUtils;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;

public abstract class AbsLuckyMoneyPageController implements LuckyMoneyPageController {

    static final String KEY_FORM_APPEXT = "from_appkext";

    static final String KEY_WAY = "key_way";
    static final String KEY_NATIVE_URL = "key_native_url";
    static final String KEY_USERNAME = "key_username";
    static final String KEY_CROPNAME = "key_cropname";

    @Override
    public void onLuckyMoneyUICreated(Activity activity, Bundle bundle) {
        if (isFromAppExt(activity)) {
            Intent intent = activity.getIntent();
            int way = intent.getIntExtra(KEY_WAY, 0);
            String nativeUrl = intent.getStringExtra(KEY_NATIVE_URL);
            String name = intent.getStringExtra(KEY_USERNAME);
//            String cropName = intent.getStringExtra(KEY_CROPNAME);
            Log.d("way:" + way + ",nativeUrl:" + nativeUrl + ",name:" + name);
            ViewUtils.wakeupScreen(activity);
        }
    }

    @Override
    public void onLuckyMoneyUIDisplay(Activity activity) {
        if (isFromAppExt(activity)) {
            Button button = findOpenButton(activity);
            // 如果点击时小于300毫秒会存在点击事件丢失的情况
            int delay = ViewUtils.random(300, 500);
            ViewUtils.performClick(button, delay);
            clearFromFlag(activity);
        }
    }

    /**
     * 查找打开红包的Button
     *
     * @param activity
     * @return
     */
    protected abstract Button findOpenButton(Activity activity);

    /**
     * 清除标记
     *
     * @param activity
     */
    protected void clearFromFlag(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent != null) {
            intent.putExtra(KEY_FORM_APPEXT, false);
        }
    }

    /**
     * 是否为AppExt启动的抢红包页面
     *
     * @param activity
     * @return
     */
    protected boolean isFromAppExt(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent != null) {
            return intent.getBooleanExtra(KEY_FORM_APPEXT, false);
        }
        return false;
    }


}
