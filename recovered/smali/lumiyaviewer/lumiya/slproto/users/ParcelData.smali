.class public Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private final area:I

.field private final description:Ljava/lang/String;

.field private final isGroupOwned:Z

.field private final mediaURL:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private final ownerID:Ljava/util/UUID;

.field private final parcelBitmap:[Z

.field private final parcelID:I

.field private final snapshotUUID:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x1000

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->parcelBitmap:[Z

    const-string/jumbo v0, "LocalID"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->parcelID:I

    const-string/jumbo v0, "Name"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->name:Ljava/lang/String;

    const-string/jumbo v0, "Desc"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->description:Ljava/lang/String;

    const-string/jumbo v0, "MusicURL"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->mediaURL:Ljava/lang/String;

    const-string/jumbo v0, "SnapshotID"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v3, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v0, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v0, v1

    :cond_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->snapshotUUID:Ljava/util/UUID;

    const-string/jumbo v0, "OwnerID"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "OwnerID"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v1

    :cond_1
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->ownerID:Ljava/util/UUID;

    const-string/jumbo v0, "IsGroupOwned"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "IsGroupOwned"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBoolean()Z

    move-result v0

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->isGroupOwned:Z

    const-string/jumbo v0, "Area"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string/jumbo v0, "Area"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v0

    :goto_1
    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->area:I

    const-string/jumbo v0, "Bitmap"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBinary()[B

    move-result-object v4

    move v0, v2

    :goto_2
    array-length v1, v4

    if-ge v0, v1, :cond_6

    const/16 v1, 0x200

    if-ge v0, v1, :cond_6

    aget-byte v1, v4, v0

    move v3, v1

    move v1, v2

    :goto_3
    const/16 v5, 0x8

    if-ge v1, v5, :cond_5

    and-int/lit8 v5, v3, 0x1

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->parcelBitmap:[Z

    mul-int/lit8 v6, v0, 0x8

    add-int/2addr v6, v1

    const/4 v7, 0x1

    aput-boolean v7, v5, v6

    :cond_2
    shr-int/lit8 v3, v3, 0x1

    int-to-byte v3, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_3
    move v0, v2

    goto :goto_0

    :cond_4
    move v0, v2

    goto :goto_1

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_6
    return-void
.end method


# virtual methods
.method public getArea()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->area:I

    return v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getMediaURL()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->mediaURL:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOwnerID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->ownerID:Ljava/util/UUID;

    return-object v0
.end method

.method public getParcelBitmap()[Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->parcelBitmap:[Z

    return-object v0
.end method

.method public getParcelID()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->parcelID:I

    return v0
.end method

.method public getSnapshotUUID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->snapshotUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public isGroupOwned()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->isGroupOwned:Z

    return v0
.end method
