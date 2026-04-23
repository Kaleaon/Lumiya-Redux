.class public Lcom/lumiyaviewer/lumiya/orm/InventoryDB;
.super Ljava/lang/Object;


# static fields
.field public static final MAX_UPDATES_PER_TRANSACTION:I = 0x10


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    return-void
.end method


# virtual methods
.method public beginTransaction()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransactionNonExclusive()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    goto :goto_0
.end method

.method public deleteEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->delete(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method

.method public endTransaction()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-void
.end method

.method public findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->find(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    return-object v0
.end method

.method public findEntryOrCreate(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>()V

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    :cond_0
    return-object v0
.end method

.method public findSpecialFolder(JI)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 7
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v2, "isFolder AND typeDefault = ? AND parent_id = ?"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>(Landroid/database/Cursor;)V

    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    return-object v0
.end method

.method public findSpecialFolder(Ljava/util/UUID;I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 6
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v2, "isFolder AND typeDefault = ? AND parentUUID_high = ? AND parentUUID_low = ?"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {p1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-virtual {p1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>(Landroid/database/Cursor;)V

    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    return-object v0
.end method

.method public getDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method public getSpecialFolderId(JI)J
    .locals 3

    invoke-virtual {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findSpecialFolder(JI)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public getSpecialFolderUUID(JI)Ljava/util/UUID;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findSpecialFolder(JI)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    :cond_0
    return-object v0
.end method

.method public loadEntry(J)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-direct {v0, v1, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>(Landroid/database/sqlite/SQLiteDatabase;J)V

    return-object v0
.end method

.method public resolveLink(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isLink()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    return-object v0

    :cond_0
    return-object p1
.end method

.method public retainChildren(JLjava/util/Set;)V
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v3, "Entries"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const-string/jumbo v5, "_id"

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-string/jumbo v5, "uuid_low"

    const/4 v6, 0x1

    aput-object v5, v4, v6

    const-string/jumbo v5, "uuid_high"

    const/4 v6, 0x2

    aput-object v5, v4, v6

    const-string/jumbo v5, "parent_id = ?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    aput-object v7, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "retainChildren: parentId = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p1

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", count = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const/4 v3, 0x0

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_1

    new-instance v4, Ljava/util/UUID;

    const/4 v5, 0x2

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    const/4 v5, 0x1

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    invoke-direct {v4, v8, v9, v10, v11}, Ljava/util/UUID;-><init>(JJ)V

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :goto_1
    return-void

    :cond_1
    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v2, 0x0

    move v5, v2

    :goto_2
    const/4 v2, 0x2

    if-ge v5, v2, :cond_4

    const/4 v2, 0x0

    :try_start_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->beginTransaction()V
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_1

    :try_start_3
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v4, v2

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v9, "Entries"

    const-string/jumbo v10, "_id = ?"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    const/4 v12, 0x0

    aput-object v2, v11, v12

    invoke-virtual {v8, v9, v10, v11}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v2, v4, 0x1

    const/16 v4, 0x10

    if-lt v2, v4, :cond_2

    const/4 v2, 0x0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->yieldIfContendedSafely()Z

    :cond_2
    move v4, v2

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->endTransaction()V
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_1

    :cond_4
    :try_start_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "retainChildren: parentId = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, p1

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, ", deleteCount = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_1

    :catchall_0
    move-exception v2

    :try_start_6
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->endTransaction()V

    throw v2
    :try_end_6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6 .. :try_end_6} :catch_1

    :catch_1
    move-exception v2

    :try_start_7
    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_0

    add-int/lit8 v2, v5, 0x1

    move v5, v2

    goto :goto_2
.end method

.method public saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->save(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method

.method public setTransactionSuccessful()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    return-void
.end method

.method public yieldIfContendedSafely()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->yieldIfContendedSafely()Z

    return-void
.end method
