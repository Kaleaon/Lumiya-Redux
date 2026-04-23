.class Lcom/lumiyaviewer/lumiya/res/ResourceManager$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/common/cache/RemovalListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/ResourceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/cache/RemovalListener",
        "<",
        "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<TResourceParams;TResourceType;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager$1;->this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRemoval(Lcom/google/common/cache/RemovalNotification;)V
    .locals 3
    .param p1    # Lcom/google/common/cache/RemovalNotification;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/RemovalNotification",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<TResourceParams;TResourceType;>;>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/common/cache/RemovalNotification;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;

    invoke-virtual {p1}, Lcom/google/common/cache/RemovalNotification;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->isCompleted()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->isCancelled()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_1

    if-eqz v0, :cond_0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->removeConsumer(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)Z

    :cond_0
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->isStale()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->setCancelled(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager$1;->this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->-get0(Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager$1;->this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->-get1(Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/google/common/cache/LoadingCache;

    move-result-object v0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->getParams()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/google/common/cache/LoadingCache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager$1;->this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->-get1(Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/google/common/cache/LoadingCache;

    move-result-object v0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->getParams()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/cache/LoadingCache;->invalidate(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method
