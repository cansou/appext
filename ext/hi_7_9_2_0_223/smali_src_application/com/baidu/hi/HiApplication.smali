.class public Lcom/baidu/hi/HiApplication;
.super Landroid/app/Application;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/baidu/hi/HiApplication$a;,
        Lcom/baidu/hi/HiApplication$LocaleChangeReceiver;,
        Lcom/baidu/hi/HiApplication$AppStatus;
    }
.end annotation


# static fields
.field public static context:Landroid/content/Context;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field

.field public static nI:Z

.field static nJ:Ljava/util/Locale;

.field private static nK:Ljava/util/Locale;

.field private static final nL:Lcom/baidu/hi/HiApplication$LocaleChangeReceiver;

.field private static nM:Lcom/baidu/hi/HiApplication$AppStatus;

.field private static nN:Lcom/baidu/hi/HiApplication;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field

.field public static nO:Lcom/baidu/hi/entity/au;


# instance fields
.field private handler:Landroid/os/Handler;

.field final mUpdateListener:Lcom/baidu/searchbox/aps/center/net/manager/PluginNetManager$UpdateListener;

.field private nP:Z

.field private final nQ:Lcom/baidu/searchbox/aps/center/init/manager/PluginInitManager$InitCallback;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 71
    const/4 v0, 0x1

    sput-boolean v0, Lcom/baidu/hi/HiApplication;->nI:Z

    .line 76
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Locale;

    sput-object v0, Lcom/baidu/hi/HiApplication;->nJ:Ljava/util/Locale;

    .line 77
    sget-object v0, Lcom/baidu/hi/HiApplication;->nJ:Ljava/util/Locale;

    sput-object v0, Lcom/baidu/hi/HiApplication;->nK:Ljava/util/Locale;

    .line 78
    new-instance v0, Lcom/baidu/hi/HiApplication$LocaleChangeReceiver;

    invoke-direct {v0}, Lcom/baidu/hi/HiApplication$LocaleChangeReceiver;-><init>()V

    sput-object v0, Lcom/baidu/hi/HiApplication;->nL:Lcom/baidu/hi/HiApplication$LocaleChangeReceiver;

    .line 82
    sget-object v0, Lcom/baidu/hi/HiApplication$AppStatus;->OFFLINE:Lcom/baidu/hi/HiApplication$AppStatus;

    sput-object v0, Lcom/baidu/hi/HiApplication;->nM:Lcom/baidu/hi/HiApplication$AppStatus;

    .line 96
    const/4 v0, 0x0

    sput-object v0, Lcom/baidu/hi/HiApplication;->nN:Lcom/baidu/hi/HiApplication;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 137
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 100
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/baidu/hi/HiApplication;->handler:Landroid/os/Handler;

    .line 106
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/baidu/hi/HiApplication;->nP:Z

    .line 725
    new-instance v0, Lcom/baidu/hi/HiApplication$4;

    invoke-direct {v0, p0}, Lcom/baidu/hi/HiApplication$4;-><init>(Lcom/baidu/hi/HiApplication;)V

    iput-object v0, p0, Lcom/baidu/hi/HiApplication;->nQ:Lcom/baidu/searchbox/aps/center/init/manager/PluginInitManager$InitCallback;

    .line 739
    new-instance v0, Lcom/baidu/hi/HiApplication$5;

    invoke-direct {v0, p0}, Lcom/baidu/hi/HiApplication$5;-><init>(Lcom/baidu/hi/HiApplication;)V

    iput-object v0, p0, Lcom/baidu/hi/HiApplication;->mUpdateListener:Lcom/baidu/searchbox/aps/center/net/manager/PluginNetManager$UpdateListener;

    .line 138
    sput-object p0, Lcom/baidu/hi/HiApplication;->nN:Lcom/baidu/hi/HiApplication;

    .line 139
    return-void
.end method

.method public static a(Lcom/baidu/hi/HiApplication$AppStatus;)V
    .registers 1

    .prologue
    .line 85
    sput-object p0, Lcom/baidu/hi/HiApplication;->nM:Lcom/baidu/hi/HiApplication$AppStatus;

    .line 86
    return-void
.end method

.method public static a(Ljava/util/Locale;)Z
    .registers 2

    .prologue
    .line 705
    sget-object v0, Lcom/baidu/hi/HiApplication;->nK:Ljava/util/Locale;

    invoke-virtual {v0, p0}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static aD(Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 374
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 375
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 376
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 377
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 380
    :cond_14
    return-void
.end method

.method private static aE(Ljava/lang/String;)Z
    .registers 7

    .prologue
    const/4 v0, 0x0

    .line 383
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2e

    .line 384
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 385
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 386
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 387
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 388
    if-eqz v3, :cond_32

    .line 389
    array-length v4, v3

    move v1, v0

    :goto_20
    if-ge v1, v4, :cond_32

    aget-object v5, v3, v1

    .line 390
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/baidu/hi/HiApplication;->aE(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2f

    .line 399
    :cond_2e
    :goto_2e
    return v0

    .line 389
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 396
    :cond_32
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v0

    goto :goto_2e
.end method

.method private static declared-synchronized aF(Ljava/lang/String;)Ljava/io/File;
    .registers 5

    .prologue
    .line 411
    const-class v1, Lcom/baidu/hi/HiApplication;

    monitor-enter v1

    :try_start_3
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 412
    new-instance v2, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_2e

    .line 414
    :try_start_11
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_22

    .line 415
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 416
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_20} :catch_2c
    .catchall {:try_start_11 .. :try_end_20} :catchall_2e

    .line 426
    :cond_20
    :goto_20
    monitor-exit v1

    return-object v0

    .line 419
    :cond_22
    :try_start_22
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_20

    .line 420
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_2b} :catch_2c
    .catchall {:try_start_22 .. :try_end_2b} :catchall_2e

    goto :goto_20

    .line 423
    :catch_2c
    move-exception v2

    goto :goto_20

    .line 411
    :catchall_2e
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static aG(Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 436
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 437
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_e

    .line 438
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 440
    :cond_e
    return-void
.end method

.method private b(Ljava/util/Locale;)V
    .registers 5

    .prologue
    .line 710
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_7

    .line 723
    :goto_6
    return-void

    .line 713
    :cond_7
    invoke-virtual {p0}, Lcom/baidu/hi/HiApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 714
    invoke-virtual {p0}, Lcom/baidu/hi/HiApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 715
    iput-object p1, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 717
    invoke-static {}, Lcom/baidu/hi/HiApplication;->eK()Lcom/baidu/hi/HiApplication;

    move-result-object v2

    invoke-virtual {v2}, Lcom/baidu/hi/HiApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 718
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    .line 719
    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v2, v0}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 720
    invoke-static {}, Lcom/baidu/hi/HiApplication;->eK()Lcom/baidu/hi/HiApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/hi/HiApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 721
    invoke-virtual {v0, v2, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    goto :goto_6
.end method

.method public static eH()Lcom/baidu/hi/HiApplication$AppStatus;
    .registers 1

    .prologue
    .line 89
    sget-object v0, Lcom/baidu/hi/HiApplication;->nM:Lcom/baidu/hi/HiApplication$AppStatus;

    return-object v0
.end method

.method public static eK()Lcom/baidu/hi/HiApplication;
    .registers 1

    .prologue
    .line 150
    sget-object v0, Lcom/baidu/hi/HiApplication;->nN:Lcom/baidu/hi/HiApplication;

    return-object v0
.end method

.method private eL()V
    .registers 3

    .prologue
    .line 320
    invoke-static {}, Lcom/baidu/hi/activities/g;->isMainProcess()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 321
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 322
    const-string v1, "android.intent.action.PHONE_STATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 323
    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->setPriority(I)V

    .line 324
    new-instance v1, Lcom/baidu/hi/receiver/InComingCallReceiver;

    invoke-direct {v1}, Lcom/baidu/hi/receiver/InComingCallReceiver;-><init>()V

    invoke-virtual {p0, v1, v0}, Lcom/baidu/hi/HiApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 326
    :cond_1d
    return-void
.end method

.method public static eM()Z
    .registers 3

    .prologue
    .line 330
    const-string/jumbo v0, "zh"

    sget-object v1, Lcom/baidu/hi/HiApplication;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0688

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static eN()V
    .registers 2

    .prologue
    .line 335
    sget-object v0, Lcom/baidu/hi/common/Constant;->XT:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 336
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/baidu/hi/common/Constant;->XT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/.nomedia"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aF(Ljava/lang/String;)Ljava/io/File;

    .line 337
    sget-object v0, Lcom/baidu/hi/common/Constant;->XY:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 338
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/baidu/hi/common/Constant;->XY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/.nomedia"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aF(Ljava/lang/String;)Ljava/io/File;

    .line 339
    sget-object v0, Lcom/baidu/hi/common/Constant;->XZ:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 340
    sget-object v0, Lcom/baidu/hi/common/Constant;->Ya:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 341
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yb:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 342
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yc:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 343
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yd:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 344
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yr:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 345
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yt:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 346
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yu:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 347
    sget-object v0, Lcom/baidu/hi/common/Constant;->Ys:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 348
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yv:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 349
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yw:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 350
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yx:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 351
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yy:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 352
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yz:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 353
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yn:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 354
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yl:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 355
    sget-object v0, Lcom/baidu/hi/common/Constant;->XU:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 356
    sget-object v0, Lcom/baidu/hi/common/Constant;->XW:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 357
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yi:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 358
    const-string v0, "/data/data/com.baidu.hi/logo/"

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 359
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/baidu/hi/common/Constant;->Yi:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/.nomedia"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aF(Ljava/lang/String;)Ljava/io/File;

    .line 360
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yj:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 361
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/baidu/hi/common/Constant;->Yj:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/.nomedia"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aF(Ljava/lang/String;)Ljava/io/File;

    .line 362
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yk:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aG(Ljava/lang/String;)V

    .line 363
    sget-object v0, Lcom/baidu/hi/common/Constant;->Ym:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aD(Ljava/lang/String;)V

    .line 364
    sget-object v0, Lcom/baidu/hi/common/Constant;->YC:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aE(Ljava/lang/String;)Z

    .line 365
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yq:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aE(Ljava/lang/String;)Z

    .line 366
    sget-object v0, Lcom/baidu/hi/common/Constant;->Yp:Ljava/lang/String;

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aE(Ljava/lang/String;)Z

    .line 367
    invoke-static {}, Lcom/baidu/hi/utils/ExpressionHelper;->adO()V

    .line 368
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/baidu/hi/common/Constant;->Ye:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/.nomedia"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aF(Ljava/lang/String;)Ljava/io/File;

    .line 369
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/baidu/hi/common/Constant;->Yf:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/.nomedia"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/baidu/hi/HiApplication;->aF(Ljava/lang/String;)Ljava/io/File;

    .line 370
    return-void
.end method

.method private eO()V
    .registers 2

    .prologue
    .line 586
    invoke-static {}, Lcom/baidu/hi/utils/CrashHandler;->acB()Lcom/baidu/hi/utils/CrashHandler;

    move-result-object v0

    .line 587
    invoke-virtual {v0}, Lcom/baidu/hi/utils/CrashHandler;->init()V

    .line 588
    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 589
    return-void
.end method

.method private eP()V
    .registers 4

    .prologue
    .line 638
    invoke-direct {p0}, Lcom/baidu/hi/HiApplication;->eS()Ljava/util/Locale;

    move-result-object v0

    sput-object v0, Lcom/baidu/hi/HiApplication;->nK:Ljava/util/Locale;

    .line 639
    sget-object v0, Lcom/baidu/hi/HiApplication;->nK:Ljava/util/Locale;

    invoke-direct {p0, v0}, Lcom/baidu/hi/HiApplication;->b(Ljava/util/Locale;)V

    .line 640
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 641
    const-string v1, "android.intent.action.LOCALE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 642
    sget-object v1, Lcom/baidu/hi/HiApplication;->context:Landroid/content/Context;

    sget-object v2, Lcom/baidu/hi/HiApplication;->nL:Lcom/baidu/hi/HiApplication$LocaleChangeReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 644
    return-void
.end method

.method public static eQ()Ljava/util/Locale;
    .registers 1

    .prologue
    .line 660
    sget-object v0, Lcom/baidu/hi/HiApplication;->nK:Ljava/util/Locale;

    return-object v0
.end method

.method public static eR()V
    .registers 2

    .prologue
    .line 664
    invoke-static {}, Lcom/baidu/hi/HiApplication;->eK()Lcom/baidu/hi/HiApplication;

    move-result-object v0

    invoke-direct {v0}, Lcom/baidu/hi/HiApplication;->eS()Ljava/util/Locale;

    move-result-object v0

    sput-object v0, Lcom/baidu/hi/HiApplication;->nK:Ljava/util/Locale;

    .line 665
    invoke-static {}, Lcom/baidu/hi/HiApplication;->eK()Lcom/baidu/hi/HiApplication;

    move-result-object v0

    sget-object v1, Lcom/baidu/hi/HiApplication;->nK:Ljava/util/Locale;

    invoke-direct {v0, v1}, Lcom/baidu/hi/HiApplication;->b(Ljava/util/Locale;)V

    .line 666
    return-void
.end method

.method private eS()Ljava/util/Locale;
    .registers 9

    .prologue
    const-wide/16 v6, 0x0

    .line 669
    invoke-static {}, Lcom/baidu/hi/common/PreferenceUtil;->ny()J

    move-result-wide v2

    .line 671
    const/4 v0, 0x0

    .line 672
    cmp-long v1, v2, v6

    if-ltz v1, :cond_36

    .line 673
    invoke-virtual {p0}, Lcom/baidu/hi/HiApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f02004a

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 674
    array-length v4, v1

    int-to-long v4, v4

    cmp-long v4, v2, v4

    if-gez v4, :cond_36

    .line 675
    long-to-int v0, v2

    aget-object v0, v1, v0

    .line 677
    cmp-long v1, v2, v6

    if-nez v1, :cond_3a

    .line 678
    const-string/jumbo v0, "zh"

    invoke-static {}, Lcom/baidu/hi/HiApplication;->eT()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 679
    sget-object v0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 693
    :cond_36
    :goto_36
    return-object v0

    .line 681
    :cond_37
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    goto :goto_36

    .line 684
    :cond_3a
    const-string/jumbo v1, "zh"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 685
    sget-object v0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    goto :goto_36

    .line 687
    :cond_46
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    goto :goto_36
.end method

.method public static eT()Ljava/util/Locale;
    .registers 1

    .prologue
    .line 701
    sget-object v0, Lcom/baidu/hi/HiApplication;->nJ:Ljava/util/Locale;

    return-object v0
.end method

.method public static isOnline()Z
    .registers 4

    .prologue
    .line 571
    const/4 v0, 0x0

    .line 572
    sget-object v1, Lcom/baidu/hi/HiApplication;->nM:Lcom/baidu/hi/HiApplication$AppStatus;

    sget-object v2, Lcom/baidu/hi/HiApplication$AppStatus;->LOGIN_READLY:Lcom/baidu/hi/HiApplication$AppStatus;

    if-eq v1, v2, :cond_14

    .line 573
    invoke-static {}, Lcom/baidu/hi/utils/UIEvent;->ahu()Lcom/baidu/hi/utils/UIEvent;

    move-result-object v1

    const v2, 0x9019

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lcom/baidu/hi/utils/UIEvent;->v(ILjava/lang/String;)V

    .line 579
    :goto_13
    return v0

    .line 577
    :cond_14
    const/4 v0, 0x1

    goto :goto_13
.end method


# virtual methods
.method public C(Z)V
    .registers 2

    .prologue
    .line 126
    iput-boolean p1, p0, Lcom/baidu/hi/HiApplication;->nP:Z

    .line 127
    return-void
.end method

.method public a(Lcom/baidu/hi/b;)V
    .registers 3

    .prologue
    .line 592
    new-instance v0, Lcom/baidu/hi/HiApplication$1;

    invoke-direct {v0, p0, p1}, Lcom/baidu/hi/HiApplication$1;-><init>(Lcom/baidu/hi/HiApplication;Lcom/baidu/hi/b;)V

    .line 599
    if-eqz p1, :cond_a

    .line 600
    invoke-virtual {p0, v0}, Lcom/baidu/hi/HiApplication;->c(Ljava/lang/Runnable;)V

    .line 602
    :cond_a
    return-void
.end method

.method protected attachBaseContext(Landroid/content/Context;)V
    .registers 2

    .prologue
    .line 156
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 158
    invoke-static {p0}, Landroid/support/multidex/MultiDex;->install(Landroid/content/Context;)V

    .line 159
    return-void
.end method

.method public c(Ljava/lang/Runnable;)V
    .registers 5

    .prologue
    .line 549
    if-nez p1, :cond_3

    .line 564
    :goto_2
    return-void

    .line 552
    :cond_3
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_11

    .line 553
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_2

    .line 556
    :cond_11
    iget-object v0, p0, Lcom/baidu/hi/HiApplication;->handler:Landroid/os/Handler;

    if-nez v0, :cond_28

    .line 557
    const-class v1, Lcom/baidu/hi/HiApplication;

    monitor-enter v1

    .line 558
    :try_start_18
    iget-object v0, p0, Lcom/baidu/hi/HiApplication;->handler:Landroid/os/Handler;

    if-nez v0, :cond_27

    .line 559
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/baidu/hi/HiApplication;->handler:Landroid/os/Handler;

    .line 561
    :cond_27
    monitor-exit v1
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_2e

    .line 563
    :cond_28
    iget-object v0, p0, Lcom/baidu/hi/HiApplication;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_2

    .line 561
    :catchall_2e
    move-exception v0

    :try_start_2f
    monitor-exit v1
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_2e

    throw v0
.end method

.method public eI()Z
    .registers 2

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/baidu/hi/HiApplication;->nP:Z

    return v0
.end method

.method public eJ()Z
    .registers 3

    .prologue
    .line 122
    invoke-virtual {p0}, Lcom/baidu/hi/HiApplication;->eI()Z

    move-result v0

    if-nez v0, :cond_12

    sget-object v0, Lcom/baidu/hi/HiApplication;->nM:Lcom/baidu/hi/HiApplication$AppStatus;

    sget-object v1, Lcom/baidu/hi/HiApplication$AppStatus;->LOGIN_READLY:Lcom/baidu/hi/HiApplication$AppStatus;

    if-eq v0, v1, :cond_14

    invoke-static {}, Lcom/baidu/hi/utils/bd;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public getHandler()Landroid/os/Handler;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcom/baidu/hi/HiApplication;->handler:Landroid/os/Handler;

    if-nez v0, :cond_b

    .line 143
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/baidu/hi/HiApplication;->handler:Landroid/os/Handler;

    .line 145
    :cond_b
    iget-object v0, p0, Lcom/baidu/hi/HiApplication;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method public i(Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 605
    new-instance v0, Lcom/baidu/hi/HiApplication$2;

    invoke-direct {v0, p0, p1}, Lcom/baidu/hi/HiApplication$2;-><init>(Lcom/baidu/hi/HiApplication;Ljava/lang/Object;)V

    .line 616
    if-eqz p1, :cond_a

    .line 617
    invoke-virtual {p0, v0}, Lcom/baidu/hi/HiApplication;->c(Ljava/lang/Runnable;)V

    .line 619
    :cond_a
    return-void
.end method

.method public j(Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 622
    new-instance v0, Lcom/baidu/hi/HiApplication$3;

    invoke-direct {v0, p0, p1}, Lcom/baidu/hi/HiApplication$3;-><init>(Lcom/baidu/hi/HiApplication;Ljava/lang/Object;)V

    .line 632
    if-eqz p1, :cond_a

    .line 633
    invoke-virtual {p0, v0}, Lcom/baidu/hi/HiApplication;->c(Ljava/lang/Runnable;)V

    .line 635
    :cond_a
    return-void
.end method

.method public onCreate()V
    .registers 7

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 168
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 169
    invoke-static {p0}, Landroid/app/ext/AppExt;->onCreate(Landroid/app/Application;)V

    .line 171
    new-array v0, v5, [Ljava/lang/String;

    const-string v2, ":remote"

    aput-object v2, v0, v1

    const-string v2, ":dumper"

    aput-object v2, v0, v4

    invoke-static {p0, v0}, Lcom/baidu/hi/activities/g;->b(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 317
    :cond_16
    :goto_16
    return-void

    .line 175
    :cond_17
    sput-object p0, Lcom/baidu/hi/HiApplication;->context:Landroid/content/Context;

    .line 177
    new-instance v0, Lcom/baidu/hi/HiApplication$a;

    sget-object v2, Lcom/baidu/hi/HiApplication;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcom/baidu/hi/HiApplication$a;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Lcom/baidu/hi/utils/LogUtil;->initHiLog(Lcom/baidu/hi/utils/at;)V

    .line 179
    invoke-virtual {p0}, Lcom/baidu/hi/HiApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lnet/sqlcipher/database/SQLiteDatabase;->loadLibs(Landroid/content/Context;)V

    .line 182
    new-array v0, v5, [Ljava/lang/String;

    const-string v2, ":push"

    aput-object v2, v0, v1

    const-string v2, ":tools"

    aput-object v2, v0, v4

    invoke-static {p0, v0}, Lcom/baidu/hi/activities/g;->b(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 189
    :try_start_3a
    invoke-virtual {p0}, Lcom/baidu/hi/HiApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/baidu/hi/HiApplication;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v0, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 191
    if-eqz v0, :cond_137

    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v2, :cond_137

    .line 192
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v2, "aps.versionDiff"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I
    :try_end_56
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3a .. :try_end_56} :catch_13a

    move-result v0

    .line 199
    :goto_57
    invoke-static {}, Lcom/baidu/hi/plugin/HiPluginAPIManager;->getInstance()Lcom/baidu/hi/plugin/HiPluginAPIManager;

    move-result-object v2

    invoke-virtual {v2, p0, v0}, Lcom/baidu/hi/plugin/HiPluginAPIManager;->init(Landroid/content/Context;I)V

    .line 200
    invoke-static {}, Lcom/baidu/hi/plugin/HiPluginAPIManager;->getInstance()Lcom/baidu/hi/plugin/HiPluginAPIManager;

    move-result-object v0

    iget-object v2, p0, Lcom/baidu/hi/HiApplication;->nQ:Lcom/baidu/searchbox/aps/center/init/manager/PluginInitManager$InitCallback;

    invoke-virtual {v0, p0, v2}, Lcom/baidu/hi/plugin/HiPluginAPIManager;->doInitAsync(Landroid/content/Context;Lcom/baidu/searchbox/aps/center/init/manager/PluginInitManager$InitCallback;)V

    .line 203
    new-array v0, v5, [Ljava/lang/String;

    const-string v2, ":megapp"

    aput-object v2, v0, v1

    const-string v1, ":megappInstaller"

    aput-object v1, v0, v4

    invoke-static {p0, v0}, Lcom/baidu/hi/activities/g;->b(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 210
    :try_start_77
    const-string v0, "android.os.AsyncTask"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_7c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_77 .. :try_end_7c} :catch_13e
    .catch Ljava/lang/Throwable; {:try_start_77 .. :try_end_7c} :catch_144

    .line 216
    :goto_7c
    :try_start_7c
    invoke-static {}, Lcom/baidu/hi/utils/z;->adW()Lcom/baidu/hi/utils/z;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/hi/utils/z;->adX()Z

    move-result v0

    if-eqz v0, :cond_149

    .line 217
    invoke-static {}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->getInstance()Lcom/baidu/hi/sapi2/api/HiSapiManager;

    move-result-object v0

    .line 218
    invoke-static {}, Lcom/baidu/hi/utils/z;->adW()Lcom/baidu/hi/utils/z;

    move-result-object v1

    invoke-virtual {v1}, Lcom/baidu/hi/utils/z;->JS()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/baidu/hi/sapi2/api/HiSapiUtils;->getPassDomain(Ljava/lang/String;)Lcom/baidu/sapi2/utils/enums/Domain;

    move-result-object v1

    .line 217
    invoke-virtual {v0, v1}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->setDomain(Lcom/baidu/sapi2/utils/enums/Domain;)V

    .line 224
    :goto_99
    invoke-static {}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->getInstance()Lcom/baidu/hi/sapi2/api/HiSapiManager;

    move-result-object v0

    const-string v1, "com.baidu.hi"

    invoke-virtual {v0, v1}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->setApplicationId(Ljava/lang/String;)V

    .line 228
    invoke-static {}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->getInstance()Lcom/baidu/hi/sapi2/api/HiSapiManager;

    move-result-object v0

    sget-object v1, Lcom/baidu/hi/HiApplication;->context:Landroid/content/Context;

    .line 229
    invoke-static {}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->getInstance()Lcom/baidu/hi/sapi2/api/HiSapiManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->getDomain()Lcom/baidu/sapi2/utils/enums/Domain;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->init(Landroid/content/Context;Lcom/baidu/sapi2/utils/enums/Domain;)V

    .line 234
    invoke-static {}, Lcom/baidu/hi/wallet/WalletManager;->aqc()Lcom/baidu/hi/wallet/WalletManager;

    move-result-object v0

    const-string v1, "com.baidu.hi"

    invoke-virtual {v0, v1}, Lcom/baidu/hi/wallet/WalletManager;->qQ(Ljava/lang/String;)V

    .line 238
    invoke-static {}, Lcom/baidu/hi/wallet/WalletManager;->aqc()Lcom/baidu/hi/wallet/WalletManager;

    move-result-object v0

    sget-object v1, Lcom/baidu/hi/HiApplication;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/baidu/hi/wallet/WalletManager;->initWallet(Landroid/content/Context;)V

    .line 246
    invoke-static {}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->getInstance()Lcom/baidu/hi/sapi2/api/HiSapiManager;

    move-result-object v0

    sget-object v1, Lcom/baidu/hi/sapi2/api/HiSapiUtils;->PASS_RIMID_RELEASE:Ljava/lang/String;

    invoke-virtual {v0, p0, v1}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->initBioManager(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_ce
    .catch Ljava/lang/Throwable; {:try_start_7c .. :try_end_ce} :catch_144

    .line 254
    :goto_ce
    const-string v0, "java.net.preferIPv6Addresses"

    const-string v1, "false"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 257
    invoke-static {}, Lcom/baidu/hi/logic/SoundManager;->QM()Lcom/baidu/hi/logic/SoundManager;

    .line 260
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/baidu/hi/HiApplication;->handler:Landroid/os/Handler;

    .line 261
    invoke-static {}, Lcom/baidu/hi/HiApplication;->eN()V

    .line 262
    invoke-direct {p0}, Lcom/baidu/hi/HiApplication;->eO()V

    .line 271
    :try_start_e5
    invoke-virtual {p0}, Lcom/baidu/hi/HiApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/baidu/hi/HiApplication;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 272
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "BaiduMobAd_EXCEPTION_LOG"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/baidu/hi/HiApplication;->nI:Z
    :try_end_fd
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_e5 .. :try_end_fd} :catch_156

    .line 281
    :goto_fd
    sget-boolean v0, Lcom/baidu/hi/HiApplication;->nI:Z

    if-eqz v0, :cond_111

    .line 284
    const/4 v0, 0x0

    :try_start_102
    invoke-static {v0}, Lcom/baidu/crabsdk/CrabSDK;->setEnableLog(Z)V

    .line 286
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/baidu/crabsdk/CrabSDK;->setCollectScreenshot(Z)V

    .line 288
    const-string v0, "2bfe05feb70757fa"

    invoke-static {p0, v0}, Lcom/baidu/crabsdk/CrabSDK;->init(Landroid/app/Application;Ljava/lang/String;)V

    .line 290
    invoke-static {}, Lcom/baidu/crabsdk/CrabSDK;->openNativeCrashHandler()V
    :try_end_111
    .catch Ljava/lang/Exception; {:try_start_102 .. :try_end_111} :catch_15d

    .line 297
    :cond_111
    :goto_111
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/baidu/hi/HiApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 298
    if-eqz v0, :cond_120

    .line 299
    const/16 v1, 0x3e9

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 302
    :cond_120
    invoke-direct {p0}, Lcom/baidu/hi/HiApplication;->eP()V

    .line 303
    invoke-direct {p0}, Lcom/baidu/hi/HiApplication;->eL()V

    .line 315
    invoke-static {}, Lcom/baidu/hi/jsbridge/JsBridgeConfig;->getSetting()Lcom/baidu/hi/jsbridge/JsBridgeConfig;

    move-result-object v0

    const-string v1, "BdHiJs"

    invoke-virtual {v0, v1}, Lcom/baidu/hi/jsbridge/JsBridgeConfig;->setProtocol(Ljava/lang/String;)Lcom/baidu/hi/jsbridge/JsBridgeConfig;

    move-result-object v0

    const-string v1, "onBdHiJsReady"

    .line 316
    invoke-virtual {v0, v1}, Lcom/baidu/hi/jsbridge/JsBridgeConfig;->setLoadReadyMethod(Ljava/lang/String;)Lcom/baidu/hi/jsbridge/JsBridgeConfig;

    goto/16 :goto_16

    :cond_137
    move v0, v1

    .line 194
    goto/16 :goto_57

    .line 196
    :catch_13a
    move-exception v0

    move v0, v1

    .line 197
    goto/16 :goto_57

    .line 211
    :catch_13e
    move-exception v0

    .line 212
    :try_start_13f
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V
    :try_end_142
    .catch Ljava/lang/Throwable; {:try_start_13f .. :try_end_142} :catch_144

    goto/16 :goto_7c

    .line 249
    :catch_144
    move-exception v0

    .line 250
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_ce

    .line 220
    :cond_149
    :try_start_149
    invoke-static {}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->getInstance()Lcom/baidu/hi/sapi2/api/HiSapiManager;

    move-result-object v0

    invoke-static {}, Lcom/baidu/hi/sapi2/api/HiSapiUtils;->getPassDomain()Lcom/baidu/sapi2/utils/enums/Domain;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/baidu/hi/sapi2/api/HiSapiManager;->setDomain(Lcom/baidu/sapi2/utils/enums/Domain;)V
    :try_end_154
    .catch Ljava/lang/Throwable; {:try_start_149 .. :try_end_154} :catch_144

    goto/16 :goto_99

    .line 275
    :catch_156
    move-exception v0

    .line 276
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 277
    sput-boolean v4, Lcom/baidu/hi/HiApplication;->nI:Z

    goto :goto_fd

    .line 291
    :catch_15d
    move-exception v0

    .line 292
    const-string v1, "HiApplication"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Crab.init Exception"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/baidu/hi/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_111
.end method

.method public onTerminate()V
    .registers 2

    .prologue
    .line 163
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 164
    invoke-static {}, Lcom/baidu/hi/logic/y;->OA()Lcom/baidu/hi/logic/y;

    move-result-object v0

    invoke-virtual {v0}, Lcom/baidu/hi/logic/y;->OD()V

    .line 165
    return-void
.end method
