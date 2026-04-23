.class public Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$AssetLoadRequest;,
        Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;,
        Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$InstanceHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache",
        "<",
        "Ljava/util/UUID;",
        "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;",
        ">;"
    }
.end annotation


# instance fields
.field private final assetAnimations:Lcom/google/common/collect/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final assetResponseCacher:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->assetResponseCacher:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method private constructor <init>()V
    .locals 3

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->assetResponseCacher:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->builder()Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAssetManager()Landroid/content/res/AssetManager;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    const-string/jumbo v2, "anims"

    invoke-virtual {v0, v2}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableSet$Builder;->addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSet$Builder;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableSet$Builder;->build()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->assetAnimations:Lcom/google/common/collect/ImmutableSet;

    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->CreateNewRequest(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method

.method protected CreateNewRequest(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->assetAnimations:Lcom/google/common/collect/ImmutableSet;

    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$AssetLoadRequest;

    invoke-direct {v1, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$AssetLoadRequest;-><init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/lang/String;)V

    return-object v1

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;

    invoke-direct {v0, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;-><init>(Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-object v0
.end method

.method public setAssetResponseCacher(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->assetResponseCacher:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void
.end method
