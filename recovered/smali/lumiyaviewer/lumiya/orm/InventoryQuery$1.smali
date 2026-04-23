.class final Lcom/lumiyaviewer/lumiya/orm/InventoryQuery$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
    .locals 8

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery$1;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v0, "folderId"

    invoke-virtual {v5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    const-string/jumbo v1, "containsString"

    invoke-virtual {v5, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "includeFolders"

    invoke-virtual {v5, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    const-string/jumbo v3, "includeItems"

    invoke-virtual {v5, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    const-string/jumbo v4, "newestFirst"

    invoke-virtual {v5, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    const-string/jumbo v6, "assetType"

    const/4 v7, -0x1

    invoke-virtual {v5, v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->create(Ljava/util/UUID;Ljava/lang/String;ZZZI)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery$1;->createFromParcel(Landroid/os/Parcel;)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
    .locals 1

    new-array v0, p1, [Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery$1;->newArray(I)[Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    return-object v0
.end method
