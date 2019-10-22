### 编译wx_6_7_3_1360
sh ext/wx_6_7_3_1360/build.sh

# 调试 app
adb shell am set-debug-app -w pkg_name
adb shell am clear-debug-app pkg_name

# dump 当前view tree
adb shell uiautomator dump
# 获取dump.xml
adb pull /sdcard/window_dump.xml

# 反编译dex文件

###1. 通过Log查看加载的apk文件 
AppExt: Prepare ext apk name:pkgname_a089c7262e857dfb.apk
