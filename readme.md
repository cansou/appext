### 编译wx_6_7_3_1360
sh ext/wx_6_7_3_1360/build.sh

# dump 当前view tree
adb shell uiautomator dump
# 获取dump.xml
adb pull /sdcard/window_dump.xml

# 反编译dex文件
baksmali disassemble wx_6_7_3_1360-debug.apk -o smali_src

smali assemble smali_src -o classes.dex

#
adb shell am set-debug-app -w com.tencent.mm

adb shell am clear-debug-app com.tencent.mm