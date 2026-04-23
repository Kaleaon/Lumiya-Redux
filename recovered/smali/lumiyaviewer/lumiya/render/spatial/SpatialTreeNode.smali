.class public Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;
.super Lcom/lumiyaviewer/lumiya/utils/InlineList;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/utils/InlineList",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;",
        ">;"
    }
.end annotation


# static fields
.field private static final MIN_SIZE:F = 2.0f


# instance fields
.field private children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

.field depthBin:I

.field private final indexInParent:I

.field private final leaf:Z

.field nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

.field private final parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

.field final position:[F

.field prevDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

.field private singleChild:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

.field private final spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

.field private final splitAxis:I


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;FFF)V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/InlineList;-><init>()V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->singleChild:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->depthBin:I

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->prevDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    const/16 v0, 0xc

    new-array v0, v0, [F

    aput v2, v0, v4

    const/4 v1, 0x1

    aput v2, v0, v1

    const/4 v1, 0x2

    aput v2, v0, v1

    const/4 v1, 0x3

    aput p2, v0, v1

    const/4 v1, 0x4

    aput p3, v0, v1

    const/4 v1, 0x5

    aput p4, v0, v1

    const/4 v1, 0x6

    aput v2, v0, v1

    const/4 v1, 0x7

    aput v2, v0, v1

    const/16 v1, 0x8

    aput v2, v0, v1

    const/16 v1, 0x9

    aput p2, v0, v1

    const/16 v1, 0xa

    aput p3, v0, v1

    const/16 v1, 0xb

    aput p4, v0, v1

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->leaf:Z

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput v4, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->indexInParent:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->longestAxis()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->splitAxis:I

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;I)V
    .locals 9

    const/4 v2, 0x0

    const/4 v1, 0x0

    const/high16 v8, 0x40000000    # 2.0f

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/InlineList;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->singleChild:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->depthBin:I

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->prevDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    const/16 v0, 0xc

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->indexInParent:I

    const/4 v3, 0x1

    move v4, v2

    :goto_0
    const/4 v0, 0x3

    if-ge v4, v0, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    add-int/lit8 v1, v4, 0x6

    aget v1, v0, v1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    add-int/lit8 v5, v4, 0x9

    aget v0, v0, v5

    sub-float/2addr v0, v1

    iget v5, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->splitAxis:I

    if-eq v4, v5, :cond_0

    :goto_1
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    add-int/lit8 v6, v4, 0x6

    aput v1, v5, v6

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    add-int/lit8 v6, v4, 0x9

    add-float v7, v1, v0

    aput v7, v5, v6

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    div-float v6, v0, v8

    add-float/2addr v6, v1

    aput v6, v5, v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    add-int/lit8 v6, v4, 0x3

    div-float v7, v0, v8

    add-float/2addr v1, v7

    aput v1, v5, v6

    cmpl-float v0, v0, v8

    if-lez v0, :cond_2

    move v0, v2

    :goto_2
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    move v3, v0

    goto :goto_0

    :cond_0
    div-float/2addr v0, v8

    div-float v5, v0, v8

    int-to-float v6, p2

    mul-float/2addr v5, v6

    add-float/2addr v1, v5

    goto :goto_1

    :cond_1
    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->leaf:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->longestAxis()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->splitAxis:I

    return-void

    :cond_2
    move v0, v3

    goto :goto_2
.end method

.method private enlargeForBoundingBox(Z[F)V
    .locals 7

    const/4 v1, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-eqz v0, :cond_5

    move v2, v3

    move v0, v3

    :goto_0
    const/4 v4, 0x3

    if-ge v2, v4, :cond_4

    if-nez p1, :cond_0

    aget v4, p2, v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    aget v5, v5, v2

    cmpg-float v4, v4, v5

    if-gez v4, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    aget v4, p2, v2

    aput v4, v0, v2

    move v0, v1

    :cond_1
    if-nez p1, :cond_2

    add-int/lit8 v4, v2, 0x3

    aget v4, p2, v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    add-int/lit8 v6, v2, 0x3

    aget v5, v5, v6

    cmpl-float v4, v4, v5

    if-lez v4, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    add-int/lit8 v4, v2, 0x3

    add-int/lit8 v5, v2, 0x3

    aget v5, p2, v5

    aput v5, v0, v4

    move v0, v1

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->setTreeWalkNeeded()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    invoke-direct {v0, v3, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->enlargeForBoundingBox(Z[F)V

    :cond_5
    return-void
.end method

.method private isEmpty()Z
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->getFirst()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private longestAxis()I
    .locals 6

    const/4 v1, 0x0

    const/4 v3, 0x0

    move v0, v1

    :goto_0
    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    add-int/lit8 v4, v1, 0x9

    aget v2, v2, v4

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    add-int/lit8 v5, v1, 0x6

    aget v4, v4, v5

    sub-float/2addr v2, v4

    cmpl-float v4, v2, v3

    if-lez v4, :cond_1

    move v0, v1

    :goto_1
    add-int/lit8 v1, v1, 0x1

    move v3, v2

    goto :goto_0

    :cond_0
    return v0

    :cond_1
    move v2, v3

    goto :goto_1
.end method

.method private removeFromParent()V
    .locals 4

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->removeEntry(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->indexInParent:I

    aput-object v1, v0, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->singleChild:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-ne v0, p0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->singleChild:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->removeFromParent()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->shrinkBoundingBox()V

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    move v2, v0

    move-object v0, v1

    :goto_1
    const/4 v3, 0x3

    if-ge v2, v3, :cond_5

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    aget-object v3, v3, v2

    if-eqz v3, :cond_3

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    aget-object v0, v0, v2

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    move-object v0, v1

    :cond_5
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->singleChild:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->getFirst()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    move-result-object v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->removeEntry(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;)V

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->shrinkBoundingBox()V

    goto :goto_0
.end method

.method private shrinkBoundingBox()V
    .locals 15

    const/4 v14, 0x3

    const/4 v13, 0x6

    const/4 v1, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-eqz v0, :cond_8

    new-array v6, v13, [F

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->getFirst()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    move-object v5, v0

    move v2, v3

    :goto_0
    if-eqz v5, :cond_3

    move v4, v3

    :goto_1
    if-ge v4, v14, :cond_2

    if-eqz v2, :cond_0

    aget v0, v6, v4

    iget-object v7, v5, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->boundingBox:[F

    aget v7, v7, v4

    invoke-static {v0, v7}, Ljava/lang/Math;->min(FF)F

    move-result v0

    :goto_2
    aput v0, v6, v4

    add-int/lit8 v7, v4, 0x3

    if-eqz v2, :cond_1

    add-int/lit8 v0, v4, 0x3

    aget v0, v6, v0

    iget-object v8, v5, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->boundingBox:[F

    add-int/lit8 v9, v4, 0x3

    aget v8, v8, v9

    invoke-static {v0, v8}, Ljava/lang/Math;->max(FF)F

    move-result v0

    :goto_3
    aput v0, v6, v7

    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto :goto_1

    :cond_0
    iget-object v0, v5, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->boundingBox:[F

    aget v0, v0, v4

    goto :goto_2

    :cond_1
    iget-object v0, v5, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->boundingBox:[F

    add-int/lit8 v8, v4, 0x3

    aget v0, v0, v8

    goto :goto_3

    :cond_2
    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->getNext()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    move-result-object v0

    move-object v5, v0

    move v2, v1

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-eqz v0, :cond_7

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    array-length v8, v7

    move v5, v3

    :goto_4
    if-ge v5, v8, :cond_7

    aget-object v9, v7, v5

    if-eqz v9, :cond_b

    move v4, v3

    :goto_5
    if-ge v4, v14, :cond_6

    if-eqz v2, :cond_4

    aget v0, v6, v4

    iget-object v10, v9, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    aget v10, v10, v4

    invoke-static {v0, v10}, Ljava/lang/Math;->min(FF)F

    move-result v0

    :goto_6
    aput v0, v6, v4

    add-int/lit8 v10, v4, 0x3

    if-eqz v2, :cond_5

    add-int/lit8 v0, v4, 0x3

    aget v0, v6, v0

    iget-object v11, v9, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    add-int/lit8 v12, v4, 0x3

    aget v11, v11, v12

    invoke-static {v0, v11}, Ljava/lang/Math;->max(FF)F

    move-result v0

    :goto_7
    aput v0, v6, v10

    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto :goto_5

    :cond_4
    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    aget v0, v0, v4

    goto :goto_6

    :cond_5
    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    add-int/lit8 v11, v4, 0x3

    aget v0, v0, v11

    goto :goto_7

    :cond_6
    move v0, v1

    :goto_8
    add-int/lit8 v2, v5, 0x1

    move v5, v2

    move v2, v0

    goto :goto_4

    :cond_7
    if-eqz v2, :cond_8

    move v0, v3

    :goto_9
    if-ge v0, v13, :cond_a

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    aget v2, v2, v0

    aget v4, v6, v0

    cmpl-float v2, v2, v4

    if-eqz v2, :cond_9

    :goto_a
    if-eqz v1, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    invoke-static {v6, v3, v0, v3, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->parent:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->shrinkBoundingBox()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->setTreeWalkNeeded()V

    :cond_8
    return-void

    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_a
    move v1, v3

    goto :goto_a

    :cond_b
    move v0, v2

    goto :goto_8
.end method


# virtual methods
.method public addDrawables(Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)V
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->getFirst()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->addToDrawList(Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->getNext()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    move-result-object v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public addEntry(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 4

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->getFirst()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    move-result-object v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-nez v0, :cond_3

    move v0, v1

    :goto_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->singleChild:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-eqz v3, :cond_4

    :goto_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->getList()Lcom/lumiyaviewer/lumiya/utils/InlineList;

    move-result-object v2

    if-eq v2, p0, :cond_5

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/utils/InlineList;->addEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->boundingBox:[F

    invoke-direct {p0, v0, v2}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->enlargeForBoundingBox(Z[F)V

    if-nez v0, :cond_0

    if-eqz v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->setTreeWalkNeeded()V

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->depthBin:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->setDrawListChanged()V

    :cond_2
    :goto_2
    return-void

    :cond_3
    move v0, v2

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_1

    :cond_5
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->shrinkBoundingBox()V

    goto :goto_2
.end method

.method public bridge synthetic addEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->addEntry(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    return-void
.end method

.method protected findNode([F)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;
    .locals 11

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v10, 0x0

    const/high16 v9, 0x40000000    # 2.0f

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->leaf:Z

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    const/high16 v1, 0x7f800000    # Float.POSITIVE_INFINITY

    move v2, v4

    move v3, v5

    :goto_0
    const/4 v0, 0x3

    if-ge v2, v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    iget v6, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->splitAxis:I

    add-int/lit8 v6, v6, 0x6

    add-int/lit8 v6, v6, 0x3

    aget v0, v0, v6

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    iget v7, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->splitAxis:I

    add-int/lit8 v7, v7, 0x6

    aget v6, v6, v7

    sub-float/2addr v0, v6

    div-float/2addr v0, v9

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    iget v7, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->splitAxis:I

    add-int/lit8 v7, v7, 0x6

    aget v6, v6, v7

    div-float v7, v0, v9

    int-to-float v8, v2

    mul-float/2addr v7, v8

    add-float/2addr v6, v7

    iget v7, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->splitAxis:I

    aget v7, p1, v7

    cmpl-float v7, v7, v6

    if-ltz v7, :cond_1

    iget v7, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->splitAxis:I

    add-int/lit8 v7, v7, 0x3

    aget v7, p1, v7

    add-float v8, v6, v0

    cmpg-float v7, v7, v8

    if-gtz v7, :cond_1

    div-float/2addr v0, v9

    add-float/2addr v0, v6

    iget v6, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->splitAxis:I

    aget v6, p1, v6

    iget v7, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->splitAxis:I

    add-int/lit8 v7, v7, 0x3

    aget v7, p1, v7

    add-float/2addr v6, v7

    div-float/2addr v6, v9

    sub-float/2addr v0, v6

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v6, v0, v1

    if-gez v6, :cond_7

    move v1, v2

    :goto_1
    add-int/lit8 v2, v2, 0x1

    move v3, v1

    move v1, v0

    goto :goto_0

    :cond_1
    move v0, v1

    move v1, v3

    goto :goto_1

    :cond_2
    if-eq v3, v5, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-nez v0, :cond_6

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    const/4 v0, 0x1

    :goto_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    aget-object v1, v1, v3

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    new-instance v2, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    invoke-direct {v2, p0, v3}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;-><init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;I)V

    aput-object v2, v1, v3

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    aget-object v0, v0, v3

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->singleChild:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    :cond_3
    :goto_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    aget-object v0, v0, v3

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->findNode([F)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    move-result-object v0

    return-object v0

    :cond_4
    iput-object v10, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->singleChild:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    goto :goto_3

    :cond_5
    return-object p0

    :cond_6
    move v0, v4

    goto :goto_2

    :cond_7
    move v0, v1

    move v1, v3

    goto :goto_1
.end method

.method public removeEntry(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/utils/InlineList;->removeEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->depthBin:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->setDrawListChanged()V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->getFirst()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->removeEntry(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->removeFromParent()V

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->shrinkBoundingBox()V

    return-void
.end method

.method public bridge synthetic removeEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->removeEntry(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    return-void
.end method

.method public requestEntryRemoval(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->spatialObjectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->requestEntryRemoval(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    return-void
.end method

.method public bridge synthetic requestEntryRemoval(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->requestEntryRemoval(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    return-void
.end method

.method public walkTree(Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;I[F)I
    .locals 5

    const/4 v2, -0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->singleChild:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->getFirst()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->singleChild:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    invoke-virtual {v0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->walkTree(Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;I[F)I

    move-result v0

    return v0

    :cond_0
    if-eq p2, v2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->position:[F

    invoke-virtual {p1, v0, p3}, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->testBoundingBox([F[F)I

    move-result p2

    :cond_1
    if-ne p2, v2, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->removeEntry(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;)V

    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->children:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    array-length v3, v2

    :goto_1
    if-ge v1, v3, :cond_5

    aget-object v4, v2, v1

    if-eqz v4, :cond_2

    invoke-virtual {v4, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->walkTree(Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;I[F)I

    move-result v4

    add-int/2addr v0, v4

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->getFirst()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    move-result-object v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    aget v3, p3, v1

    invoke-virtual {v2, p0, v3}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->setEntryDepth(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;F)V

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v2, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->removeEntry(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;)V

    goto :goto_0

    :cond_5
    return v0
.end method
