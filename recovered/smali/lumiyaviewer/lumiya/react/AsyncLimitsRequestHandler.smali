.class public Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;
.super Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/RequestHandlerLimits;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler",
        "<TK;>;",
        "Lcom/lumiyaviewer/lumiya/react/RequestHandlerLimits;"
    }
.end annotation


# instance fields
.field private final isCancellable:Z

.field private final maxRequests:I

.field private final requestTimeout:J


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V
    .locals 1
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
            "<TK;>;ZIJ)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;->isCancellable:Z

    iput p4, p0, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;->maxRequests:I

    iput-wide p5, p0, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;->requestTimeout:J

    return-void
.end method


# virtual methods
.method public getMaxRequestsInFlight()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;->maxRequests:I

    return v0
.end method

.method public getRequestTimeout()J
    .locals 2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;->requestTimeout:J

    return-wide v0
.end method

.method public isRequestCancellable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;->isCancellable:Z

    return v0
.end method
