.class public Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;
.super Lcom/lumiyaviewer/lumiya/orm/DBObject;

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject$1;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;",
            ">;"
        }
    .end annotation
.end field

.field protected static final fieldNames:[Ljava/lang/String;

.field public static final insertQuery:Ljava/lang/String; = "INSERT INTO Entries (parent_id,uuid_high,uuid_low,parentUUID_high,parentUUID_low,name,isFolder,typeDefault,version,sessionID_high,sessionID_low,fetchFailed,description,flags,invType,assetType,creationDate,_blobField) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"

.field public static final insertUpdateParamCount:I = 0x12

.field public static final tableName:Ljava/lang/String; = "Entries"

.field public static final updateQuery:Ljava/lang/String; = "UPDATE Entries SET parent_id=?,uuid_high=?,uuid_low=?,parentUUID_high=?,parentUUID_low=?,name=?,isFolder=?,typeDefault=?,version=?,sessionID_high=?,sessionID_low=?,fetchFailed=?,description=?,flags=?,invType=?,assetType=?,creationDate=?,_blobField=?"


# instance fields
.field public agentUUID:Ljava/util/UUID;

.field public assetType:I

.field public assetUUID:Ljava/util/UUID;

.field public baseMask:I

.field public creationDate:I

.field public creatorUUID:Ljava/util/UUID;

.field public description:Ljava/lang/String;

.field public everyoneMask:I

.field public fetchFailed:Z

.field public flags:I

.field public groupMask:I

.field public groupUUID:Ljava/util/UUID;

.field public invType:I

.field public isFolder:Z

.field public isGroupOwned:Z

.field public lastOwnerUUID:Ljava/util/UUID;

.field public name:Ljava/lang/String;

.field public nextOwnerMask:I

.field public ownerMask:I

.field public ownerUUID:Ljava/util/UUID;

.field public parentUUID:Ljava/util/UUID;

.field public parent_id:J

.field public salePrice:I

.field public saleType:I

.field public sessionID:Ljava/util/UUID;

.field public typeDefault:I

.field public uuid:Ljava/util/UUID;

.field public version:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x13

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string/jumbo v1, "parent_id"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string/jumbo v1, "uuid_high"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string/jumbo v1, "uuid_low"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-string/jumbo v1, "parentUUID_high"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const-string/jumbo v1, "parentUUID_low"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-string/jumbo v1, "name"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string/jumbo v1, "isFolder"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    const-string/jumbo v1, "typeDefault"

    const/16 v2, 0x8

    aput-object v1, v0, v2

    const-string/jumbo v1, "version"

    const/16 v2, 0x9

    aput-object v1, v0, v2

    const-string/jumbo v1, "sessionID_high"

    const/16 v2, 0xa

    aput-object v1, v0, v2

    const-string/jumbo v1, "sessionID_low"

    const/16 v2, 0xb

    aput-object v1, v0, v2

    const-string/jumbo v1, "fetchFailed"

    const/16 v2, 0xc

    aput-object v1, v0, v2

    const-string/jumbo v1, "description"

    const/16 v2, 0xd

    aput-object v1, v0, v2

    const-string/jumbo v1, "flags"

    const/16 v2, 0xe

    aput-object v1, v0, v2

    const-string/jumbo v1, "invType"

    const/16 v2, 0xf

    aput-object v1, v0, v2

    const-string/jumbo v1, "assetType"

    const/16 v2, 0x10

    aput-object v1, v0, v2

    const-string/jumbo v1, "creationDate"

    const/16 v2, 0x11

    aput-object v1, v0, v2

    const-string/jumbo v1, "_blobField"

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->fieldNames:[Ljava/lang/String;

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/orm/DBObject;-><init>(Landroid/database/Cursor;)V

    return-void
.end method

.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/orm/DBObject;-><init>(Landroid/database/sqlite/SQLiteDatabase;J)V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 8

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/orm/DBObject;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->_id:J

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parent_id:J

    new-instance v0, Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v6

    invoke-direct {v0, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->uuid:Ljava/util/UUID;

    new-instance v0, Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v6

    invoke-direct {v0, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->agentUUID:Ljava/util/UUID;

    new-instance v0, Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v6

    invoke-direct {v0, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parentUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->name:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->isFolder:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->typeDefault:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->version:I

    new-instance v0, Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v6

    invoke-direct {v0, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->sessionID:Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->fetchFailed:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->description:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->flags:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->invType:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetType:I

    new-instance v0, Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v6

    invoke-direct {v0, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creationDate:I

    new-instance v0, Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v6

    invoke-direct {v0, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creatorUUID:Ljava/util/UUID;

    new-instance v0, Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v6

    invoke-direct {v0, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerUUID:Ljava/util/UUID;

    new-instance v0, Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v6

    invoke-direct {v0, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupUUID:Ljava/util/UUID;

    new-instance v0, Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v6

    invoke-direct {v0, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->lastOwnerUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    :goto_2
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->isGroupOwned:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->baseMask:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupMask:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerMask:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->nextOwnerMask:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->everyoneMask:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->saleType:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->salePrice:I

    return-void

    :cond_0
    move v0, v2

    goto/16 :goto_0

    :cond_1
    move v0, v2

    goto/16 :goto_1

    :cond_2
    move v1, v2

    goto :goto_2
.end method

.method public static getCreateTableStatements()[Ljava/lang/String;
    .locals 3

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "DROP TABLE IF EXISTS Entries;"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string/jumbo v1, "CREATE TABLE Entries (_id INTEGER PRIMARY KEY,parent_id BIGINT,uuid_high BIGINT,uuid_low BIGINT,parentUUID_high BIGINT,parentUUID_low BIGINT,name TEXT,isFolder BOOLEAN,typeDefault INTEGER,version INTEGER,sessionID_high BIGINT,sessionID_low BIGINT,fetchFailed BOOLEAN,description TEXT,flags INTEGER,invType INTEGER,assetType INTEGER,creationDate INTEGER,_blobField BLOB);"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string/jumbo v1, "CREATE INDEX Entries_parent_id ON Entries (parent_id);"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string/jumbo v1, "CREATE INDEX Entries_uuid ON Entries (uuid_high, uuid_low);"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method public static query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    const/4 v5, 0x0

    if-nez p0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    const-string/jumbo v1, "Database not opened"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const-string/jumbo v1, "Entries"

    sget-object v2, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->fieldNames:[Ljava/lang/String;

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v6, v5

    move-object v7, p3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public static query(Lcom/lumiyaviewer/lumiya/orm/DBHandle;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    const/4 v7, 0x0

    if-nez p0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    const-string/jumbo v1, "Database not opened"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/DBHandle;->getDB()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v3, "Entries"

    sget-object v4, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->fieldNames:[Ljava/lang/String;

    const/4 v2, 0x0

    move-object v1, p0

    move-object v5, p1

    move-object v6, p2

    move-object v8, v7

    move-object v9, p3

    move-object v10, v7

    invoke-virtual/range {v0 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->queryWithFactory(Landroid/database/sqlite/SQLiteDatabase$CursorFactory;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public bindInsertOrUpdate(Landroid/database/sqlite/SQLiteStatement;)V
    .locals 8

    const/4 v3, 0x2

    const/4 v2, 0x0

    const/4 v1, 0x1

    const-wide/16 v6, 0x0

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parent_id:J

    invoke-virtual {p1, v1, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->uuid:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v3, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    const/4 v0, 0x3

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parentUUID:Ljava/util/UUID;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    const/4 v0, 0x4

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    const/4 v0, 0x5

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->name:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->name:Ljava/lang/String;

    const/4 v3, 0x6

    invoke-virtual {p1, v3, v0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    :goto_2
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->isFolder:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    int-to-long v4, v0

    const/4 v0, 0x7

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->typeDefault:I

    int-to-long v4, v0

    const/16 v0, 0x8

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->version:I

    int-to-long v4, v0

    const/16 v0, 0x9

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->sessionID:Ljava/util/UUID;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->sessionID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    const/16 v0, 0xa

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->sessionID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    const/16 v0, 0xb

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    :goto_4
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->fetchFailed:Z

    if-eqz v0, :cond_5

    move v0, v1

    :goto_5
    int-to-long v4, v0

    const/16 v0, 0xc

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->description:Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->description:Ljava/lang/String;

    const/16 v3, 0xd

    invoke-virtual {p1, v3, v0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    :goto_6
    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->flags:I

    int-to-long v4, v0

    const/16 v0, 0xe

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->invType:I

    int-to-long v4, v0

    const/16 v0, 0xf

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetType:I

    int-to-long v4, v0

    const/16 v0, 0x10

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creationDate:I

    int-to-long v4, v0

    const/16 v0, 0x11

    invoke-virtual {p1, v0, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/16 v0, 0x7d

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->agentUUID:Ljava/util/UUID;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_7
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetUUID:Ljava/util/UUID;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_8
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creatorUUID:Ljava/util/UUID;

    if-eqz v3, :cond_9

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creatorUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creatorUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_9
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerUUID:Ljava/util/UUID;

    if-eqz v3, :cond_a

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_a
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupUUID:Ljava/util/UUID;

    if-eqz v3, :cond_b

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_b
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->lastOwnerUUID:Ljava/util/UUID;

    if-eqz v3, :cond_c

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->lastOwnerUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->lastOwnerUUID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_c
    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->isGroupOwned:Z

    if-eqz v3, :cond_d

    :goto_d
    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->baseMask:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupMask:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerMask:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->nextOwnerMask:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->everyoneMask:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->saleType:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->salePrice:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    const/16 v1, 0x12

    invoke-virtual {p1, v1, v0}, Landroid/database/sqlite/SQLiteStatement;->bindBlob(I[B)V

    return-void

    :cond_0
    invoke-virtual {p1, v3, v6, v7}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v0, 0x3

    invoke-virtual {p1, v0, v6, v7}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    goto/16 :goto_0

    :cond_1
    const/4 v0, 0x4

    invoke-virtual {p1, v0, v6, v7}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v0, 0x5

    invoke-virtual {p1, v0, v6, v7}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    goto/16 :goto_1

    :cond_2
    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteStatement;->bindNull(I)V

    goto/16 :goto_2

    :cond_3
    move v0, v2

    goto/16 :goto_3

    :cond_4
    const/16 v0, 0xa

    invoke-virtual {p1, v0, v6, v7}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/16 v0, 0xb

    invoke-virtual {p1, v0, v6, v7}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    goto/16 :goto_4

    :cond_5
    move v0, v2

    goto/16 :goto_5

    :cond_6
    const/16 v0, 0xd

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteStatement;->bindNull(I)V

    goto/16 :goto_6

    :cond_7
    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_7

    :cond_8
    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_8

    :cond_9
    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_9

    :cond_a
    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_a

    :cond_b
    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_b

    :cond_c
    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_c

    :cond_d
    move v1, v2

    goto/16 :goto_d
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getContentValues()Landroid/content/ContentValues;
    .locals 8

    const-wide/16 v6, 0x0

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string/jumbo v0, "parent_id"

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parent_id:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->uuid:Ljava/util/UUID;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "uuid_high"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->uuid:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string/jumbo v0, "uuid_low"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->uuid:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parentUUID:Ljava/util/UUID;

    if-eqz v0, :cond_1

    const-string/jumbo v0, "parentUUID_high"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parentUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string/jumbo v0, "parentUUID_low"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parentUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :goto_1
    const-string/jumbo v0, "name"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->name:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "isFolder"

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->isFolder:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo v0, "typeDefault"

    iget v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->typeDefault:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string/jumbo v0, "version"

    iget v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->version:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->sessionID:Ljava/util/UUID;

    if-eqz v0, :cond_2

    const-string/jumbo v0, "sessionID_high"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->sessionID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string/jumbo v0, "sessionID_low"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->sessionID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :goto_2
    const-string/jumbo v0, "fetchFailed"

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->fetchFailed:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo v0, "description"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->description:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "flags"

    iget v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->flags:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string/jumbo v0, "invType"

    iget v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->invType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string/jumbo v0, "assetType"

    iget v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string/jumbo v0, "creationDate"

    iget v2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creationDate:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const/16 v0, 0x7d

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->agentUUID:Ljava/util/UUID;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetUUID:Ljava/util/UUID;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creatorUUID:Ljava/util/UUID;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creatorUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creatorUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerUUID:Ljava/util/UUID;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupUUID:Ljava/util/UUID;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->lastOwnerUUID:Ljava/util/UUID;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->lastOwnerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->lastOwnerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    :goto_8
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->isGroupOwned:Z

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    :goto_9
    int-to-byte v0, v0

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->baseMask:I

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupMask:I

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerMask:I

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->nextOwnerMask:I

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->everyoneMask:I

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->saleType:I

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->salePrice:I

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    const-string/jumbo v0, "_blobField"

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    return-object v1

    :cond_0
    const-string/jumbo v0, "uuid_high"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string/jumbo v0, "uuid_low"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto/16 :goto_0

    :cond_1
    const-string/jumbo v0, "parentUUID_high"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string/jumbo v0, "parentUUID_low"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto/16 :goto_1

    :cond_2
    const-string/jumbo v0, "sessionID_high"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string/jumbo v0, "sessionID_low"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto/16 :goto_2

    :cond_3
    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_3

    :cond_4
    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_4

    :cond_5
    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_5

    :cond_6
    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_6

    :cond_7
    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_7

    :cond_8
    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto/16 :goto_8

    :cond_9
    const/4 v0, 0x0

    goto/16 :goto_9
.end method

.method public getFieldNames()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->fieldNames:[Ljava/lang/String;

    return-object v0
.end method

.method public getTableName()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "Entries"

    return-object v0
.end method

.method public loadFromCursor(Landroid/database/Cursor;)V
    .locals 8

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->_id:J

    const/4 v0, 0x2

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parent_id:J

    new-instance v3, Ljava/util/UUID;

    const/4 v4, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    const/4 v0, 0x4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-direct {v3, v6, v7, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->uuid:Ljava/util/UUID;

    new-instance v3, Ljava/util/UUID;

    const/4 v4, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    const/4 v0, 0x6

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-direct {v3, v6, v7, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parentUUID:Ljava/util/UUID;

    const/4 v3, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->name:Ljava/lang/String;

    const/16 v4, 0x8

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->isFolder:Z

    const/16 v0, 0x9

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->typeDefault:I

    const/16 v3, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->version:I

    new-instance v0, Ljava/util/UUID;

    const/16 v4, 0xb

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    const/16 v3, 0xc

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-direct {v0, v6, v7, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->sessionID:Ljava/util/UUID;

    const/16 v4, 0xd

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->fetchFailed:Z

    const/16 v0, 0xe

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->description:Ljava/lang/String;

    const/16 v3, 0xf

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->flags:I

    const/16 v0, 0x10

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->invType:I

    const/16 v3, 0x11

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetType:I

    const/16 v0, 0x12

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creationDate:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    new-instance v3, Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    invoke-direct {v3, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->agentUUID:Ljava/util/UUID;

    new-instance v3, Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    invoke-direct {v3, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetUUID:Ljava/util/UUID;

    new-instance v3, Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    invoke-direct {v3, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creatorUUID:Ljava/util/UUID;

    new-instance v3, Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    invoke-direct {v3, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerUUID:Ljava/util/UUID;

    new-instance v3, Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    invoke-direct {v3, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupUUID:Ljava/util/UUID;

    new-instance v3, Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    invoke-direct {v3, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->lastOwnerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    if-eqz v3, :cond_2

    :goto_2
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->isGroupOwned:Z

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->baseMask:I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupMask:I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerMask:I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->nextOwnerMask:I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->everyoneMask:I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->saleType:I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->salePrice:I

    return-void

    :cond_0
    move v0, v2

    goto/16 :goto_0

    :cond_1
    move v0, v2

    goto/16 :goto_1

    :cond_2
    move v1, v2

    goto :goto_2
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 8

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-wide/16 v6, 0x0

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->_id:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parent_id:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->uuid:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->agentUUID:Ljava/util/UUID;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parentUUID:Ljava/util/UUID;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->parentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    :goto_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->isFolder:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->typeDefault:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->version:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->sessionID:Ljava/util/UUID;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->sessionID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->sessionID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    :goto_4
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->fetchFailed:Z

    if-eqz v0, :cond_5

    move v0, v1

    :goto_5
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->invType:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetType:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetUUID:Ljava/util/UUID;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    :goto_6
    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creationDate:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creatorUUID:Ljava/util/UUID;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creatorUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->creatorUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    :goto_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerUUID:Ljava/util/UUID;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    :goto_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupUUID:Ljava/util/UUID;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    :goto_9
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->lastOwnerUUID:Ljava/util/UUID;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->lastOwnerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->lastOwnerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    :goto_a
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->isGroupOwned:Z

    if-eqz v0, :cond_b

    :goto_b
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->baseMask:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->groupMask:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->ownerMask:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->nextOwnerMask:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->everyoneMask:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->saleType:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->salePrice:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    return-void

    :cond_0
    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_0

    :cond_1
    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_1

    :cond_2
    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_2

    :cond_3
    move v0, v2

    goto/16 :goto_3

    :cond_4
    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_4

    :cond_5
    move v0, v2

    goto/16 :goto_5

    :cond_6
    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_6

    :cond_7
    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_7

    :cond_8
    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_8

    :cond_9
    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_9

    :cond_a
    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    invoke-virtual {p1, v6, v7}, Landroid/os/Parcel;->writeLong(J)V

    goto :goto_a

    :cond_b
    move v1, v2

    goto :goto_b
.end method
