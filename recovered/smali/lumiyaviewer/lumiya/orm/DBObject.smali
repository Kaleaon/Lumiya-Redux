.class public abstract Lcom/lumiyaviewer/lumiya/orm/DBObject;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
    }
.end annotation


# instance fields
.field protected _id:J


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->loadFromCursor(Landroid/database/Cursor;)V

    return-void
.end method

.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    const/4 v5, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "database not opened."

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getTableName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getFieldNames()[Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "_id = ?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    const/4 v6, 0x0

    aput-object v0, v4, v6

    move-object v0, p1

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getClass()Ljava/lang/Class;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "not found: _id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    throw v0

    :cond_1
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->loadFromCursor(Landroid/database/Cursor;)V

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    return-void
.end method


# virtual methods
.method protected UUIDfromBlob([B)Ljava/util/UUID;
    .locals 6

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    new-instance v1, Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v2

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    return-object v1
.end method

.method protected UUIDtoBlob(Ljava/util/UUID;)[B
    .locals 4

    const/16 v0, 0x10

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public abstract bindInsertOrUpdate(Landroid/database/sqlite/SQLiteStatement;)V
.end method

.method public delete(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    if-nez p1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "database not opened."

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getTableName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "_id = ?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_1
    return-void
.end method

.method public abstract getContentValues()Landroid/content/ContentValues;
.end method

.method protected abstract getFieldNames()[Ljava/lang/String;
.end method

.method public getId()J
    .locals 2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J

    return-wide v0
.end method

.method protected abstract getTableName()Ljava/lang/String;
.end method

.method public abstract loadFromCursor(Landroid/database/Cursor;)V
.end method

.method public reload(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    const/4 v5, 0x0

    if-nez p1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "database not opened."

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getTableName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getFieldNames()[Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "_id = ?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    const/4 v6, 0x0

    aput-object v0, v4, v6

    move-object v0, p1

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->loadFromCursor(Landroid/database/Cursor;)V

    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    return-void
.end method

.method public resetId()V
    .locals 2

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J

    return-void
.end method

.method public save(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    if-nez p1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "database not opened."

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getTableName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getContentValues()Landroid/content/ContentValues;

    move-result-object v1

    :try_start_0
    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    const-string/jumbo v2, "_id = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_1
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string/jumbo v3, "insert or update failed"

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1
.end method

.method protected updateOrInsert(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    if-nez p1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "database not opened."

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getTableName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getContentValues()Landroid/content/ContentValues;

    move-result-object v1

    :try_start_0
    invoke-virtual {p1, v0, v1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-void

    :catch_0
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string/jumbo v3, "insert or update failed"

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1
.end method

.method protected updateOrInsert(Landroid/database/sqlite/SQLiteStatement;Landroid/database/sqlite/SQLiteStatement;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->bindInsertOrUpdate(Landroid/database/sqlite/SQLiteStatement;)V

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->executeUpdateDelete()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->bindInsertOrUpdate(Landroid/database/sqlite/SQLiteStatement;)V

    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBObject;->_id:J
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string/jumbo v3, "insert or update failed"

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1
.end method
