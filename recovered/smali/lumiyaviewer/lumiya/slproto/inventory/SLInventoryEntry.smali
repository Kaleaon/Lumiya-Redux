.class public Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
.super Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry$1;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private static final DELIM_ANY:Ljava/lang/String; = " \t\n"

.field private static final DELIM_EOL:Ljava/lang/String; = "\n"

.field public static final FT_ANIMATION:I = 0x14

.field public static final FT_BASIC_ROOT:I = 0x34

.field public static final FT_BODYPART:I = 0xd

.field public static final FT_CALLINGCARD:I = 0x2

.field public static final FT_CLOTHING:I = 0x5

.field public static final FT_CURRENT_OUTFIT:I = 0x2e

.field public static final FT_ENSEMBLE_END:I = 0x2d

.field public static final FT_ENSEMBLE_START:I = 0x1a

.field public static final FT_FAVORITE:I = 0x17

.field public static final FT_GESTURE:I = 0x15

.field public static final FT_INBOX:I = 0x32

.field public static final FT_LANDMARK:I = 0x3

.field public static final FT_LOST_AND_FOUND:I = 0x10

.field public static final FT_LSL_TEXT:I = 0xa

.field public static final FT_MESH:I = 0x31

.field public static final FT_MY_OUTFITS:I = 0x30

.field public static final FT_NOTECARD:I = 0x7

.field public static final FT_OBJECT:I = 0x6

.field public static final FT_OUTBOX:I = 0x33

.field public static final FT_OUTFIT:I = 0x2f

.field public static final FT_ROOT_INVENTORY:I = 0x8

.field public static final FT_SNAPSHOT_CATEGORY:I = 0xf

.field public static final FT_SOUND:I = 0x1

.field public static final FT_TEXTURE:I = 0x0

.field public static final FT_TRASH:I = 0xe

.field public static final II_FLAGS_WEARABLES_MASK:I = 0xff

.field public static final IT_ANIMATION:I = 0x13

.field public static final IT_ATTACHMENT:I = 0x11

.field public static final IT_BODYPART:I = 0xd

.field public static final IT_CALLINGCARD:I = 0x2

.field public static final IT_CATEGORY:I = 0x8

.field public static final IT_CLOTHING:I = 0x5

.field public static final IT_COUNT:I = 0x15

.field public static final IT_GESTURE:I = 0x14

.field public static final IT_LANDMARK:I = 0x3

.field public static final IT_LOST_AND_FOUND:I = 0x10

.field public static final IT_LSL:I = 0xa

.field public static final IT_LSL_BYTECODE:I = 0xb

.field public static final IT_NOTECARD:I = 0x7

.field public static final IT_OBJECT:I = 0x6

.field public static final IT_ROOT_CATEGORY:I = 0x9

.field public static final IT_SCRIPT:I = 0x4

.field public static final IT_SNAPSHOT:I = 0xf

.field public static final IT_SOUND:I = 0x1

.field public static final IT_TEXTURE:I = 0x0

.field public static final IT_TEXTURE_TGA:I = 0xc

.field public static final IT_TRASH:I = 0xe

.field public static final IT_WEARABLE:I = 0x12

.field public static final PERM_COPY:I = 0x8000

.field public static final PERM_FULL:I = 0x7fffffff

.field public static final PERM_MODIFY:I = 0x4000

.field public static final PERM_TRANSFER:I = 0x2000


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;-><init>(Landroid/database/Cursor;)V

    return-void
.end method

.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;-><init>(Landroid/database/sqlite/SQLiteDatabase;J)V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/orm/DBHandle;J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/DBHandle;->getDB()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    :cond_0
    invoke-direct {p0, v0, p2, p3}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;-><init>(Landroid/database/sqlite/SQLiteDatabase;J)V

    return-void
.end method

.method public static find(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 9

    const/4 v8, 0x0

    :try_start_0
    const-string/jumbo v1, "Entries"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->fieldNames:[Ljava/lang/String;

    const-string/jumbo v3, "uuid_low = ? AND uuid_high = ?"

    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    invoke-virtual {p1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-virtual {p1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x1

    aput-object v0, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>(Landroid/database/Cursor;)V

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    return-object v1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    return-object v8

    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    return-object v8
.end method

.method public static findOrCreate(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    const/4 v5, 0x0

    if-nez p0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const-string/jumbo v2, "database is null"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    throw v0

    :cond_0
    if-nez p1, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const-string/jumbo v2, "folderUUID is null"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string/jumbo v1, "Entries"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->fieldNames:[Ljava/lang/String;

    const-string/jumbo v3, "uuid_low = ? AND uuid_high = ?"

    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    invoke-virtual {p1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    const/4 v6, 0x0

    aput-object v0, v4, v6

    invoke-virtual {p1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    const/4 v6, 0x1

    aput-object v0, v4, v6

    move-object v0, p0

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>(Landroid/database/Cursor;)V

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    return-object v1

    :cond_2
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>()V

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public static findOrCreateForUpdate(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v5, 0x0

    if-nez p0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const-string/jumbo v2, "database is null"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    throw v0

    :cond_0
    if-nez p1, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const-string/jumbo v2, "folderUUID is null"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string/jumbo v1, "Entries"

    new-array v2, v9, [Ljava/lang/String;

    const-string/jumbo v0, "_id"

    aput-object v0, v2, v8

    const-string/jumbo v3, "uuid_low = ? AND uuid_high = ?"

    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    invoke-virtual {p1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v8

    invoke-virtual {p1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v9

    move-object v0, p0

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>()V

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->_id:J

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    return-object v1

    :cond_2
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>()V

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method private static getDrawableResourceForType(I)I
    .locals 1

    packed-switch p0, :pswitch_data_0

    const/4 v0, -0x1

    return v0

    :pswitch_0
    const v0, 0x7f0200c3

    return v0

    :pswitch_1
    const v0, 0x7f0200c2

    return v0

    :pswitch_2
    const v0, 0x7f0200ca

    return v0

    :pswitch_3
    const v0, 0x7f0200cd

    return v0

    :pswitch_4
    const v0, 0x7f0200c8

    return v0

    :pswitch_5
    const v0, 0x7f0200bf

    return v0

    :pswitch_6
    const v0, 0x7f0200c6

    return v0

    :pswitch_7
    const v0, 0x7f0200c5

    return v0

    :pswitch_8
    const v0, 0x7f0200c0

    return v0

    :pswitch_9
    const v0, 0x7f0200c1

    return v0

    :pswitch_a
    const v0, 0x7f0200cb

    return v0

    :pswitch_b
    const v0, 0x7f0200c7

    return v0

    :pswitch_c
    const v0, 0x7f0200bd

    return v0

    :pswitch_d
    const v0, 0x7f0200c9

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_8
        :pswitch_4
        :pswitch_4
        :pswitch_1
        :pswitch_9
        :pswitch_a
        :pswitch_1
        :pswitch_b
        :pswitch_5
        :pswitch_5
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method

.method public static getInsertStatement(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteStatement;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    if-nez p0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    const-string/jumbo v1, "Database is closed"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    const-string/jumbo v1, "Database is closed"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :try_start_0
    const-string/jumbo v0, "INSERT INTO Entries (parent_id,uuid_high,uuid_low,parentUUID_high,parentUUID_low,name,isFolder,typeDefault,version,sessionID_high,sessionID_low,fetchFailed,description,flags,invType,assetType,creationDate,_blobField) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1
.end method

.method public static getUpdateStatement(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteStatement;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    if-nez p0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    const-string/jumbo v1, "Database is closed"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    const-string/jumbo v1, "Database is closed"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :try_start_0
    const-string/jumbo v0, "UPDATE Entries SET parent_id=?,uuid_high=?,uuid_low=?,parentUUID_high=?,parentUUID_low=?,name=?,isFolder=?,typeDefault=?,version=?,sessionID_high=?,sessionID_low=?,fetchFailed=?,description=?,flags=?,invType=?,assetType=?,creationDate=?,_blobField=? WHERE uuid_high = ? AND uuid_low = ?"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1
.end method

.method private static parsePermissions(Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
        }
    .end annotation

    const-string/jumbo v0, "{"

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    :goto_0
    const-string/jumbo v0, " \t\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    const-string/jumbo v1, "base_mask"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getHexToken(Ljava/lang/String;)I

    move-result v0

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    goto :goto_0

    :cond_1
    const-string/jumbo v1, "owner_mask"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getHexToken(Ljava/lang/String;)I

    move-result v0

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    goto :goto_0

    :cond_2
    const-string/jumbo v1, "group_mask"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getHexToken(Ljava/lang/String;)I

    move-result v0

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    goto :goto_0

    :cond_3
    const-string/jumbo v1, "everyone_mask"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getHexToken(Ljava/lang/String;)I

    move-result v0

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    goto :goto_0

    :cond_4
    const-string/jumbo v1, "next_owner_mask"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getHexToken(Ljava/lang/String;)I

    move-result v0

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    goto :goto_0

    :cond_5
    const-string/jumbo v1, "creator_id"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    goto/16 :goto_0

    :cond_6
    const-string/jumbo v1, "owner_id"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    goto/16 :goto_0

    :cond_7
    const-string/jumbo v1, "last_owner_id"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->lastOwnerUUID:Ljava/util/UUID;

    goto/16 :goto_0

    :cond_8
    const-string/jumbo v1, "group_id"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupUUID:Ljava/util/UUID;

    goto/16 :goto_0

    :cond_9
    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_0
.end method

.method private static parseSaleInfo(Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
        }
    .end annotation

    const-string/jumbo v0, "{"

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    :goto_0
    const-string/jumbo v0, " \t\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    const-string/jumbo v1, "sale_type"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->getByString(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->getTypeCode()I

    move-result v0

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->saleType:I

    goto :goto_0

    :cond_1
    const-string/jumbo v1, "sale_price"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getIntToken(Ljava/lang/String;)I

    move-result v0

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->salePrice:I

    goto :goto_0

    :cond_2
    const-string/jumbo v0, "\n"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0
.end method

.method public static parseString(Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>()V

    const-string/jumbo v1, "{"

    const-string/jumbo v2, "\n"

    invoke-virtual {p0, v1, v2}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    :goto_0
    const-string/jumbo v1, " \t\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v0

    :cond_0
    const-string/jumbo v2, "item_id"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    goto :goto_0

    :cond_1
    const-string/jumbo v2, "parent_id"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    goto :goto_0

    :cond_2
    const-string/jumbo v2, "asset_id"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    goto :goto_0

    :cond_3
    const-string/jumbo v2, "type"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByString(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    goto :goto_0

    :cond_4
    const-string/jumbo v2, "inv_type"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getByString(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    goto/16 :goto_0

    :cond_5
    const-string/jumbo v2, "flags"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getHexToken(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    goto/16 :goto_0

    :cond_6
    const-string/jumbo v2, "name"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getPipeTerminatedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    goto/16 :goto_0

    :cond_7
    const-string/jumbo v2, "desc"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getPipeTerminatedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    goto/16 :goto_0

    :cond_8
    const-string/jumbo v2, "creation_date"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getIntToken(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creationDate:I

    goto/16 :goto_0

    :cond_9
    const-string/jumbo v2, "permissions"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parsePermissions(Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto/16 :goto_0

    :cond_a
    const-string/jumbo v2, "sale_info"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parseSaleInfo(Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto/16 :goto_0

    :cond_b
    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_0
.end method

.method public static query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 2

    const/4 v1, 0x0

    if-nez p0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;->printStackTrace()V

    return-object v1
.end method

.method public static query(Lcom/lumiyaviewer/lumiya/orm/DBHandle;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 2

    const/4 v1, 0x0

    if-nez p0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->query(Lcom/lumiyaviewer/lumiya/orm/DBHandle;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;->printStackTrace()V

    return-object v1
.end method


# virtual methods
.method public getActionDescriptionResId()I
    .locals 2

    const v1, 0x7f09004d

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getActionDescription()I

    move-result v0

    return v0

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sparse-switch v0, :sswitch_data_0

    const/4 v0, -0x1

    return v0

    :sswitch_0
    const v0, 0x7f09004f

    return v0

    :sswitch_1
    return v1

    :sswitch_2
    return v1

    :sswitch_3
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_1

    const v0, 0x7f090050

    return v0

    :cond_1
    :sswitch_4
    const v0, 0x7f09004e

    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_3
        0x3 -> :sswitch_0
        0x6 -> :sswitch_4
        0x7 -> :sswitch_1
        0xa -> :sswitch_2
        0xf -> :sswitch_3
    .end sparse-switch
.end method

.method public getDrawableResource()I
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v0, :cond_0

    const v0, 0x7f0200c0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isLink()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getDrawableResource()I

    move-result v0

    return v0

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getDrawableResourceForType(I)I

    move-result v0

    return v0
.end method

.method public getReadableTextForLink()Ljava/lang/String;
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getReadableName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSubtypeDrawableResource()I
    .locals 2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    sparse-switch v0, :sswitch_data_0

    :cond_0
    const/4 v0, -0x1

    return v0

    :sswitch_0
    const v0, 0x7f0200c2

    return v0

    :sswitch_1
    const v0, 0x7f0200ca

    return v0

    :sswitch_2
    const v0, 0x7f0200cd

    return v0

    :sswitch_3
    const v0, 0x7f0200c3

    return v0

    :sswitch_4
    const v0, 0x7f0200bf

    return v0

    :sswitch_5
    const v0, 0x7f0200c5

    return v0

    :sswitch_6
    const v0, 0x7f0200c6

    return v0

    :sswitch_7
    const v0, 0x7f0200c8

    return v0

    :sswitch_8
    const v0, 0x7f0200c1

    return v0

    :sswitch_9
    const v0, 0x7f0200cb

    return v0

    :sswitch_a
    const v0, 0x7f0200c7

    return v0

    :sswitch_b
    const v0, 0x7f0200bd

    return v0

    :sswitch_c
    const v0, 0x7f0200c9

    return v0

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-eq v0, v1, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_0

    :cond_2
    const v0, 0x7f0200c4

    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x5 -> :sswitch_4
        0x6 -> :sswitch_6
        0x7 -> :sswitch_5
        0xa -> :sswitch_7
        0xd -> :sswitch_8
        0xe -> :sswitch_9
        0xf -> :sswitch_0
        0x10 -> :sswitch_a
        0x14 -> :sswitch_b
        0x15 -> :sswitch_c
        0x17 -> :sswitch_3
        0x2e -> :sswitch_4
        0x2f -> :sswitch_4
        0x30 -> :sswitch_4
        0x31 -> :sswitch_6
    .end sparse-switch
.end method

.method public getTypeDescriptionResId()I
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeDescription()I

    move-result v0

    return v0

    :cond_0
    const v0, 0x7f090078

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    packed-switch v1, :pswitch_data_0

    :goto_0
    return v0

    :pswitch_0
    const v0, 0x7f090075

    goto :goto_0

    :pswitch_1
    const v0, 0x7f090074

    goto :goto_0

    :pswitch_2
    const v0, 0x7f090065

    goto :goto_0

    :pswitch_3
    const v0, 0x7f090069

    goto :goto_0

    :pswitch_4
    const v0, 0x7f090071

    goto :goto_0

    :pswitch_5
    const v0, 0x7f090066

    goto :goto_0

    :pswitch_6
    const v0, 0x7f09006f

    goto :goto_0

    :pswitch_7
    const v0, 0x7f09006e

    goto :goto_0

    :pswitch_8
    const v0, 0x7f090067

    goto :goto_0

    :pswitch_9
    const v0, 0x7f090070

    goto :goto_0

    :pswitch_a
    const v0, 0x7f09006c

    goto :goto_0

    :pswitch_b
    const v0, 0x7f09006d

    goto :goto_0

    :pswitch_c
    const v0, 0x7f090076

    goto :goto_0

    :pswitch_d
    const v0, 0x7f090064

    goto :goto_0

    :pswitch_e
    const v0, 0x7f090077

    goto :goto_0

    :pswitch_f
    const v0, 0x7f090073

    goto :goto_0

    :pswitch_10
    const v0, 0x7f09006b

    goto :goto_0

    :pswitch_11
    const v0, 0x7f090063

    goto :goto_0

    :pswitch_12
    const v0, 0x7f090079

    goto :goto_0

    :pswitch_13
    const v0, 0x7f090062

    goto :goto_0

    :pswitch_14
    const v0, 0x7f090068

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
    .end packed-switch
.end method

.method public isAnimation()Z
    .locals 3

    const/4 v2, 0x1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_0

    return v2

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    const/16 v1, 0x13

    if-ne v0, v1, :cond_1

    return v2

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public isCopyable()Z
    .locals 3

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    and-int/2addr v1, v2

    const v2, 0x8000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public isFolderOrFolderLink()Z
    .locals 3

    const/4 v0, 0x1

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-nez v1, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v2

    if-ne v1, v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLink()Z
    .locals 3

    const/4 v0, 0x1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v2

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v2

    if-ne v1, v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isWearable()Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v3

    if-eq v2, v3, :cond_0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v3

    if-ne v2, v3, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v3

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v3

    if-eq v2, v3, :cond_0

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method public updateOrInsert(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    const-string/jumbo v0, "uuid_low = ? AND uuid_high = ?"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-super {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->updateOrInsert(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method public updateOrInsert(Landroid/database/sqlite/SQLiteStatement;Landroid/database/sqlite/SQLiteStatement;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v0

    const/16 v2, 0x13

    invoke-virtual {p1, v2, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    const/16 v2, 0x14

    invoke-virtual {p1, v2, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryDBObject;->updateOrInsert(Landroid/database/sqlite/SQLiteStatement;Landroid/database/sqlite/SQLiteStatement;)V

    return-void
.end method

.method public whatIsItemWornOn(Lcom/google/common/collect/ImmutableMap;Lcom/google/common/collect/Table;Z)Ljava/lang/Object;
    .locals 6
    .param p1    # Lcom/google/common/collect/ImmutableMap;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/google/common/collect/Table;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;Z)",
            "Ljava/lang/Object;"
        }
    .end annotation

    const/4 v5, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_3

    if-eqz p2, :cond_9

    invoke-interface {p2}, Lcom/google/common/collect/Table;->cellSet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Table$Cell;

    invoke-interface {v0}, Lcom/google/common/collect/Table$Cell;->getRowKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    invoke-interface {v0}, Lcom/google/common/collect/Table$Cell;->getColumnKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/UUID;

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    if-eqz p3, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isBodyPart()Z

    move-result v4

    if-eqz v4, :cond_0

    :cond_1
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v2, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    return-object v1

    :cond_2
    invoke-interface {v0}, Lcom/google/common/collect/Table$Cell;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->itemID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v0, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object v1

    :cond_3
    if-eqz p1, :cond_9

    if-nez p3, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    :cond_4
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-eq v0, v1, :cond_5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_7

    :cond_5
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    and-int/lit16 v0, v0, 0xff

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getByCode(I)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v0

    if-eqz v0, :cond_9

    if-eqz p2, :cond_9

    if-eqz p3, :cond_6

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isBodyPart()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_6

    return-object v5

    :cond_6
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-interface {p2, v0, v1}, Lcom/google/common/collect/Table;->contains(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    return-object v0

    :cond_7
    if-eqz p1, :cond_9

    if-nez p3, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_8
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    :cond_9
    return-object v5
.end method
