.class public Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest$TextureUploadCompleteListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;,
        Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$DefaultTextureException;,
        Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;
    }
.end annotation


# instance fields
.field private final avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

.field private final bakedImages:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;",
            "Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;",
            ">;"
        }
    .end annotation
.end field

.field private final bakingThread:Ljava/lang/Thread;

.field private final eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

.field private paramValues:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final textureReadyLock:Ljava/lang/Object;

.field private final uploader:Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;

.field private final wearables:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;",
            ">;>;"
        }
    .end annotation
.end field

.field private final wornWearables:Lcom/google/common/collect/Table;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->notifyTextureReady()V

    return-void
.end method

.method public constructor <init>(Lcom/google/common/collect/Table;Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;Lcom/lumiyaviewer/lumiya/eventbus/EventBus;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;",
            "Lcom/lumiyaviewer/lumiya/eventbus/EventBus;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->wearables:Ljava/util/Map;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->textureReadyLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->bakedImages:Ljava/util/Map;

    const-string/jumbo v0, "Baking: new BakeProcess created"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->wornWearables:Lcom/google/common/collect/Table;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->uploader:Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    invoke-interface {p1}, Lcom/google/common/collect/Table;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->getWearableData()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;->textures:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;->textures:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;

    invoke-direct {v5, p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;)V

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->wearables:Ljava/util/Map;

    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/-$Lambda$qb61PwDoxRPFEOdyYwns3UfUTbM;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/baker/-$Lambda$qb61PwDoxRPFEOdyYwns3UfUTbM;-><init>(Ljava/lang/Object;)V

    const-string/jumbo v2, "Baker"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->bakingThread:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->bakingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private PrepareAvatarTextureEntry()Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;
    .locals 9

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;-><init>(I)V

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->create(Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    move-result-object v3

    const/16 v0, 0x20

    new-array v4, v0, [Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->values()[Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    move-result-object v5

    array-length v6, v5

    move v1, v2

    :goto_0
    if-ge v1, v6, :cond_1

    aget-object v0, v5, v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->getFaceIndex()Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->ordinal()I

    move-result v7

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->bakedImages:Ljava/util/Map;

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->getUploadedID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    invoke-direct {v8, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;-><init>(I)V

    invoke-virtual {v8, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setTextureID(Ljava/util/UUID;)V

    invoke-static {v8}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->create(Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    move-result-object v0

    aput-object v0, v4, v7

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->create(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    move-result-object v0

    return-object v0
.end method

.method private bakeAppearance()V
    .locals 13

    const/4 v12, 0x1

    const/4 v11, 0x0

    const/4 v2, 0x0

    const-string/jumbo v0, "Baking: Requesting texture data."

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->wearables:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->requestData()V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->textureReadyLock:Ljava/lang/Object;

    monitor-enter v1

    :goto_1
    :try_start_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->isTexturesReady()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_2

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->textureReadyLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    :try_start_2
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->finishBaking(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V

    const-string/jumbo v0, "Baking: Interrupted before textures were ready."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v1

    return-void

    :cond_2
    monitor-exit v1

    const-string/jumbo v0, "Baking: calculating param values..."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->wornWearables:Lcom/google/common/collect/Table;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->calcAllParamValues(Lcom/google/common/collect/Table;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->paramValues:Ljava/util/Map;

    const-string/jumbo v0, "Baking: baking..."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->isWearingSkirt()Z

    move-result v3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    const-string/jumbo v1, "baker"

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getCacheDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->values()[Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    move-result-object v5

    array-length v6, v5

    move v1, v2

    :goto_2
    if-ge v1, v6, :cond_6

    aget-object v7, v5, v1

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "Baking: interrupted."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;

    invoke-direct {v1, v2, v12, v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;-><init>(ZZI)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    invoke-direct {p0, v11}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->finishBaking(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_3
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    if-ne v7, v0, :cond_4

    xor-int/lit8 v0, v3, 0x1

    if-eqz v0, :cond_4

    :goto_3
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2

    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Baking: Baking layer "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayers;->layerSets:Ljava/util/Map;

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    invoke-direct {v8, v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;-><init>(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->bakedImages:Ljava/util/Map;

    invoke-interface {v0, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v8, p0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->Bake(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;)V

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_5

    const-string/jumbo v0, "Baking: interrupted."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;

    invoke-direct {v1, v2, v12, v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;-><init>(ZZI)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    invoke-direct {p0, v11}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->finishBaking(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V

    return-void

    :cond_5
    :try_start_3
    new-instance v0, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, ".j2k"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v0, v4, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->SaveToJPEG2K(Ljava/io/File;)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;

    invoke-direct {v9, v8, v7, v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;-><init>(Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;Ljava/io/File;)V

    invoke-virtual {v9, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->setOnUploadComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest$TextureUploadCompleteListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->uploader:Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;

    invoke-virtual {v0, v9}, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;->BeginUpload(Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Baking: Done layer "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    goto/16 :goto_3

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    :cond_6
    const-string/jumbo v0, "Baking: Baked all layers."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    return-void
.end method

.method private calcAllParamValues(Lcom/google/common/collect/Table;)Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    const/4 v10, 0x0

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramByIDs:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

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

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v1, v10}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->defValue:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lcom/google/common/collect/Table;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->getWearableData()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;->params:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramIndex:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramValue:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramByIDs:Lcom/google/common/collect/ImmutableMap;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    if-eqz v1, :cond_2

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v1, v10}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->drivenParams:Lcom/google/common/collect/ImmutableList;

    if-eqz v2, :cond_2

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->drivenParams:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramByIDs:Lcom/google/common/collect/ImmutableMap;

    iget v8, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->drivenID:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v3, v8}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    if-eqz v3, :cond_3

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramValue:F

    invoke-static {v9, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->getDrivenWeight(FLcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;)F

    move-result v3

    iget v9, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->drivenID:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v4, v9, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_4
    return-object v4
.end method

.method private finishBaking(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->finishBaking(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V

    return-void
.end method

.method private isTexturesReady()Z
    .locals 4

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->wearables:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->getTextureReady()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    return v1
.end method

.method private isWearingSkirt()Z
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->wornWearables:Lcom/google/common/collect/Table;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    invoke-interface {v1, v2}, Lcom/google/common/collect/Table;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private notifyTextureReady()V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->textureReadyLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->textureReadyLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_slproto_baker_BakeProcess-mthref-0()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->bakeAppearance()V

    return-void
.end method

.method public OnTextureUploadComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;)V
    .locals 12

    const/4 v6, 0x1

    const/4 v2, 0x0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;

    if-eqz v0, :cond_3

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Baking: texture "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;->bakedIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " uploaded, UUID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;->getTextureID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;->bakedImage:Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;->getTextureID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->setUploadedID(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->bakedImages:Ljava/util/Map;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;->bakedIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;->bakedImage:Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->isWearingSkirt()Z

    move-result v7

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->values()[Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    move-result-object v8

    array-length v9, v8

    move v5, v2

    move v1, v6

    move v3, v2

    move v0, v2

    :goto_0
    if-ge v5, v9, :cond_2

    aget-object v10, v8, v5

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    if-ne v10, v4, :cond_0

    xor-int/lit8 v4, v7, 0x1

    if-eqz v4, :cond_0

    move v11, v1

    move v1, v3

    move v3, v0

    move v0, v11

    :goto_1
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    move v11, v0

    move v0, v3

    move v3, v1

    move v1, v11

    goto :goto_0

    :cond_0
    add-int/lit8 v4, v0, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->bakedImages:Ljava/util/Map;

    invoke-interface {v0, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    add-int/lit8 v0, v3, 0x1

    move v1, v0

    move v3, v4

    move v0, v2

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->bakedImages:Ljava/util/Map;

    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->getUploadedID()Ljava/util/UUID;

    move-result-object v0

    if-nez v0, :cond_5

    add-int/lit8 v0, v3, 0x1

    move v1, v0

    move v3, v4

    move v0, v2

    goto :goto_1

    :cond_2
    if-eqz v1, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;

    const/16 v3, 0x64

    invoke-direct {v1, v2, v6, v3}, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;-><init>(ZZI)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    const-string/jumbo v0, "Baking: all textures uploaded."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->PrepareAvatarTextureEntry()Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->finishBaking(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V

    :cond_3
    :goto_2
    return-void

    :cond_4
    sub-int v1, v0, v3

    mul-int/lit8 v1, v1, 0x64

    div-int v0, v1, v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;

    invoke-direct {v3, v2, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;-><init>(ZZI)V

    invoke-virtual {v1, v3}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    goto :goto_2

    :cond_5
    move v0, v1

    move v1, v3

    move v3, v4

    goto :goto_1
.end method

.method public cancel()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->bakingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    return-void
.end method

.method getLocalTexture(Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$DefaultTextureException;
        }
    .end annotation

    const/4 v4, 0x1

    const/4 v2, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->wearables:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v1, v2

    move-object v3, v0

    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->getTexture()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;

    move-result-object v5

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;->layer:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->ordinal()I

    move-result v8

    if-ne v5, v8, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->getTexture()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;

    move-result-object v5

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;->textureID:Ljava/util/UUID;

    if-eqz v5, :cond_6

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->getTexture()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;

    move-result-object v5

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;->textureID:Ljava/util/UUID;

    sget-object v8, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->DEFAULT_AVATAR_TEXTURE:Ljava/util/UUID;

    invoke-virtual {v5, v8}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    move v5, v4

    :goto_1
    if-eqz v5, :cond_2

    move v1, v4

    goto :goto_0

    :cond_2
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->-get0(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;)Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->getTextureData()Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    move-result-object v0

    if-eqz v0, :cond_1

    if-nez v3, :cond_3

    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    :cond_3
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_4
    if-nez v3, :cond_5

    if-eqz v1, :cond_5

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$DefaultTextureException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$DefaultTextureException;-><init>()V

    throw v0

    :cond_5
    return-object v3

    :cond_6
    move v5, v2

    goto :goto_1
.end method

.method getParamWeight(ILcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;)F
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->paramValues:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0

    :cond_0
    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->defValue:F

    return v0
.end method
