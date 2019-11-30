.class public Lcom/tencent/mm/app/Application;
.super Lcom/tencent/tinker/loader/app/TinkerApplication;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    .line 13
    const/4 v0, 0x7

    const-string/jumbo v1, "com.tencent.mm.app.MMApplicationLike"

    const-string/jumbo v2, "com.tencent.tinker.loader.TinkerLoader"

    const/4 v3, 0x1

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/tencent/tinker/loader/app/TinkerApplication;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 14
    return-void
.end method


# virtual methods
.method public onCreate()V
    .registers 3

    .line 9
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 11
    :try_start_3
    const-string v0, "AppExt"

    const-string v1, "Prepare ext apk name:==========="

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_a} :catch_b

    .line 14
    goto :goto_f

    .line 12
    :catch_b
    move-exception v0

    .line 13
    .local v0, "throwable":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .end local v0    # "throwable":Ljava/lang/Throwable;
    :goto_f
    return-void
.end method
