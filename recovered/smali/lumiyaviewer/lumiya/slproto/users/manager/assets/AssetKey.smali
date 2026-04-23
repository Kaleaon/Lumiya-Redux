.class public abstract Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;
.super Ljava/lang/Object;


# static fields
.field private static final toStringJoiner:Lcom/google/common/base/Joiner;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x3a

    invoke-static {v0}, Lcom/google/common/base/Joiner;->on(C)Lcom/google/common/base/Joiner;

    move-result-object v0

    const-string/jumbo v1, "null"

    invoke-virtual {v0, v1}, Lcom/google/common/base/Joiner;->useForNull(Ljava/lang/String;)Lcom/google/common/base/Joiner;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->toStringJoiner:Lcom/google/common/base/Joiner;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createAssetKey(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;I)Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;
    .locals 8
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;

    const/4 v7, 0x0

    move v2, v1

    move-object v3, p2

    move v4, p3

    move-object v5, p1

    move-object v6, p0

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;-><init>(IILjava/util/UUID;ILjava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V

    return-object v0
.end method

.method public static createInventoryKey(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;
    .locals 8
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    const/4 v1, 0x2

    const/4 v2, 0x3

    move-object v7, p1

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AutoValue_AssetKey;-><init>(IILjava/util/UUID;ILjava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V

    return-object v0
.end method


# virtual methods
.method public abstract assetType()I
.end method

.method public abstract assetUUID()Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract channelType()I
.end method

.method public abstract itemUUID()Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract ownerUUID()Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract sourceType()I
.end method

.method public abstract taskUUID()Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public toString()Ljava/lang/String;
    .locals 6
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->toStringJoiner:Lcom/google/common/base/Joiner;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->channelType()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->sourceType()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->assetUUID()Ljava/util/UUID;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->assetType()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->ownerUUID()Ljava/util/UUID;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->itemUUID()Ljava/util/UUID;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->taskUUID()Ljava/util/UUID;

    move-result-object v4

    const/4 v5, 0x4

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
