#!/usr/bin/env bash

# 当前脚本目录
build_tools_script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "script_dir :${build_tools_script_dir}"

# 工具链配置
# 定义smali位置
smali=${build_tools_script_dir}/baksmali/smali

# 定义baksmali位置
baksmali=${build_tools_script_dir}/baksmali/baksmali

# 定义apksigner位置
apksigner=${build_tools_script_dir}/apksigner/apksigner.sh