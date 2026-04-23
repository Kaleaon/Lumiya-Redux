.class public abstract Lcom/lumiyaviewer/lumiya/react/RequestOperator;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/RequestHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
        "<TK;>;"
    }
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<TK;TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final toHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/react/RequestHandler;Lcom/lumiyaviewer/lumiya/react/ResultHandler;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/ResultHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;",
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<TK;TT;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->executor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/react/RequestHandler;Lcom/lumiyaviewer/lumiya/react/ResultHandler;Ljava/util/concurrent/Executor;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/ResultHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;",
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<TK;TT;>;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->executor:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_react_RequestOperator_1579(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequestCancelled(Ljava/lang/Object;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_RequestOperator_996(Ljava/lang/Object;)V
    .locals 2

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->processRequest(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v1, p1, v0}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequest(Ljava/lang/Object;)V

    goto :goto_0
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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->executor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$3htMVvcf7XlS6QCgMv3cESjj4go;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$3htMVvcf7XlS6QCgMv3cESjj4go;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->processRequest(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v1, p1, v0}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequest(Ljava/lang/Object;)V

    goto :goto_0
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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->executor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$3htMVvcf7XlS6QCgMv3cESjj4go$1;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$3htMVvcf7XlS6QCgMv3cESjj4go$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequestCancelled(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected abstract processRequest(Ljava/lang/Object;)Ljava/lang/Object;
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TT;"
        }
    .end annotation
.end method
