.class public Lcom/agmbat/appext/host/HostApplication;
.super Landroid/app/Application;
.source "HostApplication.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .registers 1

    .line 11
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 13
    invoke-static {p0}, Landroid/app/ext/AppExt;->onCreate(Landroid/app/Application;)V

    .line 14
    return-void
.end method
