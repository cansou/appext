package com.baidu.hi.e;

import android.app.ext.SignatureUtils;
import android.content.Context;
import android.content.pm.PackageInfo;

import java.io.ByteArrayInputStream;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;

public abstract class h {

    public static X509Certificate X(Context var0) {
        return null;
    }

    public static byte[] Y(Context param0) {
        // $FF: Couldn't be decompiled
        return null;
    }

    public static String n(Context var0, String var1) {
        return null;
    }

    public static String n(byte[] param0) {
        // $FF: Couldn't be decompiled
        return "";
    }

    public static X509Certificate readX509Certificate(Context context) {
        ByteArrayInputStream inputStream = null;
        X509Certificate certificate = null;
        try {
            String packageName = context.getPackageName();
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(packageName, 64);
            byte[] signData = packageInfo.signatures[0].toByteArray();
            signData = SignatureUtils.readSign(context, signData);
            inputStream = new ByteArrayInputStream(signData);
            CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
            certificate = (X509Certificate) certificateFactory.generateCertificate(inputStream);
        } catch (CertificateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SignatureUtils.closeQuietly(inputStream);
        }
        return certificate;
    }


}
