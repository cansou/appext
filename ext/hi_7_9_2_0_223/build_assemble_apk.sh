#!/usr/bin/env bash
# 反编译apk, 注入代码抢红包

set -x

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "script_dir :${script_dir}"

gradle_work=${script_dir}/../..

# 加载build工具
source ${gradle_work}/buildtools/build_tools.sh

cd ${gradle_work}

# 当前模块名称
module_name=hi_7_9_2_0_223
pkg_name=com.baidu.hi

# 原始apk路径
original_apk=${1}

if [ -z "${original_apk}" ]; then
    # 将.apk替换成_signed.apk
    exit 0
fi

# 先编译出apk, 将plugin apk放在 assets目录中
./gradlew ext:${module_name}:clean
./gradlew ext:${module_name}:assembleDebug
output_plugin_apk=${gradle_work}/ext/${module_name}/build/outputs/apk/debug/${module_name}-debug.apk


# 临时目录
temp_build_name=build_temp
temp_build_dir=${gradle_work}/ext/${module_name}/build/${temp_build_name}
temp_apk=${pkg_name}.apk

# 清理build目录文件
rm -rf ${temp_build_dir}
mkdir ${temp_build_dir}

cp ${original_apk} ${temp_build_dir}/${temp_apk}
cd ${temp_build_dir}

# 获取classes.dex
classes_dex_name=classes.dex
# 解压apk中的classes.dex
unzip ${temp_apk} ${classes_dex_name}

# 替换application的smali文件
smali_src_name=smali_src_classes
${baksmali} disassemble ${classes_dex_name} -o ${smali_src_name}

# 修改Application.smali
application_smali_file=com/baidu/hi/HiApplication.smali
cp ${gradle_work}/ext/${module_name}/smali_src_application/${application_smali_file} ${smali_src_name}/${application_smali_file}

# 修改smali文件, 在Application中注入代码, 用于app启动后有代码的执行能力
mkdir ${smali_src_name}/android
mkdir ${smali_src_name}/android/app
mkdir ${smali_src_name}/android/app/ext
appext_smali_file=android/app/ext/AppExt.smali
# 复制AppExt.smali
cp ${gradle_work}/appexthost/smali_src/${appext_smali_file} ${smali_src_name}/${appext_smali_file}

# 重新生成classes.dex
rm -rf ${classes_dex_name}
${smali} assemble ${smali_src_name} -o ${classes_dex_name}

# 替换apk中的classes.dex
zip -d ${temp_apk} ${classes_dex_name}
zip -m ${temp_apk} ${classes_dex_name}
# 7z d ${temp_apk} ${classes_dex_name}
# 7z a ${temp_apk} ${classes_dex_name}

######### 替换其他的文件 ##########
## 修改 com.baidu.hi.e.h.smali 在classes2.dex文件中
classes_dex_name=classes2.dex
unzip ${temp_apk} ${classes_dex_name}

smali_src_name=smali_src_classes2
${baksmali} disassemble ${classes_dex_name} -o ${smali_src_name}

# 修改 com.baidu.hi.e.h.smali
com_baidu_hi_e_h_smali_file=com/baidu/hi/e/h.smali
cp ${gradle_work}/ext/${module_name}/smali_src/${com_baidu_hi_e_h_smali_file} ${smali_src_name}/${com_baidu_hi_e_h_smali_file}

# 复制签名的类
sign_smali_file=android/app/ext/SignatureUtils.smali
cp ${gradle_work}/ext/${module_name}/smali_src/${sign_smali_file} ${smali_src_name}/${sign_smali_file}

# 重新生成classes.dex
rm -rf ${classes_dex_name}
${smali} assemble ${smali_src_name} -o ${classes_dex_name}

# 替换apk中的classes2.dex
zip -d ${temp_apk} ${classes_dex_name}
zip -m ${temp_apk} ${classes_dex_name}

# 将plugin apk放在 assets目录中
rm -rf assets
mkdir assets
cp ${output_plugin_apk} assets/${pkg_name}.apk
zip -m ${temp_apk} assets/${pkg_name}.apk
# 7z a ${temp_apk} assets/${pkg_name}.apk

# 添加签名信息
rm -rf assets
mkdir assets
cp ${gradle_work}/ext/${module_name}/sign_data/${pkg_name}_sign.data assets/${pkg_name}_sign.data
zip -m ${temp_apk} assets/${pkg_name}_sign.data
# 7z a ${temp_apk} assets/${pkg_name}_sign.data

# 重新签名apk
${apksigner} ${temp_apk}

# 安装apk运行
adb uninstall ${pkg_name}
adb install -r ${pkg_name}_signed.apk