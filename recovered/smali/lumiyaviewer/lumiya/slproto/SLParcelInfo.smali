.class public Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;
.super Ljava/lang/Object;


# instance fields
.field private agentAvatar:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

.field private final agentAvatarLock:Ljava/lang/Object;

.field public final allObjectsNearby:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;"
        }
    .end annotation
.end field

.field private drawDistance:F

.field private final objectDisplayInfoComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;"
        }
    .end annotation
.end field

.field public final objectNamesQueue:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final orphanObjects:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private final rootObjects:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;"
        }
    .end annotation
.end field

.field private simSunHour:F

.field private simSunHourDirty:Z

.field private final simSunHourLock:Ljava/lang/Object;

.field public final terrainData:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;

.field private volatile userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

.field public final uuidsNearby:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    const/high16 v3, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->drawDistance:F

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->terrainData:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->agentAvatarLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->agentAvatar:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHourLock:Ljava/lang/Object;

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHour:F

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHourDirty:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v1, 0x400

    invoke-direct {v0, v1, v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v1, 0x80

    invoke-direct {v0, v1, v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->rootObjects:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->orphanObjects:Ljava/util/Map;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$1YF5tPpIlUnjvWeNVttYc5eIlFY;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$1YF5tPpIlUnjvWeNVttYc5eIlFY;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectDisplayInfoComparator:Ljava/util/Comparator;

    return-void
.end method

.method private addDisplayObjects(Ljava/lang/Iterable;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;ZLcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;Ljava/util/Set;Z)Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;",
            "Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;",
            "Z",
            "Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;",
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;Z)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move-object v11, v2

    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v10, :cond_e

    iget-object v3, v10, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    const/4 v2, 0x0

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->hasChildren()Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v2

    if-nez v2, :cond_3

    move/from16 v9, p7

    :goto_1
    const/4 v6, 0x0

    move-object v2, p0

    move-object v4, p2

    move-object/from16 v5, p3

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    invoke-direct/range {v2 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->addDisplayObjects(Ljava/lang/Iterable;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;ZLcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;Ljava/util/Set;Z)Ljava/util/ArrayList;

    move-result-object v2

    move-object v8, v2

    :goto_2
    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getAbsolutePosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iget v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    move-object/from16 v0, p3

    invoke-virtual {v0, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->distanceTo(FFF)F

    move-result v5

    if-eqz v8, :cond_4

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    :goto_3
    move/from16 v0, p7

    invoke-virtual {p2, v10, v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->objectMatches(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;FZ)Z

    move-result v6

    if-nez v2, :cond_0

    if-eqz v6, :cond_e

    :cond_0
    move-object/from16 v0, p5

    move-object/from16 v1, p6

    invoke-direct {p0, v10, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getKnownName(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;Ljava/util/Set;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->nameMatches(Ljava/lang/String;)Z

    move-result v4

    if-nez v2, :cond_1

    if-eqz v4, :cond_e

    :cond_1
    if-eqz v2, :cond_6

    if-eqz v6, :cond_5

    move v2, v4

    :goto_4
    xor-int/lit8 v7, v2, 0x1

    :goto_5
    if-nez v11, :cond_2

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    :cond_2
    if-eqz p4, :cond_b

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v2

    if-eqz v2, :cond_8

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;

    if-eqz v8, :cond_7

    invoke-static {v8}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v6

    :goto_6
    move-object v4, v10

    invoke-direct/range {v2 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;FLcom/google/common/collect/ImmutableList;Z)V

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v2, v11

    :goto_7
    move-object v11, v2

    goto/16 :goto_0

    :cond_3
    const/4 v9, 0x1

    goto :goto_1

    :cond_4
    const/4 v2, 0x0

    goto :goto_3

    :cond_5
    const/4 v2, 0x0

    goto :goto_4

    :cond_6
    const/4 v7, 0x0

    goto :goto_5

    :cond_7
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v6

    goto :goto_6

    :cond_8
    if-eqz v8, :cond_9

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_9
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;

    invoke-direct {v2, v10, v5}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;-><init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;F)V

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v2, v11

    goto :goto_7

    :cond_a
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;

    invoke-static {v8}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    invoke-direct {v2, v10, v5, v3, v7}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;-><init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;FLcom/google/common/collect/ImmutableList;Z)V

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v2, v11

    goto :goto_7

    :cond_b
    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v2

    if-eqz v2, :cond_c

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v6

    move-object v4, v10

    invoke-direct/range {v2 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;FLcom/google/common/collect/ImmutableList;Z)V

    :goto_8
    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v8, :cond_e

    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    move-object v2, v11

    goto :goto_7

    :cond_c
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;

    invoke-direct {v2, v10, v5}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;-><init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;F)V

    goto :goto_8

    :cond_d
    return-object v11

    :cond_e
    move-object v2, v11

    goto :goto_7

    :cond_f
    move-object v8, v2

    goto/16 :goto_2
.end method

.method private getKnownName(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;Ljava/util/Set;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;",
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {p3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-virtual {p2, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;->addChatter(Ljava/util/UUID;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v0

    :cond_1
    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameKnown:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameKnown:Z

    if-eqz v1, :cond_3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->name:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_3
    return-object v0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_SLParcelInfo_17694(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;)I
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->distance:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->distance:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    return v0
.end method


# virtual methods
.method declared-synchronized ApplyAvatarAnimation(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->Sender_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$Sender;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$Sender;->ID:Ljava/util/UUID;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->ApplyAvatarAnimation(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p2, v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ApplyAvatarAnimation(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;)V
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

.method declared-synchronized ApplyAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->Sender_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$Sender;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$Sender;->ID:Ljava/util/UUID;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->ApplyAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)V
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

.method declared-synchronized addObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Z
    .locals 5

    const/4 v2, 0x1

    const/4 v4, 0x0

    const/4 v1, 0x0

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    monitor-exit p0

    return v4

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v3

    invoke-interface {v0, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-object v1, v0

    :cond_2
    if-eqz v1, :cond_4

    iget v0, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hierLevel:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hierLevel:I

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v0

    if-nez v0, :cond_3

    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAttachment:Z

    :goto_0
    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->setIsAttachmentAll(Z)V

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->addChild(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->orphanObjects:Ljava/util/Map;

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    if-eqz v0, :cond_8

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hierLevel:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hierLevel:I

    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAttachment:Z

    if-nez v1, :cond_7

    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAttachment:Z

    :goto_3
    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->setIsAttachmentAll(Z)V

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->addChild(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_3
    move v0, v2

    goto :goto_0

    :cond_4
    :try_start_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->orphanObjects:Ljava/util/Map;

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    if-nez v0, :cond_5

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->orphanObjects:Ljava/util/Map;

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->rootObjects:Ljava/util/Map;

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_7
    move v1, v2

    goto :goto_3

    :cond_8
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateSpatialIndex(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v2
.end method

.method public getAgentAvatar()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->agentAvatarLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->agentAvatar:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public declared-synchronized getAvatarObject(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDisplayObjects(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;
    .locals 10

    const/4 v8, 0x1

    const/4 v9, 0x0

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->rootObjects:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    const/4 v4, 0x1

    const/4 v7, 0x0

    move-object v0, p0

    move-object v2, p2

    move-object v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->addDisplayObjects(Ljava/lang/Iterable;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;ZLcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;Ljava/util/Set;Z)Ljava/util/ArrayList;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    monitor-exit p0

    invoke-virtual {p3, v6}, Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;->retainChatters(Ljava/util/Set;)V

    const-string/jumbo v3, "getDisplayObjects: objectList is %s, load queue %d"

    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/Object;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    aput-object v0, v4, v9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v8

    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectDisplayInfoComparator:Ljava/util/Comparator;

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;

    invoke-static {v1}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    if-eqz v2, :cond_1

    move v0, v8

    :goto_1
    invoke-direct {v3, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;-><init>(Lcom/google/common/collect/ImmutableList;Z)V

    return-object v3

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    const-string/jumbo v0, "null"

    goto :goto_0

    :cond_1
    move v0, v9

    goto :goto_1

    :cond_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    if-eqz v2, :cond_3

    :goto_2
    invoke-direct {v0, v1, v8}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;-><init>(Lcom/google/common/collect/ImmutableList;Z)V

    return-object v0

    :cond_3
    move v8, v9

    goto :goto_2
.end method

.method public declared-synchronized getObjectInfo(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-object v2

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getObjectLocalID(Ljava/util/UUID;)I
    .locals 2
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, -0x1

    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_0

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public getObjectUUID(I)Ljava/util/UUID;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSunHour([FZ)Z
    .locals 3

    const/4 v2, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHourLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHourDirty:Z

    if-nez v0, :cond_0

    if-eqz p2, :cond_1

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHour:F

    const/4 v2, 0x0

    aput v0, p1, v2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHourDirty:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    monitor-exit v1

    return v0

    :cond_1
    monitor-exit v1

    return v2

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public getUserTouchableObjects(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Ljava/util/UUID;)Lcom/google/common/collect/ImmutableList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;",
            "Ljava/util/UUID;",
            ")",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_2

    :try_start_1
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isTouchable()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameKnown:Z

    if-nez v3, :cond_1

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->RequestObjectName(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    :cond_1
    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;
    :try_end_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_2
    monitor-exit p0

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized initSpatialIndex()V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->rootObjects:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateSpatialIndex(Z)V
    :try_end_0
    .catch Ljava/util/ConcurrentModificationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_1
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isParentOrSame(Ljava/util/UUID;Ljava/util/UUID;)Z
    .locals 3

    const/4 v2, 0x1

    monitor-enter p0

    :try_start_0
    invoke-virtual {p2, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    monitor-exit p0

    return v2

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getParentObject()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-eqz v1, :cond_1

    monitor-exit p0

    return v2

    :cond_1
    :try_start_2
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getParentObject()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method killObject(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;I)Z
    .locals 10

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v4, 0x0

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/UUID;

    if-eqz v1, :cond_c

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v2, :cond_c

    const/4 v3, 0x1

    iput-boolean v3, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    iget v3, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->rootObjects:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    :goto_0
    :try_start_1
    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v8

    if-eqz v8, :cond_4

    if-nez v4, :cond_1

    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    :cond_1
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v3, v4

    :goto_2
    move-object v4, v3

    goto :goto_1

    :cond_2
    :try_start_2
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    iget v5, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/UUID;

    if-eqz v3, :cond_b

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    :goto_3
    if-eqz v3, :cond_3

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->removeChild(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    instance-of v5, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v5, :cond_0

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->processMyAttachmentUpdate(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    :cond_3
    :try_start_3
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->orphanObjects:Ljava/util/Map;

    iget v5, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/LinkedList;

    if-eqz v3, :cond_0

    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->orphanObjects:Ljava/util/Map;

    iget v5, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :cond_4
    :try_start_4
    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->killObject(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;I)Z

    move-object v3, v4

    goto :goto_2

    :cond_5
    if-eqz v4, :cond_a

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_4
    .catch Ljava/util/NoSuchElementException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v8

    move v5, v6

    :goto_4
    :try_start_5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->removeChild(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    const/4 v4, 0x0

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    instance-of v4, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v4, :cond_6

    move-object v0, v3

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-object v4, v0

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v4

    if-eqz v4, :cond_6

    move v5, v7

    :cond_6
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->rootObjects:Ljava/util/Map;

    iget v9, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v4, v9, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/util/NoSuchElementException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_4

    :catch_0
    move-exception v3

    :goto_5
    :try_start_6
    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move v3, v5

    :goto_6
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->removeFromSpatialIndex()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move v2, v3

    :goto_7
    if-eqz v1, :cond_7

    move v6, v7

    :cond_7
    monitor-exit p0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestObjectProfileUpdate(I)V

    if-eqz v2, :cond_8

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_8
    return v6

    :catch_1
    move-exception v3

    move v5, v6

    goto :goto_5

    :cond_9
    move v3, v5

    goto :goto_6

    :cond_a
    move v3, v6

    goto :goto_6

    :cond_b
    move-object v3, v4

    goto/16 :goto_3

    :cond_c
    move v2, v6

    goto :goto_7
.end method

.method public declared-synchronized reset(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->clearParcelInfo(Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;)V

    :cond_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->setParcelInfo(Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getExistingDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->requestEntryRemoval()V

    :cond_2
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->clearDrawListEntry()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->rootObjects:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->orphanObjects:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->terrainData:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->reset()V

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHour:F

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHourDirty:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void
.end method

.method public setAgentAvatar(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->agentAvatarLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->agentAvatar:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public setDrawDistance(F)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->drawDistance:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->drawDistance:F
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

.method setSunHour(F)V
    .locals 4

    const/4 v1, 0x1

    const-string/jumbo v0, "Windlight: Simulator sun hour set to %f"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHourLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHour:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->simSunHourDirty:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method declared-synchronized updateObjectParent(ILcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Z
    .locals 4

    const/4 v1, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    monitor-enter p0

    :try_start_0
    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne p1, v0, :cond_0

    monitor-exit p0

    return v3

    :cond_0
    if-eqz p1, :cond_4

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    if-eqz v0, :cond_9

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->removeChild(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateSpatialIndex(Z)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->orphanObjects:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    if-eqz v0, :cond_2

    invoke-virtual {v0, p2}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    :cond_2
    :goto_1
    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-object v2, v0

    :cond_3
    if-eqz v2, :cond_6

    iget v0, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hierLevel:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hierLevel:I

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v0

    if-nez v0, :cond_5

    iget-boolean v0, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAttachment:Z

    :goto_2
    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->setIsAttachmentAll(Z)V

    invoke-virtual {v2, p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->addChild(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    :goto_3
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateSpatialIndex(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v1

    :cond_4
    :try_start_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->rootObjects:Ljava/util/Map;

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_5
    move v0, v1

    goto :goto_2

    :cond_6
    :try_start_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->orphanObjects:Ljava/util/Map;

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    if-nez v0, :cond_7

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->orphanObjects:Ljava/util/Map;

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    invoke-virtual {v0, p2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_8
    const/4 v0, 0x0

    iput v0, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hierLevel:I

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->setIsAttachmentAll(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->rootObjects:Ljava/util/Map;

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    :cond_9
    move-object v0, v2

    goto/16 :goto_0
.end method
