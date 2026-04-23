.class Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v5, 0x0

    move v2, v3

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get6(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get5(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get13(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/lang/Object;

    move-result-object v7

    monitor-enter v7

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get12(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;

    invoke-interface {v6}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v6, v1

    move-object v1, v0

    move v0, v4

    :goto_1
    monitor-exit v7

    if-nez v0, :cond_2

    :cond_0
    if-eqz v2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get1(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v7

    throw v0

    :cond_2
    if-ltz v6, :cond_4

    if-eqz v1, :cond_4

    rem-int/lit8 v2, v6, 0x10

    div-int/lit8 v6, v6, 0x10

    invoke-virtual {v1, v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->getPatchInfo(II)Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;

    move-result-object v1

    if-eqz v1, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get13(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/lang/Object;

    move-result-object v7

    monitor-enter v7

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get11(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)[[Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;

    move-result-object v0

    aget-object v0, v0, v2

    aget-object v0, v0, v6

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get11(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)[[Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;

    move-result-object v0

    aget-object v8, v0, v2

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;

    invoke-direct {v0, v1, v2, v6}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;II)V

    aput-object v0, v8, v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :goto_2
    monitor-exit v7

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get10(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->updateObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    :cond_3
    :goto_3
    move v0, v4

    :goto_4
    move v2, v0

    goto/16 :goto_0

    :cond_4
    move v0, v2

    goto :goto_4

    :cond_5
    :try_start_2
    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->updatePatchInfo(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    monitor-exit v7

    throw v0

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get13(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get11(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)[[Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;

    move-result-object v0

    aget-object v0, v0, v2

    aget-object v0, v0, v6

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get11(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)[[Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;

    move-result-object v7

    aget-object v2, v7, v2

    const/4 v7, 0x0

    aput-object v7, v2, v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    monitor-exit v1

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get10(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->removeObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    goto :goto_3

    :catchall_2
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_7
    move-object v1, v5

    move v6, v0

    move v0, v3

    goto/16 :goto_1
.end method
