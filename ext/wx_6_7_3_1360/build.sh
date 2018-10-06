#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "script_dir :${script_dir}"

gradle_work=${script_dir}/../..

cd ${gradle_work}

./gradlew ext:wx_6_7_3_1360:assembleDebug
adb push ext/wx_6_7_3_1360/build/outputs/apk/debug/wx_6_7_3_1360-debug.apk /sdcard/com.tencent.mm_844a7871663f7f79.apk
adb shell am force-stop com.tencent.mm