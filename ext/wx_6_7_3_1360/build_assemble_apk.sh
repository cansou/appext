#!/usr/bin/env bash
# 反编译apk, 注入代码抢红包

set -x

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "script_dir :${script_dir}"

gradle_work=${script_dir}/../..

cd ${gradle_work}

# 当前模块名称
module_name=wx_6_7_3_1360

# 原始apk路径
wx_apk=${1}

if [ -z "${wx_apk}" ]; then
    # 将.apk替换成_signed.apk
    exit 0
fi

# 将plugin apk放在 assets目录中
./gradlew ext:${module_name}:clean
./gradlew ext:${module_name}:assembleDebug
output_plugin_apk=${gradle_work}/ext/${module_name}/build/outputs/apk/debug/${module_name}-debug.apk

# setup 1 获取classes.dex

# 临时目录
temp_build_name=build_temp
temp_build_dir=${gradle_work}/ext/${module_name}/${temp_build_name}
temp_apk=wx.apk

# 清理build目录文件
rm -rf ${temp_build_dir}
mkdir ${temp_build_dir}

cp ${wx_apk} ${temp_build_dir}/${temp_apk}
cd ${temp_build_dir}

# 解压apk
unzip ${temp_apk}

# setup 2 获取wx的smali文件
baksmali disassemble classes.dex -o smali_src

# setup 3 修改smali文件, 在Application中注入代码, 用于app启动后有代码的执行能力
mkdir smali_src/android
mkdir smali_src/android/app
mkdir smali_src/android/app/ext
appext_smali_file=android/app/ext/AppExt.smali
# 复制AppExt.smali
cp ${gradle_work}/appexthost/smali_src/${appext_smali_file} smali_src/${appext_smali_file}

# 修改Application.smali
application_smali_file=com/tencent/mm/app/Application.smali
cp ${gradle_work}/ext/${module_name}/smali_src_application/${application_smali_file} smali_src/${application_smali_file}

# 修改SQLiteDtabase.smali
sqlite_db_smali=com/tencent/wcdb/database/SQLiteDatabase.smali
cp ${gradle_work}/ext/${module_name}/smali_src/${sqlite_db_smali} smali_src/${sqlite_db_smali}

# 添加DbWatcher.smali
dbwatcher_smali=android/app/ext/DbWatcher.smali
cp ${gradle_work}/ext/${module_name}/smali_src/${dbwatcher_smali} smali_src/${dbwatcher_smali}


# setup 3 重新生成classes.dex
rm -rf classes.dex
smali assemble smali_src -o classes.dex

# 替换apk中的classes.dex
7z d ${temp_apk} classes.dex
7z a ${temp_apk} classes.dex

# 注入插件apk
rm -rf assets
mkdir assets
cp ${output_plugin_apk} assets/com.tencent.mm.apk
7z a ${temp_apk} assets/com.tencent.mm.apk

# 重新签名apk
apksigner.sh ${temp_apk}

# 安装apk运行
adb uninstall com.tencent.mm
adb install -r wx_signed.apk