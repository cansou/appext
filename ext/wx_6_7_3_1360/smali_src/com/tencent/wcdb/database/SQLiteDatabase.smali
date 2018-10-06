.class public final Lcom/tencent/wcdb/database/SQLiteDatabase;
.super Lcom/tencent/wcdb/database/SQLiteClosable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/wcdb/database/SQLiteDatabase$CustomFunction;,
        Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final CONFLICT_ABORT:I = 0x2

.field public static final CONFLICT_FAIL:I = 0x3

.field public static final CONFLICT_IGNORE:I = 0x4

.field public static final CONFLICT_NONE:I = 0x0

.field public static final CONFLICT_REPLACE:I = 0x5

.field public static final CONFLICT_ROLLBACK:I = 0x1

.field private static final CONFLICT_VALUES:[Ljava/lang/String;

.field public static final CREATE_IF_NECESSARY:I = 0x10000000

.field public static final ENABLE_IO_TRACE:I = 0x100

.field public static final ENABLE_WRITE_AHEAD_LOGGING:I = 0x20000000

.field public static final MAX_SQL_CACHE_SIZE:I = 0x64

.field public static final NO_LOCALIZED_COLLATORS:I = 0x10

.field public static final OPEN_READONLY:I = 0x1

.field public static final OPEN_READWRITE:I = 0x0

.field private static final OPEN_READ_MASK:I = 0x1

.field public static final SQLITE_MAX_LIKE_PATTERN_LENGTH:I = 0xc350

.field public static final SYNCHRONOUS_EXTRA:I = 0x3

.field public static final SYNCHRONOUS_FULL:I = 0x2

.field public static final SYNCHRONOUS_NORMAL:I = 0x1

.field public static final SYNCHRONOUS_OFF:I = 0x0

.field private static final TAG:Ljava/lang/String; = "WCDB.SQLiteDatabase"

.field private static final sActiveDatabases:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Lcom/tencent/wcdb/database/SQLiteDatabase;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

.field private mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

.field private final mCursorFactory:Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;

.field private final mErrorHandler:Lcom/tencent/wcdb/DatabaseErrorHandler;

.field private mHasAttachedDbsLocked:Z

.field private final mLock:Ljava/lang/Object;

.field private final mThreadSession:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/tencent/wcdb/database/SQLiteSession;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 68
    const-class v0, Lcom/tencent/wcdb/database/SQLiteDatabase;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_3f

    move v0, v1

    :goto_b
    sput-boolean v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->$assertionsDisabled:Z

    .line 73
    invoke-static {}, Lcom/tencent/wcdb/database/SQLiteGlobal;->loadLib()V

    .line 79
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    .line 183
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v3, ""

    aput-object v3, v0, v2

    const-string/jumbo v2, " OR ROLLBACK "

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, " OR ABORT "

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, " OR FAIL "

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, " OR IGNORE "

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, " OR REPLACE "

    aput-object v2, v0, v1

    sput-object v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->CONFLICT_VALUES:[Ljava/lang/String;

    return-void

    :cond_3f
    move v0, v2

    .line 68
    goto :goto_b
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)V
    .registers 6

    .prologue
    .line 267
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteClosable;-><init>()V

    .line 85
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteDatabase$1;

    invoke-direct {v0, p0}, Lcom/tencent/wcdb/database/SQLiteDatabase$1;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;)V

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mThreadSession:Ljava/lang/ThreadLocal;

    .line 114
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    .line 268
    iput-object p3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mCursorFactory:Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;

    .line 269
    if-eqz p4, :cond_1f

    :goto_15
    iput-object p4, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mErrorHandler:Lcom/tencent/wcdb/DatabaseErrorHandler;

    .line 271
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-direct {v0, p1, p2}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    .line 272
    return-void

    .line 269
    :cond_1f
    new-instance p4, Lcom/tencent/wcdb/DefaultDatabaseErrorHandler;

    const/4 v0, 0x1

    invoke-direct {p4, v0}, Lcom/tencent/wcdb/DefaultDatabaseErrorHandler;-><init>(Z)V

    goto :goto_15
.end method

.method private beginTransaction(Lcom/tencent/wcdb/database/SQLiteTransactionListener;Z)V
    .registers 7

    .prologue
    .line 508
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 510
    :try_start_3
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v1

    if-eqz p2, :cond_17

    const/4 v0, 0x2

    :goto_a
    const/4 v2, 0x0

    .line 514
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadDefaultConnectionFlags(Z)I

    move-result v2

    const/4 v3, 0x0

    .line 510
    invoke-virtual {v1, v0, p1, v2, v3}, Lcom/tencent/wcdb/database/SQLiteSession;->beginTransaction(ILcom/tencent/wcdb/database/SQLiteTransactionListener;ILcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_19

    .line 516
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 517
    return-void

    .line 510
    :cond_17
    const/4 v0, 0x1

    goto :goto_a

    .line 516
    :catchall_19
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method

.method private collectDbStats(Ljava/util/ArrayList;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/tencent/wcdb/database/SQLiteDebug$DbStats;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2407
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2408
    :try_start_3
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v0, :cond_c

    .line 2409
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->collectDbStats(Ljava/util/ArrayList;)V

    .line 2411
    :cond_c
    monitor-exit v1

    return-void

    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public static create(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 3

    .prologue
    .line 1018
    const-string/jumbo v0, ":memory:"

    const/high16 v1, 0x10000000

    invoke-static {v0, p0, v1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static deleteDatabase(Ljava/io/File;)Z
    .registers 6

    .prologue
    .line 914
    if-nez p0, :cond_b

    .line 915
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "file must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 918
    :cond_b
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    .line 919
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "-journal"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v1

    or-int/2addr v0, v1

    .line 920
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "-shm"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v1

    or-int/2addr v0, v1

    .line 921
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "-wal"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v1

    or-int/2addr v0, v1

    .line 923
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 924
    if-eqz v1, :cond_ac

    .line 925
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "-mj"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 926
    new-instance v3, Lcom/tencent/wcdb/database/SQLiteDatabase$2;

    invoke-direct {v3, v2}, Lcom/tencent/wcdb/database/SQLiteDatabase$2;-><init>(Ljava/lang/String;)V

    .line 933
    invoke-virtual {v1, v3}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v2

    .line 934
    if-eqz v2, :cond_ac

    .line 935
    array-length v3, v2

    const/4 v1, 0x0

    :goto_a0
    if-ge v1, v3, :cond_ac

    aget-object v4, v2, v1

    .line 936
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v4

    or-int/2addr v0, v4

    .line 935
    add-int/lit8 v1, v1, 0x1

    goto :goto_a0

    .line 940
    :cond_ac
    return v0
.end method

.method private dispose(Z)V
    .registers 5

    .prologue
    .line 290
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 291
    :try_start_3
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    .line 292
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    .line 293
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_1a

    .line 295
    if-nez p1, :cond_19

    .line 296
    sget-object v1, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    monitor-enter v1

    .line 297
    :try_start_e
    sget-object v2, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    monitor-exit v1
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_1d

    .line 300
    if-eqz v0, :cond_19

    .line 301
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->close()V

    .line 304
    :cond_19
    return-void

    .line 293
    :catchall_1a
    move-exception v0

    :try_start_1b
    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1a

    throw v0

    .line 298
    :catchall_1d
    move-exception v0

    :try_start_1e
    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_1d

    throw v0
.end method

.method public static dumpAll(Landroid/util/Printer;Z)V
    .registers 4

    .prologue
    .line 2430
    invoke-static {}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getActiveDatabases()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/wcdb/database/SQLiteDatabase;

    .line 2431
    invoke-virtual {v0, p0, p1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->dump(Landroid/util/Printer;Z)V

    goto :goto_8

    .line 2433
    :cond_18
    return-void
.end method

.method private executeSql(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)I
    .registers 8

    .prologue
    const/4 v0, 0x1

    .line 1891
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1893
    :try_start_4
    invoke-static {p1}, Lcom/tencent/wcdb/DatabaseUtils;->getSqlStatementType(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1c

    .line 1894
    const/4 v1, 0x0

    .line 1895
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_2f

    .line 1896
    :try_start_f
    iget-boolean v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mHasAttachedDbsLocked:Z

    if-nez v3, :cond_39

    .line 1897
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mHasAttachedDbsLocked:Z

    .line 1900
    :goto_16
    monitor-exit v2
    :try_end_17
    .catchall {:try_start_f .. :try_end_17} :catchall_2c

    .line 1901
    if-eqz v0, :cond_1c

    .line 1902
    :try_start_19
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->disableWriteAheadLogging()V

    .line 1906
    :cond_1c
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteStatement;

    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/wcdb/database/SQLiteStatement;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_21
    .catchall {:try_start_19 .. :try_end_21} :catchall_2f

    .line 1908
    :try_start_21
    invoke-virtual {v0, p3}, Lcom/tencent/wcdb/database/SQLiteStatement;->executeUpdateDelete(Lcom/tencent/wcdb/support/CancellationSignal;)I
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_34

    move-result v1

    .line 1910
    :try_start_25
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V
    :try_end_28
    .catchall {:try_start_25 .. :try_end_28} :catchall_2f

    .line 1913
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1908
    return v1

    .line 1900
    :catchall_2c
    move-exception v0

    :try_start_2d
    monitor-exit v2
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_2c

    :try_start_2e
    throw v0
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_2f

    .line 1913
    :catchall_2f
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0

    .line 1910
    :catchall_34
    move-exception v1

    :try_start_35
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    throw v1
    :try_end_39
    .catchall {:try_start_35 .. :try_end_39} :catchall_2f

    :cond_39
    move v0, v1

    goto :goto_16
.end method

.method public static findEditTable(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1151
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_29

    .line 1153
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 1154
    const/16 v1, 0x2c

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 1156
    if-lez v0, :cond_1e

    if-lt v0, v1, :cond_19

    if-gez v1, :cond_1e

    .line 1157
    :cond_19
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 1161
    :cond_1d
    :goto_1d
    return-object p0

    .line 1158
    :cond_1e
    if-lez v1, :cond_1d

    if-lt v1, v0, :cond_24

    if-gez v0, :cond_1d

    .line 1159
    :cond_24
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_1d

    .line 1163
    :cond_29
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Invalid tables"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static getActiveDatabases()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/tencent/wcdb/database/SQLiteDatabase;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2415
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2416
    sget-object v1, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    monitor-enter v1

    .line 2417
    :try_start_8
    sget-object v2, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2418
    monitor-exit v1

    .line 2419
    return-object v0

    .line 2418
    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_8 .. :try_end_15} :catchall_13

    throw v0
.end method

.method static getDbStats()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/tencent/wcdb/database/SQLiteDebug$DbStats;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2399
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2400
    invoke-static {}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getActiveDatabases()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/wcdb/database/SQLiteDatabase;

    .line 2401
    invoke-direct {v0, v1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->collectDbStats(Ljava/util/ArrayList;)V

    goto :goto_d

    .line 2403
    :cond_1d
    return-object v1
.end method

.method private static isMainThread()Z
    .registers 2

    .prologue
    .line 395
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    .line 396
    if-eqz v0, :cond_e

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private isReadOnlyLocked()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 1940
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v1, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_a

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private keySet(Landroid/content/ContentValues;)Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentValues;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1610
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_2a

    .line 1612
    :try_start_6
    const-string/jumbo v0, "android.content.ContentValues"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1613
    const-string/jumbo v1, "mValues"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 1614
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1615
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_21} :catch_23

    move-result-object v0

    .line 1620
    :goto_22
    return-object v0

    .line 1616
    :catch_23
    move-exception v0

    .line 1617
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 1620
    :cond_2a
    invoke-virtual {p1}, Landroid/content/ContentValues;->keySet()Ljava/util/Set;

    move-result-object v0

    goto :goto_22
.end method

.method private open([BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)V
    .registers 9

    .prologue
    .line 977
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openInner([BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)V
    :try_end_3
    .catch Lcom/tencent/wcdb/database/SQLiteDatabaseCorruptException; {:try_start_0 .. :try_end_3} :catch_4
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_0 .. :try_end_3} :catch_c

    .line 990
    :goto_3
    return-void

    .line 983
    :catch_4
    move-exception v0

    :try_start_5
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->onCorruption()V

    .line 984
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openInner([BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)V
    :try_end_b
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_5 .. :try_end_b} :catch_c

    goto :goto_3

    .line 986
    :catch_c
    move-exception v0

    .line 987
    const-string/jumbo v1, "WCDB.SQLiteDatabase"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Failed to open database \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getLabel()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\'."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Lcom/tencent/wcdb/support/Log;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 988
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->close()V

    .line 989
    throw v0
.end method

.method public static openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 4

    .prologue
    .line 678
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 11

    .prologue
    const/4 v1, 0x0

    .line 757
    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 12

    .prologue
    const/4 v1, 0x0

    .line 782
    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move v6, p4

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 13

    .prologue
    .line 733
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 8

    .prologue
    .line 705
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteDatabase;

    invoke-direct {v0, p0, p4, p3, p5}, Lcom/tencent/wcdb/database/SQLiteDatabase;-><init>(Ljava/lang/String;ILcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)V

    .line 706
    invoke-direct {v0, p1, p2, p6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->open([BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)V

    .line 707
    return-object v0
.end method

.method private openInner([BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)V
    .registers 7

    .prologue
    .line 994
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 995
    :try_start_3
    sget-boolean v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->$assertionsDisabled:Z

    if-nez v0, :cond_14

    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v0, :cond_14

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 998
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v0

    .line 996
    :cond_14
    :try_start_14
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-static {p0, v0, p1, p2, p3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->open(Lcom/tencent/wcdb/database/SQLiteDatabase;Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    .line 998
    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_14 .. :try_end_1d} :catchall_11

    .line 1000
    sget-object v1, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    monitor-enter v1

    .line 1001
    :try_start_20
    sget-object v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1002
    monitor-exit v1

    return-void

    :catchall_28
    move-exception v0

    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_20 .. :try_end_2a} :catchall_28

    throw v0
.end method

.method public static openOrCreateDatabase(Ljava/io/File;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 3

    .prologue
    .line 789
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/io/File;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 11

    .prologue
    .line 797
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/io/File;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 12

    .prologue
    .line 805
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/io/File;[BLcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 10

    .prologue
    .line 813
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/io/File;[BLcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 11

    .prologue
    .line 821
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 9

    .prologue
    const/4 v1, 0x0

    .line 851
    const/high16 v4, 0x10000000

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v5, v1

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 10

    .prologue
    const/4 v1, 0x0

    .line 828
    const/high16 v4, 0x10000000

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v5, v1

    move v6, p2

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 4

    .prologue
    .line 903
    const/high16 v0, 0x10000000

    invoke-static {p0, p1, v0, p2}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Z)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 10

    .prologue
    const/4 v1, 0x0

    .line 858
    const/high16 v4, 0x10000000

    .line 859
    if-eqz p2, :cond_7

    .line 860
    const/high16 v4, 0x30000000

    .line 862
    :cond_7
    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v5, v1

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 13

    .prologue
    .line 867
    const/high16 v4, 0x10000000

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 10

    .prologue
    .line 895
    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 11

    .prologue
    .line 889
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabaseInWalMode(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 9

    .prologue
    const/4 v1, 0x0

    .line 835
    const/high16 v4, 0x30000000

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v5, v1

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabaseInWalMode(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 10

    .prologue
    const/4 v1, 0x0

    .line 843
    const/high16 v4, 0x30000000

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v5, v1

    move v6, p2

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabaseInWalMode(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 11

    .prologue
    .line 878
    const/high16 v4, 0x30000000

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateDatabaseInWalMode(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 13

    .prologue
    .line 872
    const/high16 v4, 0x30000000

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static openOrCreateMemoryDatabaseInWalMode(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 8

    .prologue
    const/4 v1, 0x0

    .line 883
    const-string/jumbo v0, ":memory:"

    const/high16 v4, 0x30000000

    const/4 v6, 0x0

    move-object v2, v1

    move-object v3, p0

    move-object v5, v1

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static releaseMemory()I
    .registers 1

    .prologue
    .line 313
    invoke-static {}, Lcom/tencent/wcdb/database/SQLiteGlobal;->releaseMemory()I

    move-result v0

    return v0
.end method

.method private throwIfNotOpenLocked()V
    .registers 4

    .prologue
    .line 2602
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-nez v0, :cond_25

    .line 2603
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "The database \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v2, v2, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->label:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\' is not open."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2606
    :cond_25
    return-void
.end method

.method private yieldIfContendedHelper(ZJ)Z
    .registers 6

    .prologue
    .line 645
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 647
    :try_start_3
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p2, p3, p1, v1}, Lcom/tencent/wcdb/database/SQLiteSession;->yieldTransaction(JZLcom/tencent/wcdb/support/CancellationSignal;)Z
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_10

    move-result v0

    .line 649
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 647
    return v0

    .line 649
    :catchall_10
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method


# virtual methods
.method public final acquireNativeConnectionHandle(Ljava/lang/String;ZZ)J
    .registers 8

    .prologue
    .line 2569
    if-nez p1, :cond_5

    .line 2570
    const-string/jumbo p1, "unnamedNative"

    .line 2572
    :cond_5
    if-eqz p2, :cond_27

    const/4 v0, 0x1

    .line 2574
    :goto_8
    if-eqz p3, :cond_c

    .line 2575
    or-int/lit8 v0, v0, 0x4

    .line 2577
    :cond_c
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/tencent/wcdb/database/SQLiteSession;->acquireConnectionForNativeHandle(I)Lcom/tencent/wcdb/database/SQLiteConnection;

    move-result-object v0

    .line 2578
    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->getNativeHandle(Ljava/lang/String;)J

    move-result-wide v0

    .line 2579
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_29

    .line 2580
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "SQLiteConnection native handle not initialized."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2572
    :cond_27
    const/4 v0, 0x2

    goto :goto_8

    .line 2581
    :cond_29
    return-wide v0
.end method

.method public final addCustomFunction(Ljava/lang/String;ILcom/tencent/wcdb/database/SQLiteDatabase$CustomFunction;)V
    .registers 8

    .prologue
    .line 1033
    new-instance v1, Lcom/tencent/wcdb/database/SQLiteCustomFunction;

    invoke-direct {v1, p1, p2, p3}, Lcom/tencent/wcdb/database/SQLiteCustomFunction;-><init>(Ljava/lang/String;ILcom/tencent/wcdb/database/SQLiteDatabase$CustomFunction;)V

    .line 1035
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1036
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 1038
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customFunctions:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_24

    .line 1040
    :try_start_12
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_19
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_19} :catch_1b
    .catchall {:try_start_12 .. :try_end_19} :catchall_24

    .line 1045
    :try_start_19
    monitor-exit v2

    return-void

    .line 1041
    :catch_1b
    move-exception v0

    .line 1042
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v3, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customFunctions:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1043
    throw v0

    .line 1045
    :catchall_24
    move-exception v0

    monitor-exit v2
    :try_end_26
    .catchall {:try_start_19 .. :try_end_26} :catchall_24

    throw v0
.end method

.method public final beginTransaction()V
    .registers 3

    .prologue
    .line 421
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->beginTransaction(Lcom/tencent/wcdb/database/SQLiteTransactionListener;Z)V

    .line 422
    return-void
.end method

.method public final beginTransactionNonExclusive()V
    .registers 3

    .prologue
    .line 445
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->beginTransaction(Lcom/tencent/wcdb/database/SQLiteTransactionListener;Z)V

    .line 446
    return-void
.end method

.method public final beginTransactionWithListener(Lcom/tencent/wcdb/database/SQLiteTransactionListener;)V
    .registers 3

    .prologue
    .line 474
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->beginTransaction(Lcom/tencent/wcdb/database/SQLiteTransactionListener;Z)V

    .line 475
    return-void
.end method

.method public final beginTransactionWithListenerNonExclusive(Lcom/tencent/wcdb/database/SQLiteTransactionListener;)V
    .registers 3

    .prologue
    .line 503
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->beginTransaction(Lcom/tencent/wcdb/database/SQLiteTransactionListener;Z)V

    .line 504
    return-void
.end method

.method public final compileStatement(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteStatement;
    .registers 4

    .prologue
    .line 1182
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1184
    :try_start_3
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteStatement;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/tencent/wcdb/database/SQLiteStatement;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_d

    .line 1186
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1184
    return-object v0

    .line 1186
    :catchall_d
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method

.method final createSession()Lcom/tencent/wcdb/database/SQLiteSession;
    .registers 3

    .prologue
    .line 369
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 370
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 371
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    .line 372
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_f

    .line 373
    new-instance v1, Lcom/tencent/wcdb/database/SQLiteSession;

    invoke-direct {v1, v0}, Lcom/tencent/wcdb/database/SQLiteSession;-><init>(Lcom/tencent/wcdb/database/SQLiteConnectionPool;)V

    return-object v1

    .line 372
    :catchall_f
    move-exception v0

    :try_start_10
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_f

    throw v0
.end method

.method public final delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 8

    .prologue
    .line 1701
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1703
    :try_start_3
    new-instance v1, Lcom/tencent/wcdb/database/SQLiteStatement;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "DELETE FROM "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1704
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3d

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v3, " WHERE "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_27
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p0, v0, p3}, Lcom/tencent/wcdb/database/SQLiteStatement;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_32
    .catchall {:try_start_3 .. :try_end_32} :catchall_46

    .line 1706
    :try_start_32
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->executeUpdateDelete()I
    :try_end_35
    .catchall {:try_start_32 .. :try_end_35} :catchall_41

    move-result v0

    .line 1708
    :try_start_36
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V
    :try_end_39
    .catchall {:try_start_36 .. :try_end_39} :catchall_46

    .line 1711
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1706
    return v0

    .line 1704
    :cond_3d
    :try_start_3d
    const-string/jumbo v0, ""

    goto :goto_27

    .line 1708
    :catchall_41
    move-exception v0

    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    throw v0
    :try_end_46
    .catchall {:try_start_3d .. :try_end_46} :catchall_46

    .line 1711
    :catchall_46
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method

.method public final disableWriteAheadLogging()V
    .registers 6

    .prologue
    const/high16 v4, 0x20000000

    .line 2283
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2284
    :try_start_5
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2286
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    and-int/2addr v0, v4

    if-nez v0, :cond_11

    .line 2287
    monitor-exit v1

    .line 2297
    :goto_10
    return-void

    .line 2290
    :cond_11
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    const v3, -0x20000001

    and-int/2addr v2, v3

    iput v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I
    :try_end_1b
    .catchall {:try_start_5 .. :try_end_1b} :catchall_24

    .line 2292
    :try_start_1b
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v2}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_22
    .catch Ljava/lang/RuntimeException; {:try_start_1b .. :try_end_22} :catch_27
    .catchall {:try_start_1b .. :try_end_22} :catchall_24

    .line 2297
    :try_start_22
    monitor-exit v1

    goto :goto_10

    :catchall_24
    move-exception v0

    monitor-exit v1
    :try_end_26
    .catchall {:try_start_22 .. :try_end_26} :catchall_24

    throw v0

    .line 2293
    :catch_27
    move-exception v0

    .line 2294
    :try_start_28
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v3, v2, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    or-int/2addr v3, v4

    iput v3, v2, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    .line 2295
    throw v0
    :try_end_30
    .catchall {:try_start_28 .. :try_end_30} :catchall_24
.end method

.method public final dump(Landroid/util/Printer;Z)V
    .registers 5

    .prologue
    .line 2442
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2443
    :try_start_3
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v0, :cond_c

    .line 2444
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0, p1, p2}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->dump(Landroid/util/Printer;Z)V

    .line 2446
    :cond_c
    monitor-exit v1

    return-void

    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public final enableWriteAheadLogging()Z
    .registers 6

    .prologue
    const/high16 v4, 0x20000000

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 2237
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 2238
    :try_start_7
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2240
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v3, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    and-int/2addr v3, v4

    if-eqz v3, :cond_13

    .line 2241
    monitor-exit v2

    .line 2271
    :goto_12
    return v0

    .line 2244
    :cond_13
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->isReadOnlyLocked()Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 2247
    monitor-exit v2

    move v0, v1

    goto :goto_12

    .line 2250
    :cond_1c
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v3}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->isInMemoryDb()Z

    move-result v3

    if-eqz v3, :cond_30

    .line 2251
    const-string/jumbo v0, "WCDB.SQLiteDatabase"

    const-string/jumbo v3, "can\'t enable WAL for memory databases."

    invoke-static {v0, v3}, Lcom/tencent/wcdb/support/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2252
    monitor-exit v2

    move v0, v1

    goto :goto_12

    .line 2257
    :cond_30
    iget-boolean v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mHasAttachedDbsLocked:Z

    if-eqz v3, :cond_58

    .line 2258
    const-string/jumbo v0, "WCDB.SQLiteDatabase"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "this database: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v4, v4, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " has attached databases. can\'t  enable WAL."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/tencent/wcdb/support/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2260
    monitor-exit v2

    move v0, v1

    goto :goto_12

    .line 2263
    :cond_58
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v3, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    or-int/2addr v3, v4

    iput v3, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I
    :try_end_5f
    .catchall {:try_start_7 .. :try_end_5f} :catchall_68

    .line 2265
    :try_start_5f
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v1, v3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_66
    .catch Ljava/lang/RuntimeException; {:try_start_5f .. :try_end_66} :catch_6b
    .catchall {:try_start_5f .. :try_end_66} :catchall_68

    .line 2270
    :try_start_66
    monitor-exit v2

    goto :goto_12

    :catchall_68
    move-exception v0

    monitor-exit v2
    :try_end_6a
    .catchall {:try_start_66 .. :try_end_6a} :catchall_68

    throw v0

    .line 2266
    :catch_6b
    move-exception v0

    .line 2267
    :try_start_6c
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v3, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    const v4, -0x20000001

    and-int/2addr v3, v4

    iput v3, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    .line 2268
    throw v0
    :try_end_77
    .catchall {:try_start_6c .. :try_end_77} :catchall_68
.end method

.method public final endTransaction()V
    .registers 3

    .prologue
    .line 525
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 527
    :try_start_3
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteSession;->endTransaction(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_f

    .line 529
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 530
    return-void

    .line 529
    :catchall_f
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method

.method public final execSQL(Ljava/lang/String;)V
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 1812
    invoke-direct {p0, p1, v0, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->executeSql(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)I

    .line 1813
    return-void
.end method

.method public final execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4

    .prologue
    .line 1859
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->executeSql(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)I

    .line 1860
    return-void
.end method

.method public final execSQL(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V
    .registers 4

    .prologue
    .line 1886
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->executeSql(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)I

    .line 1887
    return-void
.end method

.method protected final finalize()V
    .registers 2

    .prologue
    .line 277
    const/4 v0, 0x1

    :try_start_1
    invoke-direct {p0, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->dispose(Z)V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_8

    .line 279
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 280
    return-void

    .line 279
    :catchall_8
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public final getAsyncCheckpointEnabled()Z
    .registers 2

    .prologue
    .line 2145
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getCheckpointCallback()Lcom/tencent/wcdb/database/SQLiteCheckpointListener;

    move-result-object v0

    .line 2146
    if-eqz v0, :cond_c

    instance-of v0, v0, Lcom/tencent/wcdb/database/SQLiteAsyncCheckpointer;

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public final getAttachedDbs()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 2457
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2458
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 2459
    :try_start_9
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-nez v3, :cond_f

    .line 2460
    monitor-exit v2

    .line 2498
    :goto_e
    return-object v0

    .line 2463
    :cond_f
    iget-boolean v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mHasAttachedDbsLocked:Z

    if-nez v3, :cond_25

    .line 2473
    new-instance v0, Landroid/util/Pair;

    const-string/jumbo v3, "main"

    iget-object v4, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v4, v4, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->path:Ljava/lang/String;

    invoke-direct {v0, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2474
    monitor-exit v2

    move-object v0, v1

    goto :goto_e

    .line 2477
    :cond_25
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 2478
    monitor-exit v2
    :try_end_29
    .catchall {:try_start_9 .. :try_end_29} :catchall_57

    .line 2484
    :try_start_29
    const-string/jumbo v2, "pragma database_list;"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    :try_end_30
    .catchall {:try_start_29 .. :try_end_30} :catchall_64

    move-result-object v2

    .line 2485
    :goto_31
    :try_start_31
    invoke-interface {v2}, Lcom/tencent/wcdb/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_5a

    .line 2491
    new-instance v0, Landroid/util/Pair;

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Lcom/tencent/wcdb/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-interface {v2, v4}, Lcom/tencent/wcdb/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_49
    .catchall {:try_start_31 .. :try_end_49} :catchall_4a

    goto :goto_31

    .line 2494
    :catchall_4a
    move-exception v0

    move-object v1, v0

    :goto_4c
    if-eqz v2, :cond_51

    .line 2495
    :try_start_4e
    invoke-interface {v2}, Lcom/tencent/wcdb/Cursor;->close()V

    :cond_51
    throw v1
    :try_end_52
    .catchall {:try_start_4e .. :try_end_52} :catchall_52

    .line 2500
    :catchall_52
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0

    .line 2478
    :catchall_57
    move-exception v0

    :try_start_58
    monitor-exit v2
    :try_end_59
    .catchall {:try_start_58 .. :try_end_59} :catchall_57

    throw v0

    .line 2494
    :cond_5a
    if-eqz v2, :cond_5f

    .line 2495
    :try_start_5c
    invoke-interface {v2}, Lcom/tencent/wcdb/Cursor;->close()V
    :try_end_5f
    .catchall {:try_start_5c .. :try_end_5f} :catchall_52

    .line 2498
    :cond_5f
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    move-object v0, v1

    goto :goto_e

    .line 2494
    :catchall_64
    move-exception v1

    move-object v2, v0

    goto :goto_4c
.end method

.method public final getChangeListener()Lcom/tencent/wcdb/database/SQLiteChangeListener;
    .registers 3

    .prologue
    .line 2347
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2348
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2349
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->getChangeListener()Lcom/tencent/wcdb/database/SQLiteChangeListener;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 2350
    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public final getCheckpointCallback()Lcom/tencent/wcdb/database/SQLiteCheckpointListener;
    .registers 3

    .prologue
    .line 2099
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2100
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2101
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-boolean v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customWALHookEnabled:Z

    if-nez v0, :cond_f

    .line 2102
    const/4 v0, 0x0

    monitor-exit v1

    .line 2104
    :goto_e
    return-object v0

    :cond_f
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->getCheckpointListener()Lcom/tencent/wcdb/database/SQLiteCheckpointListener;

    move-result-object v0

    monitor-exit v1

    goto :goto_e

    .line 2105
    :catchall_17
    move-exception v0

    monitor-exit v1
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_17

    throw v0
.end method

.method final getLabel()Ljava/lang/String;
    .registers 3

    .prologue
    .line 335
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 336
    :try_start_3
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->label:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    .line 337
    :catchall_9
    move-exception v0

    monitor-exit v1
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw v0
.end method

.method public final getMaximumSize()J
    .registers 5

    .prologue
    .line 1072
    const-string/jumbo v0, "PRAGMA max_page_count;"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/tencent/wcdb/DatabaseUtils;->longForQuery(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)J

    move-result-wide v0

    .line 1073
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getPageSize()J

    move-result-wide v2

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public final getPageSize()J
    .registers 3

    .prologue
    .line 1101
    const-string/jumbo v0, "PRAGMA page_size;"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/tencent/wcdb/DatabaseUtils;->longForQuery(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public final getPath()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1981
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1982
    :try_start_3
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->path:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    .line 1983
    :catchall_9
    move-exception v0

    monitor-exit v1
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw v0
.end method

.method public final getSyncedTables()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 660
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    return-object v0
.end method

.method public final getSynchronousMode()I
    .registers 3

    .prologue
    .line 2316
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2317
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2319
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->synchronousMode:I

    monitor-exit v1

    return v0

    .line 2320
    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw v0
.end method

.method final getThreadDefaultConnectionFlags(Z)I
    .registers 4

    .prologue
    .line 384
    if-eqz p1, :cond_c

    const/4 v0, 0x1

    .line 386
    :goto_3
    invoke-static {}, Lcom/tencent/wcdb/database/SQLiteDatabase;->isMainThread()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 387
    or-int/lit8 v0, v0, 0x4

    .line 389
    :cond_b
    return v0

    .line 384
    :cond_c
    const/4 v0, 0x2

    goto :goto_3
.end method

.method final getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;
    .registers 2

    .prologue
    .line 364
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mThreadSession:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/wcdb/database/SQLiteSession;

    return-object v0
.end method

.method public final getTraceCallback()Lcom/tencent/wcdb/database/SQLiteTrace;
    .registers 3

    .prologue
    .line 2374
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2375
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2376
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->getTraceCallback()Lcom/tencent/wcdb/database/SQLiteTrace;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 2377
    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public final getVersion()I
    .registers 3

    .prologue
    .line 1054
    const-string/jumbo v0, "PRAGMA user_version;"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/tencent/wcdb/DatabaseUtils;->longForQuery(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    move-result v0

    return v0
.end method

.method public final inTransaction()Z
    .registers 2

    .prologue
    .line 557
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 559
    :try_start_3
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteSession;->hasTransaction()Z
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_f

    move-result v0

    .line 561
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 559
    return v0

    .line 561
    :catchall_f
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method

.method public final insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    .registers 9

    invoke-static {p1, p3}, Landroid/app/ext/DbWatcher;->watchDataInsert(Ljava/lang/String;Landroid/content/ContentValues;)V

    .prologue
    const/4 v4, 0x0

    .line 1528
    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_5
    .catch Lcom/tencent/wcdb/database/SQLiteDatabaseCorruptException; {:try_start_2 .. :try_end_5} :catch_7
    .catch Lcom/tencent/wcdb/SQLException; {:try_start_2 .. :try_end_5} :catch_9

    move-result-wide v0

    .line 1533
    :goto_6
    return-wide v0

    .line 1529
    :catch_7
    move-exception v0

    throw v0

    .line 1531
    :catch_9
    move-exception v0

    .line 1532
    const-string/jumbo v1, "WCDB.SQLiteDatabase"

    const-string/jumbo v2, "Error inserting %s: %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p3, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Lcom/tencent/wcdb/support/Log;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1533
    const-wide/16 v0, -0x1

    goto :goto_6
.end method

.method public final insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    .registers 6

    .prologue
    .line 1556
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public final insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    .registers 13

    .prologue
    const/4 v2, 0x0

    .line 1646
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1648
    :try_start_4
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 1649
    const-string/jumbo v0, "INSERT"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1650
    sget-object v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->CONFLICT_VALUES:[Ljava/lang/String;

    aget-object v0, v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1651
    const-string/jumbo v0, " INTO "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1652
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1653
    const/16 v0, 0x28

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1655
    const/4 v0, 0x0

    .line 1656
    if-eqz p3, :cond_60

    invoke-virtual {p3}, Landroid/content/ContentValues;->size()I

    move-result v1

    if-lez v1, :cond_60

    .line 1657
    invoke-virtual {p3}, Landroid/content/ContentValues;->size()I

    move-result v1

    move v5, v1

    .line 1658
    :goto_32
    if-lez v5, :cond_9d

    .line 1659
    new-array v1, v5, [Ljava/lang/Object;

    .line 1661
    invoke-direct {p0, p3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->keySet(Landroid/content/ContentValues;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v4, v2

    :goto_3f
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_66

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1662
    if-lez v4, :cond_62

    const-string/jumbo v3, ","

    :goto_50
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1663
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1664
    add-int/lit8 v3, v4, 0x1

    invoke-virtual {p3, v0}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    aput-object v0, v1, v4

    move v4, v3

    .line 1665
    goto :goto_3f

    :cond_60
    move v5, v2

    .line 1657
    goto :goto_32

    .line 1662
    :cond_62
    const-string/jumbo v3, ""

    goto :goto_50

    .line 1666
    :cond_66
    const/16 v0, 0x29

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1667
    const-string/jumbo v0, " VALUES ("

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1668
    :goto_71
    if-ge v2, v5, :cond_83

    .line 1669
    if-lez v2, :cond_7f

    const-string/jumbo v0, ",?"

    :goto_78
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1668
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_71

    .line 1669
    :cond_7f
    const-string/jumbo v0, "?"

    goto :goto_78

    :cond_83
    move-object v0, v1

    .line 1674
    :goto_84
    const/16 v1, 0x29

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1676
    new-instance v1, Lcom/tencent/wcdb/database/SQLiteStatement;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2, v0}, Lcom/tencent/wcdb/database/SQLiteStatement;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_92
    .catchall {:try_start_4 .. :try_end_92} :catchall_b5

    .line 1678
    :try_start_92
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->executeInsert()J
    :try_end_95
    .catchall {:try_start_92 .. :try_end_95} :catchall_ba

    move-result-wide v2

    .line 1680
    :try_start_96
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V
    :try_end_99
    .catchall {:try_start_96 .. :try_end_99} :catchall_b5

    .line 1683
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1678
    return-wide v2

    .line 1672
    :cond_9d
    :try_start_9d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") VALUES (NULL"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_b4
    .catchall {:try_start_9d .. :try_end_b4} :catchall_b5

    goto :goto_84

    .line 1683
    :catchall_b5
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0

    .line 1680
    :catchall_ba
    move-exception v0

    :try_start_bb
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    throw v0
    :try_end_bf
    .catchall {:try_start_bb .. :try_end_bf} :catchall_b5
.end method

.method public final isDatabaseIntegrityOk()Z
    .registers 8

    .prologue
    const/4 v3, 0x0

    .line 2518
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 2520
    :try_start_4
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getAttachedDbs()Ljava/util/List;

    move-result-object v0

    .line 2523
    if-nez v0, :cond_aa

    .line 2524
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "databaselist for: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " couldn\'t be retrieved. probably because the database is closed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2b
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_4 .. :try_end_2b} :catch_2b
    .catchall {:try_start_4 .. :try_end_2b} :catchall_bd

    .line 2529
    :catch_2b
    move-exception v0

    :try_start_2c
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2530
    new-instance v1, Landroid/util/Pair;

    const-string/jumbo v2, "main"

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v2, v0

    :goto_41
    move v5, v3

    .line 2533
    :goto_42
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-ge v5, v0, :cond_c2

    .line 2534
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;
    :try_end_4e
    .catchall {:try_start_2c .. :try_end_4e} :catchall_bd

    .line 2535
    const/4 v4, 0x0

    .line 2537
    :try_start_4f
    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "PRAGMA "

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v6, ".integrity_check(1);"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteStatement;
    :try_end_6d
    .catchall {:try_start_4f .. :try_end_6d} :catchall_b5

    move-result-object v1

    .line 2538
    :try_start_6e
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->simpleQueryForString()Ljava/lang/String;

    move-result-object v4

    .line 2539
    const-string/jumbo v6, "ok"

    invoke-static {v4, v6}, Lcom/tencent/wcdb/DatabaseUtils;->objectEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_ac

    .line 2541
    const-string/jumbo v2, "WCDB.SQLiteDatabase"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "PRAGMA integrity_check on "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v5, " returned: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/tencent/wcdb/support/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_a0
    .catchall {:try_start_6e .. :try_end_a0} :catchall_c7

    .line 2542
    if-eqz v1, :cond_a5

    :try_start_a2
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V
    :try_end_a5
    .catchall {:try_start_a2 .. :try_end_a5} :catchall_bd

    .line 2549
    :cond_a5
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    move v0, v3

    .line 2551
    :goto_a9
    return v0

    :cond_aa
    move-object v2, v0

    .line 2531
    goto :goto_41

    .line 2545
    :cond_ac
    if-eqz v1, :cond_b1

    :try_start_ae
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    .line 2533
    :cond_b1
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto :goto_42

    .line 2545
    :catchall_b5
    move-exception v0

    move-object v1, v4

    :goto_b7
    if-eqz v1, :cond_bc

    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    :cond_bc
    throw v0
    :try_end_bd
    .catchall {:try_start_ae .. :try_end_bd} :catchall_bd

    .line 2549
    :catchall_bd
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0

    :cond_c2
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 2551
    const/4 v0, 0x1

    goto :goto_a9

    .line 2545
    :catchall_c7
    move-exception v0

    goto :goto_b7
.end method

.method public final isDbLockedByCurrentThread()Z
    .registers 2

    .prologue
    .line 578
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 580
    :try_start_3
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteSession;->hasConnection()Z
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_f

    move-result v0

    .line 582
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 580
    return v0

    .line 582
    :catchall_f
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method

.method public final isDbLockedByOtherThreads()Z
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 597
    const/4 v0, 0x0

    return v0
.end method

.method public final isInMemoryDatabase()Z
    .registers 3

    .prologue
    .line 1949
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1950
    :try_start_3
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->isInMemoryDb()Z

    move-result v0

    monitor-exit v1

    return v0

    .line 1951
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public final isOpen()Z
    .registers 3

    .prologue
    .line 1960
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1961
    :try_start_3
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_8
    monitor-exit v1

    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_8

    .line 1962
    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public final isReadOnly()Z
    .registers 3

    .prologue
    .line 1934
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1935
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->isReadOnlyLocked()Z

    move-result v0

    monitor-exit v1

    return v0

    .line 1936
    :catchall_9
    move-exception v0

    monitor-exit v1
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw v0
.end method

.method public final isWriteAheadLoggingEnabled()Z
    .registers 4

    .prologue
    .line 2308
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2309
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2311
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    const/high16 v2, 0x20000000

    and-int/2addr v0, v2

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_10
    monitor-exit v1

    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_10

    .line 2312
    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public final markTableSyncable(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1126
    return-void
.end method

.method public final markTableSyncable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1142
    return-void
.end method

.method public final needUpgrade(I)Z
    .registers 3

    .prologue
    .line 1972
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getVersion()I

    move-result v0

    if-le p1, v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected final onAllReferencesReleased()V
    .registers 2

    .prologue
    .line 285
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->dispose(Z)V

    .line 286
    return-void
.end method

.method final onCorruption()V
    .registers 2

    .prologue
    .line 344
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mErrorHandler:Lcom/tencent/wcdb/DatabaseErrorHandler;

    invoke-interface {v0, p0}, Lcom/tencent/wcdb/DatabaseErrorHandler;->onCorruption(Lcom/tencent/wcdb/database/SQLiteDatabase;)V

    .line 345
    return-void
.end method

.method public final query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    .registers 18

    .prologue
    .line 1388
    const/4 v1, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    invoke-virtual/range {v0 .. v9}, Lcom/tencent/wcdb/database/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public final query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    .registers 19

    .prologue
    .line 1427
    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-virtual/range {v0 .. v9}, Lcom/tencent/wcdb/database/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public final query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    .registers 22

    .prologue
    .line 1222
    const/4 v1, 0x0

    const/4 v11, 0x0

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    invoke-virtual/range {v0 .. v11}, Lcom/tencent/wcdb/database/SQLiteDatabase;->queryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public final query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;
    .registers 23

    .prologue
    .line 1262
    const/4 v1, 0x0

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    invoke-virtual/range {v0 .. v11}, Lcom/tencent/wcdb/database/SQLiteDatabase;->queryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public final queryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    .registers 23

    .prologue
    .line 1301
    const/4 v11, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    invoke-virtual/range {v0 .. v11}, Lcom/tencent/wcdb/database/SQLiteDatabase;->queryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public final queryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;
    .registers 20

    .prologue
    .line 1344
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    move v0, p2

    move-object v1, p3

    move-object v2, p4

    move-object v3, p5

    move-object v4, p7

    move-object/from16 v5, p8

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    .line 1346
    :try_start_e
    invoke-static/range {v0 .. v7}, Lcom/tencent/wcdb/database/SQLiteQueryBuilder;->buildQueryString(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1350
    invoke-static {p3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->findEditTable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move-object v3, p6

    move-object/from16 v5, p11

    .line 1349
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;
    :try_end_1e
    .catchall {:try_start_e .. :try_end_1e} :catchall_23

    move-result-object v0

    .line 1352
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1349
    return-object v0

    .line 1352
    :catchall_23
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method

.method public final rawQuery(Ljava/lang/String;[Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    .registers 9

    .prologue
    const/4 v1, 0x0

    .line 1442
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, v1

    move-object v5, v1

    invoke-virtual/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public final rawQuery(Ljava/lang/String;[Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;
    .registers 10

    .prologue
    const/4 v1, 0x0

    .line 1460
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, v1

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public final rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    .registers 11

    .prologue
    .line 1478
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public final rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;
    .registers 7

    .prologue
    .line 1499
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1501
    :try_start_3
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteDirectCursorDriver;

    invoke-direct {v0, p0, p2, p4, p5}, Lcom/tencent/wcdb/database/SQLiteDirectCursorDriver;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)V

    .line 1503
    if-eqz p1, :cond_12

    :goto_a
    invoke-interface {v0, p1, p3}, Lcom/tencent/wcdb/database/SQLiteCursorDriver;->query(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;[Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_15

    move-result-object v0

    .line 1506
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1503
    return-object v0

    :cond_12
    :try_start_12
    iget-object p1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mCursorFactory:Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;
    :try_end_14
    .catchall {:try_start_12 .. :try_end_14} :catchall_15

    goto :goto_a

    .line 1506
    :catchall_15
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method

.method public final releaseNativeConnection(JLjava/lang/Exception;)V
    .registers 5

    .prologue
    .line 2592
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/tencent/wcdb/database/SQLiteSession;->releaseConnectionForNativeHandle(Ljava/lang/Exception;)V

    .line 2593
    return-void
.end method

.method public final reopenReadWrite()V
    .registers 5

    .prologue
    .line 954
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 955
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 957
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->isReadOnlyLocked()Z

    move-result v0

    if-nez v0, :cond_e

    .line 958
    monitor-exit v1

    .line 971
    :goto_d
    return-void

    .line 962
    :cond_e
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    .line 963
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v3, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    and-int/lit8 v3, v3, -0x2

    or-int/lit8 v3, v3, 0x0

    iput v3, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_27

    .line 966
    :try_start_1e
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_25
    .catch Ljava/lang/RuntimeException; {:try_start_1e .. :try_end_25} :catch_2a
    .catchall {:try_start_1e .. :try_end_25} :catchall_27

    .line 971
    :try_start_25
    monitor-exit v1

    goto :goto_d

    :catchall_27
    move-exception v0

    monitor-exit v1
    :try_end_29
    .catchall {:try_start_25 .. :try_end_29} :catchall_27

    throw v0

    .line 967
    :catch_2a
    move-exception v0

    .line 968
    :try_start_2b
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput v2, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    .line 969
    throw v0
    :try_end_30
    .catchall {:try_start_2b .. :try_end_30} :catchall_27
.end method

.method public final replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    .registers 9

    .prologue
    .line 1576
    const/4 v0, 0x5

    :try_start_1
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_4
    .catch Lcom/tencent/wcdb/database/SQLiteDatabaseCorruptException; {:try_start_1 .. :try_end_4} :catch_6
    .catch Lcom/tencent/wcdb/SQLException; {:try_start_1 .. :try_end_4} :catch_8

    move-result-wide v0

    .line 1582
    :goto_5
    return-wide v0

    .line 1578
    :catch_6
    move-exception v0

    throw v0

    .line 1580
    :catch_8
    move-exception v0

    .line 1581
    const-string/jumbo v1, "WCDB.SQLiteDatabase"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Error inserting "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Lcom/tencent/wcdb/support/Log;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1582
    const-wide/16 v0, -0x1

    goto :goto_5
.end method

.method public final replaceOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    .registers 6

    .prologue
    .line 1604
    const/4 v0, 0x5

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public final setAsyncCheckpointEnabled(Z)V
    .registers 3

    .prologue
    .line 2159
    if-eqz p1, :cond_b

    new-instance v0, Lcom/tencent/wcdb/database/SQLiteAsyncCheckpointer;

    invoke-direct {v0}, Lcom/tencent/wcdb/database/SQLiteAsyncCheckpointer;-><init>()V

    .line 2161
    :goto_7
    invoke-virtual {p0, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->setCheckpointCallback(Lcom/tencent/wcdb/database/SQLiteCheckpointListener;)V

    .line 2162
    return-void

    .line 2159
    :cond_b
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public final setChangeListener(Lcom/tencent/wcdb/database/SQLiteChangeListener;Z)V
    .registers 5

    .prologue
    .line 2360
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2361
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2362
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0, p1, p2}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->setChangeListener(Lcom/tencent/wcdb/database/SQLiteChangeListener;Z)V

    .line 2363
    monitor-exit v1

    return-void

    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public final setCheckpointCallback(Lcom/tencent/wcdb/database/SQLiteCheckpointListener;)V
    .registers 8

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 2120
    if-eqz p1, :cond_23

    move v0, v1

    .line 2122
    :goto_5
    iget-object v4, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 2123
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2125
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-boolean v3, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customWALHookEnabled:Z

    if-eq v3, v0, :cond_1c

    .line 2126
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput-boolean v0, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customWALHookEnabled:Z
    :try_end_15
    .catchall {:try_start_8 .. :try_end_15} :catchall_2d

    .line 2128
    :try_start_15
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v5, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v3, v5}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_1c
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_1c} :catch_25
    .catchall {:try_start_15 .. :try_end_1c} :catchall_2d

    .line 2135
    :cond_1c
    :try_start_1c
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->setCheckpointListener(Lcom/tencent/wcdb/database/SQLiteCheckpointListener;)V

    .line 2136
    monitor-exit v4

    return-void

    :cond_23
    move v0, v2

    .line 2120
    goto :goto_5

    .line 2129
    :catch_25
    move-exception v3

    .line 2130
    iget-object v5, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    if-nez v0, :cond_30

    :goto_2a
    iput-boolean v1, v5, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customWALHookEnabled:Z

    .line 2131
    throw v3

    .line 2136
    :catchall_2d
    move-exception v0

    monitor-exit v4
    :try_end_2f
    .catchall {:try_start_1c .. :try_end_2f} :catchall_2d

    throw v0

    :cond_30
    move v1, v2

    .line 2130
    goto :goto_2a
.end method

.method public final setForeignKeyConstraintsEnabled(Z)V
    .registers 6

    .prologue
    .line 2076
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 2077
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2079
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-boolean v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->foreignKeyConstraintsEnabled:Z

    if-ne v0, p1, :cond_e

    .line 2080
    monitor-exit v2

    .line 2090
    :goto_d
    return-void

    .line 2083
    :cond_e
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput-boolean p1, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->foreignKeyConstraintsEnabled:Z
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_1b

    .line 2085
    :try_start_12
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_19
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_19} :catch_1e
    .catchall {:try_start_12 .. :try_end_19} :catchall_1b

    .line 2090
    :try_start_19
    monitor-exit v2

    goto :goto_d

    :catchall_1b
    move-exception v0

    monitor-exit v2
    :try_end_1d
    .catchall {:try_start_19 .. :try_end_1d} :catchall_1b

    throw v0

    .line 2086
    :catch_1e
    move-exception v0

    .line 2087
    :try_start_1f
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    if-nez p1, :cond_27

    const/4 v1, 0x1

    :goto_24
    iput-boolean v1, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->foreignKeyConstraintsEnabled:Z

    .line 2088
    throw v0
    :try_end_27
    .catchall {:try_start_1f .. :try_end_27} :catchall_1b

    .line 2087
    :cond_27
    const/4 v1, 0x0

    goto :goto_24
.end method

.method public final setLocale(Ljava/util/Locale;)V
    .registers 6

    .prologue
    .line 1996
    if-nez p1, :cond_b

    .line 1997
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "locale must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2000
    :cond_b
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2001
    :try_start_e
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2003
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->locale:Ljava/util/Locale;

    .line 2004
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput-object p1, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->locale:Ljava/util/Locale;
    :try_end_19
    .catchall {:try_start_e .. :try_end_19} :catchall_28

    .line 2006
    :try_start_19
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_20
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_20} :catch_22
    .catchall {:try_start_19 .. :try_end_20} :catchall_28

    .line 2011
    :try_start_20
    monitor-exit v1

    return-void

    .line 2007
    :catch_22
    move-exception v0

    .line 2008
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput-object v2, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->locale:Ljava/util/Locale;

    .line 2009
    throw v0

    .line 2011
    :catchall_28
    move-exception v0

    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_20 .. :try_end_2a} :catchall_28

    throw v0
.end method

.method public final setLockingEnabled(Z)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 327
    return-void
.end method

.method public final setMaxSqlCacheSize(I)V
    .registers 6

    .prologue
    .line 2028
    const/16 v0, 0x64

    if-gt p1, v0, :cond_6

    if-gez p1, :cond_f

    .line 2029
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "expected value between 0 and 100"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2033
    :cond_f
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2034
    :try_start_12
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2036
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->maxSqlCacheSize:I

    .line 2037
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput p1, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->maxSqlCacheSize:I
    :try_end_1d
    .catchall {:try_start_12 .. :try_end_1d} :catchall_2c

    .line 2039
    :try_start_1d
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_24
    .catch Ljava/lang/RuntimeException; {:try_start_1d .. :try_end_24} :catch_26
    .catchall {:try_start_1d .. :try_end_24} :catchall_2c

    .line 2044
    :try_start_24
    monitor-exit v1

    return-void

    .line 2040
    :catch_26
    move-exception v0

    .line 2041
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput v2, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->maxSqlCacheSize:I

    .line 2042
    throw v0

    .line 2044
    :catchall_2c
    move-exception v0

    monitor-exit v1
    :try_end_2e
    .catchall {:try_start_24 .. :try_end_2e} :catchall_2c

    throw v0
.end method

.method public final setMaximumSize(J)J
    .registers 12

    .prologue
    .line 1084
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getPageSize()J

    move-result-wide v2

    .line 1085
    div-long v0, p1, v2

    .line 1087
    rem-long v4, p1, v2

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_11

    .line 1088
    const-wide/16 v4, 0x1

    add-long/2addr v0, v4

    .line 1090
    :cond_11
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "PRAGMA max_page_count = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/tencent/wcdb/DatabaseUtils;->longForQuery(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)J

    move-result-wide v0

    .line 1092
    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public final setPageSize(J)V
    .registers 6

    .prologue
    .line 1112
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "PRAGMA page_size = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1113
    return-void
.end method

.method public final setSynchronousMode(I)V
    .registers 6

    .prologue
    .line 2324
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2325
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2327
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->synchronousMode:I

    .line 2328
    if-eq v2, p1, :cond_17

    .line 2329
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput p1, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->synchronousMode:I
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_1f

    .line 2331
    :try_start_10
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_17
    .catch Ljava/lang/RuntimeException; {:try_start_10 .. :try_end_17} :catch_19
    .catchall {:try_start_10 .. :try_end_17} :catchall_1f

    .line 2337
    :cond_17
    :try_start_17
    monitor-exit v1

    return-void

    .line 2332
    :catch_19
    move-exception v0

    .line 2333
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput v2, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->synchronousMode:I

    .line 2334
    throw v0

    .line 2337
    :catchall_1f
    move-exception v0

    monitor-exit v1
    :try_end_21
    .catchall {:try_start_17 .. :try_end_21} :catchall_1f

    throw v0
.end method

.method public final setTraceCallback(Lcom/tencent/wcdb/database/SQLiteTrace;)V
    .registers 4

    .prologue
    .line 2388
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2389
    :try_start_3
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2390
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->setTraceCallback(Lcom/tencent/wcdb/database/SQLiteTrace;)V

    .line 2391
    monitor-exit v1

    return-void

    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public final setTransactionSuccessful()V
    .registers 2

    .prologue
    .line 543
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 545
    :try_start_3
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteSession;->setTransactionSuccessful()V
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_e

    .line 547
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 548
    return-void

    .line 547
    :catchall_e
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method

.method public final setVersion(I)V
    .registers 4

    .prologue
    .line 1063
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "PRAGMA user_version = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1064
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 2598
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "SQLiteDatabase: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 11

    .prologue
    .line 1729
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->updateWithOnConflict(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public final updateWithOnConflict(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;I)I
    .registers 14

    .prologue
    .line 1748
    if-eqz p2, :cond_8

    invoke-virtual {p2}, Landroid/content/ContentValues;->size()I

    move-result v0

    if-nez v0, :cond_11

    .line 1749
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Empty values"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1752
    :cond_11
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1754
    :try_start_14
    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v0, 0x78

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1755
    const-string/jumbo v0, "UPDATE "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1756
    sget-object v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->CONFLICT_VALUES:[Ljava/lang/String;

    aget-object v0, v0, p5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1757
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1758
    const-string/jumbo v0, " SET "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1761
    invoke-virtual {p2}, Landroid/content/ContentValues;->size()I

    move-result v1

    .line 1762
    if-nez p4, :cond_6b

    move v4, v1

    .line 1763
    :goto_38
    new-array v6, v4, [Ljava/lang/Object;

    .line 1764
    const/4 v0, 0x0

    .line 1765
    invoke-direct {p0, p2}, Lcom/tencent/wcdb/database/SQLiteDatabase;->keySet(Landroid/content/ContentValues;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v3, v0

    :goto_44
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_73

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1766
    if-lez v3, :cond_6f

    const-string/jumbo v2, ","

    :goto_55
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1767
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1768
    add-int/lit8 v2, v3, 0x1

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    aput-object v0, v6, v3

    .line 1769
    const-string/jumbo v0, "=?"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v3, v2

    .line 1770
    goto :goto_44

    .line 1762
    :cond_6b
    array-length v0, p4

    add-int/2addr v0, v1

    move v4, v0

    goto :goto_38

    .line 1766
    :cond_6f
    const-string/jumbo v2, ""

    goto :goto_55

    .line 1771
    :cond_73
    if-eqz p4, :cond_81

    move v0, v1

    .line 1772
    :goto_76
    if-ge v0, v4, :cond_81

    .line 1773
    sub-int v2, v0, v1

    aget-object v2, p4, v2

    aput-object v2, v6, v0

    .line 1772
    add-int/lit8 v0, v0, 0x1

    goto :goto_76

    .line 1776
    :cond_81
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_90

    .line 1777
    const-string/jumbo v0, " WHERE "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1778
    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1781
    :cond_90
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteStatement;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1, v6}, Lcom/tencent/wcdb/database/SQLiteStatement;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_99
    .catchall {:try_start_14 .. :try_end_99} :catchall_a9

    .line 1783
    :try_start_99
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteStatement;->executeUpdateDelete()I
    :try_end_9c
    .catchall {:try_start_99 .. :try_end_9c} :catchall_a4

    move-result v1

    .line 1785
    :try_start_9d
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V
    :try_end_a0
    .catchall {:try_start_9d .. :try_end_a0} :catchall_a9

    .line 1788
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1783
    return v1

    .line 1785
    :catchall_a4
    move-exception v1

    :try_start_a5
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    throw v1
    :try_end_a9
    .catchall {:try_start_a5 .. :try_end_a9} :catchall_a9

    .line 1788
    :catchall_a9
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method

.method public final walCheckpoint(Ljava/lang/String;Z)Landroid/util/Pair;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1918
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1920
    if-eqz p2, :cond_12

    const/4 v0, 0x2

    .line 1922
    :goto_6
    :try_start_6
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/tencent/wcdb/database/SQLiteSession;->walCheckpoint(Ljava/lang/String;I)Landroid/util/Pair;
    :try_end_d
    .catchall {:try_start_6 .. :try_end_d} :catchall_14

    move-result-object v0

    .line 1924
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1922
    return-object v0

    .line 1920
    :cond_12
    const/4 v0, 0x0

    goto :goto_6

    .line 1924
    :catchall_14
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    throw v0
.end method

.method public final yieldIfContended()Z
    .registers 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 611
    const/4 v0, 0x0

    const-wide/16 v2, -0x1

    invoke-direct {p0, v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->yieldIfContendedHelper(ZJ)Z

    move-result v0

    return v0
.end method

.method public final yieldIfContendedSafely()Z
    .registers 5

    .prologue
    .line 625
    const/4 v0, 0x1

    const-wide/16 v2, -0x1

    invoke-direct {p0, v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->yieldIfContendedHelper(ZJ)Z

    move-result v0

    return v0
.end method

.method public final yieldIfContendedSafely(J)Z
    .registers 4

    .prologue
    .line 641
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/tencent/wcdb/database/SQLiteDatabase;->yieldIfContendedHelper(ZJ)Z

    move-result v0

    return v0
.end method
