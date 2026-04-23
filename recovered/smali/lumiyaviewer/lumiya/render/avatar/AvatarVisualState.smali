.class public Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;
.super Ljava/lang/Object;


# static fields
.field private static final basicAnimations:Lcom/google/common/collect/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private static final defaultStandingAnimation:Ljava/util/UUID;


# instance fields
.field private final agentUUID:Ljava/util/UUID;

.field private final animations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

.field private volatile avatarShapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

.field private final avatarUUID:Ljava/util/UUID;

.field private final textures:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string/jumbo v0, "2408fe9e-df1d-1d7d-f4ff-1384fa7b350f"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->defaultStandingAnimation:Ljava/util/UUID;

    new-instance v0, Lcom/google/common/collect/ImmutableSet$Builder;

    invoke-direct {v0}, Lcom/google/common/collect/ImmutableSet$Builder;-><init>()V

    const-string/jumbo v1, "2408fe9e-df1d-1d7d-f4ff-1384fa7b350f"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "15468e00-3400-bb66-cecc-646d7c14458e"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "370f3a20-6ca6-9971-848c-9a01bc42ae3c"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "42b46214-4b44-79ae-deb8-0df61424ff4b"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "f22fed8b-a5ed-2c93-64d5-bdd8b93c889f"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "201f3fdf-cb1f-dbec-201f-7333e328ae7c"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "47f5f6fb-22e5-ae44-f871-73aaaf4a6022"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "aec4610c-757f-bc4e-c092-c6e9caf18daf"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "2b5a38b2-5e00-3a97-a495-4c826bc443e6"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "4ae8016b-31b9-03bb-c401-b1ea941db41d"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "20f063ea-8306-2562-0b07-5c853b37b31e"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "62c5de58-cb33-5743-3d07-9e4cd4352864"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "05ddbff8-aaa9-92a1-2b74-8fe77a29b445"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "6ed24bd8-91aa-4b12-ccc7-c97c857ab4e0"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    const-string/jumbo v1, "f5fc7433-043d-e819-8298-f519a119b688"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet$Builder;->build()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->basicAnimations:Lcom/google/common/collect/ImmutableSet;

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;Ljava/util/UUID;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->textures:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->animations:Ljava/util/Map;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->agentUUID:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarUUID:Ljava/util/UUID;

    return-void
.end method

.method private startAnimation(Ljava/util/UUID;IJLcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)V
    .locals 7

    const/4 v2, 0x0

    const/4 v1, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->animations:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    if-nez v0, :cond_1

    const-string/jumbo v0, "Anim: Starting new animation %s seqID %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v3, v1

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p1, p3, p4, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->newSequence(Ljava/util/UUID;JI)Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->animations:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v5, v1

    move-object v1, v0

    move v0, v5

    :goto_0
    if-eqz v0, :cond_0

    if-eqz p5, :cond_0

    invoke-virtual {p5, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->AnimationUpdate(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;)V

    :cond_0
    return-void

    :cond_1
    iget v3, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->sequenceID:I

    if-eq p2, v3, :cond_2

    invoke-static {p3, p4, p2, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->restartSequence(JILcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->animations:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v5, v1

    move-object v1, v0

    move v0, v5

    goto :goto_0

    :cond_2
    move-object v1, v0

    move v0, v2

    goto :goto_0
.end method

.method private declared-synchronized updateAvatarShape()V
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getInstance()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getDrawableAvatar(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarShapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->UpdateShapeParams(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized updateTextures()V
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getInstance()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getDrawableAvatar(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->textures:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->UpdateTextures(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized ApplyAvatarAnimation(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;)V
    .locals 12

    const/4 v8, 0x1

    const/4 v7, 0x0

    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->animations:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v10, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getInstance()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getDrawableAvatar(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    move-result-object v6

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;->AnimID:Ljava/util/UUID;

    invoke-interface {v9, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-interface {v10, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;->AnimSequenceID:I

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->startAnimation(Ljava/util/UUID;IJLcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->basicAnimations:Lcom/google/common/collect/ImmutableSet;

    invoke-static {v9, v0}, Ljava/util/Collections;->disjoint(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->defaultStandingAnimation:Ljava/util/UUID;

    invoke-interface {v10, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->defaultStandingAnimation:Ljava/util/UUID;

    const/4 v3, 0x1

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->startAnimation(Ljava/util/UUID;IJLcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)V

    :cond_1
    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_2
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->animations:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    if-eqz v1, :cond_2

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->sequenceID:I

    if-eqz v2, :cond_8

    invoke-static {v4, v5, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->stopSequence(JLcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;

    move-result-object v1

    if-eqz v1, :cond_6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->animations:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v2, v8

    move-object v3, v1

    move v1, v7

    :goto_2
    if-eqz v3, :cond_3

    invoke-virtual {v3, v4, v5}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;->hasStopped(J)Z

    move-result v10

    or-int/2addr v1, v10

    :cond_3
    if-eqz v6, :cond_5

    if-eqz v2, :cond_4

    xor-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_4

    if-eqz v3, :cond_4

    invoke-virtual {v6, v3}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->AnimationUpdate(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSequenceInfo;)V

    :cond_4
    invoke-virtual {v6, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->IsAnimationStopped(Ljava/util/UUID;)Z

    move-result v2

    or-int/2addr v1, v2

    :cond_5
    if-eqz v1, :cond_2

    const-string/jumbo v1, "Anim: Stopping animation %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v10, 0x0

    aput-object v3, v2, v10

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->animations:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v6, :cond_2

    invoke-virtual {v6, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->AnimationRemove(Ljava/util/UUID;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :cond_6
    move v2, v8

    move-object v3, v1

    move v1, v8

    goto :goto_2

    :cond_7
    monitor-exit p0

    return-void

    :cond_8
    move v2, v7

    move-object v3, v1

    move v1, v7

    goto :goto_2
.end method

.method public declared-synchronized ApplyAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarShapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->create(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarShapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarShapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->updateAvatarShape()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->textures:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;->ApplyAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->updateTextures()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized ApplyTextures(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->textures:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;->ApplyTextures(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->updateTextures()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized ApplyVisualParams([I)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarShapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->create(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;[I)Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarShapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarShapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->updateAvatarShape()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createDrawableAvatar(Lcom/lumiyaviewer/lumiya/render/DrawableStore;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;
    .locals 6

    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->agentUUID:Ljava/util/UUID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarUUID:Ljava/util/UUID;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->animations:Ljava/util/Map;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;-><init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;Ljava/util/UUID;Ljava/util/Map;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarShapeParams:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->UpdateShapeParams(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->textures:Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->UpdateTextures(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createDrawableAvatarStub(Lcom/lumiyaviewer/lumiya/render/DrawableStore;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;
    .locals 3

    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->agentUUID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->avatarObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-direct {v0, p1, v1, v2}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;-><init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRunningAnimations()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->animations:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
