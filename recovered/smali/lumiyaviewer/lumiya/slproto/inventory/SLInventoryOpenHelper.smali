.class public Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryOpenHelper;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenHelper;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryOpenHelper$InstanceHolder;
    }
.end annotation


# static fields
.field private static final DB_VERSION:I = 0x15


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private enableWriteAheadLogging(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4

    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string/jumbo v1, "enableWriteAheadLogging"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "Write-ahead logging is supported."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "Write-ahead logging not supported."

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string/jumbo v1, "Write-ahead logging not supported."

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception v0

    const-string/jumbo v1, "Write-ahead logging not supported."

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0

    :catch_3
    move-exception v0

    const-string/jumbo v0, "Write-ahead logging not supported."

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryOpenHelper;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryOpenHelper$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryOpenHelper;

    move-result-object v0

    return-object v0
.end method

.method private initTables(Landroid/database/sqlite/SQLiteDatabase;)Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    const/16 v10, 0x15

    const/4 v9, 0x1

    const/4 v3, 0x0

    const/4 v8, 0x0

    const-string/jumbo v0, "CREATE TABLE IF NOT EXISTS DBVersion (Version INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string/jumbo v1, "DBVersion"

    new-array v2, v9, [Ljava/lang/String;

    const-string/jumbo v0, "Version"

    aput-object v0, v2, v8

    move-object v0, p1

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eq v0, v10, :cond_4

    move v0, v8

    move v1, v9

    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    if-eqz v1, :cond_3

    const-string/jumbo v1, "Database needs upgrade."

    new-array v2, v8, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getCreateTableStatements()[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    :goto_1
    if-ge v8, v2, :cond_1

    aget-object v3, v1, v8

    const-string/jumbo v4, "Inventory init: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_0
    move v0, v9

    move v1, v9

    goto :goto_0

    :cond_1
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string/jumbo v2, "Version"

    const/16 v3, 0x15

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    if-eqz v0, :cond_2

    const-string/jumbo v0, "DBVersion"

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    :goto_2
    const-string/jumbo v0, "Upgraded database to version %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/16 v2, 0x15

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_3
    return v9

    :cond_2
    const-string/jumbo v0, "DBVersion"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    new-instance v1, Landroid/database/sqlite/SQLiteException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :cond_3
    const-string/jumbo v0, "Database does not need upgrade."

    new-array v1, v8, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    move v9, v8

    goto :goto_3

    :cond_4
    move v0, v8

    move v1, v8

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized openDB(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/orm/DBHandle;
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "Opening inventory DB \'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->getInstance()Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;

    move-result-object v0

    invoke-virtual {v0, p1, p0}, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;->OpenDB(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenHelper;)Lcom/lumiyaviewer/lumiya/orm/DBHandle;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catch_0
    move-exception v0

    :try_start_1
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public openOrCreateDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-static {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string/jumbo v1, "DB file \'%s\' opened"

    new-array v2, v5, [Ljava/lang/Object;

    aput-object p1, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryOpenHelper;->enableWriteAheadLogging(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryOpenHelper;->initTables(Landroid/database/sqlite/SQLiteDatabase;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "Reopening DB file \'%s\'"

    new-array v2, v5, [Ljava/lang/Object;

    aput-object p1, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    invoke-static {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryOpenHelper;->enableWriteAheadLogging(Landroid/database/sqlite/SQLiteDatabase;)V

    :cond_0
    return-object v0

    :cond_1
    new-instance v0, Landroid/database/sqlite/SQLiteException;

    const-string/jumbo v1, "DB was null"

    invoke-direct {v0, v1}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Landroid/database/sqlite/SQLiteException;

    const-string/jumbo v1, "DB was null"

    invoke-direct {v0, v1}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
