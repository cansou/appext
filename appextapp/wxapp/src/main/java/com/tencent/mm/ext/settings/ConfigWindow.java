package com.tencent.mm.ext.settings;

import android.app.ext.utils.Log;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.FrameLayout;
import android.widget.TextView;

import com.agmbat.multiwindow.FloatingWindow;
import com.tencent.mm.ext.R;

public class ConfigWindow extends FloatingWindow {

    private CheckBox mGrabSelfBox;

    public ConfigWindow(Context context) {
        super(context);
    }

    @Override
    public void onCreateView(FrameLayout frame) {
        View view = View.inflate(mContext, R.layout.appext_config, frame);
        TextView textView = view.findViewById(R.id.text);
        textView.setText("debug");
        view.findViewById(R.id.refresh).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d("=====");
            }
        });
        mGrabSelfBox = view.findViewById(R.id.grab_self_switch);

        mGrabSelfBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                WXConfig.get().setEnableMySelfLucky(isChecked);
            }
        });
        mGrabSelfBox.setChecked(WXConfig.get().isEnableMySelfLucky());

    }

    @Override
    public String getAppName() {
        Context baseContext = ((ContextWrapper) mContext).getBaseContext();
        return baseContext.getString(baseContext.getApplicationInfo().labelRes);
    }

    /**
     * 获取app icon
     *
     * @return
     */
    public Drawable getAppIconDrawable() {
        Context baseContext = ((ContextWrapper) mContext).getBaseContext();
        int id = baseContext.getApplicationInfo().icon;
        return baseContext.getResources().getDrawable(id);
    }

}
