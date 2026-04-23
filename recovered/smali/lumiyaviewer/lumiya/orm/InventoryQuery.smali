.class public abstract Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/orm/InventoryQuery$1;
    }
.end annotation


# static fields
.field private static final ASSET_TYPE_ANY:I = -0x1

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;",
            ">;"
        }
    .end annotation
.end field

.field private static final FOLDER_TYPE_ANY:I = -0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/util/UUID;Ljava/lang/String;ZZZI)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
    .locals 8
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;

    const/4 v6, -0x1

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;-><init>(Ljava/util/UUID;Ljava/lang/String;ZZZII)V

    return-object v0
.end method

.method public static create(Ljava/util/UUID;Ljava/lang/String;ZZZLcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
    .locals 8
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v6, -0x1

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;

    if-eqz p5, :cond_0

    invoke-virtual {p5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v7

    :goto_0
    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;-><init>(Ljava/util/UUID;Ljava/lang/String;ZZZII)V

    return-object v0

    :cond_0
    move v7, v6

    goto :goto_0
.end method

.method public static findFolderWithType(Ljava/util/UUID;I)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
    .locals 8
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v7, -0x1

    move-object v1, p0

    move v5, v4

    move v6, p1

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;-><init>(Ljava/util/UUID;Ljava/lang/String;ZZZII)V

    return-object v0
.end method


# virtual methods
.method public abstract assetType()I
.end method

.method public abstract containsString()Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public abstract folderId()Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract folderType()I
.end method

.method public abstract includeFolders()Z
.end method

.method public abstract includeItems()Z
.end method

.method public abstract newestFirst()Z
.end method

.method public query(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/orm/InventoryDB;)Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;
    .locals 10
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    const/4 v9, 0x2

    const/4 v8, -0x1

    const/4 v2, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_0

    const-string/jumbo v0, "parent_id = ?"

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->containsString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "name LIKE ?"

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "%"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "%"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->includeFolders()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->includeItems()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_6

    const-string/jumbo v0, "(isFolder OR (invType == %d AND assetType == %d))"

    new-array v1, v9, [Ljava/lang/Object;

    const/16 v5, 0x8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v7

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->folderType()I

    move-result v0

    if-eq v0, v8, :cond_3

    const-string/jumbo v0, "(typeDefault = ?)"

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->folderType()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string/jumbo v0, "isFolder"

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->assetType()I

    move-result v0

    if-eq v0, v8, :cond_4

    const-string/jumbo v0, "(isFolder OR assetType == %d)"

    new-array v1, v7, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->assetType()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v6

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    const-string/jumbo v5, "isFolder DESC, (isFolder AND (typeDefault >= 0)) DESC, (assetType == 25) DESC"

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->newestFirst()Z

    move-result v0

    if-eqz v0, :cond_7

    const-string/jumbo v0, "creationDate DESC, name"

    move-object v1, v0

    :goto_1
    const-string/jumbo v0, " AND "

    invoke-static {v0}, Lcom/google/common/base/Joiner;->on(Ljava/lang/String;)Lcom/google/common/base/Joiner;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    const-class v0, Ljava/lang/String;

    invoke-static {v4, v0}, Lcom/google/common/collect/Iterables;->toArray(Ljava/lang/Iterable;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    if-eqz p1, :cond_5

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    :cond_5
    new-instance v4, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v7, ", "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v3, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-direct {v4, v2, p1, v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Landroid/database/Cursor;)V

    return-object v4

    :cond_6
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->includeItems()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->includeFolders()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    const-string/jumbo v0, "(NOT (isFolder OR (invType == %d AND assetType == %d)))"

    new-array v1, v9, [Ljava/lang/Object;

    const/16 v5, 0x8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v7

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_7
    const-string/jumbo v0, "name, creationDate DESC"

    move-object v1, v0

    goto :goto_1
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->folderId()Ljava/util/UUID;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string/jumbo v2, "folderId"

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string/jumbo v1, "containsString"

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->containsString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v1, "includeFolders"

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->includeFolders()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string/jumbo v1, "includeItems"

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->includeItems()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string/jumbo v1, "newestFirst"

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->newestFirst()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string/jumbo v1, "assetType"

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->assetType()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    return-void
.end method
