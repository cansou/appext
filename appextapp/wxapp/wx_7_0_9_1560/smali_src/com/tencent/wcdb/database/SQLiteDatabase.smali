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
    .registers 5

    .prologue
    const/16 v4, 0x30fb

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 74
    const-class v0, Lcom/tencent/wcdb/database/SQLiteDatabase;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_47

    move v0, v1

    :goto_10
    sput-boolean v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->$assertionsDisabled:Z

    .line 79
    invoke-static {}, Lcom/tencent/wcdb/database/SQLiteGlobal;->loadLib()V

    .line 85
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    .line 189
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

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    :cond_47
    move v0, v2

    .line 74
    goto :goto_10
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)V
    .registers 7

    .prologue
    const/16 v1, 0x3089

    .line 273
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteClosable;-><init>()V

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 91
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteDatabase$1;

    invoke-direct {v0, p0}, Lcom/tencent/wcdb/database/SQLiteDatabase$1;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;)V

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mThreadSession:Ljava/lang/ThreadLocal;

    .line 120
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    .line 274
    iput-object p3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mCursorFactory:Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;

    .line 275
    if-eqz p4, :cond_27

    :goto_1a
    iput-object p4, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mErrorHandler:Lcom/tencent/wcdb/DatabaseErrorHandler;

    .line 277
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-direct {v0, p1, p2}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    .line 278
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    .line 275
    :cond_27
    new-instance p4, Lcom/tencent/wcdb/DefaultDatabaseErrorHandler;

    const/4 v0, 0x1

    invoke-direct {p4, v0}, Lcom/tencent/wcdb/DefaultDatabaseErrorHandler;-><init>(Z)V

    goto :goto_1a
.end method

.method private beginTransaction(Landroid/database/sqlite/SQLiteTransactionListener;Z)V
    .registers 8

    .prologue
    const/16 v4, 0x3097

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 514
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 516
    :try_start_8
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v1

    if-eqz p2, :cond_1f

    const/4 v0, 0x2

    :goto_f
    const/4 v2, 0x0

    .line 520
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadDefaultConnectionFlags(Z)I

    move-result v2

    const/4 v3, 0x0

    .line 516
    invoke-virtual {v1, v0, p1, v2, v3}, Lcom/tencent/wcdb/database/SQLiteSession;->beginTransaction(ILandroid/database/sqlite/SQLiteTransactionListener;ILcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_18
    .catchall {:try_start_8 .. :try_end_18} :catchall_21

    .line 522
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 523
    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    .line 516
    :cond_1f
    const/4 v0, 0x1

    goto :goto_f

    .line 522
    :catchall_21
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 523
    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method private collectDbStats(Ljava/util/ArrayList;)V
    .registers 5
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
    const/16 v2, 0x30f1

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2404
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2405
    :try_start_8
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v0, :cond_11

    .line 2406
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->collectDbStats(Ljava/util/ArrayList;)V

    .line 2408
    :cond_11
    monitor-exit v1
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_16

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public static create(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 4

    .prologue
    const/16 v2, 0x30bb

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1024
    const-string/jumbo v0, ":memory:"

    const/high16 v1, 0x10000000

    invoke-static {v0, p0, v1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static deleteDatabase(Ljava/io/File;)Z
    .registers 7

    .prologue
    const/16 v5, 0x30b7

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 920
    if-nez p0, :cond_13

    .line 921
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "file must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 924
    :cond_13
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    .line 925
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

    .line 926
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

    .line 927
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

    .line 929
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 930
    if-eqz v1, :cond_b4

    .line 931
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

    .line 932
    new-instance v3, Lcom/tencent/wcdb/database/SQLiteDatabase$2;

    invoke-direct {v3, v2}, Lcom/tencent/wcdb/database/SQLiteDatabase$2;-><init>(Ljava/lang/String;)V

    .line 939
    invoke-virtual {v1, v3}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v2

    .line 940
    if-eqz v2, :cond_b4

    .line 941
    array-length v3, v2

    const/4 v1, 0x0

    :goto_a8
    if-ge v1, v3, :cond_b4

    aget-object v4, v2, v1

    .line 942
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v4

    or-int/2addr v0, v4

    .line 941
    add-int/lit8 v1, v1, 0x1

    goto :goto_a8

    .line 946
    :cond_b4
    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0
.end method

.method private dispose(Z)V
    .registers 6

    .prologue
    const/16 v3, 0x308c

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 296
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 297
    :try_start_8
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    .line 298
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    .line 299
    monitor-exit v1
    :try_end_e
    .catchall {:try_start_8 .. :try_end_e} :catchall_22

    .line 301
    if-nez p1, :cond_1e

    .line 302
    sget-object v1, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    monitor-enter v1

    .line 303
    :try_start_13
    sget-object v2, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    monitor-exit v1
    :try_end_19
    .catchall {:try_start_13 .. :try_end_19} :catchall_28

    .line 306
    if-eqz v0, :cond_1e

    .line 307
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->close()V

    .line 310
    :cond_1e
    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    .line 299
    :catchall_22
    move-exception v0

    :try_start_23
    monitor-exit v1
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_22

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 304
    :catchall_28
    move-exception v0

    :try_start_29
    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_29 .. :try_end_2a} :catchall_28

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public static dumpAll(Landroid/util/Printer;Z)V
    .registers 5

    .prologue
    const/16 v2, 0x30f3

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2427
    invoke-static {}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getActiveDatabases()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/wcdb/database/SQLiteDatabase;

    .line 2428
    invoke-virtual {v0, p0, p1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->dump(Landroid/util/Printer;Z)V

    goto :goto_d

    .line 2430
    :cond_1d
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method public static dumpAllJSON(Z)Lorg/json/JSONArray;
    .registers 5

    .prologue
    const v3, 0x2290a

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2433
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 2434
    invoke-static {}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getActiveDatabases()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/wcdb/database/SQLiteDatabase;

    .line 2435
    invoke-virtual {v0, p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->dumpJSON(Z)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_13

    .line 2437
    :cond_27
    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v1
.end method

.method private executeSql(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)I
    .registers 9

    .prologue
    const/4 v0, 0x1

    const/16 v4, 0x30db

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1888
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1890
    :try_start_9
    invoke-static {p1}, Lcom/tencent/wcdb/DatabaseUtils;->getSqlStatementType(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_21

    .line 1891
    const/4 v1, 0x0

    .line 1892
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_14
    .catchall {:try_start_9 .. :try_end_14} :catchall_3c

    .line 1893
    :try_start_14
    iget-boolean v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mHasAttachedDbsLocked:Z

    if-nez v3, :cond_4e

    .line 1894
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mHasAttachedDbsLocked:Z

    .line 1897
    :goto_1b
    monitor-exit v2
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_34

    .line 1898
    if-eqz v0, :cond_21

    .line 1899
    :try_start_1e
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->disableWriteAheadLogging()V

    .line 1903
    :cond_21
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteStatement;

    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/wcdb/database/SQLiteStatement;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_26
    .catchall {:try_start_1e .. :try_end_26} :catchall_3c

    .line 1905
    :try_start_26
    invoke-virtual {v0, p3}, Lcom/tencent/wcdb/database/SQLiteStatement;->executeUpdateDelete(Lcom/tencent/wcdb/support/CancellationSignal;)I
    :try_end_29
    .catchall {:try_start_26 .. :try_end_29} :catchall_44

    move-result v1

    .line 1907
    :try_start_2a
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V
    :try_end_2d
    .catchall {:try_start_2a .. :try_end_2d} :catchall_3c

    .line 1910
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1905
    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v1

    .line 1897
    :catchall_34
    move-exception v0

    :try_start_35
    monitor-exit v2
    :try_end_36
    .catchall {:try_start_35 .. :try_end_36} :catchall_34

    const/16 v1, 0x30db

    :try_start_38
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
    :try_end_3c
    .catchall {:try_start_38 .. :try_end_3c} :catchall_3c

    .line 1910
    :catchall_3c
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1911
    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 1907
    :catchall_44
    move-exception v1

    :try_start_45
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    .line 1908
    const/16 v0, 0x30db

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v1
    :try_end_4e
    .catchall {:try_start_45 .. :try_end_4e} :catchall_3c

    :cond_4e
    move v0, v1

    goto :goto_1b
.end method

.method public static findEditTable(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/16 v2, 0x30c3

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1146
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_38

    .line 1148
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 1149
    const/16 v1, 0x2c

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 1151
    if-lez v0, :cond_26

    if-lt v0, v1, :cond_1e

    if-gez v1, :cond_26

    .line 1152
    :cond_1e
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 1156
    :goto_25
    return-object p0

    .line 1153
    :cond_26
    if-lez v1, :cond_34

    if-lt v1, v0, :cond_2c

    if-gez v0, :cond_34

    .line 1154
    :cond_2c
    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_25

    .line 1156
    :cond_34
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_25

    .line 1158
    :cond_38
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Invalid tables"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method private static getActiveDatabases()Ljava/util/ArrayList;
    .registers 4
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
    const/16 v3, 0x30f2

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2412
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2413
    sget-object v1, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    monitor-enter v1

    .line 2414
    :try_start_d
    sget-object v2, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2415
    monitor-exit v1
    :try_end_17
    .catchall {:try_start_d .. :try_end_17} :catchall_1b

    .line 2416
    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0

    .line 2415
    :catchall_1b
    move-exception v0

    :try_start_1c
    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1b

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method static getDbStats()Ljava/util/ArrayList;
    .registers 4
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
    const/16 v3, 0x30f0

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2396
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2397
    invoke-static {}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getActiveDatabases()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/wcdb/database/SQLiteDatabase;

    .line 2398
    invoke-direct {v0, v1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->collectDbStats(Ljava/util/ArrayList;)V

    goto :goto_12

    .line 2400
    :cond_22
    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v1
.end method

.method private static isMainThread()Z
    .registers 3

    .prologue
    const/16 v2, 0x3092

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 401
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    .line 402
    if-eqz v0, :cond_16

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_16

    const/4 v0, 0x1

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_15
.end method

.method private isReadOnlyLocked()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 1937
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
    .registers 5
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
    const/16 v2, 0x30d3

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1607
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_35

    .line 1609
    :try_start_b
    const-string/jumbo v0, "android.content.ContentValues"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1610
    const-string/jumbo v1, "mValues"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 1611
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1612
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_26} :catch_2b

    move-result-object v0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 1617
    :goto_2a
    return-object v0

    .line 1613
    :catch_2b
    move-exception v0

    .line 1614
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v1

    .line 1617
    :cond_35
    invoke-virtual {p1}, Landroid/content/ContentValues;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_2a
.end method

.method private open([BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)V
    .registers 10

    .prologue
    const/16 v5, 0x30b9

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 983
    :try_start_5
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openInner([BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)V
    :try_end_8
    .catch Lcom/tencent/wcdb/database/SQLiteDatabaseCorruptException; {:try_start_5 .. :try_end_8} :catch_e
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_5 .. :try_end_8} :catch_19

    .line 991
    const/16 v0, 0x30b9

    :try_start_a
    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 996
    :goto_d
    return-void

    .line 989
    :catch_e
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->onCorruption()V

    .line 990
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openInner([BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)V
    :try_end_15
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_a .. :try_end_15} :catch_19

    .line 996
    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_d

    .line 992
    :catch_19
    move-exception v0

    .line 993
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

    .line 994
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->close()V

    .line 995
    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public static openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 5

    .prologue
    const/16 v1, 0x30a1

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 684
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 12

    .prologue
    const/4 v1, 0x0

    const/16 v7, 0x30a4

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 763
    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 13

    .prologue
    const/4 v1, 0x0

    const/16 v7, 0x30a5

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move v6, p4

    .line 788
    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 14

    .prologue
    const/16 v7, 0x30a3

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 739
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 9

    .prologue
    const/16 v1, 0x30a2

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 711
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteDatabase;

    invoke-direct {v0, p0, p4, p3, p5}, Lcom/tencent/wcdb/database/SQLiteDatabase;-><init>(Ljava/lang/String;ILcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)V

    .line 712
    invoke-direct {v0, p1, p2, p6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->open([BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)V

    .line 713
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method private openInner([BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)V
    .registers 8

    .prologue
    const/16 v3, 0x30ba

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1000
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1001
    :try_start_8
    sget-boolean v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->$assertionsDisabled:Z

    if-nez v0, :cond_21

    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v0, :cond_21

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    const/16 v2, 0x30ba

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 1004
    :catchall_1b
    move-exception v0

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_8 .. :try_end_1d} :catchall_1b

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 1002
    :cond_21
    :try_start_21
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-static {p0, v0, p1, p2, p3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->open(Lcom/tencent/wcdb/database/SQLiteDatabase;Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;I)Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    .line 1004
    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_21 .. :try_end_2a} :catchall_1b

    .line 1006
    sget-object v1, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    monitor-enter v1

    .line 1007
    :try_start_2d
    sget-object v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->sActiveDatabases:Ljava/util/WeakHashMap;

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1008
    monitor-exit v1
    :try_end_34
    .catchall {:try_start_2d .. :try_end_34} :catchall_38

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    :catchall_38
    move-exception v0

    :try_start_39
    monitor-exit v1
    :try_end_3a
    .catchall {:try_start_39 .. :try_end_3a} :catchall_38

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public static openOrCreateDatabase(Ljava/io/File;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 4

    .prologue
    const/16 v1, 0x30a6

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 795
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/io/File;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 12

    .prologue
    const/16 v6, 0x30a7

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 803
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/io/File;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 13

    .prologue
    const/16 v6, 0x30a8

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 811
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/io/File;[BLcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 11

    .prologue
    const/16 v6, 0x30a9

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 819
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/io/File;[BLcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 12

    .prologue
    const/16 v6, 0x30aa

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 827
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 10

    .prologue
    const/16 v7, 0x30ae

    const/4 v1, 0x0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 857
    const/high16 v4, 0x10000000

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v5, v1

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 11

    .prologue
    const/16 v7, 0x30ab

    const/4 v1, 0x0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 834
    const/high16 v4, 0x10000000

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v5, v1

    move v6, p2

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 5

    .prologue
    const/16 v1, 0x30b6

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 909
    const/high16 v0, 0x10000000

    invoke-static {p0, p1, v0, p2}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Z)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 11

    .prologue
    const/16 v7, 0x30af

    const/4 v1, 0x0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 864
    const/high16 v4, 0x10000000

    .line 865
    if-eqz p2, :cond_c

    .line 866
    const/high16 v4, 0x30000000

    .line 868
    :cond_c
    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v5, v1

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 14

    .prologue
    const/16 v7, 0x30b0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 873
    const/high16 v4, 0x10000000

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 11

    .prologue
    const/16 v6, 0x30b5

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 901
    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 12

    .prologue
    const/16 v6, 0x30b4

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 895
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabaseInWalMode(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 10

    .prologue
    const/16 v7, 0x30ac

    const/4 v1, 0x0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 841
    const/high16 v4, 0x30000000

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v5, v1

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabaseInWalMode(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 11

    .prologue
    const/16 v7, 0x30ad

    const/4 v1, 0x0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 849
    const/high16 v4, 0x30000000

    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v5, v1

    move v6, p2

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabaseInWalMode(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 12

    .prologue
    const/16 v7, 0x30b2

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 884
    const/high16 v4, 0x30000000

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateDatabaseInWalMode(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Lcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 14

    .prologue
    const/16 v7, 0x30b1

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 878
    const/high16 v4, 0x30000000

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static openOrCreateMemoryDatabaseInWalMode(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;)Lcom/tencent/wcdb/database/SQLiteDatabase;
    .registers 9

    .prologue
    const/16 v7, 0x30b3

    const/4 v1, 0x0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 889
    const-string/jumbo v0, ":memory:"

    const/high16 v4, 0x30000000

    const/4 v6, 0x0

    move-object v2, v1

    move-object v3, p0

    move-object v5, v1

    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteDatabase;->openDatabase(Ljava/lang/String;[BLcom/tencent/wcdb/database/SQLiteCipherSpec;Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ILcom/tencent/wcdb/DatabaseErrorHandler;I)Lcom/tencent/wcdb/database/SQLiteDatabase;

    move-result-object v0

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public static releaseMemory()I
    .registers 2

    .prologue
    const/16 v1, 0x308d

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 319
    invoke-static {}, Lcom/tencent/wcdb/database/SQLiteGlobal;->releaseMemory()I

    move-result v0

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0
.end method

.method private throwIfNotOpenLocked()V
    .registers 5

    .prologue
    const/16 v3, 0x30fa

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2617
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-nez v0, :cond_2d

    .line 2618
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

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2621
    :cond_2d
    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method private yieldIfContendedHelper(ZJ)Z
    .registers 8

    .prologue
    const/16 v2, 0x309f

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 651
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 653
    :try_start_8
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p2, p3, p1, v1}, Lcom/tencent/wcdb/database/SQLiteSession;->yieldTransaction(JZLcom/tencent/wcdb/support/CancellationSignal;)Z
    :try_end_10
    .catchall {:try_start_8 .. :try_end_10} :catchall_18

    move-result v0

    .line 655
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 653
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0

    .line 655
    :catchall_18
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 656
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method


# virtual methods
.method public final acquireNativeConnectionHandle(Ljava/lang/String;ZZ)J
    .registers 9

    .prologue
    const/16 v4, 0x30f7

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2584
    if-nez p1, :cond_a

    .line 2585
    const-string/jumbo p1, "unnamedNative"

    .line 2587
    :cond_a
    if-eqz p2, :cond_2f

    const/4 v0, 0x1

    .line 2589
    :goto_d
    if-eqz p3, :cond_11

    .line 2590
    or-int/lit8 v0, v0, 0x4

    .line 2592
    :cond_11
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/tencent/wcdb/database/SQLiteSession;->acquireConnectionForNativeHandle(I)Lcom/tencent/wcdb/database/SQLiteConnection;

    move-result-object v0

    .line 2593
    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->getNativeHandle(Ljava/lang/String;)J

    move-result-wide v0

    .line 2594
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_31

    .line 2595
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "SQLiteConnection native handle not initialized."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2587
    :cond_2f
    const/4 v0, 0x2

    goto :goto_d

    .line 2596
    :cond_31
    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-wide v0
.end method

.method public final addExtension(Lcom/tencent/wcdb/extension/SQLiteExtension;)V
    .registers 6

    .prologue
    const/16 v3, 0x30bc

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1029
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1030
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 1032
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->extensions:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_2f

    move-result v0

    if-eqz v0, :cond_1c

    .line 1034
    :try_start_15
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v2}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_1c
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_1c} :catch_21
    .catchall {:try_start_15 .. :try_end_1c} :catchall_2f

    .line 1040
    :cond_1c
    :try_start_1c
    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_2f

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    .line 1035
    :catch_21
    move-exception v0

    .line 1036
    :try_start_22
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v2, v2, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->extensions:Ljava/util/LinkedHashSet;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashSet;->remove(Ljava/lang/Object;)Z

    .line 1037
    const/16 v2, 0x30bc

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 1040
    :catchall_2f
    move-exception v0

    monitor-exit v1
    :try_end_31
    .catchall {:try_start_22 .. :try_end_31} :catchall_2f

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final beginTransaction()V
    .registers 4

    .prologue
    const/16 v2, 0x3093

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 427
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->beginTransaction(Landroid/database/sqlite/SQLiteTransactionListener;Z)V

    .line 428
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method public final beginTransactionNonExclusive()V
    .registers 4

    .prologue
    const/16 v2, 0x3094

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 451
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->beginTransaction(Landroid/database/sqlite/SQLiteTransactionListener;Z)V

    .line 452
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method public final beginTransactionWithListener(Landroid/database/sqlite/SQLiteTransactionListener;)V
    .registers 4

    .prologue
    const/16 v1, 0x3095

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 480
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->beginTransaction(Landroid/database/sqlite/SQLiteTransactionListener;Z)V

    .line 481
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method public final beginTransactionWithListenerNonExclusive(Landroid/database/sqlite/SQLiteTransactionListener;)V
    .registers 4

    .prologue
    const/16 v1, 0x3096

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 509
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->beginTransaction(Landroid/database/sqlite/SQLiteTransactionListener;Z)V

    .line 510
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method public final compileStatement(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteStatement;
    .registers 5

    .prologue
    const/16 v2, 0x30c4

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1177
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1179
    :try_start_8
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteStatement;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/tencent/wcdb/database/SQLiteStatement;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_e
    .catchall {:try_start_8 .. :try_end_e} :catchall_15

    .line 1181
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1179
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0

    .line 1181
    :catchall_15
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1182
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method final createSession()Lcom/tencent/wcdb/database/SQLiteSession;
    .registers 4

    .prologue
    const/16 v2, 0x3090

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 375
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 376
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 377
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    .line 378
    monitor-exit v1
    :try_end_e
    .catchall {:try_start_8 .. :try_end_e} :catchall_17

    .line 379
    new-instance v1, Lcom/tencent/wcdb/database/SQLiteSession;

    invoke-direct {v1, v0}, Lcom/tencent/wcdb/database/SQLiteSession;-><init>(Lcom/tencent/wcdb/database/SQLiteConnectionPool;)V

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v1

    .line 378
    :catchall_17
    move-exception v0

    :try_start_18
    monitor-exit v1
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 9

    .prologue
    const/16 v4, 0x30d5

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1698
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1700
    :try_start_8
    new-instance v1, Lcom/tencent/wcdb/database/SQLiteStatement;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "DELETE FROM "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1701
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_40

    const-string/jumbo v0, " WHERE "

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_27
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p0, v0, p3}, Lcom/tencent/wcdb/database/SQLiteStatement;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_32
    .catchall {:try_start_8 .. :try_end_32} :catchall_4e

    .line 1703
    :try_start_32
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->executeUpdateDelete()I
    :try_end_35
    .catchall {:try_start_32 .. :try_end_35} :catchall_44

    move-result v0

    .line 1705
    :try_start_36
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V
    :try_end_39
    .catchall {:try_start_36 .. :try_end_39} :catchall_4e

    .line 1708
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1703
    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0

    .line 1701
    :cond_40
    :try_start_40
    const-string/jumbo v0, ""

    goto :goto_27

    .line 1705
    :catchall_44
    move-exception v0

    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    .line 1706
    const/16 v1, 0x30d5

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
    :try_end_4e
    .catchall {:try_start_40 .. :try_end_4e} :catchall_4e

    .line 1708
    :catchall_4e
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1709
    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final disableWriteAheadLogging()V
    .registers 7

    .prologue
    const/high16 v5, 0x20000000

    const/16 v4, 0x30e8

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2280
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2281
    :try_start_a
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2283
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    and-int/2addr v0, v5

    if-nez v0, :cond_19

    .line 2284
    monitor-exit v1
    :try_end_15
    .catchall {:try_start_a .. :try_end_15} :catchall_3d

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 2294
    :goto_18
    return-void

    .line 2287
    :cond_19
    :try_start_19
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    const v3, -0x20000001

    and-int/2addr v2, v3

    iput v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I
    :try_end_23
    .catchall {:try_start_19 .. :try_end_23} :catchall_3d

    .line 2289
    :try_start_23
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v2}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_2a
    .catch Ljava/lang/RuntimeException; {:try_start_23 .. :try_end_2a} :catch_2f
    .catchall {:try_start_23 .. :try_end_2a} :catchall_3d

    .line 2294
    :try_start_2a
    monitor-exit v1
    :try_end_2b
    .catchall {:try_start_2a .. :try_end_2b} :catchall_3d

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_18

    .line 2290
    :catch_2f
    move-exception v0

    .line 2291
    :try_start_30
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v3, v2, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    or-int/2addr v3, v5

    iput v3, v2, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    .line 2292
    const/16 v2, 0x30e8

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2294
    :catchall_3d
    move-exception v0

    monitor-exit v1
    :try_end_3f
    .catchall {:try_start_30 .. :try_end_3f} :catchall_3d

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final dump(Landroid/util/Printer;Z)V
    .registers 6

    .prologue
    const/16 v2, 0x30f4

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2447
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2448
    :try_start_8
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v0, :cond_11

    .line 2449
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0, p1, p2}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->dump(Landroid/util/Printer;Z)V

    .line 2451
    :cond_11
    monitor-exit v1
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_16

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final dumpJSON(Z)Lorg/json/JSONObject;
    .registers 5

    .prologue
    const v2, 0x2290b

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2455
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2456
    :try_start_9
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v0, :cond_18

    .line 2457
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->dumpJSON(Z)Lorg/json/JSONObject;

    move-result-object v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_9 .. :try_end_14} :catchall_22

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 2459
    :goto_17
    return-object v0

    :cond_18
    :try_start_18
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_18 .. :try_end_1e} :catchall_22

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_17

    .line 2461
    :catchall_22
    move-exception v0

    :try_start_23
    monitor-exit v1
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_22

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final enableWriteAheadLogging()Z
    .registers 7

    .prologue
    const/high16 v4, 0x20000000

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/16 v5, 0x30e7

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2234
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 2235
    :try_start_c
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2237
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v3, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    and-int/2addr v3, v4

    if-eqz v3, :cond_1b

    .line 2238
    monitor-exit v2
    :try_end_17
    .catchall {:try_start_c .. :try_end_17} :catchall_8d

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 2268
    :goto_1a
    return v0

    .line 2241
    :cond_1b
    :try_start_1b
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->isReadOnlyLocked()Z

    move-result v3

    if-eqz v3, :cond_27

    .line 2244
    monitor-exit v2
    :try_end_22
    .catchall {:try_start_1b .. :try_end_22} :catchall_8d

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    move v0, v1

    goto :goto_1a

    .line 2247
    :cond_27
    :try_start_27
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v3}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->isInMemoryDb()Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 2248
    const-string/jumbo v0, "WCDB.SQLiteDatabase"

    const-string/jumbo v3, "can\'t enable WAL for memory databases."

    invoke-static {v0, v3}, Lcom/tencent/wcdb/support/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2249
    monitor-exit v2
    :try_end_39
    .catchall {:try_start_27 .. :try_end_39} :catchall_8d

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    move v0, v1

    goto :goto_1a

    .line 2254
    :cond_3e
    :try_start_3e
    iget-boolean v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mHasAttachedDbsLocked:Z

    if-eqz v3, :cond_69

    .line 2255
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

    .line 2257
    monitor-exit v2
    :try_end_64
    .catchall {:try_start_3e .. :try_end_64} :catchall_8d

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    move v0, v1

    goto :goto_1a

    .line 2260
    :cond_69
    :try_start_69
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v3, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    or-int/2addr v3, v4

    iput v3, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I
    :try_end_70
    .catchall {:try_start_69 .. :try_end_70} :catchall_8d

    .line 2262
    :try_start_70
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v1, v3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_77
    .catch Ljava/lang/RuntimeException; {:try_start_70 .. :try_end_77} :catch_7c
    .catchall {:try_start_70 .. :try_end_77} :catchall_8d

    .line 2267
    :try_start_77
    monitor-exit v2
    :try_end_78
    .catchall {:try_start_77 .. :try_end_78} :catchall_8d

    .line 2268
    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_1a

    .line 2263
    :catch_7c
    move-exception v0

    .line 2264
    :try_start_7d
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v3, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    const v4, -0x20000001

    and-int/2addr v3, v4

    iput v3, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    .line 2265
    const/16 v1, 0x30e7

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2267
    :catchall_8d
    move-exception v0

    monitor-exit v2
    :try_end_8f
    .catchall {:try_start_7d .. :try_end_8f} :catchall_8d

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final endTransaction()V
    .registers 4

    .prologue
    const/16 v2, 0x3098

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 531
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 533
    :try_start_8
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteSession;->endTransaction(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_10
    .catchall {:try_start_8 .. :try_end_10} :catchall_17

    .line 535
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 536
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    .line 535
    :catchall_17
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 536
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final execSQL(Ljava/lang/String;)V
    .registers 4

    .prologue
    const/4 v1, 0x0

    const/16 v0, 0x30d8

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1809
    invoke-direct {p0, p1, v1, v1}, Lcom/tencent/wcdb/database/SQLiteDatabase;->executeSql(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)I

    .line 1810
    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method public final execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5

    .prologue
    const/16 v1, 0x30d9

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1856
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->executeSql(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)I

    .line 1857
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method public final execSQL(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V
    .registers 5

    .prologue
    const/16 v0, 0x30da

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1883
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->executeSql(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)I

    .line 1884
    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method protected final finalize()V
    .registers 3

    .prologue
    const/16 v1, 0x308a

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 283
    const/4 v0, 0x1

    :try_start_6
    invoke-direct {p0, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->dispose(Z)V
    :try_end_9
    .catchall {:try_start_6 .. :try_end_9} :catchall_10

    .line 285
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 286
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    .line 285
    :catchall_10
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 286
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final getAsyncCheckpointEnabled()Z
    .registers 3

    .prologue
    const/16 v1, 0x30e5

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2142
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getCheckpointCallback()Lcom/tencent/wcdb/database/SQLiteCheckpointListener;

    move-result-object v0

    .line 2143
    if-eqz v0, :cond_14

    instance-of v0, v0, Lcom/tencent/wcdb/database/SQLiteAsyncCheckpointer;

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_13
.end method

.method public final getAttachedDbs()Ljava/util/List;
    .registers 7
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

    const/16 v5, 0x30f5

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2472
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2473
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 2474
    :try_start_e
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-nez v3, :cond_17

    .line 2475
    monitor-exit v2
    :try_end_13
    .catchall {:try_start_e .. :try_end_13} :catchall_6a

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 2513
    :goto_16
    return-object v0

    .line 2478
    :cond_17
    :try_start_17
    iget-boolean v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mHasAttachedDbsLocked:Z

    if-nez v3, :cond_30

    .line 2488
    new-instance v0, Landroid/util/Pair;

    const-string/jumbo v3, "main"

    iget-object v4, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v4, v4, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->path:Ljava/lang/String;

    invoke-direct {v0, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2489
    monitor-exit v2
    :try_end_2b
    .catchall {:try_start_17 .. :try_end_2b} :catchall_6a

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    move-object v0, v1

    goto :goto_16

    .line 2492
    :cond_30
    :try_start_30
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 2493
    monitor-exit v2
    :try_end_34
    .catchall {:try_start_30 .. :try_end_34} :catchall_6a

    .line 2499
    :try_start_34
    const-string/jumbo v2, "pragma database_list;"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/Object;)Lcom/tencent/wcdb/Cursor;
    :try_end_3b
    .catchall {:try_start_34 .. :try_end_3b} :catchall_7d

    move-result-object v2

    .line 2500
    :goto_3c
    :try_start_3c
    invoke-interface {v2}, Lcom/tencent/wcdb/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_70

    .line 2506
    new-instance v0, Landroid/util/Pair;

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Lcom/tencent/wcdb/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-interface {v2, v4}, Lcom/tencent/wcdb/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_54
    .catchall {:try_start_3c .. :try_end_54} :catchall_55

    goto :goto_3c

    .line 2509
    :catchall_55
    move-exception v0

    move-object v1, v0

    :goto_57
    if-eqz v2, :cond_5c

    .line 2510
    :try_start_59
    invoke-interface {v2}, Lcom/tencent/wcdb/Cursor;->close()V

    .line 2512
    :cond_5c
    const/16 v0, 0x30f5

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v1
    :try_end_62
    .catchall {:try_start_59 .. :try_end_62} :catchall_62

    .line 2515
    :catchall_62
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 2516
    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2493
    :catchall_6a
    move-exception v0

    :try_start_6b
    monitor-exit v2
    :try_end_6c
    .catchall {:try_start_6b .. :try_end_6c} :catchall_6a

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2509
    :cond_70
    if-eqz v2, :cond_75

    .line 2510
    :try_start_72
    invoke-interface {v2}, Lcom/tencent/wcdb/Cursor;->close()V
    :try_end_75
    .catchall {:try_start_72 .. :try_end_75} :catchall_62

    .line 2515
    :cond_75
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 2513
    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    move-object v0, v1

    goto :goto_16

    .line 2509
    :catchall_7d
    move-exception v1

    move-object v2, v0

    goto :goto_57
.end method

.method public final getChangeListener()Lcom/tencent/wcdb/database/SQLiteChangeListener;
    .registers 4

    .prologue
    const/16 v2, 0x30ec

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2344
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2345
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2346
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->getChangeListener()Lcom/tencent/wcdb/database/SQLiteChangeListener;

    move-result-object v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_16

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0

    .line 2347
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final getCheckpointCallback()Lcom/tencent/wcdb/database/SQLiteCheckpointListener;
    .registers 4

    .prologue
    const/16 v2, 0x30e3

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2096
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2097
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2098
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-boolean v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customWALHookEnabled:Z

    if-nez v0, :cond_17

    .line 2099
    const/4 v0, 0x0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_8 .. :try_end_13} :catchall_22

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 2101
    :goto_16
    return-object v0

    :cond_17
    :try_start_17
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->getCheckpointListener()Lcom/tencent/wcdb/database/SQLiteCheckpointListener;

    move-result-object v0

    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_17 .. :try_end_1e} :catchall_22

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_16

    .line 2102
    :catchall_22
    move-exception v0

    :try_start_23
    monitor-exit v1
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_22

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method final getLabel()Ljava/lang/String;
    .registers 3

    .prologue
    .line 341
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 342
    :try_start_3
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->label:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    .line 343
    :catchall_9
    move-exception v0

    monitor-exit v1
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw v0
.end method

.method public final getMaximumSize()J
    .registers 6

    .prologue
    const/16 v4, 0x30bf

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1067
    const-string/jumbo v0, "PRAGMA max_page_count;"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/tencent/wcdb/DatabaseUtils;->longForQuery(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)J

    move-result-wide v0

    .line 1068
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getPageSize()J

    move-result-wide v2

    mul-long/2addr v0, v2

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-wide v0
.end method

.method public final getPageSize()J
    .registers 4

    .prologue
    const/16 v2, 0x30c1

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1096
    const-string/jumbo v0, "PRAGMA page_size;"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/tencent/wcdb/DatabaseUtils;->longForQuery(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-wide v0
.end method

.method public final getPath()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1978
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1979
    :try_start_3
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->path:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    .line 1980
    :catchall_9
    move-exception v0

    monitor-exit v1
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw v0
.end method

.method public final getSyncedTables()Ljava/util/Map;
    .registers 4
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
    const/16 v2, 0x30a0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 666
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public final getSynchronousMode()I
    .registers 4

    .prologue
    const/16 v2, 0x30ea

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2313
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2314
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2316
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->synchronousMode:I

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_8 .. :try_end_10} :catchall_14

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0

    .line 2317
    :catchall_14
    move-exception v0

    :try_start_15
    monitor-exit v1
    :try_end_16
    .catchall {:try_start_15 .. :try_end_16} :catchall_14

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method final getThreadDefaultConnectionFlags(Z)I
    .registers 5

    .prologue
    const/16 v2, 0x3091

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 390
    if-eqz p1, :cond_14

    const/4 v0, 0x1

    .line 392
    :goto_8
    invoke-static {}, Lcom/tencent/wcdb/database/SQLiteDatabase;->isMainThread()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 393
    or-int/lit8 v0, v0, 0x4

    .line 395
    :cond_10
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0

    .line 390
    :cond_14
    const/4 v0, 0x2

    goto :goto_8
.end method

.method final getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;
    .registers 3

    .prologue
    const/16 v1, 0x308f

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 370
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mThreadSession:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/wcdb/database/SQLiteSession;

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public final getTraceCallback()Lcom/tencent/wcdb/database/SQLiteTrace;
    .registers 4

    .prologue
    const/16 v2, 0x30ee

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2371
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2372
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2373
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->getTraceCallback()Lcom/tencent/wcdb/database/SQLiteTrace;

    move-result-object v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_16

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0

    .line 2374
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final getVersion()I
    .registers 4

    .prologue
    const/16 v2, 0x30bd

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1049
    const-string/jumbo v0, "PRAGMA user_version;"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/tencent/wcdb/DatabaseUtils;->longForQuery(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    move-result v0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0
.end method

.method public final inTransaction()Z
    .registers 3

    .prologue
    const/16 v1, 0x309a

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 563
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 565
    :try_start_8
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteSession;->hasTransaction()Z
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_17

    move-result v0

    .line 567
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 565
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0

    .line 567
    :catchall_17
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 568
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    .registers 10

    invoke-static {p1, p3}, Landroid/app/ext/DbWatcher;->watchDataInsert(Ljava/lang/String;Landroid/content/ContentValues;)V

    .prologue
    const/4 v4, 0x0

    const/16 v5, 0x30cf

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1525
    const/4 v0, 0x0

    :try_start_7
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_a
    .catch Lcom/tencent/wcdb/database/SQLiteDatabaseCorruptException; {:try_start_7 .. :try_end_a} :catch_f
    .catch Lcom/tencent/wcdb/SQLException; {:try_start_7 .. :try_end_a} :catch_14

    move-result-wide v0

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 1530
    :goto_e
    return-wide v0

    .line 1527
    :catch_f
    move-exception v0

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 1528
    :catch_14
    move-exception v0

    .line 1529
    const-string/jumbo v1, "WCDB.SQLiteDatabase"

    const-string/jumbo v2, "Error inserting %s: %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p3, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Lcom/tencent/wcdb/support/Log;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1530
    const-wide/16 v0, -0x1

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_e
.end method

.method public final insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    .registers 7

    .prologue
    const/16 v2, 0x30d0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1553
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-wide v0
.end method

.method public final insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    .registers 14

    .prologue
    const/4 v2, 0x0

    const/16 v8, 0x30d4

    invoke-static {v8}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1643
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1645
    :try_start_9
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 1646
    const-string/jumbo v0, "INSERT"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1647
    sget-object v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->CONFLICT_VALUES:[Ljava/lang/String;

    aget-object v0, v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1648
    const-string/jumbo v0, " INTO "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1649
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1650
    const/16 v0, 0x28

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1652
    const/4 v0, 0x0

    .line 1653
    if-eqz p3, :cond_65

    invoke-virtual {p3}, Landroid/content/ContentValues;->size()I

    move-result v1

    if-lez v1, :cond_65

    .line 1654
    invoke-virtual {p3}, Landroid/content/ContentValues;->size()I

    move-result v1

    move v5, v1

    .line 1655
    :goto_37
    if-lez v5, :cond_a5

    .line 1656
    new-array v1, v5, [Ljava/lang/Object;

    .line 1658
    invoke-direct {p0, p3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->keySet(Landroid/content/ContentValues;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v4, v2

    :goto_44
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1659
    if-lez v4, :cond_67

    const-string/jumbo v3, ","

    :goto_55
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1660
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1661
    add-int/lit8 v3, v4, 0x1

    invoke-virtual {p3, v0}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    aput-object v0, v1, v4

    move v4, v3

    .line 1662
    goto :goto_44

    :cond_65
    move v5, v2

    .line 1654
    goto :goto_37

    .line 1659
    :cond_67
    const-string/jumbo v3, ""

    goto :goto_55

    .line 1663
    :cond_6b
    const/16 v0, 0x29

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1664
    const-string/jumbo v0, " VALUES ("

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1665
    :goto_76
    if-ge v2, v5, :cond_88

    .line 1666
    if-lez v2, :cond_84

    const-string/jumbo v0, ",?"

    :goto_7d
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1665
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_76

    .line 1666
    :cond_84
    const-string/jumbo v0, "?"

    goto :goto_7d

    :cond_88
    move-object v0, v1

    .line 1671
    :goto_89
    const/16 v1, 0x29

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1673
    new-instance v1, Lcom/tencent/wcdb/database/SQLiteStatement;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2, v0}, Lcom/tencent/wcdb/database/SQLiteStatement;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_97
    .catchall {:try_start_9 .. :try_end_97} :catchall_bd

    .line 1675
    :try_start_97
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->executeInsert()J
    :try_end_9a
    .catchall {:try_start_97 .. :try_end_9a} :catchall_c5

    move-result-wide v2

    .line 1677
    :try_start_9b
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V
    :try_end_9e
    .catchall {:try_start_9b .. :try_end_9e} :catchall_bd

    .line 1680
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1675
    invoke-static {v8}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-wide v2

    .line 1669
    :cond_a5
    :try_start_a5
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
    :try_end_bc
    .catchall {:try_start_a5 .. :try_end_bc} :catchall_bd

    goto :goto_89

    .line 1680
    :catchall_bd
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1681
    invoke-static {v8}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 1677
    :catchall_c5
    move-exception v0

    :try_start_c6
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    .line 1678
    const/16 v1, 0x30d4

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
    :try_end_cf
    .catchall {:try_start_c6 .. :try_end_cf} :catchall_bd
.end method

.method public final isDatabaseIntegrityOk()Z
    .registers 9

    .prologue
    const/4 v3, 0x0

    const/16 v7, 0x30f6

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2533
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 2537
    :try_start_9
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getAttachedDbs()Ljava/util/List;

    move-result-object v0

    .line 2538
    if-nez v0, :cond_b7

    .line 2539
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

    const/16 v1, 0x30f6

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
    :try_end_35
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_9 .. :try_end_35} :catch_35
    .catchall {:try_start_9 .. :try_end_35} :catchall_cf

    .line 2544
    :catch_35
    move-exception v0

    :try_start_36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2545
    new-instance v1, Landroid/util/Pair;

    const-string/jumbo v2, "main"

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v2, v0

    :goto_4b
    move v5, v3

    .line 2548
    :goto_4c
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-ge v5, v0, :cond_d7

    .line 2549
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;
    :try_end_58
    .catchall {:try_start_36 .. :try_end_58} :catchall_cf

    .line 2550
    const/4 v4, 0x0

    .line 2552
    :try_start_59
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
    :try_end_77
    .catchall {:try_start_59 .. :try_end_77} :catchall_c2

    move-result-object v1

    .line 2553
    :try_start_78
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->simpleQueryForString()Ljava/lang/String;

    move-result-object v4

    .line 2554
    const-string/jumbo v6, "ok"

    invoke-static {v4, v6}, Lcom/tencent/wcdb/DatabaseUtils;->objectEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_b9

    .line 2556
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
    :try_end_aa
    .catchall {:try_start_78 .. :try_end_aa} :catchall_df

    .line 2560
    if-eqz v1, :cond_af

    :try_start_ac
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V
    :try_end_af
    .catchall {:try_start_ac .. :try_end_af} :catchall_cf

    .line 2564
    :cond_af
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 2557
    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    move v0, v3

    .line 2566
    :goto_b6
    return v0

    :cond_b7
    move-object v2, v0

    .line 2546
    goto :goto_4b

    .line 2560
    :cond_b9
    if-eqz v1, :cond_be

    :try_start_bb
    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    .line 2548
    :cond_be
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto :goto_4c

    .line 2560
    :catchall_c2
    move-exception v0

    move-object v1, v4

    :goto_c4
    if-eqz v1, :cond_c9

    invoke-virtual {v1}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    .line 2561
    :cond_c9
    const/16 v1, 0x30f6

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
    :try_end_cf
    .catchall {:try_start_bb .. :try_end_cf} :catchall_cf

    .line 2564
    :catchall_cf
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 2565
    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2564
    :cond_d7
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 2566
    const/4 v0, 0x1

    invoke-static {v7}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_b6

    .line 2560
    :catchall_df
    move-exception v0

    goto :goto_c4
.end method

.method public final isDbLockedByCurrentThread()Z
    .registers 3

    .prologue
    const/16 v1, 0x309b

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 584
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 586
    :try_start_8
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteSession;->hasConnection()Z
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_17

    move-result v0

    .line 588
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 586
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0

    .line 588
    :catchall_17
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 589
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final isDbLockedByOtherThreads()Z
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 603
    const/4 v0, 0x0

    return v0
.end method

.method public final isInMemoryDatabase()Z
    .registers 4

    .prologue
    const/16 v2, 0x30de

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1946
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1947
    :try_start_8
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->isInMemoryDb()Z

    move-result v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_13

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0

    .line 1948
    :catchall_13
    move-exception v0

    :try_start_14
    monitor-exit v1
    :try_end_15
    .catchall {:try_start_14 .. :try_end_15} :catchall_13

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final isOpen()Z
    .registers 3

    .prologue
    .line 1957
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1958
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

    .line 1959
    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public final isReadOnly()Z
    .registers 4

    .prologue
    const/16 v2, 0x30dd

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1931
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1932
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->isReadOnlyLocked()Z

    move-result v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_11

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0

    .line 1933
    :catchall_11
    move-exception v0

    :try_start_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final isWriteAheadLoggingEnabled()Z
    .registers 5

    .prologue
    const/16 v3, 0x30e9

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2305
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2306
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2308
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    const/high16 v2, 0x20000000

    and-int/2addr v0, v2

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    :goto_15
    monitor-exit v1
    :try_end_16
    .catchall {:try_start_8 .. :try_end_16} :catchall_1c

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_15

    .line 2309
    :catchall_1c
    move-exception v0

    :try_start_1d
    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1c

    invoke-static {v3}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final markTableSyncable(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1121
    return-void
.end method

.method public final markTableSyncable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1137
    return-void
.end method

.method public final needUpgrade(I)Z
    .registers 4

    .prologue
    const/16 v1, 0x30df

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1969
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getVersion()I

    move-result v0

    if-le p1, v0, :cond_10

    const/4 v0, 0x1

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_f
.end method

.method protected final onAllReferencesReleased()V
    .registers 3

    .prologue
    const/16 v1, 0x308b

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 291
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->dispose(Z)V

    .line 292
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method final onCorruption()V
    .registers 3

    .prologue
    const/16 v1, 0x308e

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 350
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mErrorHandler:Lcom/tencent/wcdb/DatabaseErrorHandler;

    invoke-interface {v0, p0}, Lcom/tencent/wcdb/DatabaseErrorHandler;->onCorruption(Lcom/tencent/wcdb/database/SQLiteDatabase;)V

    .line 351
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method public final query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    .registers 18

    .prologue
    const/16 v0, 0x30c9

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1385
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

    invoke-virtual/range {v0 .. v9}, Lcom/tencent/wcdb/database/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    const/16 v1, 0x30c9

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public final query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    .registers 19

    .prologue
    const/16 v0, 0x30ca

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1424
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

    invoke-virtual/range {v0 .. v9}, Lcom/tencent/wcdb/database/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    const/16 v1, 0x30ca

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public final query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    .registers 22

    .prologue
    const/16 v0, 0x30c5

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1218
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

    invoke-virtual/range {v0 .. v11}, Lcom/tencent/wcdb/database/SQLiteDatabase;->queryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    const/16 v1, 0x30c5

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public final query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;
    .registers 23

    .prologue
    const/16 v0, 0x30c6

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1259
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

    invoke-virtual/range {v0 .. v11}, Lcom/tencent/wcdb/database/SQLiteDatabase;->queryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    const/16 v1, 0x30c6

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public final queryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    .registers 23

    .prologue
    const/16 v0, 0x30c7

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1298
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

    invoke-virtual/range {v0 .. v11}, Lcom/tencent/wcdb/database/SQLiteDatabase;->queryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    const/16 v1, 0x30c7

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public final queryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;
    .registers 20

    .prologue
    const/16 v0, 0x30c8

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1341
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    move v0, p2

    move-object v1, p3

    move-object v2, p4

    move-object v3, p5

    move-object v4, p7

    move-object/from16 v5, p8

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    .line 1343
    :try_start_13
    invoke-static/range {v0 .. v7}, Lcom/tencent/wcdb/database/SQLiteQueryBuilder;->buildQueryString(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1347
    invoke-static {p3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->findEditTable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move-object v3, p6

    move-object/from16 v5, p11

    .line 1346
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;
    :try_end_23
    .catchall {:try_start_13 .. :try_end_23} :catchall_2d

    move-result-object v0

    .line 1349
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1346
    const/16 v1, 0x30c8

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0

    .line 1349
    :catchall_2d
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1350
    const/16 v1, 0x30c8

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final rawQuery(Ljava/lang/String;[Ljava/lang/Object;)Lcom/tencent/wcdb/Cursor;
    .registers 10

    .prologue
    const/16 v6, 0x30cb

    const/4 v1, 0x0

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, v1

    move-object v5, v1

    .line 1439
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public final rawQuery(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;
    .registers 11

    .prologue
    const/4 v1, 0x0

    const/16 v6, 0x30cc

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, v1

    move-object v5, p3

    .line 1457
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public final rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;)Lcom/tencent/wcdb/Cursor;
    .registers 12

    .prologue
    const/16 v6, 0x30cd

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1475
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;

    move-result-object v0

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public final rawQueryWithFactory(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)Lcom/tencent/wcdb/Cursor;
    .registers 8

    .prologue
    const/16 v1, 0x30ce

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1496
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1498
    :try_start_8
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteDirectCursorDriver;

    invoke-direct {v0, p0, p2, p4, p5}, Lcom/tencent/wcdb/database/SQLiteDirectCursorDriver;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/wcdb/support/CancellationSignal;)V

    .line 1500
    if-eqz p1, :cond_1a

    :goto_f
    invoke-interface {v0, p1, p3}, Lcom/tencent/wcdb/database/SQLiteCursorDriver;->query(Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;[Ljava/lang/Object;)Lcom/tencent/wcdb/Cursor;
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_1d

    move-result-object v0

    .line 1503
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1500
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0

    :cond_1a
    :try_start_1a
    iget-object p1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mCursorFactory:Lcom/tencent/wcdb/database/SQLiteDatabase$CursorFactory;
    :try_end_1c
    .catchall {:try_start_1a .. :try_end_1c} :catchall_1d

    goto :goto_f

    .line 1503
    :catchall_1d
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1504
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final releaseNativeConnection(JLjava/lang/Exception;)V
    .registers 6

    .prologue
    const/16 v1, 0x30f8

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2607
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/tencent/wcdb/database/SQLiteSession;->releaseConnectionForNativeHandle(Ljava/lang/Exception;)V

    .line 2608
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method public final reopenReadWrite()V
    .registers 6

    .prologue
    const/16 v4, 0x30b8

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 960
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 961
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 963
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->isReadOnlyLocked()Z

    move-result v0

    if-nez v0, :cond_16

    .line 964
    monitor-exit v1
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_3d

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 977
    :goto_15
    return-void

    .line 968
    :cond_16
    :try_start_16
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    .line 969
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v3, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    and-int/lit8 v3, v3, -0x2

    or-int/lit8 v3, v3, 0x0

    iput v3, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I
    :try_end_26
    .catchall {:try_start_16 .. :try_end_26} :catchall_3d

    .line 972
    :try_start_26
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_2d
    .catch Ljava/lang/RuntimeException; {:try_start_26 .. :try_end_2d} :catch_32
    .catchall {:try_start_26 .. :try_end_2d} :catchall_3d

    .line 977
    :try_start_2d
    monitor-exit v1
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_3d

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_15

    .line 973
    :catch_32
    move-exception v0

    .line 974
    :try_start_33
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput v2, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    .line 975
    const/16 v2, 0x30b8

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 977
    :catchall_3d
    move-exception v0

    monitor-exit v1
    :try_end_3f
    .catchall {:try_start_33 .. :try_end_3f} :catchall_3d

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    .registers 10

    .prologue
    const/16 v5, 0x30d1

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1573
    const/4 v0, 0x5

    :try_start_6
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_9
    .catch Lcom/tencent/wcdb/database/SQLiteDatabaseCorruptException; {:try_start_6 .. :try_end_9} :catch_e
    .catch Lcom/tencent/wcdb/SQLException; {:try_start_6 .. :try_end_9} :catch_13

    move-result-wide v0

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 1579
    :goto_d
    return-wide v0

    .line 1576
    :catch_e
    move-exception v0

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 1577
    :catch_13
    move-exception v0

    .line 1578
    const-string/jumbo v1, "WCDB.SQLiteDatabase"

    const-string/jumbo v2, "Error inserting "

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Lcom/tencent/wcdb/support/Log;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1579
    const-wide/16 v0, -0x1

    invoke-static {v5}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_d
.end method

.method public final replaceOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    .registers 7

    .prologue
    const/16 v2, 0x30d2

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1601
    const/4 v0, 0x5

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-wide v0
.end method

.method public final setAsyncCheckpointEnabled(Z)V
    .registers 4

    .prologue
    const/16 v1, 0x30e6

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2156
    if-eqz p1, :cond_13

    new-instance v0, Lcom/tencent/wcdb/database/SQLiteAsyncCheckpointer;

    invoke-direct {v0}, Lcom/tencent/wcdb/database/SQLiteAsyncCheckpointer;-><init>()V

    .line 2158
    :goto_c
    invoke-virtual {p0, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->setCheckpointCallback(Lcom/tencent/wcdb/database/SQLiteCheckpointListener;)V

    .line 2159
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    .line 2156
    :cond_13
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public final setChangeListener(Lcom/tencent/wcdb/database/SQLiteChangeListener;Z)V
    .registers 6

    .prologue
    const/16 v2, 0x30ed

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2357
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2358
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2359
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0, p1, p2}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->setChangeListener(Lcom/tencent/wcdb/database/SQLiteChangeListener;Z)V

    .line 2360
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_15

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    :catchall_15
    move-exception v0

    :try_start_16
    monitor-exit v1
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final setCheckpointCallback(Lcom/tencent/wcdb/database/SQLiteCheckpointListener;)V
    .registers 9

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/16 v6, 0x30e4

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2117
    if-eqz p1, :cond_2b

    move v0, v1

    .line 2119
    :goto_a
    iget-object v4, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 2120
    :try_start_d
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2122
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-boolean v3, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customWALHookEnabled:Z

    if-eq v3, v0, :cond_21

    .line 2123
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput-boolean v0, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customWALHookEnabled:Z
    :try_end_1a
    .catchall {:try_start_d .. :try_end_1a} :catchall_3a

    .line 2125
    :try_start_1a
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v5, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v3, v5}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_21
    .catch Ljava/lang/RuntimeException; {:try_start_1a .. :try_end_21} :catch_2d
    .catchall {:try_start_1a .. :try_end_21} :catchall_3a

    .line 2132
    :cond_21
    :try_start_21
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->setCheckpointListener(Lcom/tencent/wcdb/database/SQLiteCheckpointListener;)V

    .line 2133
    monitor-exit v4
    :try_end_27
    .catchall {:try_start_21 .. :try_end_27} :catchall_3a

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    :cond_2b
    move v0, v2

    .line 2117
    goto :goto_a

    .line 2126
    :catch_2d
    move-exception v3

    .line 2127
    :try_start_2e
    iget-object v5, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    if-nez v0, :cond_40

    :goto_32
    iput-boolean v1, v5, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customWALHookEnabled:Z

    .line 2128
    const/16 v0, 0x30e4

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v3

    .line 2133
    :catchall_3a
    move-exception v0

    monitor-exit v4
    :try_end_3c
    .catchall {:try_start_2e .. :try_end_3c} :catchall_3a

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    :cond_40
    move v1, v2

    .line 2127
    goto :goto_32
.end method

.method public final setForeignKeyConstraintsEnabled(Z)V
    .registers 7

    .prologue
    const/16 v4, 0x30e2

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2073
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 2074
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2076
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-boolean v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->foreignKeyConstraintsEnabled:Z

    if-ne v0, p1, :cond_16

    .line 2077
    monitor-exit v2
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_34

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    .line 2087
    :goto_15
    return-void

    .line 2080
    :cond_16
    :try_start_16
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput-boolean p1, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->foreignKeyConstraintsEnabled:Z
    :try_end_1a
    .catchall {:try_start_16 .. :try_end_1a} :catchall_34

    .line 2082
    :try_start_1a
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_21
    .catch Ljava/lang/RuntimeException; {:try_start_1a .. :try_end_21} :catch_26
    .catchall {:try_start_1a .. :try_end_21} :catchall_34

    .line 2087
    :try_start_21
    monitor-exit v2
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_34

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    goto :goto_15

    .line 2083
    :catch_26
    move-exception v0

    .line 2084
    :try_start_27
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    if-nez p1, :cond_3a

    const/4 v1, 0x1

    :goto_2c
    iput-boolean v1, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->foreignKeyConstraintsEnabled:Z

    .line 2085
    const/16 v1, 0x30e2

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2087
    :catchall_34
    move-exception v0

    monitor-exit v2
    :try_end_36
    .catchall {:try_start_27 .. :try_end_36} :catchall_34

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2084
    :cond_3a
    const/4 v1, 0x0

    goto :goto_2c
.end method

.method public final setLocale(Ljava/util/Locale;)V
    .registers 7

    .prologue
    const/16 v4, 0x30e0

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1993
    if-nez p1, :cond_13

    .line 1994
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "locale must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 1997
    :cond_13
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1998
    :try_start_16
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2000
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->locale:Ljava/util/Locale;

    .line 2001
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput-object p1, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->locale:Ljava/util/Locale;
    :try_end_21
    .catchall {:try_start_16 .. :try_end_21} :catchall_38

    .line 2003
    :try_start_21
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_28
    .catch Ljava/lang/RuntimeException; {:try_start_21 .. :try_end_28} :catch_2d
    .catchall {:try_start_21 .. :try_end_28} :catchall_38

    .line 2008
    :try_start_28
    monitor-exit v1
    :try_end_29
    .catchall {:try_start_28 .. :try_end_29} :catchall_38

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    .line 2004
    :catch_2d
    move-exception v0

    .line 2005
    :try_start_2e
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput-object v2, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->locale:Ljava/util/Locale;

    .line 2006
    const/16 v2, 0x30e0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2008
    :catchall_38
    move-exception v0

    monitor-exit v1
    :try_end_3a
    .catchall {:try_start_2e .. :try_end_3a} :catchall_38

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final setLockingEnabled(Z)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 333
    return-void
.end method

.method public final setMaxSqlCacheSize(I)V
    .registers 7

    .prologue
    const/16 v4, 0x30e1

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2025
    const/16 v0, 0x64

    if-gt p1, v0, :cond_b

    if-gez p1, :cond_17

    .line 2026
    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "expected value between 0 and 100"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2030
    :cond_17
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2031
    :try_start_1a
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2033
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->maxSqlCacheSize:I

    .line 2034
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput p1, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->maxSqlCacheSize:I
    :try_end_25
    .catchall {:try_start_1a .. :try_end_25} :catchall_3c

    .line 2036
    :try_start_25
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_2c
    .catch Ljava/lang/RuntimeException; {:try_start_25 .. :try_end_2c} :catch_31
    .catchall {:try_start_25 .. :try_end_2c} :catchall_3c

    .line 2041
    :try_start_2c
    monitor-exit v1
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_3c

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    .line 2037
    :catch_31
    move-exception v0

    .line 2038
    :try_start_32
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput v2, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->maxSqlCacheSize:I

    .line 2039
    const/16 v2, 0x30e1

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2041
    :catchall_3c
    move-exception v0

    monitor-exit v1
    :try_end_3e
    .catchall {:try_start_32 .. :try_end_3e} :catchall_3c

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final setMaximumSize(J)J
    .registers 12

    .prologue
    const/16 v8, 0x30c0

    invoke-static {v8}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1079
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getPageSize()J

    move-result-wide v2

    .line 1080
    div-long v0, p1, v2

    .line 1082
    rem-long v4, p1, v2

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_16

    .line 1083
    const-wide/16 v4, 0x1

    add-long/2addr v0, v4

    .line 1085
    :cond_16
    const-string/jumbo v4, "PRAGMA max_page_count = "

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/tencent/wcdb/DatabaseUtils;->longForQuery(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)J

    move-result-wide v0

    .line 1087
    mul-long/2addr v0, v2

    invoke-static {v8}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-wide v0
.end method

.method public final setPageSize(J)V
    .registers 6

    .prologue
    const/16 v2, 0x30c2

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1107
    const-string/jumbo v0, "PRAGMA page_size = "

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1108
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method public final setSynchronousMode(I)V
    .registers 7

    .prologue
    const/16 v4, 0x30eb

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2321
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2322
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2324
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->synchronousMode:I

    .line 2325
    if-eq v2, p1, :cond_1c

    .line 2326
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput p1, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->synchronousMode:I
    :try_end_15
    .catchall {:try_start_8 .. :try_end_15} :catchall_2c

    .line 2328
    :try_start_15
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    :try_end_1c
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_1c} :catch_21
    .catchall {:try_start_15 .. :try_end_1c} :catchall_2c

    .line 2334
    :cond_1c
    :try_start_1c
    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_2c

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    .line 2329
    :catch_21
    move-exception v0

    .line 2330
    :try_start_22
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConfigurationLocked:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iput v2, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->synchronousMode:I

    .line 2331
    const/16 v2, 0x30eb

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 2334
    :catchall_2c
    move-exception v0

    monitor-exit v1
    :try_end_2e
    .catchall {:try_start_22 .. :try_end_2e} :catchall_2c

    invoke-static {v4}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final setTraceCallback(Lcom/tencent/wcdb/database/SQLiteTrace;)V
    .registers 5

    .prologue
    const/16 v2, 0x30ef

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2385
    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2386
    :try_start_8
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->throwIfNotOpenLocked()V

    .line 2387
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteDatabase;->mConnectionPoolLocked:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->setTraceCallback(Lcom/tencent/wcdb/database/SQLiteTrace;)V

    .line 2388
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_15

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    :catchall_15
    move-exception v0

    :try_start_16
    monitor-exit v1
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final setTransactionSuccessful()V
    .registers 3

    .prologue
    const/16 v1, 0x3099

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 549
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 551
    :try_start_8
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteSession;->setTransactionSuccessful()V
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_16

    .line 553
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 554
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void

    .line 553
    :catchall_16
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 554
    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final setVersion(I)V
    .registers 5

    .prologue
    const/16 v2, 0x30be

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1058
    const-string/jumbo v0, "PRAGMA user_version = "

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1059
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    .prologue
    const/16 v2, 0x30f9

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 2613
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "SQLiteDatabase: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0
.end method

.method public final update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 12

    .prologue
    const/16 v6, 0x30d6

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1726
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteDatabase;->updateWithOnConflict(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;I)I

    move-result v0

    invoke-static {v6}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0
.end method

.method public final updateWithOnConflict(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;I)I
    .registers 15

    .prologue
    const/16 v8, 0x30d7

    invoke-static {v8}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1745
    if-eqz p2, :cond_d

    invoke-virtual {p2}, Landroid/content/ContentValues;->size()I

    move-result v0

    if-nez v0, :cond_19

    .line 1746
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Empty values"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v8}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0

    .line 1749
    :cond_19
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1751
    :try_start_1c
    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v0, 0x78

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1752
    const-string/jumbo v0, "UPDATE "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1753
    sget-object v0, Lcom/tencent/wcdb/database/SQLiteDatabase;->CONFLICT_VALUES:[Ljava/lang/String;

    aget-object v0, v0, p5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1754
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1755
    const-string/jumbo v0, " SET "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1758
    invoke-virtual {p2}, Landroid/content/ContentValues;->size()I

    move-result v1

    .line 1759
    if-nez p4, :cond_73

    move v4, v1

    .line 1760
    :goto_40
    new-array v6, v4, [Ljava/lang/Object;

    .line 1761
    const/4 v0, 0x0

    .line 1762
    invoke-direct {p0, p2}, Lcom/tencent/wcdb/database/SQLiteDatabase;->keySet(Landroid/content/ContentValues;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v3, v0

    :goto_4c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1763
    if-lez v3, :cond_77

    const-string/jumbo v2, ","

    :goto_5d
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1764
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1765
    add-int/lit8 v2, v3, 0x1

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    aput-object v0, v6, v3

    .line 1766
    const-string/jumbo v0, "=?"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v3, v2

    .line 1767
    goto :goto_4c

    .line 1759
    :cond_73
    array-length v0, p4

    add-int/2addr v0, v1

    move v4, v0

    goto :goto_40

    .line 1763
    :cond_77
    const-string/jumbo v2, ""

    goto :goto_5d

    .line 1768
    :cond_7b
    if-eqz p4, :cond_89

    move v0, v1

    .line 1769
    :goto_7e
    if-ge v0, v4, :cond_89

    .line 1770
    sub-int v2, v0, v1

    aget-object v2, p4, v2

    aput-object v2, v6, v0

    .line 1769
    add-int/lit8 v0, v0, 0x1

    goto :goto_7e

    .line 1773
    :cond_89
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_98

    .line 1774
    const-string/jumbo v0, " WHERE "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1775
    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1778
    :cond_98
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteStatement;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1, v6}, Lcom/tencent/wcdb/database/SQLiteStatement;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_a1
    .catchall {:try_start_1c .. :try_end_a1} :catchall_b9

    .line 1780
    :try_start_a1
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteStatement;->executeUpdateDelete()I
    :try_end_a4
    .catchall {:try_start_a1 .. :try_end_a4} :catchall_af

    move-result v1

    .line 1782
    :try_start_a5
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V
    :try_end_a8
    .catchall {:try_start_a5 .. :try_end_a8} :catchall_b9

    .line 1785
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1780
    invoke-static {v8}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v1

    .line 1782
    :catchall_af
    move-exception v1

    :try_start_b0
    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteStatement;->close()V

    .line 1783
    const/16 v0, 0x30d7

    invoke-static {v0}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v1
    :try_end_b9
    .catchall {:try_start_b0 .. :try_end_b9} :catchall_b9

    .line 1785
    :catchall_b9
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1786
    invoke-static {v8}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final walCheckpoint(Ljava/lang/String;Z)Landroid/util/Pair;
    .registers 6
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
    const/16 v2, 0x30dc

    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 1915
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->acquireReference()V

    .line 1917
    if-eqz p2, :cond_1a

    const/4 v0, 0x2

    .line 1919
    :goto_b
    :try_start_b
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->getThreadSession()Lcom/tencent/wcdb/database/SQLiteSession;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/tencent/wcdb/database/SQLiteSession;->walCheckpoint(Ljava/lang/String;I)Landroid/util/Pair;
    :try_end_12
    .catchall {:try_start_b .. :try_end_12} :catchall_1c

    move-result-object v0

    .line 1921
    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1919
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return-object v0

    .line 1917
    :cond_1a
    const/4 v0, 0x0

    goto :goto_b

    .line 1921
    :catchall_1c
    move-exception v0

    invoke-virtual {p0}, Lcom/tencent/wcdb/database/SQLiteDatabase;->releaseReference()V

    .line 1922
    invoke-static {v2}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    throw v0
.end method

.method public final yieldIfContended()Z
    .registers 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/16 v1, 0x309c

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 617
    const/4 v0, 0x0

    const-wide/16 v2, -0x1

    invoke-direct {p0, v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->yieldIfContendedHelper(ZJ)Z

    move-result v0

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0
.end method

.method public final yieldIfContendedSafely()Z
    .registers 5

    .prologue
    const/16 v1, 0x309d

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 631
    const/4 v0, 0x1

    const-wide/16 v2, -0x1

    invoke-direct {p0, v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteDatabase;->yieldIfContendedHelper(ZJ)Z

    move-result v0

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0
.end method

.method public final yieldIfContendedSafely(J)Z
    .registers 6

    .prologue
    const/16 v1, 0x309e

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->i(I)V

    .line 647
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/tencent/wcdb/database/SQLiteDatabase;->yieldIfContendedHelper(ZJ)Z

    move-result v0

    invoke-static {v1}, Lcom/tencent/matrix/trace/core/AppMethodBeat;->o(I)V

    return v0
.end method
