编译出wx apk
sh ext/wx_6_7_3_1360/build_assemble_apk.sh com.tencent.mm_vc1360_vn6.7.3.apk

# 编译出插件apk
sh ext/wx_6_7_3_1360/build.sh

Application声明的启动类名
com.tencent.mm.app.Application

调试 app
adb shell am set-debug-app -w com.tencent.mm

adb shell am clear-debug-app com.tencent.mm