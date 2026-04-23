.class public Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/RequestHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
        "<TK;>;"
    }
.end annotation


# instance fields
.field private final baseHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final executor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V
    .locals 0
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;->executor:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;->baseHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_react_AsyncRequestHandler_553(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;->baseHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequest(Ljava/lang/Object;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_AsyncRequestHandler_690(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;->baseHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequestCancelled(Ljava/lang/Object;)V

    return-void
.end method

.method public onRequest(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$SNlq3T7EFvfEVtJpS5BhPof2E2o;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$SNlq3T7EFvfEVtJpS5BhPof2E2o;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onRequestCancelled(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$SNlq3T7EFvfEVtJpS5BhPof2E2o$1;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$SNlq3T7EFvfEVtJpS5BhPof2E2o$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
