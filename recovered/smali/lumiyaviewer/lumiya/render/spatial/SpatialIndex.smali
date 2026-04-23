.class public Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex$InstanceHolder;
    }
.end annotation


# instance fields
.field private volatile indexHolder:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private volatile objectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;


# direct methods
.method private constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->indexHolder:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->objectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public declared-synchronized DisableObjectIndex(Ljava/lang/Object;)V
    .locals 3

    const/4 v0, 0x0

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->objectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->indexHolder:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->indexHolder:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    :cond_0
    if-eqz v1, :cond_2

    if-eq v0, p1, :cond_1

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->disableIndex()V

    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->indexHolder:Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->objectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized EnableObjectIndex(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;
    .locals 1

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->objectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->indexHolder:Ljava/lang/ref/WeakReference;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->objectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDrawableAvatar(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->objectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->getDrawableAvatar(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method public declared-synchronized getObjectIndex()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->objectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setAvatarCountLimit(I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->objectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->setAvatarCountLimit(I)V

    :cond_0
    return-void
.end method

.method public updateTerrainPatch(IILcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->objectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->updateTerrainPatch(IILcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;)V

    :cond_0
    return-void
.end method
