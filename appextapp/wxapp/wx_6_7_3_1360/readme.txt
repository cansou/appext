编译出wx apk
sh ext/wx_6_7_3_1360/build_assemble_apk.sh com.tencent.mm_vc1360_vn6.7.3.apk

# 编译出插件apk
sh ext/wx_6_7_3_1360/build.sh

Application声明的启动类名
pkgname.app.Application


----------------
1. 下载微信apk
    http://dldir1.qq.com/weixin/android/weixin707android1520.apk
    md5:8983fe14c96d9576fbabc6b1442e1e77

    查看apk信息
    aapt d badging weixin707android1520.apk

    package: name='com.tencent.mm'
    versionCode='1521'
    versionName='7.0.7'
    platformBuildVersionName=''
    install-location:'auto'
    sdkVersion:'21'
    targetSdkVersion:'26'

2. 确认重签名是否可运行
    1. 删除原签名
        cp weixin707android1520.apk temp.apk
        7z l temp.apk | grep 'META-INF'
        7z d temp.apk META-INF
    2. 重新签名
       apksigner.sh temp.apk
       adb install -r temp_signed.apk

3. 反编译apk,提取smali代码
        mkdir temp
        mv temp.apk temp
        unzip temp.apk
        baksmali disassemble classes.dex -o classes
        baksmali disassemble classes2.dex -o classes2
        baksmali disassemble classes3.dex -o classes3
        baksmali disassemble classes4.dex -o classes4
        baksmali disassemble classes5.dex -o classes5
        baksmali disassemble classes6.dex -o classes6

4. 找到 入口类 Application.smali 注入加载apk的代码

        <application
                android:theme="@ref/0x7f0d0025"
                android:label="@ref/0x7f0a0306"
                android:icon="@ref/0x7f030002"
                android:name="com.tencent.mm.app.Application"
                android:persistent="false"
                android:allowBackup="false"
                android:hardwareAccelerated="true"
                android:largeHeap="true"
                android:supportsRtl="false"
                android:appComponentFactory="android.support.v4.app.CoreComponentFactory">

5. 找到 监听收到消息的关键点, 可以是监听数据库

6. 回编classes.dex
    smali assemble classes -o classes.dex