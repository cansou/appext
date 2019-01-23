#!/usr/bin/env bash
set -x

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "script_dir :${script_dir}"

gradle_work=${script_dir}/../..

cd ${gradle_work}

module_name=hi_7_9_2_0_223
pkg_name=com.baidu.hi
apk_name=${pkg_name}_43f33feae1ea7622.apk
./gradlew ext:${module_name}:assembleDebug

adb push ext/${module_name}/build/outputs/apk/debug/${module_name}-debug.apk /sdcard/${apk_name}
adb shell am force-stop ${pkg_name}