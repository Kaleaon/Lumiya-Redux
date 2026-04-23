.class public abstract Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ResourceParams:",
        "Ljava/lang/Object;",
        "ResourceType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final consumers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
            ">;"
        }
    .end annotation
.end field

.field private isCancelled:Z

.field private isCompleted:Z

.field private final manager:Lcom/lumiyaviewer/lumiya/res/ResourceManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<TResourceParams;TResourceType;>;"
        }
    .end annotation
.end field

.field private final params:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TResourceParams;"
        }
    .end annotation
.end field

.field private started:Z


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<TResourceParams;TResourceType;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->started:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->isCompleted:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->isCancelled:Z

    new-instance v0, Ljava/util/WeakHashMap;

    const/4 v1, 0x4

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-direct {v0, v1, v2}, Ljava/util/WeakHashMap;-><init>(IF)V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->consumers:Ljava/util/Set;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->params:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->manager:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    return-void
.end method


# virtual methods
.method public addConsumer(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->consumers:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public cancelRequest()V
    .locals 0

    return-void
.end method

.method public completeRequest(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceType;)V"
        }
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->isCompleted:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->manager:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->params:Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->consumers:Ljava/util/Set;

    invoke-virtual {v0, v1, p1, v2}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->CompleteRequest(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)V

    return-void
.end method

.method public abstract execute()V
.end method

.method protected final getParams()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResourceParams;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->params:Ljava/lang/Object;

    return-object v0
.end method

.method public intermediateResult(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceType;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->manager:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->params:Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->consumers:Ljava/util/Set;

    invoke-virtual {v0, v1, p1, v2}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->IntermediateResult(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)V

    return-void
.end method

.method public isCancelled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->isCancelled:Z

    return v0
.end method

.method public final isCompleted()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->isCompleted:Z

    return v0
.end method

.method public isStale()Z
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->consumers:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public removeConsumer(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)Z
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->consumers:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->consumers:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public setCancelled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->isCancelled:Z

    return-void
.end method

.method public final willStart()Z
    .locals 2

    const/4 v1, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->started:Z

    if-nez v0, :cond_0

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->started:Z

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
