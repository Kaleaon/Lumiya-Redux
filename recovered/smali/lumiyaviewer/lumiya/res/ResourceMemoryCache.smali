.class public abstract Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceManager;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ResourceParams:",
        "Ljava/lang/Object;",
        "ResourceType:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
        "<TResourceParams;TResourceType;>;"
    }
.end annotation


# instance fields
.field private final finalResults:Lcom/google/common/cache/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/Cache",
            "<TResourceParams;TResourceType;>;"
        }
    .end annotation
.end field

.field private final intermediateResults:Lcom/google/common/cache/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/Cache",
            "<TResourceParams;TResourceType;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;-><init>()V

    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakValues()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->build()Lcom/google/common/cache/Cache;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;->finalResults:Lcom/google/common/cache/Cache;

    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakValues()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->build()Lcom/google/common/cache/Cache;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;->intermediateResults:Lcom/google/common/cache/Cache;

    return-void
.end method


# virtual methods
.method public CompleteRequest(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;TResourceType;",
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
            ">;)V"
        }
    .end annotation

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;->finalResults:Lcom/google/common/cache/Cache;

    invoke-interface {v0, p1, p2}, Lcom/google/common/cache/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->CompleteRequest(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;->finalResults:Lcom/google/common/cache/Cache;

    invoke-interface {v0, p1}, Lcom/google/common/cache/Cache;->invalidate(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public IntermediateResult(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;TResourceType;",
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
            ">;)V"
        }
    .end annotation

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;->intermediateResults:Lcom/google/common/cache/Cache;

    invoke-interface {v0, p1, p2}, Lcom/google/common/cache/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->IntermediateResult(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;->intermediateResults:Lcom/google/common/cache/Cache;

    invoke-interface {v0, p1}, Lcom/google/common/cache/Cache;->invalidate(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;->finalResults:Lcom/google/common/cache/Cache;

    invoke-interface {v0, p1}, Lcom/google/common/cache/Cache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-interface {p2, v0, v1}, Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;->OnResourceReady(Ljava/lang/Object;Z)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;->intermediateResults:Lcom/google/common/cache/Cache;

    invoke-interface {v0, p1}, Lcom/google/common/cache/Cache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    invoke-interface {p2, v0, v1}, Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;->OnResourceReady(Ljava/lang/Object;Z)V

    :cond_1
    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method
