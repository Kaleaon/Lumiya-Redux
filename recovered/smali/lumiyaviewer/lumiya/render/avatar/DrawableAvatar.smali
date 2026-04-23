.class public Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;
.super Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/render/picking/IntersectPickable;
.implements Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList$EntryRemovalListener;


# instance fields
.field private final animationLock:Ljava/lang/Object;

.field private final animationSkeletonData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;

.field private final animations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;",
            ">;"
        }
    .end annotation
.end field

.field private volatile animationsInitialized:Z

.field private final deadAttachmentsList:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final deadAttachmentsLock:Ljava/lang/Object;

.field private final displayedHUDid:Ljava/util/concurrent/atomic/AtomicInteger;

.field private volatile drawableAttachmentList:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final drawableAttachments:Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;

.field private volatile drawableHUD:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;

.field private headPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field private jointMatrixUpdated:Z

.field private final localAviWorldMatrix:[F

.field private final parts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;",
            "Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;",
            ">;"
        }
    .end annotation
.end field

.field private pelvisTranslateX:F

.field private pelvisTranslateY:F

.field private pelvisTranslateZ:F

.field private final riggedMeshes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/DrawableObject;",
            ">;"
        }
    .end annotation
.end field

.field private volatile runningAnimations:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;

.field private volatile shapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

.field private final shapeParamsUpdate:Ljava/lang/Runnable;

.field private volatile skeleton:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;

.field private final updateAttachmentsRunnable:Ljava/lang/Runnable;

.field private final updatedSkeleton:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;Ljava/util/UUID;Ljava/util/Map;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/render/DrawableStore;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;",
            "Ljava/util/UUID;",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;",
            ">;)V"
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v0, 0x0

    const/4 v3, 0x0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;-><init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V

    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1, v4}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updatedSkeleton:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v1, Ljava/util/EnumMap;

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    invoke-direct {v1, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->parts:Ljava/util/Map;

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationLock:Ljava/lang/Object;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animations:Ljava/util/Map;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->runningAnimations:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationsInitialized:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableAttachmentList:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;

    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->displayedHUDid:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;-><init>(Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList$EntryRemovalListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableAttachments:Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->deadAttachmentsLock:Ljava/lang/Object;

    new-instance v1, Ljava/util/IdentityHashMap;

    invoke-direct {v1}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->deadAttachmentsList:Ljava/util/Set;

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->riggedMeshes:Ljava/util/Set;

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationSkeletonData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;

    iput v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateX:F

    iput v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateY:F

    iput v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateZ:F

    const/16 v1, 0x10

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->localAviWorldMatrix:[F

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->jointMatrixUpdated:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/avatar/-$Lambda$0R0mXpfMxrM5lCygN3JijOMDexU;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/render/avatar/-$Lambda$0R0mXpfMxrM5lCygN3JijOMDexU;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateAttachmentsRunnable:Ljava/lang/Runnable;

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/avatar/-$Lambda$0R0mXpfMxrM5lCygN3JijOMDexU$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/render/avatar/-$Lambda$0R0mXpfMxrM5lCygN3JijOMDexU$1;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->shapeParamsUpdate:Ljava/lang/Runnable;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    array-length v3, v2

    :goto_0
    if-ge v0, v3, :cond_0

    aget-object v4, v2, v0

    new-instance v5, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-virtual {v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->getMeshEntry(Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    move-result-object v6

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;->textureFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-virtual {v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->getMeshEntry(Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    move-result-object v7

    iget-object v7, v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;->polyMesh:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-boolean v8, p1, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->hasGL20:Z

    invoke-direct {v5, p4, v6, v7, v8}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;-><init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;Z)V

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->parts:Ljava/util/Map;

    invoke-interface {v6, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationLock:Ljava/lang/Object;

    monitor-enter v1

    if-eqz p5, :cond_1

    :try_start_0
    invoke-interface {p5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animations:Ljava/util/Map;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->animationID:Ljava/util/UUID;

    new-instance v5, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;

    invoke-direct {v5, v0, p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;-><init>(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)V

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationsInitialized:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateRunningAnimations()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateAttachments()V

    return-void
.end method

.method private DrawParts(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 10

    const/4 v4, 0x0

    const/4 v2, 0x0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->skeleton:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;

    if-nez v5, :cond_0

    return-void

    :cond_0
    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->getBodySize()F

    move-result v0

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->getPelvisToFoot()F

    move-result v1

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->getPelvisOffset()F

    move-result v3

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->parentID:I

    if-nez v6, :cond_3

    neg-float v0, v0

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v0, v6

    add-float/2addr v0, v1

    add-float/2addr v0, v3

    :goto_0
    iget-object v1, v5, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->rootBone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionX()F

    move-result v1

    neg-float v1, v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateX:F

    iget-object v1, v5, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->rootBone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionY()F

    move-result v1

    neg-float v1, v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateY:F

    iget-object v1, v5, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->rootBone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionZ()F

    move-result v1

    neg-float v1, v1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateZ:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateX:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateY:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateZ:F

    invoke-virtual {p1, v0, v1, v3}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldTranslatef(FFF)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->localAviWorldMatrix:[F

    invoke-virtual {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrix([FI)V

    iget-object v0, v5, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->jointMatrix:[F

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->GLPrepare(Lcom/lumiyaviewer/lumiya/render/RenderContext;[F)V

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    array-length v7, v6

    move v3, v4

    :goto_1
    if-ge v3, v7, :cond_5

    aget-object v1, v6, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->parts:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->MESH_ID_EYEBALL_LEFT:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    if-ne v1, v8, :cond_4

    iget-object v1, v5, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mEyeLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    :goto_2
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getGlobalMatrix()[F

    move-result-object v8

    invoke-virtual {p1, v8, v4}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPushAndMultMatrixf([FI)V

    :cond_1
    iget-object v8, v5, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->jointMatrix:[F

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->jointMatrixUpdated:Z

    invoke-virtual {v0, p1, v8, v9}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;[FZ)V

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPopMatrix()V

    :cond_2
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    goto :goto_0

    :cond_4
    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->MESH_ID_EYEBALL_RIGHT:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    if-ne v1, v8, :cond_9

    iget-object v1, v5, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mEyeRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    goto :goto_2

    :cond_5
    iget-object v0, v5, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->bones:Ljava/util/Map;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHead:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getGlobalMatrix()[F

    move-result-object v0

    invoke-virtual {p1, v0, v4}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPushAndMultMatrixf([FI)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v1

    add-int/lit8 v3, v1, 0xc

    aget v3, v0, v3

    add-int/lit8 v6, v1, 0xd

    aget v6, v0, v6

    add-int/lit8 v1, v1, 0xe

    aget v0, v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->headPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    if-nez v1, :cond_6

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->headPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    :cond_6
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->headPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v1, v3, v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPopMatrix()V

    :cond_7
    iput-object v2, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableAttachmentList:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->jointMatrixUpdated:Z

    invoke-virtual {v0, p1, v5, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;->Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;Z)Z

    move-result v0

    if-eqz v0, :cond_8

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableAttachmentList:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;-><init>(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableAttachmentList:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;

    :cond_8
    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->jointMatrixUpdated:Z

    return-void

    :cond_9
    move-object v1, v2

    goto/16 :goto_2
.end method

.method private GLPrepare(Lcom/lumiyaviewer/lumiya/render/RenderContext;[F)V
    .locals 3

    const/4 v2, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->sTexture:I

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uObjCoordScale:I

    invoke-static {v0, v1, v1, v1, v1}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uMVPMatrix:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelApplyMatrix(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightPreset:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->SetupLighting(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uJointMatrix:I

    const/16 v1, 0x85

    invoke-static {v0, v1, v2, p2, v2}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    :goto_0
    return-void

    :cond_0
    const/16 v0, 0x1702

    invoke-static {v0}, Landroid/opengl/GLES11;->glMatrixMode(I)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/utils/IdentityMatrix;->getMatrix()[F

    move-result-object v0

    invoke-static {v0, v2}, Landroid/opengl/GLES11;->glLoadMatrixf([FI)V

    const/16 v0, 0x1700

    invoke-static {v0}, Landroid/opengl/GLES11;->glMatrixMode(I)V

    goto :goto_0
.end method

.method private animate(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;)Z
    .locals 4

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->needForceAnimate()Z

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->runningAnimations:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;->needAnimate(J)Z

    move-result v2

    if-nez v2, :cond_0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationSkeletonData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animate(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;)V

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private getRunningAnimations()Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animations:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private processUpdateAttachments()V
    .locals 13

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    invoke-static {}, Lcom/google/common/collect/ArrayListMultimap;->create()Lcom/google/common/collect/ArrayListMultimap;

    move-result-object v10

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v11

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->displayedHUDid:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v12

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getFirstChild()Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    move-result-object v0

    move-object v9, v0

    move-object v2, v6

    :goto_0
    if-eqz v9, :cond_2

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getDataObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-boolean v0, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    if-nez v0, :cond_c

    iget v0, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentID:I

    if-ltz v0, :cond_0

    const/16 v1, 0x38

    if-ge v0, v1, :cond_0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    aget-object v1, v1, v0

    if-eqz v1, :cond_c

    iget-boolean v4, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->isHUD:Z

    if-eqz v4, :cond_1

    iget v0, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    if-ne v12, v0, :cond_c

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableAttachments:Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/DrawableStore;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)V

    :goto_1
    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getNextChild()Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    move-result-object v1

    move-object v9, v1

    move-object v2, v0

    goto :goto_0

    :cond_0
    move-object v0, v2

    goto :goto_1

    :cond_1
    invoke-direct {p0, v3, v10, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateAttachmentParts(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/google/common/collect/Multimap;I)V

    move-object v0, v2

    goto :goto_1

    :cond_2
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->deadAttachmentsLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->deadAttachmentsList:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->deadAttachmentsList:Ljava/util/Set;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->deadAttachmentsList:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->deadAttachmentsList:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v1, v0

    :goto_2
    monitor-exit v3

    invoke-interface {v10}, Lcom/google/common/collect/Multimap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v3, v7

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->isRiggedMesh()Z

    move-result v5

    if-eqz v5, :cond_a

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->riggedMeshes:Ljava/util/Set;

    invoke-interface {v5, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    move v3, v8

    :cond_3
    invoke-interface {v11, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move v0, v3

    :goto_4
    move v3, v0

    goto :goto_3

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_4
    if-eqz v1, :cond_5

    array-length v4, v1

    :goto_5
    if-ge v7, v4, :cond_5

    aget-object v0, v1, v7

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableAttachments:Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;->removeEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    instance-of v5, v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;

    if-eqz v5, :cond_9

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->getDrawableObject()Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    move-result-object v0

    if-eqz v0, :cond_9

    invoke-interface {v11, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->riggedMeshes:Ljava/util/Set;

    invoke-interface {v5, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    move v0, v8

    :goto_6
    add-int/lit8 v7, v7, 0x1

    move v3, v0

    goto :goto_5

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->riggedMeshes:Ljava/util/Set;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    invoke-interface {v11, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->riggedMeshes:Ljava/util/Set;

    invoke-interface {v3, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move v3, v8

    goto :goto_7

    :cond_7
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableHUD:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;

    invoke-direct {v0, v10}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;-><init>(Lcom/google/common/collect/Multimap;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableAttachmentList:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAttachments;

    if-eqz v3, :cond_8

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateRiggedMeshes()V

    :cond_8
    return-void

    :cond_9
    move v0, v3

    goto :goto_6

    :cond_a
    move v0, v3

    goto :goto_4

    :cond_b
    move-object v1, v6

    goto/16 :goto_2

    :cond_c
    move-object v0, v2

    goto/16 :goto_1
.end method

.method private updateAttachmentParts(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/google/common/collect/Multimap;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/render/DrawableObject;",
            ">;I)V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableAttachments:Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;->addEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    invoke-virtual {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->getDrawableAttachment(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    move-result-object v0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, v1, v0}, Lcom/google/common/collect/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getFirstChild()Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    move-result-object v0

    move-object v1, v0

    :goto_0
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getDataObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_1

    invoke-direct {p0, v0, p2, p3}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateAttachmentParts(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/google/common/collect/Multimap;I)V

    :cond_1
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getNextChild()Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    move-result-object v0

    move-object v1, v0

    goto :goto_0

    :cond_2
    return-void
.end method

.method private updateRiggedMeshes()V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->shapeParamsUpdate:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_render_avatar_DrawableAvatar-mthref-0()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->processUpdateAttachments()V

    return-void
.end method

.method AnimationRemove(Ljava/util/UUID;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animations:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateRunningAnimations()V

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method AnimationUpdate(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;)V
    .locals 4

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->animationID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animations:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animations:Ljava/util/Map;

    new-instance v3, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;

    invoke-direct {v3, p1, p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;-><init>(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)V

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateRunningAnimations()V

    return-void

    :cond_0
    :try_start_1
    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->updateSequenceInfo(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method public Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 2

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->getWorldMatrix(Lcom/lumiyaviewer/lumiya/render/RenderContext;)[F

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1, v0, v1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPushAndMultMatrixf([FI)V

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->DrawParts(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPopMatrix()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public DrawNameTag(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 9

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableNameTag:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->headPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    if-eqz v1, :cond_1

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v3, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v4, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v6, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    const/high16 v5, 0x3f000000    # 0.5f

    move-object v1, p1

    move v8, v7

    invoke-virtual/range {v0 .. v8}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->DrawAtWorld(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFFFLcom/lumiyaviewer/lumiya/render/MatrixStack;ZI)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->DrawNameTag(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    goto :goto_0
.end method

.method IsAnimationStopped(Ljava/util/UUID;)Z
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animations:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationState;->hasStopped()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public PickObject(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFF)Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;
    .locals 18

    invoke-virtual/range {p0 .. p1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->getWorldMatrix(Lcom/lumiyaviewer/lumiya/render/RenderContext;)[F

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->skeleton:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;

    const/4 v13, 0x0

    if-eqz v2, :cond_2

    if-eqz v14, :cond_2

    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/16 v1, 0x20

    new-array v1, v1, [F

    const/4 v3, 0x6

    new-array v11, v3, [F

    const/4 v3, 0x3

    aget v3, v9, v3

    int-to-float v3, v3

    sub-float v15, v3, p3

    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPushAndMultMatrixf([FI)V

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateX:F

    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateY:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->pelvisTranslateZ:F

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldTranslatef(FFF)V

    iget-object v2, v14, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->bones:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->boneID:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    iget-boolean v3, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->isJoint:Z

    if-nez v3, :cond_0

    iget-object v3, v14, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->jointWorldMatrix:[F

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->boneID:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->ordinal()I

    move-result v2

    mul-int/lit8 v2, v2, 0x10

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v2}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPushAndMultMatrixf([FI)V

    move-object/from16 v0, p1

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v2, :cond_3

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v3

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v4

    const/4 v2, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static/range {v1 .. v7}, Landroid/opengl/Matrix;->scaleM([FI[FIFFF)V

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v7

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v8

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    move/from16 v2, p2

    move v3, v15

    move-object v5, v1

    invoke-static/range {v2 .. v12}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->gluUnProject(FFF[FI[FI[II[FI)I

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v7

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v8

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x3

    move/from16 v2, p2

    move v3, v15

    move-object v5, v1

    invoke-static/range {v2 .. v12}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->gluUnProject(FFF[FI[FI[II[FI)I

    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPopMatrix()V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v2, 0x0

    aget v2, v11, v2

    const/4 v3, 0x1

    aget v3, v11, v3

    const/4 v5, 0x2

    aget v5, v11, v5

    invoke-direct {v4, v2, v3, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v2, 0x3

    aget v2, v11, v2

    const/4 v3, 0x4

    aget v3, v11, v3

    const/4 v6, 0x5

    aget v6, v11, v6

    invoke-direct {v5, v2, v3, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->getInstance()Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;

    move-result-object v2

    iget-object v6, v2, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->vertices:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v3, 0x0

    const/4 v2, 0x0

    move/from16 v17, v2

    move-object v2, v3

    move/from16 v3, v17

    :goto_1
    const/16 v7, 0xc

    if-ge v3, v7, :cond_1

    mul-int/lit8 v2, v3, 0x3

    invoke-static {v4, v5, v6, v2}, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace;->intersect_RayTriangle(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;I)Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;

    move-result-object v2

    if-eqz v2, :cond_4

    :cond_1
    if-eqz v2, :cond_0

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    move-object/from16 v0, p1

    invoke-static {v0, v3, v1}, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace;->getIntersectionDepth(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;[F)F

    move-result v3

    cmpl-float v4, v3, p4

    if-ltz v4, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    new-instance v4, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    invoke-direct {v4, v2}, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-direct {v1, v4, v2, v3}, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;-><init>(Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;F)V

    :goto_2
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPopMatrix()V

    move-object v13, v1

    :cond_2
    return-object v13

    :cond_3
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v3

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v4

    const/16 v2, 0x10

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static/range {v1 .. v7}, Landroid/opengl/Matrix;->scaleM([FI[FIFFF)V

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v3

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v4

    const/4 v2, 0x0

    const/16 v6, 0x10

    move-object v5, v1

    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v7

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v8

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    move/from16 v2, p2

    move v3, v15

    move-object v5, v1

    invoke-static/range {v2 .. v12}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->gluUnProject(FFF[FI[FI[II[FI)I

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v7

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v8

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x3

    move/from16 v2, p2

    move v3, v15

    move-object v5, v1

    invoke-static/range {v2 .. v12}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->gluUnProject(FFF[FI[FI[II[FI)I

    goto/16 :goto_0

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    :cond_5
    move-object v1, v13

    goto :goto_2
.end method

.method public RunAnimations()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updatedSkeleton:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;

    if-eqz v0, :cond_0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->skeleton:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->skeleton:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;

    if-eqz v0, :cond_1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animate(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationSkeletonData:Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->UpdateGlobalPositions(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->jointMatrixUpdated:Z

    const/4 v1, 0x1

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->jointMatrixUpdated:Z

    :cond_1
    return-void
.end method

.method UpdateShapeParams(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;)V
    .locals 2

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->shapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->shapeParamsUpdate:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method UpdateTextures(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->parts:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->getFaceIndex()Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;->getTexture(Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v1, v3, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->setTexture(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;Ljava/util/UUID;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getDrawableHUD()Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->drawableHUD:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_render_avatar_DrawableAvatar_15479()V
    .locals 5

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->shapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    if-eqz v2, :cond_1

    const-string/jumbo v1, "Avatar: shapeParamsUpdate: %d rigged meshes"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->riggedMeshes:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->riggedMeshes:Ljava/util/Set;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v0

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->ApplyJointTranslations(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->hasExtendedBones()Z

    move-result v0

    or-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    new-instance v4, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;

    invoke-direct {v4, v2, v3, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;-><init>(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updatedSkeleton:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->parts:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    invoke-virtual {v4, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->getMorphParams(Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;)[F

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->setPartMorphParams([F)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public onEntryRemovalRequested(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->deadAttachmentsLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->deadAttachmentsList:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateAttachments()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onRiggedMeshReady(Lcom/lumiyaviewer/lumiya/render/DrawableObject;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->riggedMeshes:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateRiggedMeshes()V

    :cond_0
    return-void
.end method

.method public setDisplayedHUDid(I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->displayedHUDid:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    move-result v0

    if-eq v0, p1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateAttachments()V

    :cond_0
    return-void
.end method

.method public updateAttachments()V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateAttachmentsRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method updateRunningAnimations()V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->animationsInitialized:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->getRunningAnimations()Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->runningAnimations:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->skeleton:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->setForceAnimate()V

    :cond_0
    return-void
.end method
