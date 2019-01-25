#!/usr/bin/env bash

# 生成 AppExt 类的 smali文件

set -x

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "script_dir :${script_dir}"

gradle_work=${script_dir}/..

cd ${gradle_work}/

module_name=appexthost
./gradlew ${module_name}:clean
./gradlew ${module_name}:assembleDebug

out_dir=${gradle_work}/${module_name}/build/outputs/apk/debug
out_apk_name=${module_name}-debug.apk

# 进入apk目录
cd ${out_dir}

# 解压apk
unzip ${out_apk_name}

# 反编译class.dex
baksmali disassemble classes.dex -o smali_src
# 保存smali文件
smali_file=android/app/ext/AppExt.smali
cp ${out_dir}/smali_src/${smali_file} ${gradle_work}/${module_name}/smali_src/${smali_file}


