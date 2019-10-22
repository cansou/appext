.class public Landroid/app/ext/DbWatcher;
.super Ljava/lang/Object;
.source "DbWatcher.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static watchDataInsert(Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 5
    .param p0, "table"    # Ljava/lang/String;
    .param p1, "values"    # Landroid/content/ContentValues;

    .line 10
    const-string v0, "action_dbinsert"

    .line 11
    .local v0, "action":Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 12
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "table"

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    const-string v2, "values"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 14
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/Application;->sendBroadcast(Landroid/content/Intent;)V

    .line 15
    return-void
.end method
