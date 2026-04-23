.class public abstract Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;
.super Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;


# instance fields
.field final objectInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->objectInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    return-void
.end method


# virtual methods
.method public getObjectInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->objectInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    return-object v0
.end method

.method public updateBoundingBox()V
    .locals 13

    const/high16 v12, 0x40000000    # 2.0f

    const/4 v11, 0x0

    const/4 v10, 0x3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->objectInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    if-eqz v3, :cond_5

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->objectInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getObjectCoords()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getData()[F

    move-result-object v4

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getElementOffset(I)I

    move-result v5

    move v1, v0

    :goto_0
    if-ge v1, v10, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->boundingBox:[F

    add-int/lit8 v6, v1, 0xc

    aget v6, v3, v6

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->boundingBox:[F

    add-int/lit8 v8, v1, 0x3

    aput v6, v7, v8

    aput v6, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    move v2, v0

    :goto_1
    if-ge v2, v10, :cond_3

    move v1, v0

    :goto_2
    if-ge v1, v10, :cond_2

    mul-int/lit8 v6, v2, 0x4

    add-int/2addr v6, v1

    aget v6, v3, v6

    add-int v7, v5, v1

    aget v7, v4, v7

    neg-float v7, v7

    div-float/2addr v7, v12

    mul-float/2addr v6, v7

    mul-int/lit8 v7, v2, 0x4

    add-int/2addr v7, v1

    aget v7, v3, v7

    add-int v8, v5, v1

    aget v8, v4, v8

    div-float/2addr v8, v12

    mul-float/2addr v7, v8

    cmpg-float v8, v6, v7

    if-gez v8, :cond_1

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->boundingBox:[F

    aget v9, v8, v2

    add-float/2addr v6, v9

    aput v6, v8, v2

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->boundingBox:[F

    add-int/lit8 v8, v2, 0x3

    aget v9, v6, v8

    add-float/2addr v7, v9

    aput v7, v6, v8

    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_1
    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->boundingBox:[F

    aget v9, v8, v2

    add-float/2addr v7, v9

    aput v7, v8, v2

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->boundingBox:[F

    add-int/lit8 v8, v2, 0x3

    aget v9, v7, v8

    add-float/2addr v6, v9

    aput v6, v7, v8

    goto :goto_3

    :cond_2
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_1

    :cond_3
    move v1, v0

    :goto_4
    if-ge v1, v10, :cond_5

    const/4 v0, 0x2

    if-ne v1, v0, :cond_4

    const/high16 v0, 0x45800000    # 4096.0f

    :goto_5
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->boundingBox:[F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->boundingBox:[F

    aget v3, v3, v1

    invoke-static {v11, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    aput v3, v2, v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->boundingBox:[F

    add-int/lit8 v3, v1, 0x3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->boundingBox:[F

    add-int/lit8 v5, v1, 0x3

    aget v4, v4, v5

    invoke-static {v11, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->min(FF)F

    move-result v0

    aput v0, v2, v3

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_4

    :cond_4
    const/high16 v0, 0x43800000    # 256.0f

    goto :goto_5

    :cond_5
    return-void
.end method
