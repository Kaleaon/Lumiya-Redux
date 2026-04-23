.class public Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;
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


# instance fields
.field private final spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/InlineList;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    return-void
.end method


# virtual methods
.method public addDrawables(Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)V
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;->getFirst()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

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
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/utils/InlineList;->addEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->setDrawListChanged()V

    return-void
.end method

.method public bridge synthetic addEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;->addEntry(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    return-void
.end method

.method public removeEntry(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/utils/InlineList;->removeEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->setDrawListChanged()V

    return-void
.end method

.method public bridge synthetic removeEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;->removeEntry(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    return-void
.end method

.method public requestEntryRemoval(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->spatialObjectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->requestEntryRemoval(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    return-void
.end method

.method public bridge synthetic requestEntryRemoval(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/MyAvatarTreeNode;->requestEntryRemoval(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    return-void
.end method
