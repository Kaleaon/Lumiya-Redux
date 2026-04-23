.class public Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenHelper;,
        Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;,
        Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$InstanceHolder;
    }
.end annotation


# instance fields
.field private final fileMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;",
            ">;"
        }
    .end annotation
.end field

.field private final refMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/ref/PhantomReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/DBHandle;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;",
            ">;"
        }
    .end annotation
.end field

.field private final refQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/DBHandle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->refQueue:Ljava/lang/ref/ReferenceQueue;

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->refMap:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->fileMap:Ljava/util/Map;

    const-string/jumbo v0, "DBHandleCache: Initialized."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public declared-synchronized Cleanup()V
    .locals 5

    monitor-enter p0

    :cond_0
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->refMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->releaseReference()I

    move-result v1

    if-gtz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->getFileName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "DBHandle: Closing db \'%s\'"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->getDB()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :goto_1
    :try_start_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->fileMap:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :catch_0
    move-exception v0

    :try_start_3
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :cond_2
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized OpenDB(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenHelper;)Lcom/lumiyaviewer/lumiya/orm/DBHandle;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->fileMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;

    if-nez v0, :cond_0

    const-string/jumbo v0, "DBHandle: Opening db \'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {p2, p1}, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenHelper;->openOrCreateDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;

    invoke-direct {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;-><init>(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->fileMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/orm/DBHandle;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->getDB()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBHandle;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->acquireReference()V

    new-instance v2, Ljava/lang/ref/PhantomReference;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v2, v1, v3}, Ljava/lang/ref/PhantomReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->refMap:Ljava/util/Map;

    invoke-interface {v3, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized hasOpenHandles()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->fileMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->refMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    :goto_0
    xor-int/lit8 v0, v0, 0x1

    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
