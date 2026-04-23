.class public abstract Lcom/lumiyaviewer/lumiya/react/ResultOperator;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/ResultHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "Tin:",
        "Ljava/lang/Object;",
        "Tout:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
        "<TK;TTin;>;"
    }
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final toHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<TK;TTout;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/react/ResultHandler;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/react/ResultHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<TK;TTout;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->executor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/react/ResultHandler;Ljava/util/concurrent/Executor;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/react/ResultHandler;
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
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<TK;TTout;>;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->executor:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_react_ResultOperator_1065(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_ResultOperator_796(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->onData(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method protected abstract onData(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTin;)TTout;"
        }
    .end annotation
.end method

.method public onResultData(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TTin;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->executor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$rbwdofHzZNihI1HZoTkj8gWFECo;

    invoke-direct {v1, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$rbwdofHzZNihI1HZoTkj8gWFECo;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->onData(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 2
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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->executor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$rbwdofHzZNihI1HZoTkj8gWFECo$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$rbwdofHzZNihI1HZoTkj8gWFECo$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/ResultOperator;->toHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
