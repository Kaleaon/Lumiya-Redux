.class public Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$1;,
        Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$2;
    }
.end annotation


# static fields
.field private static final MAX_BATCH_SIZE:I = 0x4


# instance fields
.field private final capsURL:Ljava/lang/String;

.field private final httpThreadRunnable:Ljava/lang/Runnable;

.field private final requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final requestQueue:Lcom/lumiyaviewer/lumiya/react/RequestQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestQueue",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ">;"
        }
    .end annotation
.end field

.field private final resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ">;"
        }
    .end annotation
.end field

.field private final threadMustExit:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final useDisplayNames:Z

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

.field private final workingThread:Ljava/lang/Thread;

.field private final xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;)Lcom/lumiyaviewer/lumiya/react/RequestQueue;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestQueue:Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->threadMustExit:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;Ljava/util/Set;Lcom/lumiyaviewer/lumiya/react/RequestQueue;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestNamesHttp(Ljava/util/Set;Lcom/lumiyaviewer/lumiya/react/RequestQueue;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V
    .locals 9

    const/4 v4, 0x0

    const/4 v8, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->threadMustExit:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$1;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;)V

    const/4 v5, 0x3

    const-wide/16 v6, 0x3a98

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->httpThreadRunnable:Ljava/lang/Runnable;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserNameRequestQueue()Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestQueue:Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetDisplayNames:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetDisplayNames:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->capsURL:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->useDisplayNames:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestQueue:Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestQueue:Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/react/RequestQueue;->getResultHandler()Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v8

    :cond_0
    iput-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->httpThreadRunnable:Ljava/lang/Runnable;

    const-string/jumbo v2, "DisplayNameFetcher"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->workingThread:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->workingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :goto_1
    return-void

    :cond_1
    move-object v0, v8

    goto :goto_0

    :cond_2
    iput-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->capsURL:Ljava/lang/String;

    iput-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->workingThread:Ljava/lang/Thread;

    iput-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->useDisplayNames:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestQueue:Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestQueue:Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestQueue;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v8

    :cond_3
    iput-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    goto :goto_1
.end method

.method private requestNamesHttp(Ljava/util/Set;Lcom/lumiyaviewer/lumiya/react/RequestQueue;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/react/RequestQueue",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ">;)V"
        }
    .end annotation

    const/4 v2, 0x1

    const/4 v3, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->capsURL:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v1, v2

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    const-string/jumbo v6, "UserName: Requesting name for %s over HTTP"

    new-array v7, v2, [Ljava/lang/Object;

    aput-object v0, v7, v3

    invoke-static {v6, v7}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v1, :cond_0

    const/16 v1, 0x3f

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1
    const-string/jumbo v1, "ids="

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v3

    goto :goto_0

    :cond_0
    const/16 v1, 0x26

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    if-eqz v1, :cond_5

    const-string/jumbo v0, "agents"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "agents"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    move v0, v3

    :goto_2
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v4

    if-ge v0, v4, :cond_3

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    const-string/jumbo v5, "id"

    invoke-virtual {v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v5

    const-string/jumbo v6, "display_name"

    invoke-virtual {v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v6

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "username"

    invoke-virtual {v4, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v4

    new-instance v7, Lcom/lumiyaviewer/lumiya/dao/UserName;

    const/4 v8, 0x0

    invoke-direct {v7, v5, v4, v6, v8}, Lcom/lumiyaviewer/lumiya/dao/UserName;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v4, v5, v7}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    invoke-interface {p1, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_3
    const-string/jumbo v0, "bad_ids"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string/jumbo v0, "bad_ids"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    :goto_3
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v1

    if-ge v3, v1, :cond_5

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/dao/UserName;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-direct {v2, v1, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/dao/UserName;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v4, v1, v2}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_4
    invoke-interface {p1, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_5
    return-void
.end method


# virtual methods
.method public HandleCloseCircuit()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->threadMustExit:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->InterruptRequest()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->workingThread:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->workingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestQueue:Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestQueue:Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestQueue;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    :cond_2
    return-void
.end method

.method public HandleUUIDNameReply(Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply;)V
    .locals 5
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply;->UUIDNameBlock_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply$UUIDNameBlock;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply$UUIDNameBlock;->ID:Ljava/util/UUID;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply$UUIDNameBlock;->FirstName:[B

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply$UUIDNameBlock;->LastName:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Lcom/lumiyaviewer/lumiya/dao/UserName;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v0, v0, v4}, Lcom/lumiyaviewer/lumiya/dao/UserName;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    return-void
.end method
