开发记录

1. 找hi apk
  下载地址:
    http://i.im.baidu.com/
    https://shouji.baidu.com/software/item?pid=178966
    http://p.gdown.baidu.com/c6bc5f26275b433d0a7c98b0ae1328731089cc1005a419d5703082008f09dcd0a47458ad87c50b55b10e28ce2fde4152b17458e759405db204b1583c5e0355671f057582799167bea485a47c7f2adfd01d7e72ea12fe3935f4f5db1695e824ade1659de36ab88cacf4f0d1b6eb41793668eecf39bbf96aedb6328ee3fe9a30a057905f01eba2b6adf09529d02f33f495fc90d3a5d48089d6c62a7b6dada16ea1922b00b95c3bcdf94d801f1db5a6afe934db2b57772b7bbe50c3199ed66c93b327805ccc8093f50fd7587d47001da68c93df0de29a05da427015d032afdfde32c1250aa4f4faf971acc1532f6cc64baf9d81ec0bb86a5cd9a1e2068f1df03c24a88ad0ecc20d8a1fc667668cfe63abdccf059b1510b5294c3eb10237bc1b2c52dc7bb875ba873b887a8fb2924f7b6639

2. 获取会加载的apk名称
    com.baidu.hi_43f33feae1ea7622.apk
    发现加载了三次,说明Application.OnCreate调用了三次,加载保护，只调用一次

3. 调试hi
    adb shell am set-debug-app -w com.baidu.hi

4. 找到监听收到消息的hook点
    1. 收到消息一般会写数据库

        1) 解压apk获取dex
        2) dex2jar 转jar包
        3）jdgui jar-> java 源码

拦截启动的Activity,查看Intent数据

com.baidu.hi.luckymoney.LuckyMoneyActivity

com.baidu.hi.luckymoney.logic.LuckyMoneyTryOpenEvent

5. 运行项目
sh ext/hi_7_9_2_0_223/build.sh