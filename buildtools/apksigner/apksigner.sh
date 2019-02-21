#!/bin/bash
# 签名apk
set -x
work_dir=`dirname "$0"`
echo "work dir:${work_dir}"
cd `pwd`

# 第一个参数为输入参数，需要签名的包 need signed apk
unsigned_apk=${1}

# 第二个参数为输出路径, 签名后的包
signed_apk=${2}

# 如果未输入输出包,则以输入的包加上signed作为后缀输出
if [ -z "${signed_apk}" ]; then
    # 将.apk替换成_signed.apk
    signed_apk=${unsigned_apk/.apk/_signed.apk}
fi

# 定义签名信息
key_store=${work_dir}/key.keystore
key_alias=key.keystore
key_store_password=123123
key_alias_password=123123

echo "unsigned apk:"${unsigned_apk}
echo "singed apk:"${signed_apk}

# 在签名之前需要删除原有的签名
tmp_apk=${unsigned_apk/.apk/_tmp.apk}

# 复制临时apk
cp ${unsigned_apk} ${tmp_apk}

### 删除原apk中的签名 #########
# 可使用7z, 需要安装7z工具
# 7z d ${tmp_apk} META-INF

# 或者使用zip删除签名的apk
# zip -d ${tmp_apk} META-INF/CERT.RSA
# zip -d ${tmp_apk} META-INF/CERT.SF
# zip -d ${tmp_apk} META-INF/MANIFEST.MF
# zip -d ${tmp_apk} META-INF/COM_TENC.SF
# zip -d ${tmp_apk} META-INF

# mac平台 '*' 需要加上转义
zip -d ${tmp_apk} META-INF/\*
### 删除原apk中的签名 #########

echo "Signing apk..."
jarsigner -verbose -digestalg SHA1 -sigalg MD5withRSA -keystore ${key_store} -storepass ${key_store_password} -keypass ${key_alias_password} -signedjar ${signed_apk} ${tmp_apk} ${key_alias}

# singed apk but not zipalign
# zipalign -f -v 4 "$1" `echo "$1" | sed 's/\.apk$/_signed.apk/'`

