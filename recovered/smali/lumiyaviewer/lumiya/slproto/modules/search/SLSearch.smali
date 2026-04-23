.class public Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$2;
    }
.end annotation


# static fields
.field private static final DFQ_ADULT_SIMS_ONLY:I = 0x8000000

.field private static final DFQ_AGENT_OWNED:I = 0x40

.field private static final DFQ_AREA_SORT:I = 0x40000

.field private static final DFQ_AUCTION:I = 0x200

.field private static final DFQ_DATE_EVENTS:I = 0x20

.field private static final DFQ_DWELL_SORT:I = 0x400

.field private static final DFQ_EVENTS:I = 0x8

.field private static final DFQ_FILTER_MATURE:I = 0x400000

.field private static final DFQ_FOR_SALE:I = 0x80

.field private static final DFQ_GROUPS:I = 0x10

.field private static final DFQ_GROUP_OWNED:I = 0x100

.field private static final DFQ_INC_ADULT:I = 0x4000000

.field private static final DFQ_INC_MATURE:I = 0x2000000

.field private static final DFQ_INC_NEW_VIEWER:I = 0x7000000

.field private static final DFQ_INC_PG:I = 0x1000000

.field private static final DFQ_LIMIT_BY_AREA:I = 0x200000

.field private static final DFQ_LIMIT_BY_PRICE:I = 0x100000

.field private static final DFQ_MATURE_SIMS_ONLY:I = 0x4000

.field private static final DFQ_NAME_SORT:I = 0x80000

.field private static final DFQ_ONLINE:I = 0x2

.field private static final DFQ_PEOPLE:I = 0x1

.field private static final DFQ_PER_METER_SORT:I = 0x20000

.field private static final DFQ_PG_EVENTS_ONLY:I = 0x2000

.field private static final DFQ_PG_PARCELS_ONLY:I = 0x800000

.field private static final DFQ_PG_SIMS_ONLY:I = 0x800

.field private static final DFQ_PICTURES_ONLY:I = 0x1000

.field private static final DFQ_PLACES:I = 0x4

.field private static final DFQ_PRICE_SORT:I = 0x10000

.field private static final DFQ_SORT_ASC:I = 0x8000


# instance fields
.field private final currentSearchQuery:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;",
            ">;"
        }
    .end annotation
.end field

.field private final parcelInfoRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final parcelInfoResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;",
            ">;"
        }
    .end annotation
.end field

.field private final searchRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;",
            ">;"
        }
    .end annotation
.end field

.field private final searchResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;",
            ">;>;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;)Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->currentSearchQuery:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;Ljava/lang/String;Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->SearchGroups(Ljava/lang/String;Ljava/util/UUID;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;Ljava/lang/String;Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->SearchPeople(Ljava/lang/String;Ljava/util/UUID;)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;Ljava/lang/String;Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->SearchPlaces(Ljava/lang/String;Ljava/util/UUID;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 9

    const/4 v8, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v8}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->currentSearchQuery:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->searchRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$2;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;)V

    const/4 v4, 0x0

    const/4 v5, 0x3

    const-wide/16 v6, 0x3a98

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->parcelInfoRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSearchManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->searchResults()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->searchRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->searchResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->parcelInfoData()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->parcelInfoRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->parcelInfoResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    :goto_0
    return-void

    :cond_0
    iput-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->searchResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iput-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->parcelInfoResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    goto :goto_0
.end method

.method private SearchGroups(Ljava/lang/String;Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;->QueryText:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;

    const v2, 0x7000010

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;->QueryFlags:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;

    const/4 v2, 0x0

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;->QueryStart:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private SearchPeople(Ljava/lang/String;Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;->QueryText:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;

    const v2, 0x7000001

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;->QueryFlags:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;

    const/4 v2, 0x0

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery$QueryData;->QueryStart:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private SearchPlaces(Ljava/lang/String;Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$QueryData;

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$QueryData;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$QueryData;->QueryText:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$QueryData;

    const v2, 0x7000004

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$QueryData;->QueryFlags:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$QueryData;

    const/4 v2, 0x0

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$QueryData;->QueryStart:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$QueryData;

    const-string/jumbo v2, ""

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery$QueryData;->SimName:[B

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private updateSearchResults(Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;)V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->searchResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao$Properties;->SearchUUID:Lde/greenrobot/dao/Property;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v1

    new-array v2, v3, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v0, v1, v2}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Lde/greenrobot/dao/Property;

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao$Properties;->LevensteinDistance:Lde/greenrobot/dao/Property;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lde/greenrobot/dao/query/QueryBuilder;->orderAsc([Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->listLazyUncached()Lde/greenrobot/dao/query/LazyList;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->searchResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v1, p2, v0}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao$Properties;->SearchUUID:Lde/greenrobot/dao/Property;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/Property;->notEq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v1

    new-array v2, v3, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v0, v1, v2}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->buildDelete()Lde/greenrobot/dao/query/DeleteQuery;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/DeleteQuery;->executeDeleteWithoutDetachingEntities()V

    :cond_0
    return-void
.end method


# virtual methods
.method public DirGroupsReply(Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply;)V
    .locals 11
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply$QueryData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->currentSearchQuery:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->searchResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSearchManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->getSearchGridResultDao()Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    move-result-object v9

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_0
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply$QueryReplies;

    iget-object v0, v7, Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply$QueryReplies;->GroupID:Ljava/util/UUID;

    sget-object v3, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v0, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, v7, Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply$QueryReplies;->GroupName:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/lumiyaviewer/lumiya/utils/LevensteinDistance;->computeLevensteinDistance(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v6

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Groups:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v3

    iget-object v4, v7, Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply$QueryReplies;->GroupID:Ljava/util/UUID;

    iget v7, v7, Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply$QueryReplies;->Members:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;-><init>(Ljava/lang/Long;Ljava/util/UUID;ILjava/util/UUID;Ljava/lang/String;ILjava/lang/Integer;)V

    invoke-virtual {v9, v0}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;->insert(Ljava/lang/Object;)J

    goto :goto_0

    :cond_1
    invoke-direct {p0, v9, v8}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->updateSearchResults(Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;)V

    :cond_2
    return-void
.end method

.method public DirPeopleReply(Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply;)V
    .locals 14
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const-wide/16 v12, 0x0

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->currentSearchQuery:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply$QueryData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->searchResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSearchManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->getSearchGridResultDao()Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    move-result-object v9

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_0
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply$QueryReplies;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply$QueryReplies;->AgentID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v6

    cmp-long v3, v6, v12

    if-nez v3, :cond_1

    invoke-virtual {v4}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v6

    cmp-long v3, v6, v12

    if-eqz v3, :cond_0

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply$QueryReplies;->FirstName:[B

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply$QueryReplies;->LastName:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/lumiyaviewer/lumiya/utils/LevensteinDistance;->computeLevensteinDistance(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v6

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->People:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v3

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;-><init>(Ljava/lang/Long;Ljava/util/UUID;ILjava/util/UUID;Ljava/lang/String;ILjava/lang/Integer;)V

    invoke-virtual {v9, v0}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;->insert(Ljava/lang/Object;)J

    goto :goto_0

    :cond_2
    invoke-direct {p0, v9, v8}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->updateSearchResults(Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;)V

    :cond_3
    return-void
.end method

.method public DirPlacesReply(Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesReply;)V
    .locals 12
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->currentSearchQuery:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesReply;->QueryData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesReply$QueryData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesReply$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->searchResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSearchManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->getSearchGridResultDao()Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    move-result-object v10

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_1
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesReply$QueryReplies;

    iget-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesReply$QueryReplies;->ParcelID:Ljava/util/UUID;

    sget-object v3, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v0, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesReply$QueryReplies;->Name:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/lumiyaviewer/lumiya/utils/LevensteinDistance;->computeLevensteinDistance(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v6

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Places:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v3

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesReply$QueryReplies;->ParcelID:Ljava/util/UUID;

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;-><init>(Ljava/lang/Long;Ljava/util/UUID;ILjava/util/UUID;Ljava/lang/String;ILjava/lang/Integer;)V

    invoke-virtual {v10, v0}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;->insert(Ljava/lang/Object;)J

    goto :goto_1

    :cond_2
    invoke-direct {p0, v10, v8}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->updateSearchResults(Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;)V

    goto :goto_0

    :cond_3
    return-void
.end method

.method public HandleCloseCircuit()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSearchManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->searchResults()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->searchRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->parcelInfoData()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->parcelInfoRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCloseCircuit()V

    return-void
.end method

.method public ParcelInfoReply(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;)V
    .locals 4
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const-string/jumbo v0, "ParcelInfo: Got reply for %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->ParcelID:Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->parcelInfoResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->parcelInfoResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->ParcelID:Ljava/util/UUID;

    invoke-interface {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
