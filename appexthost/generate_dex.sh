#!/usr/bin/env bash

# 生成 AppExt 类的 smali文件

set -x

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "script_dir :${script_dir}"

gradle_work=${script_dir}/..

# 加载build工具
source ${gradle_work}/buildtools/build_tools.sh

cd ${gradle_work}/

module_name=appexthost
out_dir=${gradle_work}/${module_name}/build/outputs/apk/debug

# 进入apk目录
cd ${out_dir}

# 反编译class.dex
${smali} assemble smali_src -o classes_patch.dex
