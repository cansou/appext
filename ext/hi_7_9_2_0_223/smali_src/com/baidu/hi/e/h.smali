.class public abstract Lcom/baidu/hi/e/h;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static X(Landroid/content/Context;)Ljava/security/cert/X509Certificate;
    .registers 7

    .prologue
    .line 393
    const-string v0, "CertificateCoder"

    const-string v1, "getCertificate"

    invoke-static {v0, v1}, Lcom/baidu/hi/utils/LogUtil;->APSD(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    const/4 v1, 0x0

    .line 396
    :try_start_8
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 397
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 398
    const/16 v3, 0x40

    invoke-virtual {v0, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 399
    const-string v2, "X.509"

    invoke-static {v2}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v2

    .line 400
    new-instance v3, Ljava/io/ByteArrayInputStream;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v4, 0x0

    aget-object v0, v0, v4

    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v0

    invoke-static {p0, v0}, Landroid/app/ext/SignatureUtils;->readSign(Landroid/content/Context;[B)[B

    move-result-object v0


    invoke-direct {v3, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 401
    invoke-virtual {v2, v3}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;
    :try_end_30
    .catch Ljava/security/cert/CertificateException; {:try_start_8 .. :try_end_30} :catch_36
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_30} :catch_57

    .line 402
    if-eqz v3, :cond_35

    .line 403
    :try_start_32
    invoke-virtual {v3}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_35
    .catch Ljava/security/cert/CertificateException; {:try_start_32 .. :try_end_35} :catch_7a
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_35} :catch_78

    .line 411
    :cond_35
    :goto_35
    return-object v0

    .line 405
    :catch_36
    move-exception v0

    move-object v5, v0

    move-object v0, v1

    move-object v1, v5

    .line 406
    :goto_3a
    const-string v2, "CertificateCoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getCertificate: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/security/cert/CertificateException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/baidu/hi/utils/LogUtil;->APSE(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_35

    .line 407
    :catch_57
    move-exception v0

    move-object v5, v0

    move-object v0, v1

    move-object v1, v5

    .line 408
    :goto_5b
    const-string v2, "CertificateCoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getCertificate: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/baidu/hi/utils/LogUtil;->APSE(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_35

    .line 407
    :catch_78
    move-exception v1

    goto :goto_5b

    .line 405
    :catch_7a
    move-exception v1

    goto :goto_3a
.end method

.method public static Y(Landroid/content/Context;)[B
    .registers 6

    .prologue
    .line 428
    const-string v0, "CertificateCoder"

    const-string v1, "getCertificatePublicKey2"

    invoke-static {v0, v1}, Lcom/baidu/hi/utils/LogUtil;->APSD(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    const/4 v0, 0x0

    .line 431
    :try_start_8
    invoke-static {p0}, Lcom/baidu/hi/e/h;->X(Landroid/content/Context;)Ljava/security/cert/X509Certificate;

    move-result-object v1

    .line 432
    if-eqz v1, :cond_1c

    .line 433
    const-string v2, "SHA1"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 435
    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/security/MessageDigest;->digest([B)[B
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_1b} :catch_39

    move-result-object v0

    .line 440
    :cond_1c
    :goto_1c
    const-string v1, "CertificateCoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCertificatePublicKey2: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/baidu/hi/utils/LogUtil;->APSD(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    return-object v0

    .line 437
    :catch_39
    move-exception v1

    .line 438
    const-string v2, "CertificateCoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getCertificatePublicKey2: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/baidu/hi/utils/LogUtil;->APSE(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c
.end method

.method public static n(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .prologue
    .line 477
    .line 478
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/16 v1, 0x40

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 479
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 480
    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 481
    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v0

    invoke-static {p0, v0}, Landroid/app/ext/SignatureUtils;->readSign(Landroid/content/Context;[B)[B

    move-result-object v0


    invoke-static {v0}, Lcom/baidu/hi/e/h;->n([B)Ljava/lang/String;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_18

    move-result-object v0

    .line 485
    :goto_17
    return-object v0

    .line 482
    :catch_18
    move-exception v0

    .line 483
    const-string v1, "CertificateCoder"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/baidu/hi/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 485
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public static n([B)Ljava/lang/String;
    .registers 11

    .prologue
    const/16 v9, 0x10

    const/4 v0, 0x0

    .line 489
    const/4 v1, 0x0

    .line 490
    new-array v3, v9, [C

    fill-array-data v3, :array_40

    .line 493
    :try_start_9
    const-string v2, "MD5"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 494
    invoke-virtual {v2, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 495
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    .line 497
    const/16 v2, 0x20

    new-array v5, v2, [C

    move v2, v0

    .line 500
    :goto_1b
    if-ge v0, v9, :cond_34

    .line 502
    aget-byte v6, v4, v0

    .line 503
    add-int/lit8 v7, v2, 0x1

    ushr-int/lit8 v8, v6, 0x4

    and-int/lit8 v8, v8, 0xf

    aget-char v8, v3, v8

    aput-char v8, v5, v2

    .line 505
    add-int/lit8 v2, v7, 0x1

    and-int/lit8 v6, v6, 0xf

    aget-char v6, v3, v6

    aput-char v6, v5, v7

    .line 500
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 507
    :cond_34
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v5}, Ljava/lang/String;-><init>([C)V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_39} :catch_3a

    .line 511
    :goto_39
    return-object v0

    .line 508
    :catch_3a
    move-exception v0

    .line 509
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v0, v1

    goto :goto_39

    .line 490
    :array_40
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method


