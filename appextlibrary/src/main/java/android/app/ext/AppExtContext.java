package android.app.ext;

import android.app.ext.utils.ExtAppUtils;
import android.app.ext.utils.ReflectionUtils;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.view.LayoutInflater;

public class AppExtContext extends ContextWrapper {

    /**
     * 用于获取插件资源
     */
    private Resources mResources;

    /**
     * 用于解析插件中view树
     */
    private LayoutInflater mInflater;

    /**
     * 插件主题使用当前app设置的主题
     */
    private Resources.Theme mTheme;

    public AppExtContext(Context base) {
        super(base);
        String pluginApkPath = ExtAppUtils.getPluginApkPath(base);
        mResources = createResources(base, pluginApkPath);
        mInflater = new PluginLayoutInflater(this);
    }

    @Override
    public Object getSystemService(String name) {
        if (Context.LAYOUT_INFLATER_SERVICE.equals(name)) {
            return mInflater;
        }
        return super.getSystemService(name);
    }

    @Override
    public AssetManager getAssets() {
        return mResources.getAssets();
    }

    @Override
    public Resources getResources() {
        return mResources;
    }

    @Override
    public Resources.Theme getTheme() {
        if (mTheme == null) {
            int targetSdkVersion = getBaseContext().getApplicationInfo().targetSdkVersion;
            int resid = (int) ReflectionUtils
                    .invokeStaticMethod(Resources.class.getName(), "selectDefaultTheme",
                            new Class[]{int.class, int.class}, new Object[]{0, targetSdkVersion});
//            int resid = Resources.selectDefaultTheme(0, targetSdkVersion);
            mTheme = mResources.newTheme();
            mTheme.applyStyle(resid, true);
        }
        return mTheme;
    }

    /**
     * 创建指定路径的插件资源
     *
     * @param context
     * @param pluginPath
     * @return
     */
    public static Resources createResources(Context context, String pluginPath) {
        try {
            AssetManager assets = AssetManager.class.newInstance();
            addAssetPath(assets, pluginPath);
            Resources superRes = context.getResources();
            return new Resources(assets, superRes.getDisplayMetrics(), superRes.getConfiguration());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 使用射调用AssetManager.addAssetPath方法
     */
    public static int addAssetPath(AssetManager assetManager, String path) {
        return (int) ReflectionUtils.invokeMethod(assetManager, "addAssetPath",
                new Class[]{String.class}, new Object[]{path});
    }


}
