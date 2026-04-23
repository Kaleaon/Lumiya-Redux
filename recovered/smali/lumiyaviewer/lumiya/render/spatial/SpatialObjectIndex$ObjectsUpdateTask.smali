.class Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ObjectsUpdateTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;-><init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get6(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get5(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get7(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get9(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get9(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get8(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/Set;

    move-result-object v1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get8(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    new-array v4, v4, [Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    invoke-interface {v1, v4}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get9(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->clear()V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get8(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    array-length v5, v0

    move v4, v3

    move v2, v3

    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v6, v0, v4

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->getObjectInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v7

    iget-boolean v7, v7, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    if-nez v7, :cond_0

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v7, v6}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-wrap1(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)Z

    move-result v6

    or-int/2addr v2, v6

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_0
    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v7, v6}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-wrap0(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)Z

    move-result v6

    or-int/2addr v2, v6

    goto :goto_1

    :cond_1
    array-length v4, v1

    move v0, v3

    :goto_2
    if-ge v0, v4, :cond_2

    aget-object v3, v1, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v5, v3}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-wrap0(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)Z

    move-result v3

    or-int/2addr v2, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    if-nez v2, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get10(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->isDrawListChanged()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get10(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->isTreeWalkNeeded()Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get1(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_4
    return-void
.end method
