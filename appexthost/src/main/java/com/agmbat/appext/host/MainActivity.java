package com.agmbat.appext.host;

import android.app.Activity;
import android.app.ext.SignatureUtils;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Environment;
import android.widget.TextView;

import java.io.File;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        TextView textView = new TextView(this);
        textView.setText("Host");
        setContentView(textView);
        saveSignData(this, getPackageName());
    }

    /**
     * 保存签名信息
     *
     * @param context
     * @param packageName
     */
    private static void saveSignData(Context context, String packageName) {
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(packageName, 64);
            byte[] signData = packageInfo.signatures[0].toByteArray();
            File file = new File(Environment.getExternalStorageDirectory(), packageName + "_sign.data");
            SignatureUtils.writeToFile(file, signData);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
