package com.tencent.mm.ext.luckymoney.send;

import android.app.Activity;
import android.app.ext.ActivityLifecycleHook;
import android.app.ext.utils.ReflectionUtils;
import android.app.ext.utils.UiUtils;
import android.view.View;

public class WalletPayUI extends ActivityLifecycleHook {

    // com.tencent.mm.plugin.wallet_core.ui.cashier.WcPayCashierDialog
    public static final String ACTIVITY_NAME = "com.tencent.mm.plugin.wallet.pay.ui.WalletPayUI";

    @Override
    public void onActivityResumed(Activity activity) {
        super.onActivityResumed(activity);
        watchKeyboardShown(activity, new KeyboardListener());
    }

    /**
     * 监听键盘是否显示
     *
     * @param activity
     * @param onKeyboardShownListener
     */
    private void watchKeyboardShown(final Activity activity, final OnKeyboardShownListener onKeyboardShownListener) {
        OnWcPayCashierDialogListener listener = new OnWcPayCashierDialogListener() {
            @Override
            public void onDialogShown(Object wcPayCashierDialog) {
                View keyboardWindow = (View) ReflectionUtils.getFieldValue(wcPayCashierDialog, "mKeyboard");
                if (keyboardWindow != null) {
                    if (onKeyboardShownListener != null) {
                        onKeyboardShownListener.onKeyboardShown(keyboardWindow);
                    }
                }
            }
        };
        watchWcPayCashierDialog(activity, listener);
    }

    /**
     * 查找支付显示的对话框
     *
     * @param activity
     * @return
     */
    private Object findWcPayCashierDialog(final Activity activity) {
        return ReflectionUtils.getFieldValue(activity, "vST");
    }

    private void watchWcPayCashierDialog(final Activity activity, final OnWcPayCashierDialogListener listener) {
        Object wcPayCashierDialog = findWcPayCashierDialog(activity);
        if (wcPayCashierDialog != null) {
            listener.onDialogShown(wcPayCashierDialog);
            return;
        }
        UiUtils.post(new Runnable() {
            @Override
            public void run() {
                Object wcPayCashierDialog = findWcPayCashierDialog(activity);
                if (wcPayCashierDialog == null) {
                    UiUtils.post(this);
                } else {
                    listener.onDialogShown(wcPayCashierDialog);
                }
            }
        });
    }

    public interface OnWcPayCashierDialogListener {
        public void onDialogShown(Object wcPayCashierDialog);
    }

}
