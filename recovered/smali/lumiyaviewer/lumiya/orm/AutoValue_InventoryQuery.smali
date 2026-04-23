.class final Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;
.super Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;


# instance fields
.field private final assetType:I

.field private final containsString:Ljava/lang/String;

.field private final folderId:Ljava/util/UUID;

.field private final folderType:I

.field private final includeFolders:Z

.field private final includeItems:Z

.field private final newestFirst:Z


# direct methods
.method constructor <init>(Ljava/util/UUID;Ljava/lang/String;ZZZII)V
    .locals 0
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderId:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->containsString:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->includeFolders:Z

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->includeItems:Z

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->newestFirst:Z

    iput p6, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderType:I

    iput p7, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->assetType:I

    return-void
.end method


# virtual methods
.method public assetType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->assetType:I

    return v0
.end method

.method public containsString()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->containsString:Ljava/lang/String;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    if-eqz v2, :cond_6

    check-cast p1, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderId:Ljava/util/UUID;

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->folderId()Ljava/util/UUID;

    move-result-object v2

    if-nez v2, :cond_3

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->containsString:Ljava/lang/String;

    if-nez v2, :cond_4

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->containsString()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    :goto_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->includeFolders:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->includeFolders()Z

    move-result v3

    if-ne v2, v3, :cond_3

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->includeItems:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->includeItems()Z

    move-result v3

    if-ne v2, v3, :cond_3

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->newestFirst:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->newestFirst()Z

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderType:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->folderType()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->assetType:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->assetType()I

    move-result v3

    if-ne v2, v3, :cond_5

    :goto_1
    return v0

    :cond_2
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderId:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->folderId()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_3
    move v0, v1

    goto :goto_1

    :cond_4
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->containsString:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->containsString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_0

    :cond_5
    move v0, v1

    goto :goto_1

    :cond_6
    return v1
.end method

.method public folderId()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderId:Ljava/util/UUID;

    return-object v0
.end method

.method public folderType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderType:I

    return v0
.end method

.method public hashCode()I
    .locals 6

    const/4 v1, 0x0

    const/16 v3, 0x4d5

    const/16 v2, 0x4cf

    const v5, 0xf4243

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderId:Ljava/util/UUID;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    xor-int/2addr v0, v5

    mul-int/2addr v0, v5

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->containsString:Ljava/lang/String;

    if-nez v4, :cond_1

    :goto_1
    xor-int/2addr v0, v1

    mul-int v1, v0, v5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->includeFolders:Z

    if-eqz v0, :cond_2

    move v0, v2

    :goto_2
    xor-int/2addr v0, v1

    mul-int v1, v0, v5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->includeItems:Z

    if-eqz v0, :cond_3

    move v0, v2

    :goto_3
    xor-int/2addr v0, v1

    mul-int/2addr v0, v5

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->newestFirst:Z

    if-eqz v1, :cond_4

    :goto_4
    xor-int/2addr v0, v2

    mul-int/2addr v0, v5

    iget v1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderType:I

    xor-int/2addr v0, v1

    mul-int/2addr v0, v5

    iget v1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->assetType:I

    xor-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderId:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->containsString:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_1

    :cond_2
    move v0, v3

    goto :goto_2

    :cond_3
    move v0, v3

    goto :goto_3

    :cond_4
    move v2, v3

    goto :goto_4
.end method

.method public includeFolders()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->includeFolders:Z

    return v0
.end method

.method public includeItems()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->includeItems:Z

    return v0
.end method

.method public newestFirst()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->newestFirst:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "InventoryQuery{folderId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderId:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "containsString="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->containsString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "includeFolders="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->includeFolders:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "includeItems="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->includeItems:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "newestFirst="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->newestFirst:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "folderType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->folderType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "assetType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/orm/AutoValue_InventoryQuery;->assetType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
