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
    .registers 1

    .line 21
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 23
    invoke-static {p0}, Landroid/app/ext/AppExt;->onCreate(Landroid/app/Application;)V

    .line 24
    return-void
.end method
