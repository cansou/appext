### 编译wx_6_7_3_1360
sh ext/wx_6_7_3_1360/build.sh

# dump 当前view tree
adb shell uiautomator dump
# 获取dump.xml
adb pull /sdcard/window_dump.xml
