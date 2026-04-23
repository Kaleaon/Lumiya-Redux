.class final Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;
.super Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;


# instance fields
.field private final assetType:I

.field private final assetUUID:Ljava/util/UUID;

.field private final channelType:I

.field private final itemUUID:Ljava/util/UUID;

.field private final ownerUUID:Ljava/util/UUID;

.field private final sourceType:I

.field private final taskUUID:Ljava/util/UUID;


# direct methods
.method constructor <init>(IILjava/util/UUID;ILjava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 0
    .param p3    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->channelType:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->sourceType:I

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->assetUUID:Ljava/util/UUID;

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->assetType:I

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->ownerUUID:Ljava/util/UUID;

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->itemUUID:Ljava/util/UUID;

    iput-object p7, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->taskUUID:Ljava/util/UUID;

    return-void
.end method


# virtual methods
.method public assetType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->assetType:I

    return v0
.end method

.method public assetUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->assetUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public channelType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->channelType:I

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    if-eqz v2, :cond_8

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->channelType:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->channelType()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->sourceType:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->sourceType()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->assetUUID:Ljava/util/UUID;

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->assetUUID()Ljava/util/UUID;

    move-result-object v2

    if-nez v2, :cond_3

    :cond_1
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->assetType:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->assetType()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->ownerUUID:Ljava/util/UUID;

    if-nez v2, :cond_4

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->ownerUUID()Ljava/util/UUID;

    move-result-object v2

    if-nez v2, :cond_3

    :goto_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->itemUUID:Ljava/util/UUID;

    if-nez v2, :cond_5

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->itemUUID()Ljava/util/UUID;

    move-result-object v2

    if-nez v2, :cond_3

    :goto_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->taskUUID:Ljava/util/UUID;

    if-nez v2, :cond_7

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->taskUUID()Ljava/util/UUID;

    move-result-object v2

    if-nez v2, :cond_6

    :goto_2
    return v0

    :cond_2
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->assetUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->assetUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_3
    move v0, v1

    goto :goto_2

    :cond_4
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->ownerUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_0

    :cond_5
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->itemUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->itemUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_1

    :cond_6
    move v0, v1

    goto :goto_2

    :cond_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->taskUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->taskUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_2

    :cond_8
    return v1
.end method

.method public hashCode()I
    .locals 4

    const/4 v1, 0x0

    const v3, 0xf4243

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->channelType:I

    xor-int/2addr v0, v3

    mul-int/2addr v0, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->sourceType:I

    xor-int/2addr v0, v2

    mul-int v2, v0, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->assetUUID:Ljava/util/UUID;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    xor-int/2addr v0, v2

    mul-int/2addr v0, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->assetType:I

    xor-int/2addr v0, v2

    mul-int v2, v0, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->ownerUUID:Ljava/util/UUID;

    if-nez v0, :cond_1

    move v0, v1

    :goto_1
    xor-int/2addr v0, v2

    mul-int v2, v0, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->itemUUID:Ljava/util/UUID;

    if-nez v0, :cond_2

    move v0, v1

    :goto_2
    xor-int/2addr v0, v2

    mul-int/2addr v0, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->taskUUID:Ljava/util/UUID;

    if-nez v2, :cond_3

    :goto_3
    xor-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->itemUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    goto :goto_2

    :cond_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->taskUUID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->hashCode()I

    move-result v1

    goto :goto_3
.end method

.method public itemUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->itemUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public ownerUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->ownerUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public sourceType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->sourceType:I

    return v0
.end method

.method public taskUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;->taskUUID:Ljava/util/UUID;

    return-object v0
.end method
