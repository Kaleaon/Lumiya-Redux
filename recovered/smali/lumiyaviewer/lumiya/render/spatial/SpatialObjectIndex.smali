.class public Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;,
        Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;,
        Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;
    }
.end annotation


# static fields
.field private static final NUM_DEPTH_BINS:I = 0x10

.field private static final REGION_SIZE_XY:F = 256.0f

.field private static final REGION_SIZE_Z:F = 4096.0f


# instance fields
.field private volatile avatarCountLimit:I

.field private final drawListUpdateRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final drawListUpdateTask:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;

.field private final drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

.field private final frustrumChanged:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private volatile frustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

.field private volatile frustrumPlanes:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;

.field private volatile indexDisabled:Z

.field private volatile initialUpdateCompleted:Z

.field private final lock:Ljava/lang/Object;

.field private final objectUpdateRemoveLock:Ljava/lang/Object;

.field private volatile objectsInFrustrum:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

.field private final objectsToRemove:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final objectsToUpdate:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final objectsUpdateTask:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;

.field private final spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

.field private final terrain:[[Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;

.field private final terrainDirty:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;",
            ">;"
        }
    .end annotation
.end field

.field private final terrainLock:Ljava/lang/Object;

.field private final terrainUpdate:Ljava/lang/Runnable;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->avatarCountLimit:I

    return v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->drawListUpdateRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get10(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    return-object v0
.end method

.method static synthetic -get11(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)[[Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->terrain:[[Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;

    return-object v0
.end method

.method static synthetic -get12(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->terrainDirty:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic -get13(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->terrainLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumChanged:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumPlanes:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;

    return-object v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->indexDisabled:Z

    return v0
.end method

.method static synthetic -get6(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->initialUpdateCompleted:Z

    return v0
.end method

.method static synthetic -get7(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectUpdateRemoveLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get8(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/Set;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsToRemove:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic -get9(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/Set;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsToUpdate:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsInFrustrum:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->handleRemoveObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->handleUpdateObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap2(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;I)Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->getObjectsInCells(I)Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    move-result-object v0

    return-object v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;I)V
    .locals 7

    const/high16 v2, 0x43800000    # 256.0f

    const/16 v1, 0x10

    const/4 v3, 0x0

    const/4 v6, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumChanged:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->drawListUpdateRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectUpdateRemoveLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsToUpdate:Ljava/util/Set;

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsToRemove:Ljava/util/Set;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->initialUpdateCompleted:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->indexDisabled:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->terrainLock:Ljava/lang/Object;

    const-class v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;

    filled-new-array {v1, v1}, [I

    move-result-object v3

    invoke-static {v0, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->terrain:[[Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->terrainDirty:Ljava/util/Map;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->lock:Ljava/lang/Object;

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumPlanes:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;

    const/4 v0, 0x5

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->avatarCountLimit:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;

    invoke-direct {v0, p0, v6}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;-><init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->drawListUpdateTask:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;

    invoke-direct {v0, p0, v6}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;-><init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsUpdateTask:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$1;-><init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->terrainUpdate:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->avatarCountLimit:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    const/high16 v4, 0x45800000    # 4096.0f

    move v3, v2

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;-><init>(IFFFLcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-static {p1, v6, p2}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->create(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;I)Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsInFrustrum:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    return-void
.end method

.method private getObjectsInCells(I)Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsInFrustrum:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    invoke-static {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->create(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;I)Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->addDrawables(Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->initRenderPasses()V

    return-object v0
.end method

.method private handleRemoveObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->removeObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->getObjectInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->clearDrawListEntry()V

    const/4 v0, 0x0

    return v0
.end method

.method private handleUpdateObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)Z
    .locals 1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->updateBoundingBox()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->spatialTree:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->updateObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    const/4 v0, 0x0

    return v0
.end method

.method private removeObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)V
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectUpdateRemoveLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsToUpdate:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsToRemove:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    or-int/2addr v0, v2

    monitor-exit v1

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->initialUpdateCompleted:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->indexDisabled:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsUpdateTask:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public completeInitialUpdate()V
    .locals 3

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->initialUpdateCompleted:Z

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->indexDisabled:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsUpdateTask:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->terrainUpdate:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->drawListUpdateRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_0
    return-void
.end method

.method disableIndex()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->indexDisabled:Z

    return-void
.end method

.method getDrawableAvatar(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->drawableAvatarCache:Lcom/google/common/cache/LoadingCache;

    invoke-interface {v0, p1}, Lcom/google/common/cache/LoadingCache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    return-object v0
.end method

.method public getObjectsInFrustrum()Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsInFrustrum:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    return-object v0
.end method

.method requestEntryRemoval(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->removeObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)V

    :cond_0
    return-void
.end method

.method public setAvatarCountLimit(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->avatarCountLimit:I

    return-void
.end method

.method public setViewport(Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;)V
    .locals 4

    const/4 v0, 0x1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->lock:Ljava/lang/Object;

    monitor-enter v2

    const/4 v1, 0x0

    :try_start_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    if-nez v3, :cond_1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    :goto_0
    if-eqz v0, :cond_0

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumPlanes:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumChanged:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->initialUpdateCompleted:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->indexDisabled:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->drawListUpdateRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v2

    return-void

    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    invoke-virtual {v3, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->frustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method public updateDrawListIfNeeded()Z
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->drawListUpdateRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->drawListUpdateTask:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    return v1
.end method

.method public updateObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectUpdateRemoveLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->getObjectInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsToUpdate:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    :goto_0
    monitor-exit v1

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->initialUpdateCompleted:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->indexDisabled:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsUpdateTask:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$ObjectsUpdateTask;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->objectsToRemove:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method updateTerrainPatch(IILcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;)V
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->terrainLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->terrainDirty:Ljava/util/Map;

    mul-int/lit8 v2, p2, 0x10

    add-int/2addr v2, p1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->initialUpdateCompleted:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->indexDisabled:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->terrainUpdate:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
