.class public abstract Lcom/lumiyaviewer/lumiya/react/RequestProcessor;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/RequestHandler;
.implements Lcom/lumiyaviewer/lumiya/react/RequestSource;
.implements Lcom/lumiyaviewer/lumiya/react/ResultHandler;
.implements Lcom/lumiyaviewer/lumiya/react/Refreshable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "Tup:",
        "Ljava/lang/Object;",
        "Tdown:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
        "<TK;>;",
        "Lcom/lumiyaviewer/lumiya/react/RequestSource",
        "<TK;TTdown;>;",
        "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
        "<TK;TTdown;>;",
        "Lcom/lumiyaviewer/lumiya/react/Refreshable",
        "<TK;>;"
    }
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<TK;TTup;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestSource;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestSource",
            "<TK;TTup;>;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->executor:Ljava/util/concurrent/Executor;

    invoke-interface {p1, p0}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    return-void
.end method

.method private processRequestInternal(Ljava/lang/Object;)V
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

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->processRequest(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v1, p1, v0}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->isRequestComplete(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequest(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method private requestUpdateInternal(Ljava/lang/Object;)V
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequest(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;)",
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<TK;TTdown;>;"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    return-object p0
.end method

.method public detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-ne v0, p1, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    :cond_0
    return-void
.end method

.method protected isRequestComplete(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TTup;)Z"
        }
    .end annotation

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_RequestProcessor_1507(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->requestUpdateInternal(Ljava/lang/Object;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_RequestProcessor_2159(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->processResult(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_RequestProcessor_940(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->processRequestInternal(Ljava/lang/Object;)V

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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->executor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->processRequestInternal(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onRequestCancelled(Ljava/lang/Object;)V
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequestCancelled(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public onResultData(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TTdown;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->executor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->processResult(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method protected abstract processRequest(Ljava/lang/Object;)Ljava/lang/Object;
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TTup;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method protected abstract processResult(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TTdown;)TTup;"
        }
    .end annotation
.end method

.method public requestUpdate(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->executor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$1;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$s15PKVbd3BFZx563Ff4DOHT5V_w$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;->requestUpdateInternal(Ljava/lang/Object;)V

    goto :goto_0
.end method
