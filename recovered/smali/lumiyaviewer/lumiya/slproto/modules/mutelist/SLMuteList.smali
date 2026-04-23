.class public Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList$1;
    }
.end annotation


# instance fields
.field private cachedCRC:Ljava/lang/Integer;

.field private final muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

.field private volatile muteListData:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

.field private final muteListRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            ">;"
        }
    .end annotation
.end field

.field private final muteListResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;>;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    return-object v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 4

    const/4 v3, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListData:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->cachedCRC:Ljava/lang/Integer;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDaoSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getMuteListCachedDataDao()Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->muteListPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    :goto_0
    return-void

    :cond_0
    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    goto :goto_0
.end method

.method private RequestMuteList()V
    .locals 5

    const/4 v4, 0x1

    const/4 v1, 0x0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest;-><init>()V

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest$MuteData;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->cachedCRC:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->cachedCRC:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_0
    iput v0, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest$MuteData;->MuteCRC:I

    iput-boolean v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest;->isReliable:Z

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    const-string/jumbo v0, "MuteList: Requested mute list (CRC %08x)"

    new-array v3, v4, [Ljava/lang/Object;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest$MuteData;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest$MuteData;->MuteCRC:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v3, v1

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_0
    move v0, v1

    goto :goto_0
.end method


# virtual methods
.method public Block(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListData:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->Block(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListData:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    const-string/jumbo v0, "MuteList: adding entry %s \'%s\'"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteName:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->type:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->ordinal()I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteType:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->flags:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteFlags:I

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->muteListPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public HandleCircuitReady()V
    .locals 4

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCircuitReady()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->listLazy()Lde/greenrobot/dao/query/LazyList;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->getData()[B

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;-><init>([B)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListData:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->getCRC()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->cachedCRC:Ljava/lang/Integer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->muteListPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_0
    invoke-virtual {v1}, Lde/greenrobot/dao/query/LazyList;->close()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->RequestMuteList()V

    :cond_1
    return-void
.end method

.method public HandleCloseCircuit()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->muteListPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCloseCircuit()V

    return-void
.end method

.method public HandleMuteListUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListUpdate;)V
    .locals 6
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v3, 0x1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListUpdate;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListUpdate$MuteData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListUpdate$MuteData;->Filename:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v0, "MuteList: fileName = \'%s\'"

    new-array v2, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v2, v4

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->xferManager:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_CACHE:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/4 v5, 0x0

    move-object v4, p0

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->RequestXfer(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;ZLcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleUseCachedMuteList(Lcom/lumiyaviewer/lumiya/slproto/messages/UseCachedMuteList;)V
    .locals 2
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const-string/jumbo v0, "MuteList: Using cached mute list."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public Unblock(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListData:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->Unblock(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListData:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    const-string/jumbo v0, "MuteList: removing entry %s \'%s\'"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry$MuteData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry$MuteData;->MuteID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry$MuteData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry$MuteData;->MuteName:[B

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->muteListPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public getMuteList()Lcom/google/common/collect/ImmutableList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListData:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->getMuteList()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    return-object v0
.end method

.method public isMuted(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;)Z
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListData:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->isMuted(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isMutedByName(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListData:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->isMutedByName(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public onXferComplete(Ljava/lang/Object;Ljava/lang/String;[B)V
    .locals 4

    const/4 v3, 0x0

    if-eqz p3, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    invoke-direct {v0, p3}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;-><init>([B)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListData:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    invoke-virtual {v0, p3}, Ljava/util/zip/CRC32;->update([B)V

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;->deleteAll()V

    new-instance v2, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;

    long-to-int v0, v0

    invoke-direct {v2, v3, v0, p3}, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;-><init>(Ljava/lang/Long;I[B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;->insert(Ljava/lang/Object;)J

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->muteListPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method
