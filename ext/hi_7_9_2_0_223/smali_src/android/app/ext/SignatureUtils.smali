.class public Landroid/app/ext/SignatureUtils;
.super Ljava/lang/Object;
.source "SignatureUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static closeQuietly(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "fos"    # Ljava/io/Closeable;

    .line 33
    if-eqz p0, :cond_a

    .line 35
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 38
    goto :goto_a

    .line 36
    :catch_6
    move-exception v0

    .line 37
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 40
    .end local v0    # "e":Ljava/io/IOException;
    :cond_a
    :goto_a
    return-void
.end method

.method private static copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 7
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    const/16 v0, 0x2800

    new-array v0, v0, [B

    .line 83
    .local v0, "buffer":[B
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 84
    .local v2, "len":I
    :goto_6
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    move v2, v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_12

    .line 85
    invoke-virtual {p1, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_6

    .line 87
    :cond_12
    return-void
.end method

.method public static loadBytes(Ljava/io/InputStream;)[B
    .registers 4
    .param p0, "in"    # Ljava/io/InputStream;

    .line 68
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 69
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 71
    .local v1, "data":[B
    :try_start_6
    invoke-static {p0, v0}, Landroid/app/ext/SignatureUtils;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 72
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_d} :catch_14
    .catchall {:try_start_6 .. :try_end_d} :catchall_12

    move-object v1, v2

    .line 76
    :goto_e
    invoke-static {v0}, Landroid/app/ext/SignatureUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 77
    goto :goto_19

    .line 76
    :catchall_12
    move-exception v2

    goto :goto_1a

    .line 73
    :catch_14
    move-exception v2

    .line 74
    .local v2, "e":Ljava/io/IOException;
    :try_start_15
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_18
    .catchall {:try_start_15 .. :try_end_18} :catchall_12

    .line 74
    .end local v2    # "e":Ljava/io/IOException;
    goto :goto_e

    .line 78
    :goto_19
    return-object v1

    .line 76
    :goto_1a
    invoke-static {v0}, Landroid/app/ext/SignatureUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 77
    throw v2
.end method

.method public static readFileBytes(Ljava/io/File;)[B
    .registers 4
    .param p0, "file"    # Ljava/io/File;

    .line 49
    const/4 v0, 0x0

    move-object v1, v0

    .line 51
    .local v1, "fis":Ljava/io/FileInputStream;
    :try_start_2
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v1, v2

    .line 52
    invoke-static {v1}, Landroid/app/ext/SignatureUtils;->loadBytes(Ljava/io/InputStream;)[B

    move-result-object v2
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_c} :catch_12
    .catchall {:try_start_2 .. :try_end_c} :catchall_10

    .line 56
    invoke-static {v1}, Landroid/app/ext/SignatureUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 52
    return-object v2

    .line 56
    :catchall_10
    move-exception v0

    goto :goto_1b

    .line 53
    :catch_12
    move-exception v2

    .line 54
    .local v2, "e":Ljava/io/IOException;
    :try_start_13
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_16
    .catchall {:try_start_13 .. :try_end_16} :catchall_10

    .line 56
    .end local v2    # "e":Ljava/io/IOException;
    invoke-static {v1}, Landroid/app/ext/SignatureUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 57
    nop

    .line 58
    return-object v0

    .line 56
    :goto_1b
    invoke-static {v1}, Landroid/app/ext/SignatureUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 57
    throw v0
.end method

.method public static readSign(Landroid/content/Context;[B)[B
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "data"    # [B

    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 25
    .local v0, "packageName":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "_sign.data"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 26
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_33

    .line 27
    invoke-static {v1}, Landroid/app/ext/SignatureUtils;->readFileBytes(Ljava/io/File;)[B

    move-result-object v2

    return-object v2

    .line 29
    :cond_33
    return-object p1
.end method

.method public static final writeToFile(Ljava/io/File;[B)V
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "data"    # [B

    .line 96
    if-eqz p0, :cond_1f

    if-nez p1, :cond_5

    goto :goto_1f

    .line 99
    :cond_5
    const/4 v0, 0x0

    .line 101
    .local v0, "fos":Ljava/io/FileOutputStream;
    :try_start_6
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v0, v1

    .line 102
    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_f} :catch_12
    .catchall {:try_start_6 .. :try_end_f} :catchall_10

    goto :goto_16

    .line 106
    :catchall_10
    move-exception v1

    goto :goto_1b

    .line 103
    :catch_12
    move-exception v1

    .line 104
    .local v1, "e":Ljava/lang/Exception;
    :try_start_13
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_16
    .catchall {:try_start_13 .. :try_end_16} :catchall_10

    .line 106
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_16
    invoke-static {v0}, Landroid/app/ext/SignatureUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 107
    nop

    .line 108
    return-void

    .line 106
    :goto_1b
    invoke-static {v0}, Landroid/app/ext/SignatureUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 107
    throw v1

    .line 97
    .end local v0    # "fos":Ljava/io/FileOutputStream;
    :cond_1f
    :goto_1f
    return-void
.end method
