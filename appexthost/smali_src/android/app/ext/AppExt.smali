.class public Landroid/app/ext/AppExt;
.super Ljava/lang/Object;
.source "AppExt.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 39
    const-class v0, Landroid/app/ext/AppExt;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/app/ext/AppExt;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static asHexString([B)Ljava/lang/String;
    .registers 9
    .param p0, "data"    # [B

    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 202
    .local v0, "sb":Ljava/lang/StringBuilder;
    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_8
    if-ge v3, v1, :cond_21

    aget-byte v4, p0, v3

    .line 203
    .local v4, "b":B
    const-string v5, "%02x"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .end local v4    # "b":B
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 205
    :cond_21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static attachBaseContext(Landroid/content/ContextWrapper;Landroid/content/Context;)V
    .registers 7
    .param p0, "wrapper"    # Landroid/content/ContextWrapper;
    .param p1, "context"    # Landroid/content/Context;

    .line 294
    const-string v0, "attachBaseContext"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v4

    invoke-static {p0, v0, v2, v1}, Landroid/app/ext/AppExt;->invokeMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    return-void
.end method

.method private static closeQuietly(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "closeable"    # Ljava/io/Closeable;

    .line 214
    if-eqz p0, :cond_a

    .line 216
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 219
    goto :goto_a

    .line 217
    :catch_6
    move-exception v0

    .line 218
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 221
    .end local v0    # "e":Ljava/io/IOException;
    :cond_a
    :goto_a
    return-void
.end method

.method private static copyFileNio(Ljava/io/File;Ljava/io/File;)Z
    .registers 13
    .param p0, "src"    # Ljava/io/File;
    .param p1, "dest"    # Ljava/io/File;

    .line 247
    const/4 v0, 0x0

    .line 248
    .local v0, "fis":Ljava/io/FileInputStream;
    const/4 v1, 0x0

    .line 249
    .local v1, "fos":Ljava/io/FileOutputStream;
    const/4 v2, 0x0

    .line 250
    .local v2, "in":Ljava/nio/channels/FileChannel;
    const/4 v3, 0x0

    .line 252
    .local v3, "out":Ljava/nio/channels/FileChannel;
    :try_start_4
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v0, v4

    .line 253
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v1, v4

    .line 254
    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    move-object v2, v4

    .line 255
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    move-object v3, v4

    .line 256
    const-wide/16 v6, 0x0

    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v8

    move-object v5, v2

    move-object v10, v3

    invoke-virtual/range {v5 .. v10}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_25} :catch_35
    .catchall {:try_start_4 .. :try_end_25} :catchall_33

    .line 257
    const/4 v4, 0x1

    .line 261
    invoke-static {v0}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 262
    invoke-static {v2}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 263
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 264
    invoke-static {v3}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 257
    return v4

    .line 261
    :catchall_33
    move-exception v4

    goto :goto_48

    .line 258
    :catch_35
    move-exception v4

    .line 259
    .local v4, "e":Ljava/io/IOException;
    :try_start_36
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_39
    .catchall {:try_start_36 .. :try_end_39} :catchall_33

    .line 261
    .end local v4    # "e":Ljava/io/IOException;
    invoke-static {v0}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 262
    invoke-static {v2}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 263
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 264
    invoke-static {v3}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 265
    nop

    .line 266
    const/4 v4, 0x0

    return v4

    .line 261
    :goto_48
    invoke-static {v0}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 262
    invoke-static {v2}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 263
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 264
    invoke-static {v3}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    throw v4
.end method

.method private static getApkMd516(Landroid/content/Context;)Ljava/lang/String;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .line 153
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 154
    .local v0, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 155
    .local v1, "path":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/app/ext/AppExt;->md5File(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    .line 156
    .local v2, "md5":Ljava/lang/String;
    invoke-static {v2}, Landroid/app/ext/AppExt;->getMd516bit(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static varargs getDeclaredMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 5
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 331
    .local p2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 331
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_4
    const-class v1, Ljava/lang/Object;

    if-eq v0, v1, :cond_13

    .line 333
    :try_start_8
    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_c} :catch_d

    return-object v1

    .line 334
    :catch_d
    move-exception v1

    .line 331
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_4

    .line 338
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_13
    const/4 v0, 0x0

    return-object v0
.end method

.method private static getMd516bit(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "md532bit"    # Ljava/lang/String;

    .line 188
    if-eqz p0, :cond_12

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_9

    goto :goto_12

    .line 191
    :cond_9
    const/16 v0, 0x8

    const/16 v1, 0x18

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 189
    :cond_12
    :goto_12
    return-object p0
.end method

.method private static getPackageArchiveInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PackageInfo;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "apkPath"    # Ljava/lang/String;

    .line 230
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 231
    .local v0, "pm":Landroid/content/pm/PackageManager;
    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 232
    .local v1, "info":Landroid/content/pm/PackageInfo;
    if-eqz v1, :cond_11

    .line 233
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 234
    .local v2, "appInfo":Landroid/content/pm/ApplicationInfo;
    iput-object p1, v2, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 235
    iput-object p1, v2, Landroid/content/pm/ApplicationInfo;->publicSourceDir:Ljava/lang/String;

    .line 237
    .end local v2    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_11
    return-object v1
.end method

.method private static getProcessName(Landroid/content/Context;)Ljava/lang/String;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;

    .line 129
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    .line 130
    .local v0, "pid":I
    const-string v1, "activity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    .line 131
    .local v1, "am":Landroid/app/ActivityManager;
    const/4 v2, 0x0

    if-nez v1, :cond_10

    .line 132
    return-object v2

    .line 134
    :cond_10
    invoke-virtual {v1}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v3

    .line 135
    .local v3, "processInfoList":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    if-eqz v3, :cond_36

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_1d

    goto :goto_36

    .line 138
    :cond_1d
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_21
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_35

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 139
    .local v5, "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    iget v6, v5, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v0, v6, :cond_34

    .line 140
    iget-object v2, v5, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    return-object v2

    .line 142
    .end local v5    # "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_34
    goto :goto_21

    .line 143
    :cond_35
    return-object v2

    .line 136
    :cond_36
    :goto_36
    return-object v2
.end method

.method private static invokeMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p3, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 309
    .local p2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {p0, p1, p2}, Landroid/app/ext/AppExt;->getDeclaredMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 310
    .local v0, "method":Ljava/lang/reflect/Method;
    if-eqz v0, :cond_13

    .line 311
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 313
    :try_start_a
    invoke-virtual {v0, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_e} :catch_f

    return-object v1

    .line 314
    :catch_f
    move-exception v1

    .line 315
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 318
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_13
    const/4 v1, 0x0

    return-object v1
.end method

.method private static loadExt(Landroid/content/Context;)V
    .registers 10
    .param p0, "context"    # Landroid/content/Context;

    .line 59
    invoke-static {p0}, Landroid/app/ext/AppExt;->prepareExtApk(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, "apkPath":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 61
    sget-object v1, Landroid/app/ext/AppExt;->TAG:Ljava/lang/String;

    const-string v2, "Not found app ext"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    return-void

    .line 65
    :cond_12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 66
    .local v1, "parent":Ljava/lang/ClassLoader;
    new-instance v2, Ldalvik/system/DexClassLoader;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3, v3, v1}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 67
    .local v2, "classLoader":Ldalvik/system/DexClassLoader;
    invoke-static {p0, v0}, Landroid/app/ext/AppExt;->getPackageArchiveInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 68
    .local v3, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v4, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->className:Ljava/lang/String;

    .line 69
    .local v4, "appClass":Ljava/lang/String;
    sget-object v5, Landroid/app/ext/AppExt;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Load app ext app class:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    if-nez v4, :cond_41

    .line 71
    return-void

    .line 73
    :cond_41
    invoke-static {v2, v4}, Landroid/app/ext/AppExt;->newInstance(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/Application;

    .line 74
    .local v5, "app":Landroid/app/Application;
    if-eqz v5, :cond_50

    .line 75
    invoke-static {v5, p0}, Landroid/app/ext/AppExt;->attachBaseContext(Landroid/content/ContextWrapper;Landroid/content/Context;)V

    .line 76
    invoke-virtual {v5}, Landroid/app/Application;->onCreate()V

    goto :goto_66

    .line 78
    :cond_50
    sget-object v6, Landroid/app/ext/AppExt;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Load application is null:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :goto_66
    return-void
.end method

.method private static md5File(Ljava/io/File;)Ljava/lang/String;
    .registers 8
    .param p0, "file"    # Ljava/io/File;

    .line 160
    const/4 v0, 0x0

    if-eqz p0, :cond_49

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_49

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_10

    goto :goto_49

    .line 163
    :cond_10
    move-object v1, v0

    .line 165
    .local v1, "fis":Ljava/io/InputStream;
    :try_start_11
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v1, v2

    .line 166
    const-string v2, "MD5"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 167
    .local v2, "digest":Ljava/security/MessageDigest;
    const/16 v3, 0x400

    new-array v3, v3, [B

    .line 168
    .local v3, "buf":[B
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 169
    .local v5, "n":I
    :goto_23
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6

    move v5, v6

    if-lez v6, :cond_2e

    .line 170
    invoke-virtual {v2, v3, v4, v5}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_23

    .line 172
    :cond_2e
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    invoke-static {v4}, Landroid/app/ext/AppExt;->asHexString([B)Ljava/lang/String;

    move-result-object v4
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_36} :catch_3c
    .catchall {:try_start_11 .. :try_end_36} :catchall_3a

    .line 176
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 172
    return-object v4

    .line 176
    .end local v2    # "digest":Ljava/security/MessageDigest;
    .end local v3    # "buf":[B
    .end local v5    # "n":I
    :catchall_3a
    move-exception v0

    goto :goto_45

    .line 173
    :catch_3c
    move-exception v2

    .line 174
    .local v2, "e":Ljava/lang/Exception;
    :try_start_3d
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_40
    .catchall {:try_start_3d .. :try_end_40} :catchall_3a

    .line 176
    .end local v2    # "e":Ljava/lang/Exception;
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 177
    nop

    .line 178
    return-object v0

    .line 176
    :goto_45
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    throw v0

    .line 161
    .end local v1    # "fis":Ljava/io/InputStream;
    :cond_49
    :goto_49
    return-object v0
.end method

.method private static newInstance(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;
    .param p1, "className"    # Ljava/lang/String;

    .line 278
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 279
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 280
    .local v2, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    return-object v1

    .line 281
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :catch_12
    move-exception v0

    .line 282
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 284
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return-object v0
.end method

.method public static onCreate(Landroid/app/Application;)V
    .registers 2
    .param p0, "application"    # Landroid/app/Application;

    .line 49
    :try_start_0
    invoke-static {p0}, Landroid/app/ext/AppExt;->loadExt(Landroid/content/Context;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_4

    .line 52
    goto :goto_8

    .line 50
    :catch_4
    move-exception v0

    .line 51
    .local v0, "throwable":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 53
    .end local v0    # "throwable":Ljava/lang/Throwable;
    :goto_8
    return-void
.end method

.method private static prepareExtApk(Landroid/content/Context;)Ljava/lang/String;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;

    .line 88
    invoke-static {p0}, Landroid/app/ext/AppExt;->getProcessName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "processName":Ljava/lang/String;
    invoke-static {p0}, Landroid/app/ext/AppExt;->getApkMd516(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 91
    .local v1, "apkMd5":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ":"

    const-string v4, "-"

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".apk"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 92
    .local v2, "apkName":Ljava/lang/String;
    sget-object v3, Landroid/app/ext/AppExt;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Prepare ext apk name:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    new-instance v3, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 94
    .local v3, "sdcardApk":Ljava/io/File;
    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 96
    .local v4, "cacheApk":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_64

    .line 97
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_5f

    .line 98
    const/4 v5, 0x0

    return-object v5

    .line 100
    :cond_5f
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 104
    :cond_64
    invoke-static {v3}, Landroid/app/ext/AppExt;->md5File(Ljava/io/File;)Ljava/lang/String;

    move-result-object v5

    .line 105
    .local v5, "sdcardMd5":Ljava/lang/String;
    invoke-static {v4}, Landroid/app/ext/AppExt;->md5File(Ljava/io/File;)Ljava/lang/String;

    move-result-object v6

    .line 106
    .local v6, "cacheMd5":Ljava/lang/String;
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_77

    .line 108
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 112
    :cond_77
    invoke-static {v3, v4}, Landroid/app/ext/AppExt;->copyFileNio(Ljava/io/File;Ljava/io/File;)Z

    .line 113
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method
