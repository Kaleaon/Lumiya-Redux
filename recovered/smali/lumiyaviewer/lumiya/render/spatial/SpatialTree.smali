.class Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;
.super Ljava/lang/Object;


# static fields
.field static final INVALID_BIN:I = -0x1


# instance fields
.field private final bins:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

.field private final depthBuf:[F

.field private drawDistance:F

.field private drawListChanged:Z

.field private final myAvatarTreeNode:Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;

.field private final numBins:I

.field private final rootNode:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

.field final spatialObjectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

.field private treeWalkNeeded:Z


# direct methods
.method constructor <init>(IFFFLcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->drawDistance:F

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->treeWalkNeeded:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->drawListChanged:Z

    const/4 v0, 0x1

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->depthBuf:[F

    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->numBins:I

    new-array v0, p1, [Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->bins:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->spatialObjectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    invoke-direct {v0, p0, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;-><init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;FFF)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->rootNode:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;-><init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->myAvatarTreeNode:Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;

    return-void
.end method

.method private getNodeForObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)Lcom/lumiyaviewer/lumiya/utils/InlineList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;",
            ")",
            "Lcom/lumiyaviewer/lumiya/utils/InlineList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;",
            ">;"
        }
    .end annotation

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListAvatarEntry;->getObjectAvatarInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->myAvatarTreeNode:Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->rootNode:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->boundingBox:[F

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->findNode([F)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    move-result-object v0

    return-object v0
.end method

.method private setEntryBin(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;I)V
    .locals 5

    const/4 v4, -0x1

    const/4 v3, 0x0

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->depthBin:I

    if-eq p2, v0, :cond_4

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->depthBin:I

    if-eq v0, v4, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->prevDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-eqz v0, :cond_5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->prevDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    :goto_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->prevDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->prevDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    :cond_0
    iput-object v3, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->prevDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v3, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    :cond_1
    if-eq p2, v4, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->bins:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    aget-object v0, v0, p2

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v3, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->prevDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->prevDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->bins:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    aput-object p1, v0, p2

    :cond_3
    iput p2, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->depthBin:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->getFirst()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->setDrawListChanged()V

    :cond_4
    return-void

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->bins:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->depthBin:I

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    aput-object v2, v0, v1

    goto :goto_0
.end method


# virtual methods
.method addDrawables(Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)V
    .locals 5

    const/4 v2, 0x0

    const-string/jumbo v0, "SpatialTree: adding drawables."

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->myAvatarTreeNode:Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;->addDrawables(Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->bins:[Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    array-length v4, v3

    move v1, v2

    :goto_0
    if-ge v1, v4, :cond_1

    aget-object v0, v3, v1

    :goto_1
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->addDrawables(Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->nextDepth:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->drawListChanged:Z

    return-void
.end method

.method final isDrawListChanged()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->drawListChanged:Z

    return v0
.end method

.method final isTreeWalkNeeded()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->treeWalkNeeded:Z

    return v0
.end method

.method final removeEntry(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->setEntryBin(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;I)V

    return-void
.end method

.method removeObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->getList()Lcom/lumiyaviewer/lumiya/utils/InlineList;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/utils/InlineList;->removeEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    :cond_0
    return-void
.end method

.method final setDrawListChanged()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->drawListChanged:Z

    return-void
.end method

.method final setEntryDepth(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;F)V
    .locals 3

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->numBins:I

    int-to-float v1, v1

    mul-float/2addr v1, p2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->drawDistance:F

    div-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    if-gez v1, :cond_0

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->setEntryBin(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;I)V

    return-void

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->numBins:I

    if-lt v1, v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->numBins:I

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method final setTreeWalkNeeded()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->treeWalkNeeded:Z

    return-void
.end method

.method updateObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->getNodeForObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)Lcom/lumiyaviewer/lumiya/utils/InlineList;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->getList()Lcom/lumiyaviewer/lumiya/utils/InlineList;

    move-result-object v1

    if-eq v0, v1, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/utils/InlineList;->removeEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/utils/InlineList;->addEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    :cond_1
    return-void
.end method

.method walkTree(Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;F)V
    .locals 4

    const/4 v3, 0x0

    const-string/jumbo v0, "SpatialTree: walkTree: starting to walk."

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->drawDistance:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->rootNode:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->depthBuf:[F

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v2, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;->walkTree(Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;I[F)I

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->treeWalkNeeded:Z

    return-void
.end method
