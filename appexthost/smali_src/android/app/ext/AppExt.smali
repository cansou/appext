.class public Landroid/app/ext/AppExt;
.super Ljava/lang/Object;
.source "AppExt.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 45
    const-class v0, Landroid/app/ext/AppExt;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/app/ext/AppExt;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static asHexString([B)Ljava/lang/String;
    .registers 9
    .param p0, "data"    # [B

    .line 256
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 257
    .local v0, "sb":Ljava/lang/StringBuilder;
    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_8
    if-ge v3, v1, :cond_21

    aget-byte v4, p0, v3

    .line 258
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

    .line 257
    .end local v4    # "b":B
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 260
    :cond_21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static attachBaseContext(Landroid/content/ContextWrapper;Landroid/content/Context;)V
    .registers 7
    .param p0, "wrapper"    # Landroid/content/ContextWrapper;
    .param p1, "context"    # Landroid/content/Context;

    .line 352
    const-string v0, "attachBaseContext"

    .line 353
    .local v0, "methodName":Ljava/lang/String;
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 354
    .local v2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-array v3, v1, [Ljava/lang/Object;

    aput-object p1, v3, v4

    .line 355
    .local v3, "parameters":[Ljava/lang/Object;
    invoke-static {p0, v0, v2}, Landroid/app/ext/AppExt;->getDeclaredMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 356
    .local v4, "method":Ljava/lang/reflect/Method;
    if-eqz v4, :cond_1f

    .line 357
    invoke-virtual {v4, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 359
    :try_start_17
    invoke-virtual {v4, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1a} :catch_1b

    .line 362
    goto :goto_1f

    .line 360
    :catch_1b
    move-exception v1

    .line 361
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 364
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1f
    :goto_1f
    return-void
.end method

.method private static closeQuietly(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "closeable"    # Ljava/io/Closeable;

    .line 269
    if-eqz p0, :cond_a

    .line 271
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 274
    goto :goto_a

    .line 272
    :catch_6
    move-exception v0

    .line 273
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 276
    .end local v0    # "e":Ljava/io/IOException;
    :cond_a
    :goto_a
    return-void
.end method

.method private static copyFileNio(Ljava/io/File;Ljava/io/File;)Z
    .registers 13
    .param p0, "src"    # Ljava/io/File;
    .param p1, "dest"    # Ljava/io/File;

    .line 302
    const/4 v0, 0x0

    .line 303
    .local v0, "fis":Ljava/io/FileInputStream;
    const/4 v1, 0x0

    .line 304
    .local v1, "fos":Ljava/io/FileOutputStream;
    const/4 v2, 0x0

    .line 305
    .local v2, "in":Ljava/nio/channels/FileChannel;
    const/4 v3, 0x0

    .line 307
    .local v3, "out":Ljava/nio/channels/FileChannel;
    :try_start_4
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v0, v4

    .line 308
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v1, v4

    .line 309
    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    move-object v2, v4

    .line 310
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    move-object v3, v4

    .line 311
    const-wide/16 v6, 0x0

    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v8

    move-object v5, v2

    move-object v10, v3

    invoke-virtual/range {v5 .. v10}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_25} :catch_35
    .catchall {:try_start_4 .. :try_end_25} :catchall_33

    .line 312
    const/4 v4, 0x1

    .line 319
    invoke-static {v0}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 320
    invoke-static {v2}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 321
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 322
    invoke-static {v3}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 312
    return v4

    .line 319
    :catchall_33
    move-exception v4

    goto :goto_51

    .line 313
    :catch_35
    move-exception v4

    .line 314
    .local v4, "e":Ljava/lang/Exception;
    :try_start_36
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 315
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_42

    .line 316
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_42
    .catchall {:try_start_36 .. :try_end_42} :catchall_33

    .line 319
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_42
    invoke-static {v0}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 320
    invoke-static {v2}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 321
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 322
    invoke-static {v3}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 323
    nop

    .line 324
    const/4 v4, 0x0

    return v4

    .line 319
    :goto_51
    invoke-static {v0}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 320
    invoke-static {v2}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 321
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 322
    invoke-static {v3}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 323
    throw v4
.end method

.method private static getApkMd516(Landroid/content/Context;)Ljava/lang/String;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .line 202
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 203
    .local v0, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 204
    .local v1, "path":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/app/ext/AppExt;->md5File(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    .line 205
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

    .line 376
    .local p2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 376
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_4
    const-class v1, Ljava/lang/Object;

    if-eq v0, v1, :cond_13

    .line 378
    :try_start_8
    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_c} :catch_d

    return-object v1

    .line 379
    :catch_d
    move-exception v1

    .line 376
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_4

    .line 383
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_13
    const/4 v0, 0x0

    return-object v0
.end method

.method private static getMd516bit(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "md532bit"    # Ljava/lang/String;

    .line 243
    if-eqz p0, :cond_12

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_9

    goto :goto_12

    .line 246
    :cond_9
    const/16 v0, 0x8

    const/16 v1, 0x18

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 244
    :cond_12
    :goto_12
    return-object p0
.end method

.method private static getPackageArchiveInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PackageInfo;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "apkPath"    # Ljava/lang/String;

    .line 285
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 286
    .local v0, "pm":Landroid/content/pm/PackageManager;
    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 287
    .local v1, "info":Landroid/content/pm/PackageInfo;
    if-eqz v1, :cond_11

    .line 288
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 289
    .local v2, "appInfo":Landroid/content/pm/ApplicationInfo;
    iput-object p1, v2, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 290
    iput-object p1, v2, Landroid/content/pm/ApplicationInfo;->publicSourceDir:Ljava/lang/String;

    .line 292
    .end local v2    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_11
    return-object v1
.end method

.method private static getProcessName(Landroid/content/Context;)Ljava/lang/String;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;

    .line 178
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    .line 179
    .local v0, "pid":I
    const-string v1, "activity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    .line 180
    .local v1, "am":Landroid/app/ActivityManager;
    const/4 v2, 0x0

    if-nez v1, :cond_10

    .line 181
    return-object v2

    .line 183
    :cond_10
    invoke-virtual {v1}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v3

    .line 184
    .local v3, "processInfoList":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    if-eqz v3, :cond_36

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_1d

    goto :goto_36

    .line 187
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

    .line 188
    .local v5, "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    iget v6, v5, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v0, v6, :cond_34

    .line 189
    iget-object v2, v5, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    return-object v2

    .line 191
    .end local v5    # "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_34
    goto :goto_21

    .line 192
    :cond_35
    return-object v2

    .line 185
    :cond_36
    :goto_36
    return-object v2
.end method

.method private static loadExt(Landroid/content/Context;)V
    .registers 12
    .param p0, "context"    # Landroid/content/Context;

    .line 65
    invoke-static {p0}, Landroid/app/ext/AppExt;->prepareExtApk(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 66
    .local v0, "apkPath":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 67
    sget-object v1, Landroid/app/ext/AppExt;->TAG:Ljava/lang/String;

    const-string v2, "Not found app ext"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    return-void

    .line 71
    :cond_12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 73
    .local v1, "parent":Ljava/lang/ClassLoader;
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "ext_dex"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 74
    .local v2, "dexDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 75
    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    const-string v5, "ext_lib"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 76
    .local v3, "libDir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 77
    new-instance v4, Ldalvik/system/DexClassLoader;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    .line 78
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v0, v5, v6, v1}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 79
    .local v4, "classLoader":Ldalvik/system/DexClassLoader;
    invoke-static {p0, v0}, Landroid/app/ext/AppExt;->getPackageArchiveInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 80
    .local v5, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v6, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v6, v6, Landroid/content/pm/ApplicationInfo;->className:Ljava/lang/String;

    .line 81
    .local v6, "appClass":Ljava/lang/String;
    sget-object v7, Landroid/app/ext/AppExt;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Load app ext app class:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_68

    .line 83
    return-void

    .line 85
    :cond_68
    invoke-static {v4, v6}, Landroid/app/ext/AppExt;->newInstance(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/app/Application;

    .line 86
    .local v7, "app":Landroid/app/Application;
    if-eqz v7, :cond_77

    .line 87
    invoke-static {v7, p0}, Landroid/app/ext/AppExt;->attachBaseContext(Landroid/content/ContextWrapper;Landroid/content/Context;)V

    .line 88
    invoke-virtual {v7}, Landroid/app/Application;->onCreate()V

    goto :goto_8d

    .line 90
    :cond_77
    sget-object v8, Landroid/app/ext/AppExt;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Load application is null:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    :goto_8d
    return-void
.end method

.method private static md5File(Ljava/io/File;)Ljava/lang/String;
    .registers 8
    .param p0, "file"    # Ljava/io/File;

    .line 215
    const/4 v0, 0x0

    if-eqz p0, :cond_49

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_49

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_10

    goto :goto_49

    .line 218
    :cond_10
    move-object v1, v0

    .line 220
    .local v1, "fis":Ljava/io/InputStream;
    :try_start_11
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v1, v2

    .line 221
    const-string v2, "MD5"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 222
    .local v2, "digest":Ljava/security/MessageDigest;
    const/16 v3, 0x400

    new-array v3, v3, [B

    .line 223
    .local v3, "buf":[B
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 224
    .local v5, "n":I
    :goto_23
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6

    move v5, v6

    if-lez v6, :cond_2e

    .line 225
    invoke-virtual {v2, v3, v4, v5}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_23

    .line 227
    :cond_2e
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    invoke-static {v4}, Landroid/app/ext/AppExt;->asHexString([B)Ljava/lang/String;

    move-result-object v4
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_36} :catch_3c
    .catchall {:try_start_11 .. :try_end_36} :catchall_3a

    .line 231
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 227
    return-object v4

    .line 231
    .end local v2    # "digest":Ljava/security/MessageDigest;
    .end local v3    # "buf":[B
    .end local v5    # "n":I
    :catchall_3a
    move-exception v0

    goto :goto_45

    .line 228
    :catch_3c
    move-exception v2

    .line 229
    .local v2, "e":Ljava/lang/Exception;
    :try_start_3d
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_40
    .catchall {:try_start_3d .. :try_end_40} :catchall_3a

    .line 231
    .end local v2    # "e":Ljava/lang/Exception;
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 232
    nop

    .line 233
    return-object v0

    .line 231
    :goto_45
    invoke-static {v1}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 232
    throw v0

    .line 216
    .end local v1    # "fis":Ljava/io/InputStream;
    :cond_49
    :goto_49
    return-object v0
.end method

.method private static newInstance(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;
    .param p1, "className"    # Ljava/lang/String;

    .line 336
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 337
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 338
    .local v2, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    return-object v1

    .line 339
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :catch_12
    move-exception v0

    .line 340
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 342
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return-object v0
.end method

.method public static onCreate(Landroid/app/Application;)V
    .registers 2
    .param p0, "application"    # Landroid/app/Application;

    .line 55
    :try_start_0
    invoke-static {p0}, Landroid/app/ext/AppExt;->loadExt(Landroid/content/Context;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_4

    .line 58
    goto :goto_8

    .line 56
    :catch_4
    move-exception v0

    .line 57
    .local v0, "throwable":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 59
    .end local v0    # "throwable":Ljava/lang/Throwable;
    :goto_8
    return-void
.end method

.method private static prepareExtApk(Landroid/content/Context;)Ljava/lang/String;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;

    .line 100
    invoke-static {p0}, Landroid/app/ext/AppExt;->getProcessName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 101
    .local v0, "processName":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_c

    .line 102
    return-object v2

    .line 104
    :cond_c
    const-string v1, ":"

    const-string v3, "-"

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 105
    .local v1, "apkNamePrefix":Ljava/lang/String;
    invoke-static {p0}, Landroid/app/ext/AppExt;->getApkMd516(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 107
    .local v3, "apkMd5":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".apk"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 108
    .local v4, "apkName":Ljava/lang/String;
    sget-object v5, Landroid/app/ext/AppExt;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Prepare ext apk name:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    new-instance v5, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    invoke-direct {v5, v6, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 110
    .local v5, "sdcardApk":Ljava/io/File;
    new-instance v6, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 112
    .local v6, "cacheApk":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_6f

    .line 114
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_6a

    .line 116
    invoke-static {p0, v1}, Landroid/app/ext/AppExt;->prepareExtApkFromAsset(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 118
    :cond_6a
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 122
    :cond_6f
    invoke-static {v5}, Landroid/app/ext/AppExt;->md5File(Ljava/io/File;)Ljava/lang/String;

    move-result-object v7

    .line 123
    .local v7, "sdcardMd5":Ljava/lang/String;
    invoke-static {v6}, Landroid/app/ext/AppExt;->md5File(Ljava/io/File;)Ljava/lang/String;

    move-result-object v8

    .line 124
    .local v8, "cacheMd5":Ljava/lang/String;
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_82

    .line 126
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 130
    :cond_82
    invoke-static {v5, v6}, Landroid/app/ext/AppExt;->copyFileNio(Ljava/io/File;Ljava/io/File;)Z

    move-result v9

    .line 131
    .local v9, "success":Z
    if-eqz v9, :cond_8d

    .line 132
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 134
    :cond_8d
    return-object v2
.end method

.method private static prepareExtApkFromAsset(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "apkNamePrefix"    # Ljava/lang/String;

    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".apk"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 145
    .local v0, "name":Ljava/lang/String;
    sget-object v1, Landroid/app/ext/AppExt;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Prepare ext apk name:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", from assets"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 147
    .local v1, "cacheApk":Ljava/io/File;
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    .line 148
    .local v2, "assetManager":Landroid/content/res/AssetManager;
    const/4 v3, 0x0

    .line 149
    .local v3, "in":Ljava/io/InputStream;
    const/4 v4, 0x0

    move-object v5, v4

    .line 151
    .local v5, "out":Ljava/io/OutputStream;
    :try_start_3c
    invoke-virtual {v2, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    move-object v3, v6

    .line 152
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v5, v6

    .line 153
    const/16 v6, 0x2800

    new-array v6, v6, [B

    .line 154
    .local v6, "buffer":[B
    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 155
    .local v8, "len":I
    :goto_4d
    invoke-virtual {v3, v6}, Ljava/io/InputStream;->read([B)I

    move-result v9

    move v8, v9

    const/4 v10, -0x1

    if-eq v9, v10, :cond_59

    .line 156
    invoke-virtual {v5, v6, v7, v8}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_4d

    .line 158
    :cond_59
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_5d} :catch_66
    .catchall {:try_start_3c .. :try_end_5d} :catchall_64

    .line 165
    invoke-static {v3}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 166
    invoke-static {v5}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 158
    return-object v7

    .line 165
    .end local v6    # "buffer":[B
    .end local v8    # "len":I
    :catchall_64
    move-exception v4

    goto :goto_7b

    .line 159
    :catch_66
    move-exception v6

    .line 160
    .local v6, "e":Ljava/lang/Exception;
    :try_start_67
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 161
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_73

    .line 162
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_73
    .catchall {:try_start_67 .. :try_end_73} :catchall_64

    .line 165
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_73
    invoke-static {v3}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 166
    invoke-static {v5}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 167
    nop

    .line 168
    return-object v4

    .line 165
    :goto_7b
    invoke-static {v3}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 166
    invoke-static {v5}, Landroid/app/ext/AppExt;->closeQuietly(Ljava/io/Closeable;)V

    .line 167
    throw v4
.end method
