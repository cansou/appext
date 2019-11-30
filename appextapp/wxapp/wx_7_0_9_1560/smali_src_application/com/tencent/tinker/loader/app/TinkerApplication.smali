.class public abstract Lcom/tencent/tinker/loader/app/TinkerApplication;
.super Landroid/app/Application;
.source "SourceFile"


# static fields
.field private static final INTENT_PATCH_EXCEPTION:Ljava/lang/String; = "intent_patch_exception"

.field private static final TINKER_LOADER_METHOD:Ljava/lang/String; = "tryLoad"


# instance fields
.field private final delegateClassName:Ljava/lang/String;

.field private final loaderClassName:Ljava/lang/String;

.field private mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

.field private final tinkerFlags:I

.field private final tinkerLoadVerifyFlag:Z

.field private tinkerResultIntent:Landroid/content/Intent;

.field private useSafeMode:Z


# direct methods
.method protected constructor <init>(I)V
    .registers 5

    .prologue
    .line 71
    const-string/jumbo v0, "com.tencent.tinker.entry.DefaultApplicationLike"

    const-class v1, Lcom/tencent/tinker/loader/TinkerLoader;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/tencent/tinker/loader/app/TinkerApplication;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 72
    return-void
.end method

.method protected constructor <init>(ILjava/lang/String;)V
    .registers 5

    .prologue
    .line 83
    const-class v0, Lcom/tencent/tinker/loader/TinkerLoader;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/tencent/tinker/loader/app/TinkerApplication;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 84
    return-void
.end method

.method protected constructor <init>(ILjava/lang/String;Ljava/lang/String;Z)V
    .registers 6

    .prologue
    .line 75
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    .line 76
    iput p1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->tinkerFlags:I

    .line 77
    iput-object p2, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->delegateClassName:Ljava/lang/String;

    .line 78
    iput-object p3, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->loaderClassName:Ljava/lang/String;

    .line 79
    iput-boolean p4, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->tinkerLoadVerifyFlag:Z

    .line 80
    return-void
.end method

.method private createInlineFence(ILjava/lang/String;ZJJLandroid/content/Intent;)Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;
    .registers 13

    .prologue
    .line 108
    :try_start_0
    const-string/jumbo v0, "com.tencent.tinker.entry.TinkerApplicationInlineFence"

    const/4 v1, 0x1

    .line 110
    invoke-super {p0}, Landroid/app/Application;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 108
    invoke-static {v0, v1, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 111
    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-class v3, Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x4

    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-class v3, Landroid/content/Intent;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 113
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 114
    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    const/4 v2, 0x2

    .line 115
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    .line 116
    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    aput-object p8, v1, v2

    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;
    :try_end_60
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_60} :catch_61

    return-object v0

    .line 117
    :catch_61
    move-exception v0

    .line 118
    new-instance v1, Lcom/tencent/tinker/loader/TinkerRuntimeException;

    const-string/jumbo v2, "fail to create inline fence instance."

    invoke-direct {v1, v2, v0}, Lcom/tencent/tinker/loader/TinkerRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private loadTinker()V
    .registers 6

    .prologue
    .line 89
    :try_start_0
    iget-object v0, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->loaderClassName:Ljava/lang/String;

    const/4 v1, 0x0

    const-class v2, Lcom/tencent/tinker/loader/app/TinkerApplication;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-static {v0, v1, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 90
    const-string/jumbo v1, "tryLoad"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Lcom/tencent/tinker/loader/app/TinkerApplication;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 91
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 92
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->tinkerResultIntent:Landroid/content/Intent;
    :try_end_38
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_38} :catch_39

    .line 99
    :goto_38
    return-void

    .line 93
    :catch_39
    move-exception v0

    .line 95
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    iput-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->tinkerResultIntent:Landroid/content/Intent;

    .line 96
    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->tinkerResultIntent:Landroid/content/Intent;

    const/16 v2, -0x14

    invoke-static {v1, v2}, Lcom/tencent/tinker/loader/shareutil/ShareIntentUtil;->c(Landroid/content/Intent;I)V

    .line 97
    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->tinkerResultIntent:Landroid/content/Intent;

    const-string/jumbo v2, "intent_patch_exception"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_38
.end method

.method private onBaseContextAttached(Landroid/content/Context;)V
    .registers 11

    .prologue
    .line 124
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 125
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 126
    invoke-direct {p0}, Lcom/tencent/tinker/loader/app/TinkerApplication;->loadTinker()V

    .line 127
    iget v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->tinkerFlags:I

    iget-object v2, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->delegateClassName:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->tinkerLoadVerifyFlag:Z

    iget-object v8, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->tinkerResultIntent:Landroid/content/Intent;

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/tencent/tinker/loader/app/TinkerApplication;->createInlineFence(ILjava/lang/String;ZJJLandroid/content/Intent;)Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    .line 130
    iget-object v0, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    invoke-interface {v0, p0, p1}, Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;->attachBaseContext(Lcom/tencent/tinker/loader/app/TinkerApplication;Landroid/content/Context;)V

    .line 132
    iget-boolean v0, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->useSafeMode:Z

    if-eqz v0, :cond_27

    .line 133
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/tencent/tinker/loader/shareutil/ShareTinkerInternals;->aL(Landroid/content/Context;I)V
    :try_end_27
    .catch Lcom/tencent/tinker/loader/TinkerRuntimeException; {:try_start_0 .. :try_end_27} :catch_28
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_27} :catch_2a

    .line 139
    :cond_27
    return-void

    .line 136
    :catch_28
    move-exception v0

    throw v0

    .line 137
    :catch_2a
    move-exception v0

    .line 138
    new-instance v1, Lcom/tencent/tinker/loader/TinkerRuntimeException;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/tencent/tinker/loader/TinkerRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 144
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 145
    new-instance v0, Lcom/tencent/tinker/loader/TinkerUncaughtHandler;

    invoke-direct {v0, p0}, Lcom/tencent/tinker/loader/TinkerUncaughtHandler;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 146
    invoke-direct {p0, p1}, Lcom/tencent/tinker/loader/app/TinkerApplication;->onBaseContextAttached(Landroid/content/Context;)V

    .line 147
    return-void
.end method

.method public getAssets()Landroid/content/res/AssetManager;
    .registers 3

    .prologue
    .line 204
    invoke-super {p0}, Landroid/app/Application;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 205
    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    invoke-interface {v1, v0}, Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;->getAssets(Landroid/content/res/AssetManager;)Landroid/content/res/AssetManager;

    move-result-object v0

    :cond_e
    return-object v0
.end method

.method public getBaseContext()Landroid/content/Context;
    .registers 3

    .prologue
    .line 216
    invoke-super {p0}, Landroid/app/Application;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 217
    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    invoke-interface {v1, v0}, Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;->getBaseContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    :cond_e
    return-object v0
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 3

    .prologue
    .line 198
    invoke-super {p0}, Landroid/app/Application;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 199
    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    invoke-interface {v1, v0}, Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;->getClassLoader(Ljava/lang/ClassLoader;)Ljava/lang/ClassLoader;

    move-result-object v0

    :cond_e
    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 3

    .prologue
    .line 192
    invoke-super {p0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 193
    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    invoke-interface {v1, v0}, Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;->getResources(Landroid/content/res/Resources;)Landroid/content/res/Resources;

    move-result-object v0

    :cond_e
    return-object v0
.end method

.method public getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4

    .prologue
    .line 210
    invoke-super {p0, p1}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 211
    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    invoke-interface {v1, p1, v0}, Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;->getSystemService(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :cond_e
    return-object v0
.end method

.method public getTinkerFlags()I
    .registers 2

    .prologue
    .line 229
    iget v0, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->tinkerFlags:I

    return v0
.end method

.method public isTinkerLoadVerifyFlag()Z
    .registers 2

    .prologue
    .line 225
    iget-boolean v0, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->tinkerLoadVerifyFlag:Z

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    .prologue
    .line 184
    invoke-super {p0, p1}, Landroid/app/Application;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 185
    iget-object v0, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    if-eqz v0, :cond_c

    .line 186
    iget-object v0, p0, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    invoke-interface {v0, p1}, Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 188
    :cond_c
    return-void
.end method

# virtual methods
.method public onCreate()V
    .registers 28

    .line 26
    move-object/from16 v1, p0

    invoke-super/range {p0 .. p0}, Landroid/app/Application;->onCreate()V

    .line 27
    iget-object v2, v1, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    if-eqz v2, :cond_e

    .line 28
    iget-object v2, v1, Lcom/tencent/tinker/loader/app/TinkerApplication;->mBridge:Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;

    invoke-interface {v2, v1}, Lcom/tencent/tinker/loader/app/ITinkerInlineFenceBridge;->onCreate(Lcom/tencent/tinker/loader/app/TinkerApplication;)V

    .line 32
    :cond_e
    const/4 v2, 0x0

    .line 33
    .local v2, "curProcessName":Ljava/lang/String;
    :try_start_f
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    .line 34
    .local v3, "pid":I
    const-string v4, "activity"

    invoke-virtual {v1, v4}, Lcom/tencent/tinker/loader/app/TinkerApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager;

    .line 35
    .local v4, "am":Landroid/app/ActivityManager;
    invoke-virtual {v4}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v5

    .line 36
    .local v5, "processInfoList":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_23
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_38

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 37
    .local v7, "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    iget v8, v7, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v3, v8, :cond_37

    .line 38
    iget-object v6, v7, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    move-object v2, v6

    .line 39
    goto :goto_38

    .line 41
    .end local v7    # "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_37
    goto :goto_23

    .line 42
    :cond_38
    :goto_38
    invoke-virtual/range {p0 .. p0}, Lcom/tencent/tinker/loader/app/TinkerApplication;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_43

    .line 43
    return-void

    .line 47
    :cond_43
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ":"

    const-string v8, "-"

    invoke-virtual {v2, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ".apk"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 48
    .local v6, "apkName":Ljava/lang/String;
    const-string v7, "AppExt"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Prepare ext apk name:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    new-instance v7, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    invoke-direct {v7, v8, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 50
    .local v7, "sdcardApk":Ljava/io/File;
    new-instance v8, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lcom/tencent/tinker/loader/app/TinkerApplication;->getFilesDir()Ljava/io/File;

    move-result-object v9

    invoke-direct {v8, v9, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 52
    .local v8, "cacheApk":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_8b

    .line 53
    return-void

    .line 56
    :cond_8b
    const/4 v9, 0x0

    .line 57
    .local v9, "fis":Ljava/io/FileInputStream;
    const/4 v10, 0x0

    .line 58
    .local v10, "fos":Ljava/io/FileOutputStream;
    const/4 v11, 0x0

    .line 59
    .local v11, "in":Ljava/nio/channels/FileChannel;
    const/4 v12, 0x0

    .line 61
    .local v12, "out":Ljava/nio/channels/FileChannel;
    new-instance v13, Ljava/io/FileInputStream;

    invoke-direct {v13, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v9, v13

    .line 62
    new-instance v13, Ljava/io/FileOutputStream;

    invoke-direct {v13, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v10, v13

    .line 63
    invoke-virtual {v9}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v13

    move-object v11, v13

    .line 64
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v13

    move-object v12, v13

    .line 65
    const-wide/16 v15, 0x0

    invoke-virtual {v11}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v17

    move-object v14, v11

    move-object/from16 v19, v12

    invoke-virtual/range {v14 .. v19}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    .line 66
    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V

    .line 67
    invoke-virtual {v11}, Ljava/nio/channels/FileChannel;->close()V

    .line 68
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->close()V

    .line 69
    invoke-virtual {v12}, Ljava/nio/channels/FileChannel;->close()V

    .line 71
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    .line 74
    .local v13, "apkPath":Ljava/lang/String;
    new-instance v14, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lcom/tencent/tinker/loader/app/TinkerApplication;->getFilesDir()Ljava/io/File;

    move-result-object v15

    move-object/from16 v20, v2

    const-string v2, "ext_dex"

    .line 74
    .end local v2    # "curProcessName":Ljava/lang/String;
    .local v20, "curProcessName":Ljava/lang/String;
    invoke-direct {v14, v15, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v2, v14

    .line 75
    .local v2, "dexDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 76
    new-instance v14, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lcom/tencent/tinker/loader/app/TinkerApplication;->getFilesDir()Ljava/io/File;

    move-result-object v15

    move/from16 v21, v3

    const-string v3, "ext_lib"

    .line 76
    .end local v3    # "pid":I
    .local v21, "pid":I
    invoke-direct {v14, v15, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v3, v14

    .line 77
    .local v3, "libDir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 78
    new-instance v14, Ldalvik/system/DexClassLoader;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    .line 79
    move-object/from16 v22, v2

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 79
    .end local v2    # "dexDir":Ljava/io/File;
    .local v22, "dexDir":Ljava/io/File;
    move-object/from16 v23, v3

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 79
    .end local v3    # "libDir":Ljava/io/File;
    .local v23, "libDir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-direct {v14, v13, v15, v2, v3}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    move-object v2, v14

    .line 81
    .local v2, "classLoader":Ldalvik/system/DexClassLoader;
    invoke-virtual/range {p0 .. p0}, Lcom/tencent/tinker/loader/app/TinkerApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v14, 0x0

    invoke-virtual {v3, v13, v14}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->className:Ljava/lang/String;

    .line 82
    .local v3, "appClass":Ljava/lang/String;
    const-string v15, "AppExt"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v24, v4

    const-string v4, "Load app ext app class:"

    .line 82
    .end local v4    # "am":Landroid/app/ActivityManager;
    .local v24, "am":Landroid/app/ActivityManager;
    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v15, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    invoke-virtual {v2, v3}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/Application;

    .line 84
    .local v4, "app":Landroid/app/Application;
    const/4 v14, 0x1

    new-array v15, v14, [Ljava/lang/Class;

    const-class v16, Landroid/content/Context;

    const/16 v17, 0x0

    aput-object v16, v15, v17

    .line 85
    .local v15, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/16 v16, 0x0

    .line 86
    .local v16, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v17

    .line 86
    .local v17, "clsApplication":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_13b
    move-object/from16 v25, v17

    .line 86
    .end local v17    # "clsApplication":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v25, "clsApplication":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v14, Ljava/lang/Object;
    :try_end_13f
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_13f} :catch_16c

    move-object/from16 v26, v2

    move-object/from16 v2, v25

    if-eq v2, v14, :cond_159

    .line 88
    .end local v25    # "clsApplication":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v2, "clsApplication":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v26, "classLoader":Ldalvik/system/DexClassLoader;
    :try_start_145
    const-string v14, "attachBaseContext"

    invoke-virtual {v2, v14, v15}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v14
    :try_end_14b
    .catch Ljava/lang/Exception; {:try_start_145 .. :try_end_14b} :catch_14e
    .catch Ljava/lang/Throwable; {:try_start_145 .. :try_end_14b} :catch_16c

    move-object/from16 v16, v14

    .line 89
    goto :goto_159

    .line 90
    :catch_14e
    move-exception v0

    .line 86
    :try_start_14f
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v14

    move-object/from16 v17, v14

    .line 86
    .end local v2    # "clsApplication":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v17    # "clsApplication":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v2, v26

    const/4 v14, 0x1

    goto :goto_13b

    .line 94
    .end local v16    # "method":Ljava/lang/reflect/Method;
    .end local v17    # "clsApplication":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v2, "method":Ljava/lang/reflect/Method;
    :cond_159
    :goto_159
    move-object/from16 v2, v16

    const/4 v14, 0x1

    invoke-virtual {v2, v14}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 95
    new-array v14, v14, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v1, v14, v16

    invoke-virtual {v2, v4, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    invoke-virtual {v4}, Landroid/app/Application;->onCreate()V
    :try_end_16b
    .catch Ljava/lang/Throwable; {:try_start_14f .. :try_end_16b} :catch_16c

    .line 99
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "appClass":Ljava/lang/String;
    .end local v4    # "app":Landroid/app/Application;
    .end local v5    # "processInfoList":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    .end local v6    # "apkName":Ljava/lang/String;
    .end local v7    # "sdcardApk":Ljava/io/File;
    .end local v8    # "cacheApk":Ljava/io/File;
    .end local v9    # "fis":Ljava/io/FileInputStream;
    .end local v10    # "fos":Ljava/io/FileOutputStream;
    .end local v11    # "in":Ljava/nio/channels/FileChannel;
    .end local v12    # "out":Ljava/nio/channels/FileChannel;
    .end local v13    # "apkPath":Ljava/lang/String;
    .end local v15    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v20    # "curProcessName":Ljava/lang/String;
    .end local v21    # "pid":I
    .end local v22    # "dexDir":Ljava/io/File;
    .end local v23    # "libDir":Ljava/io/File;
    .end local v24    # "am":Landroid/app/ActivityManager;
    .end local v26    # "classLoader":Ldalvik/system/DexClassLoader;
    goto :goto_171

    .line 97
    :catch_16c
    move-exception v0

    move-object v2, v0

    .line 98
    .local v2, "throwable":Ljava/lang/Throwable;
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 169
    .end local v2    # "throwable":Ljava/lang/Throwable;
    :goto_171
    return-void
.end method
