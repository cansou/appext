#!/usr/bin/env bash
set -x

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "script_dir :${script_dir}"

gradle_work=${script_dir}/../..

# 加载build工具
source ${gradle_work}/buildtools/build_tools.sh

cd ${gradle_work}

version=wx_7_0_9_1560
#version=wx_7_0_7_1521
#version=wx_6_7_3_1360

pkg_name=com.tencent.mm

####================ 编译出fix dex包
#cd  ext/${version}
#${smali} assemble smali_src -o db.dex
####================

ext_app_file=${pkg_name}_778e415d1bd67137.apk # wx_7.0.14
#ext_app_file=${pkg_name}_1b2708769b0d708a.apk
#ext_app_file=${pkg_name}_c96d9576fbabc6b1.apk
#ext_app_file=${pkg_name}_844a7871663f7f79.apk

module_name=wxapp
cd ${gradle_work}
./gradlew :appextapp:${module_name}:assembleDebug
adb push appextapp/${module_name}/build/outputs/apk/debug/${module_name}-debug.apk /sdcard/${ext_app_file}
adb shell am force-stop ${pkg_name}
# launch
adb shell monkey -p ${pkg_name} -c android.intent.category.LAUNCHER 1