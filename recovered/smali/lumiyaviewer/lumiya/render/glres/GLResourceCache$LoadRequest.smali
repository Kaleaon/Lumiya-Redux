.class Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Raw:TRawType;>",
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<TResourceParams;TResourceType;>;",
        "Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;",
        "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;"
    }
.end annotation


# instance fields
.field private volatile finalResult:Z

.field private volatile loadedFinal:Z

.field private volatile loadedResource:Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TResourceType;"
        }
    .end annotation
.end field

.field private volatile rawResource:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TRaw;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<TResourceParams;TResourceType;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-void
.end method


# virtual methods
.method public GLCompleteLoad()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->loadedResource:Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->loadedFinal:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->completeRequest(Ljava/lang/Object;)V

    :goto_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->intermediateResult(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public GLGetLoadSize()I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->rawResource:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;->GetResourceSize(Ljava/lang/Object;)I

    move-result v0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public GLLoad(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadHandler;)I
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->rawResource:Ljava/lang/Object;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->finalResult:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->getParams()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3, v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;->LoadResource(Ljava/lang/Object;Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;->getLoadedSize()I

    move-result v0

    :goto_0
    monitor-enter p0

    :try_start_1
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->loadedResource:Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->loadedFinal:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit p0

    if-eqz v2, :cond_0

    invoke-interface {p2, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadHandler;->GLResourceLoaded(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;)V

    :cond_0
    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 2

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->rawResource:Ljava/lang/Object;

    xor-int/lit8 v0, p2, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->finalResult:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    monitor-exit p0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;->-get0(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;)Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;->add(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;)V
    :try_end_2
    .catch Ljava/lang/ClassCastException; {:try_start_2 .. :try_end_2} :catch_0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;->-wrap0(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p0

    throw v0
    :try_end_3
    .catch Ljava/lang/ClassCastException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public cancelRequest()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;->-get0(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;)Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;->remove(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;->CancelRawResource(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void
.end method

.method public execute()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;->getParams()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;->RequestRawResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method
