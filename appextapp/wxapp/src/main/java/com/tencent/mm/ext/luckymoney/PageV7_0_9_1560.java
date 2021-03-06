package com.tencent.mm.ext.luckymoney;

import android.app.Activity;
import android.app.ext.utils.ViewUtils;
import android.content.Context;
import android.content.Intent;
import android.view.ViewGroup;
import android.widget.Button;

import com.tencent.mm.ext.WXRuntime;

/**
 * window_dump_luckymoneynothookreceiveui.xml
 */
public class PageV7_0_9_1560 extends AbsLuckyMoneyPageController {

    /**
     * 微信 7.0.9 引入的抢红包页面
     * 显示红包界面的Activity
     */
    public static final String ACTIVITY_NAME = "com.tencent.mm.plugin.luckymoney.ui.LuckyMoneyNotHookReceiveUI";

    @Override
    public void launchLuckyMoney(LuckyInfo info) {
        Context context = WXRuntime.getApplicationContext();
        Intent intent = new Intent();
        intent.putExtra(KEY_WAY, info.way);
        intent.putExtra(KEY_NATIVE_URL, info.nativeurl);
        intent.putExtra(KEY_USERNAME, info.name);
        intent.putExtra(KEY_CROPNAME, "");
        intent.putExtra(KEY_FORM_APPEXT, true);
        intent.setClassName(context, ACTIVITY_NAME);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    @Override
    protected Button findOpenButton(Activity activity) {
        ViewGroup contentView = (ViewGroup) activity.findViewById(android.R.id.content);
        // 每个版本的button id值不一样, 也没找到一个比较通用的方案,可能都会存在问题
        Button button = (Button) ViewUtils.findViewByIdName(contentView, "dan");
        return button;
    }

}

