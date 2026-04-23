.class public Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$1;,
        Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$2;,
        Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$3;,
        Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$4;,
        Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$5;,
        Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$InventoryFetchException;,
        Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$NoInventoryItemException;,
        Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;,
        Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;
    }
.end annotation


# instance fields
.field private callbacks:Ljava/util/Map;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSparseArrays"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;",
            ">;"
        }
    .end annotation
.end field

.field private final caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

.field private final db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

.field private final dbExecutor:Ljava/util/concurrent/Executor;

.field private executor:Ljava/util/concurrent/ExecutorService;

.field private final fetchCap:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final fetchEntireInventoryRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final fetchRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final folderEntryResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final folderLoadingRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final folderLoadingResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final folderRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private nextCallbackID:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final nextFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private reloadEvent:Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;

.field public rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

.field private rootFolderFetchNeeded:Z

.field private final rootFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final seachRunningResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final searchProcessResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final searchRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            ">;"
        }
    .end annotation
.end field

.field private final searchRunningRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            ">;"
        }
    .end annotation
.end field

.field private udpFetchPendingRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;",
            ">;"
        }
    .end annotation
.end field

.field private udpFetchRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Lcom/lumiyaviewer/lumiya/eventbus/EventBus;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchCap:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchEntireInventoryRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchRequests:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Ljava/util/UUID;ILjava/util/UUID;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->MoveTaskInventory(Ljava/util/UUID;ILjava/util/UUID;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->StartUploadingNotecardContents(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchNextFolder()V

    return-void
.end method

.method static synthetic -wrap3(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->updateFolderLoadingStatus(Ljava/util/UUID;)V

    return-void
.end method

.method static synthetic -wrap4(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->updateSearchRunningStatus()V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V
    .locals 8

    const-wide/16 v6, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->nextCallbackID:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderFetchNeeded:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->callbacks:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->udpFetchRequests:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->udpFetchPendingRequests:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchRequests:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchEntireInventoryRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderLoadingRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->searchRunningRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$3;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$4;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$4;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->searchRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$5;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$5;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->reloadEvent:Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->FetchInventoryDescendents2:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchCap:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->dbExecutor:Ljava/util/concurrent/Executor;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAuthReply()Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->sessionID:Ljava/util/UUID;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->setCurrentSessionID(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAuthReply()Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->inventoryRoot:Ljava/util/UUID;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->setRootFolder(Ljava/util/UUID;)V

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    if-eqz v0, :cond_1

    const-string/jumbo v0, "Inventory: creating root folder with folderUUID %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAuthReply()Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    move-result-object v3

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->inventoryRoot:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAuthReply()Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->inventoryRoot:Ljava/util/UUID;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntryOrCreate(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v2

    cmp-long v0, v2, v6

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const-string/jumbo v2, "Inventory"

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const-wide/16 v2, 0x0

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parent_id:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->agentUUID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderFetchNeeded:Z

    :cond_1
    const-string/jumbo v0, "Inventory: ready."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getFolderRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v2}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    :goto_3
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderEntryResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getFolderLoadingRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->dbExecutor:Ljava/util/concurrent/Executor;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderLoadingRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-direct {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    invoke-interface {v0, v2}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderLoadingResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getSearchRunning()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->dbExecutor:Ljava/util/concurrent/Executor;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->searchRunningRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-direct {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->seachRunningResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getSearchProcessRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->dbExecutor:Ljava/util/concurrent/Executor;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->searchRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-direct {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    invoke-interface {v0, v2}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->searchProcessResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs;-><init>(Ljava/lang/Object;)V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$2;

    invoke-direct {v4, p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$2;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->nextFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderFetchNeeded:Z

    if-eqz v0, :cond_5

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$1;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    :goto_4
    return-void

    :cond_2
    move-object v0, v1

    goto/16 :goto_0

    :cond_3
    move-object v0, v1

    goto/16 :goto_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto/16 :goto_2

    :cond_4
    move-object v0, v1

    goto/16 :goto_3

    :cond_5
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    goto :goto_4

    :cond_6
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderLoadingResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->searchProcessResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->nextFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->seachRunningResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    goto :goto_4
.end method

.method private DoCreateInventoryItem(Ljava/util/UUID;IILjava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;)V
    .locals 6

    const-wide/16 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->getNextCallbackID()I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->CallbackID:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->FolderID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->TransactionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    const v2, 0x7fffffff

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->NextOwnerMask:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iput p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Type:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iput p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->InvType:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-static {p4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Name:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-static {p5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Description:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->callbacks:Ljava/util/Map;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->CallbackID:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private DoUpdateInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;)V
    .locals 8

    const-wide/16 v6, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$AgentData;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$AgentData;->TransactionID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;-><init>()V

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->FolderID:Ljava/util/UUID;

    iput v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->CallbackID:I

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->CreatorID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->OwnerID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->GroupID:Ljava/util/UUID;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->BaseMask:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->OwnerMask:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->GroupMask:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->EveryoneMask:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->NextOwnerMask:I

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isGroupOwned:Z

    iput-boolean v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->GroupOwned:Z

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v6, v7, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->TransactionID:Ljava/util/UUID;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->Type:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->InvType:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->Flags:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->saleType:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->SaleType:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->salePrice:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->SalePrice:I

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->Name:[B

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->Description:[B

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creationDate:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->CreationDate:I

    iput v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->CRC:I

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem;->InventoryData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem;->isReliable:Z

    const-string/jumbo v2, "Update inventory callback %d"

    new-array v3, v3, [Ljava/lang/Object;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem$InventoryData;->CallbackID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$13;

    invoke-direct {v1, p0, p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$13;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private DoUpdateTaskInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;ILcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V
    .locals 6

    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->UpdateData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;

    iput p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;->LocalID:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->UpdateData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;->Key:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->FolderID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->CreatorID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->OwnerID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->GroupID:Ljava/util/UUID;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->BaseMask:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->OwnerMask:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->GroupMask:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->EveryoneMask:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->NextOwnerMask:I

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isGroupOwned:Z

    iput-boolean v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->GroupOwned:Z

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->TransactionID:Ljava/util/UUID;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Type:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->InvType:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Flags:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->saleType:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->SaleType:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->salePrice:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->SalePrice:I

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Name:[B

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Description:[B

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creationDate:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->CreationDate:I

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->CRC:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->isReliable:Z

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private MoveTaskInventory(Ljava/util/UUID;ILjava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory$AgentData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory$AgentData;->FolderID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory$InventoryData;

    iput p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory$InventoryData;->LocalID:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory$InventoryData;

    iput-object p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory$InventoryData;->ItemID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private StartUploadingNotecardContents(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V
    .locals 8
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;->getInstance()Ljava/util/concurrent/ExecutorService;

    move-result-object v7

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$9;

    move v1, p3

    move-object v2, p0

    move-object v3, p1

    move-object v4, p4

    move-object v5, p2

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$9;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v7, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private UploadNotecardContents(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[B)Ljava/lang/String;
    .locals 10
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v3, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x0

    :try_start_0
    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    if-eqz p3, :cond_4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->getCaps()Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    move-result-object v5

    if-nez p2, :cond_3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateScriptAgent:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    :goto_0
    invoke-virtual {v5, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapabilityOrThrow(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v2

    move-object v9, v2

    move v2, v3

    move-object v3, v9

    :goto_1
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v5

    const-string/jumbo v6, "item_id"

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    iget-object v8, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-direct {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-virtual {v5, v6, v7}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    if-eqz p2, :cond_0

    const-string/jumbo v6, "task_id"

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    invoke-direct {v7, p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-virtual {v5, v6, v7}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    :cond_0
    if-eqz v2, :cond_1

    const-string/jumbo v2, "target"

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    const-string/jumbo v7, "mono"

    invoke-direct {v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2, v6}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    if-eqz p2, :cond_1

    const-string/jumbo v2, "is_script_running"

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;-><init>(I)V

    invoke-virtual {v5, v2, v6}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    :cond_1
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>(Ljava/util/Map;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Notecard upload request: Initial uploader request: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;->serializeToXML()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {v4, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Notecard upload request: Initial uploader reply: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const-string/jumbo v4, "uploader"

    invoke-virtual {v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-static {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->repairURL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_2
    new-instance v3, Lokhttp3/Request$Builder;

    invoke-direct {v3}, Lokhttp3/Request$Builder;-><init>()V

    invoke-static {v2}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    const-string/jumbo v3, "application/vnd.ll.notecard"

    invoke-static {v3}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v3

    invoke-static {v3, p4}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;[B)Lokhttp3/RequestBody;

    move-result-object v3

    invoke-virtual {v2, v3}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v2

    const-string/jumbo v3, "Accept"

    const-string/jumbo v4, "application/llsd+xml"

    invoke-virtual {v2, v3, v4}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->getOkHttpClient()Lokhttp3/OkHttpClient;

    move-result-object v3

    invoke-virtual {v3, v2}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v2

    invoke-interface {v2}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v3

    if-nez v3, :cond_6

    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Null response"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$NoSuchCapabilityException; {:try_start_0 .. :try_end_0} :catch_2

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const-string/jumbo v0, "Failed to upload inventory asset"

    return-object v0

    :cond_3
    :try_start_1
    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateScriptTask:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    goto/16 :goto_0

    :cond_4
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->getCaps()Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    move-result-object v3

    if-nez p2, :cond_5

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateNotecardAgentInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    :goto_2
    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapabilityOrThrow(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v2

    move-object v3, v2

    move v2, v1

    goto/16 :goto_1

    :cond_5
    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateNotecardTaskInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$NoSuchCapabilityException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_2

    :cond_6
    :try_start_2
    invoke-virtual {v3}, Lokhttp3/Response;->isSuccessful()Z

    move-result v2

    if-nez v2, :cond_7

    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Response error code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v3}, Lokhttp3/Response;->code()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception v0

    :try_start_3
    invoke-virtual {v3}, Lokhttp3/Response;->close()V

    throw v0
    :try_end_3
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$NoSuchCapabilityException; {:try_start_3 .. :try_end_3} :catch_2

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const-string/jumbo v0, "Failed to upload inventory asset"

    return-object v0

    :cond_7
    :try_start_4
    invoke-virtual {v3}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v2

    const/4 v4, 0x0

    invoke-static {v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->parseXML(Ljava/io/InputStream;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "upload reply: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const-string/jumbo v4, "state"

    invoke-virtual {v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "new_asset"

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v5

    const-string/jumbo v6, "complete"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    if-nez p2, :cond_9

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iget-object v6, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v4, v6}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v4

    if-eqz v4, :cond_8

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v5, v4}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_8
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v4

    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    invoke-virtual {v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    :cond_9
    const-string/jumbo v4, "compiled"

    invoke-virtual {v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    const-string/jumbo v4, "compiled"

    invoke-virtual {v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBoolean()Z

    move-result v4

    if-nez v4, :cond_b

    const-string/jumbo v4, "errors"

    invoke-virtual {v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    const-string/jumbo v0, "errors"

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    const-string/jumbo v0, ""

    :goto_3
    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_b

    if-eqz v1, :cond_a

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v2

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    move-object v0, v2

    goto :goto_3

    :cond_b
    :try_start_5
    invoke-virtual {v3}, Lokhttp3/Response;->close()V
    :try_end_5
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$NoSuchCapabilityException; {:try_start_5 .. :try_end_5} :catch_2

    return-object v0

    :catch_2
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const-string/jumbo v0, "Failed to upload inventory asset"

    return-object v0

    :catch_3
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const-string/jumbo v0, "Failed to upload inventory asset"

    return-object v0
.end method

.method private fetchNextFolder()V
    .locals 10

    const/4 v9, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchEntireInventoryRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v1, "Entries"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string/jumbo v3, "uuid_high"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string/jumbo v3, "uuid_low"

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const-string/jumbo v3, "isFolder AND (sessionID_high != ? OR sessionID_low != ?)"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v5}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v4, v7

    invoke-virtual {v5}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    const-string/jumbo v8, "1"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(JJ)Ljava/util/UUID;

    move-result-object v1

    const-string/jumbo v2, "InventorySearch: fetching next folder: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->nextFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getFolderEntryPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->updateSearchRunningStatus()V

    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :goto_1
    return-void

    :cond_0
    const-string/jumbo v1, "InventorySearch: no more folders to fetch"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->searchProcessResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->nextFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->updateSearchRunningStatus()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "InventorySearch: error while fetching folders"

    new-array v2, v9, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchEntireInventoryRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->searchProcessResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-interface {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->nextFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->updateSearchRunningStatus()V

    goto :goto_1

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->updateSearchRunningStatus()V

    goto :goto_1
.end method

.method private getNextCallbackID()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->nextCallbackID:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    return v0
.end method

.method private onNextFolderError(Ljava/lang/Throwable;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchNextFolder()V

    return-void
.end method

.method private onNextFolderFetched(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->sessionID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchNextFolder()V

    :cond_0
    return-void
.end method

.method private onRootFolderFetched(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 2

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderFetchNeeded:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    :cond_0
    const-string/jumbo v0, "Inventory: Fetched root folder."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private updateFolderLoadingStatus(Ljava/util/UUID;)V
    .locals 2
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderLoadingResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderLoadingResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchRequests:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private updateSearchRunningStatus()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->searchRunningRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->seachRunningResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchEntireInventoryRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->nextFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->isSubscribed()Z

    move-result v0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_slproto_inventory_SLInventory-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->onNextFolderFetched(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_inventory_SLInventory-mthref-1(Ljava/lang/Throwable;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->onNextFolderError(Ljava/lang/Throwable;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_inventory_SLInventory-mthref-2(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->onRootFolderFetched(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return-void
.end method

.method public CollectGiveableItems(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Ljava/util/Collection;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation

    const/4 v7, 0x0

    const/4 v6, 0x0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string/jumbo v2, "parent_id = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v1, v2, v3, v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_3

    :cond_0
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>(Landroid/database/Cursor;)V

    iget-boolean v3, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v3, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->CollectGiveableItems(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_1
    iget v3, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    iget v4, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    and-int/2addr v3, v4

    and-int/lit16 v3, v3, 0x2000

    if-eqz v3, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_3
    return-object v0
.end method

.method public CopyInventoryFromNotecard(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/Runnable;)V
    .locals 7
    .param p4    # Ljava/lang/Runnable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;->getInstance()Ljava/util/concurrent/ExecutorService;

    move-result-object v6

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v6, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public CopyInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$InventoryData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$InventoryData;-><init>()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->getNextCallbackID()I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$InventoryData;->CallbackID:I

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->agentUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$InventoryData;->OldAgentID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$InventoryData;->OldItemID:Ljava/util/UUID;

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$InventoryData;->NewFolderID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem$InventoryData;->NewName:[B

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem;->InventoryData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public CopyObjectContents(Ljava/lang/String;ILjava/util/Set;Lcom/google/common/base/Function;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;",
            "Lcom/google/common/base/Function",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_0

    invoke-static {p3}, Lcom/google/common/collect/ImmutableSet;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v4

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$6;

    move v1, p2

    move-object v2, p0

    move-object v3, p1

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$6;-><init>(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v6, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    invoke-interface {p4, v1}, Lcom/google/common/base/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public DeleteInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 4

    const/4 v3, 0x1

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder$FolderData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder$FolderData;-><init>()V

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder$FolderData;->FolderID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder;->FolderData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$6;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$6;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :goto_0
    return-void

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$InventoryData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$InventoryData;-><init>()V

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;->InventoryData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$7;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$7;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    goto :goto_0
.end method

.method public DeleteInventoryItemRaw(Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$InventoryData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$InventoryData;-><init>()V

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;->InventoryData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;->isReliable:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->reloadEvent:Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public DeleteMultiInventoryItemRaw(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            "Ljava/util/List",
            "<",
            "Ljava/util/UUID;",
            ">;)V"
        }
    .end annotation

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects;-><init>()V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects$AgentData;->SessionID:Ljava/util/UUID;

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects$ItemData;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects$ItemData;-><init>()V

    iput-object v0, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects$ItemData;->ItemID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects;->ItemData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects;->isReliable:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$8;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$8;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public DoCreateNewFolder(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;ZLcom/google/common/base/Function;)Ljava/util/UUID;
    .locals 7
    .param p4    # Lcom/google/common/base/Function;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            "Ljava/lang/String;",
            "Z",
            "Lcom/google/common/base/Function",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Void;",
            ">;)",
            "Ljava/util/UUID;"
        }
    .end annotation

    const/4 v6, 0x0

    const/4 v5, -0x1

    const/4 v4, 0x1

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    if-eqz p3, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntryOrCreate(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->resetId()V

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parent_id:J

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    iput-object p2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const-string/jumbo v2, ""

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->agentUUID:Ljava/util/UUID;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    const/4 v2, -0x1

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    const/4 v2, 0x0

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->version:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    const-string/jumbo v0, "Inventory: Creating new folder with uuid = %s, parent %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v1, v2, v6

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;-><init>()V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    iput-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->FolderID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->ParentID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    iput v5, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->Type:I

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->Name:[B

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->isReliable:Z

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;

    invoke-direct {v2, p0, v1, p1, p4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/google/common/base/Function;)V

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-object v1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public DoCreateNewLandmark(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const-wide/16 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->getNextCallbackID()I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->CallbackID:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->FolderID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->TransactionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    const v2, 0x7fffffff

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->NextOwnerMask:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LANDMARK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Type:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_LANDMARK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->InvType:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Name:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-static {p3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Description:[B

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public HandleBulkUpdateInventory(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 14
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLEventQueueMessageHandler;
        eventName = .enum Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->BulkUpdateInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;
    .end annotation

    const-string/jumbo v0, "BulkUpdateInventory: EventQueue event"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;-><init>()V

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    :try_start_0
    const-string/jumbo v0, "FolderData"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string/jumbo v0, "FolderData"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v0

    if-ge v1, v0, :cond_7

    invoke-virtual {v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    const-string/jumbo v0, "FolderID"

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v0, v8, v10

    if-nez v0, :cond_0

    invoke-virtual {v6}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v0, v8, v10

    if-eqz v0, :cond_4

    :cond_0
    const-string/jumbo v0, "Inventory: BulkUpdateInventory got folder %s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    invoke-static {v0, v7}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x0

    const-string/jumbo v7, "CallbackID"

    invoke-virtual {v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    const-string/jumbo v0, "Inventory: got callback id %d"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const-string/jumbo v8, "CallbackID"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    invoke-static {v0, v7}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, "CallbackID"

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v0

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->callbacks:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v7, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;

    :cond_1
    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v7, v6}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntryOrCreate(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v7

    const-string/jumbo v8, "ParentID"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v8

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v9, v8}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v9

    if-eqz v9, :cond_5

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v10

    iput-wide v10, v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parent_id:J

    iput-object v8, v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    const-string/jumbo v9, "Name"

    invoke-virtual {v5, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v9

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const-string/jumbo v9, "Type"

    invoke-virtual {v5, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v5

    iput v5, v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    const/4 v5, 0x1

    iput-boolean v5, v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v5, v10, v12

    if-nez v5, :cond_2

    if-nez v0, :cond_2

    iget-object v5, v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const/4 v9, 0x1

    invoke-virtual {v2, v9, v6, v5}, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->AddItem(ZLjava/util/UUID;Ljava/lang/String;)V

    :cond_2
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v5, v7}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-interface {v3, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_1
    if-eqz v0, :cond_4

    invoke-interface {v0, v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;->onInventoryCallback(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_4
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto/16 :goto_0

    :cond_5
    invoke-interface {v3, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v5, v8, v10

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v5, v7}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->deleteEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_6
    :goto_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_e

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    goto :goto_3

    :cond_7
    :try_start_1
    const-string/jumbo v0, "ItemData"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string/jumbo v0, "ItemData"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    const/4 v0, 0x0

    move v1, v0

    :goto_4
    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v0

    if-ge v1, v0, :cond_6

    invoke-virtual {v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    const-string/jumbo v0, "ItemID"

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v0, v8, v10

    if-nez v0, :cond_8

    invoke-virtual {v6}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v0, v8, v10

    if-eqz v0, :cond_c

    :cond_8
    const-string/jumbo v0, "Inventory: BulkUpdateInventory got item %s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    invoke-static {v0, v7}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, "FolderID"

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v7

    const/4 v0, 0x0

    const-string/jumbo v8, "CallbackID"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_9

    const-string/jumbo v0, "Inventory: got callback id %d"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const-string/jumbo v9, "CallbackID"

    invoke-virtual {v5, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v9

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v10, 0x0

    aput-object v9, v8, v10

    invoke-static {v0, v8}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, "CallbackID"

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v0

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->callbacks:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;

    :cond_9
    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v8, v6}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntryOrCreate(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v6

    invoke-interface {v3, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    const-string/jumbo v8, "GroupMask"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v8

    iput v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    const-string/jumbo v8, "Description"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    const-string/jumbo v8, "GroupOwned"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBoolean()Z

    move-result v8

    iput-boolean v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isGroupOwned:Z

    const-string/jumbo v8, "EveryoneMask"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v8

    iput v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    const-string/jumbo v8, "Type"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v8

    iput v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    const-string/jumbo v8, "InvType"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v8

    iput v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    const-string/jumbo v8, "GroupID"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v8

    iput-object v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupUUID:Ljava/util/UUID;

    const-string/jumbo v8, "Name"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const-string/jumbo v8, "BaseMask"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v8

    iput v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    const-string/jumbo v8, "SaleType"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v8

    iput v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->saleType:I

    const-string/jumbo v8, "SalePrice"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v8

    iput v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->salePrice:I

    const-string/jumbo v8, "OwnerID"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v8

    iput-object v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    const-string/jumbo v8, "Flags"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v8

    iput v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    const-string/jumbo v8, "OwnerMask"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v8

    iput v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    const-string/jumbo v8, "NextOwnerMask"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v8

    iput v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    const-string/jumbo v8, "AssetID"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v8

    iput-object v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    const-string/jumbo v8, "CreationDate"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v5

    iput v5, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creationDate:I

    iput-object v7, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v5, v7}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v5

    if-eqz v5, :cond_d

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_a

    if-nez v0, :cond_a

    iget v8, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    const/16 v9, 0xe

    if-eq v8, v9, :cond_a

    iget v8, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    const/4 v9, 0x2

    if-eq v8, v9, :cond_a

    iget-object v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const/4 v9, 0x0

    invoke-virtual {v2, v9, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->AddItem(ZLjava/util/UUID;Ljava/lang/String;)V

    :cond_a
    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v8

    iput-wide v8, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parent_id:J

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v5, v6}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_b
    :goto_5
    if-eqz v0, :cond_c

    invoke-interface {v0, v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;->onInventoryCallback(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_c
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto/16 :goto_4

    :cond_d
    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v5, v8, v10

    if-eqz v5, :cond_b

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v5, v6}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->deleteEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_5

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto/16 :goto_2

    :cond_e
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_f
    return-void
.end method

.method public HandleCircuitReady()V
    .locals 4

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCircuitReady()V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderFetchNeeded:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "Inventory: Fetching root folder: %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getFolderEntryPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleCloseCircuit()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->nextFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->nextFolderSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getFolderRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->executor:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->executor:Ljava/util/concurrent/ExecutorService;

    :cond_3
    return-void
.end method

.method public declared-synchronized HandleInventoryDescendents(Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;)V
    .locals 3
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->udpFetchRequests:Ljava/util/Map;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;->FolderID:Ljava/util/UUID;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->HandleInventoryDescendents(Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->udpFetchRequests:Ljava/util/Map;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;->FolderID:Ljava/util/UUID;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->udpFetchPendingRequests:Ljava/util/Map;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;->FolderID:Ljava/util/UUID;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->udpFetchRequests:Ljava/util/Map;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;->FolderID:Ljava/util/UUID;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public HandleUpdateCreateInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem;)V
    .locals 14
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const-wide/16 v12, 0x0

    const/4 v11, 0x2

    const/4 v10, 0x0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;-><init>()V

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem;->InventoryData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->FolderID:Ljava/util/UUID;

    const-string/jumbo v1, "Inventory: UpdateCreateInventoryItem got folder %s item %s, callback %d"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    aput-object v8, v7, v9

    iget v8, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->CallbackID:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-static {v1, v7}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->callbacks:Ljava/util/Map;

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->CallbackID:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;

    :try_start_0
    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v7, v5}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntryOrCreate(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v5

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->GroupMask:I

    iput v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->Description:[B

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    iget-boolean v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->GroupOwned:Z

    iput-boolean v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isGroupOwned:Z

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->EveryoneMask:I

    iput v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->Type:I

    iput v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->InvType:I

    iput v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->GroupID:Ljava/util/UUID;

    iput-object v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupUUID:Ljava/util/UUID;

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->Name:[B

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->BaseMask:I

    iput v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->SaleType:I

    iput v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->saleType:I

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->SalePrice:I

    iput v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->salePrice:I

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->OwnerID:Ljava/util/UUID;

    iput-object v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->Flags:I

    iput v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->OwnerMask:I

    iput v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->NextOwnerMask:I

    iput v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->AssetID:Ljava/util/UUID;

    iput-object v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->CreationDate:I

    iput v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creationDate:I

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem$InventoryData;->CreatorID:Ljava/util/UUID;

    iput-object v0, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    iput-object v6, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0, v6}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v8

    cmp-long v7, v8, v12

    if-nez v7, :cond_1

    if-nez v1, :cond_1

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    const/16 v8, 0xe

    if-eq v7, v8, :cond_1

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    if-eq v7, v11, :cond_1

    iget-object v7, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual {v2, v8, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->AddItem(ZLjava/util/UUID;Ljava/lang/String;)V

    :cond_1
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parent_id:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_2
    :goto_1
    if-eqz v1, :cond_0

    invoke-interface {v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;->onInventoryCallback(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException;->printStackTrace()V

    goto/16 :goto_0

    :cond_3
    :try_start_1
    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v6

    cmp-long v0, v6, v12

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->deleteEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_5

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    goto :goto_2

    :cond_5
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_6
    return-void
.end method

.method public LinkInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;IILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->FolderID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->TransactionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->OldItemID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iput p4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->Type:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iput p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->InvType:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-static {p5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->Name:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-static {p6}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->Description:[B

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$9;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$9;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public MoveInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;-><init>()V

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;-><init>()V

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;->FolderID:Ljava/util/UUID;

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;->ParentID:Ljava/util/UUID;

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;->Type:I

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;->Name:[B

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;->FolderData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;->isReliable:Z

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;

    invoke-direct {v2, p0, v0, p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :goto_0
    return-void

    :cond_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;-><init>()V

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;->Stamp:Z

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$InventoryData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$InventoryData;-><init>()V

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$InventoryData;->FolderID:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$InventoryData;->NewName:[B

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->InventoryData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->isReliable:Z

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$11;

    invoke-direct {v2, p0, v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$11;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    goto :goto_0
.end method

.method public MoveInventoryItemRaw(Ljava/util/UUID;Ljava/lang/String;Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$AgentData;->Stamp:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$InventoryData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$InventoryData;-><init>()V

    iput-object p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$InventoryData;->FolderID:Ljava/util/UUID;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$InventoryData;->ItemID:Ljava/util/UUID;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem$InventoryData;->NewName:[B

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->InventoryData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->isReliable:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->reloadEvent:Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public RenameInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;)V
    .locals 3

    iput-object p2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;-><init>()V

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;->FolderID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;->ParentID:Ljava/util/UUID;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;->Type:I

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder$FolderData;->Name:[B

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;->FolderData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$12;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$12;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :goto_1
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$3;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$3;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DoUpdateInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;)V

    goto :goto_1
.end method

.method public TrashInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v2

    const/16 v1, 0xe

    invoke-virtual {v0, v2, v3, v1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findSpecialFolder(JI)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->MoveInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_0
    return-void
.end method

.method public UpdateNotecard(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;ZLjava/lang/String;Ljava/lang/String;[BLjava/util/UUID;ILcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V
    .locals 9
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # [B
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v1, p4}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    invoke-static {v1, p5}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :goto_0
    xor-int/lit8 v1, v1, 0x1

    :goto_1
    if-nez p7, :cond_6

    if-nez p1, :cond_4

    const-string/jumbo v1, "Notecard: Creating new inventory entry."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p3, :cond_2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LSL_TEXT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v3

    :goto_2
    if-eqz p3, :cond_3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_LSL:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v4

    :goto_3
    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$7;

    move-object/from16 v0, p9

    invoke-direct {v7, p3, p0, p6, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$7;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v1, p0

    move-object v2, p2

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DoCreateInventoryItem(Ljava/util/UUID;IILjava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;)V

    :goto_4
    return-void

    :cond_0
    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_NOTECARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v3

    goto :goto_2

    :cond_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_NOTECARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v4

    goto :goto_3

    :cond_4
    if-eqz v1, :cond_5

    iput-object p4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    iput-object p5, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_5
    const-string/jumbo v1, "Notecard: Updating existing inventory entry %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;

    move-object/from16 v0, p9

    invoke-direct {v1, p3, p0, p6, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DoUpdateInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;)V

    goto :goto_4

    :catch_0
    move-exception v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_5

    :cond_5
    const/4 v3, 0x0

    move-object v1, p0

    move-object v2, p1

    move v4, p3

    move-object v5, p6

    move-object/from16 v6, p9

    invoke-direct/range {v1 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->StartUploadingNotecardContents(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V

    goto :goto_4

    :cond_6
    if-eqz v1, :cond_7

    if-eqz p1, :cond_7

    iput-object p4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    iput-object p5, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;

    move-object v2, p0

    move/from16 v3, p8

    move-object v4, p1

    move-object/from16 v5, p7

    move v6, p3

    move-object v7, p6

    move-object/from16 v8, p9

    invoke-direct/range {v1 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;ILcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V

    move/from16 v0, p8

    invoke-direct {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DoUpdateTaskInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;ILcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    goto :goto_4

    :cond_7
    move-object v1, p0

    move-object v2, p1

    move-object/from16 v3, p7

    move v4, p3

    move-object v5, p6

    move-object/from16 v6, p9

    invoke-direct/range {v1 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->StartUploadingNotecardContents(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V

    goto :goto_4
.end method

.method public UpdateStoreInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$4;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$4;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DoUpdateInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public canMoveToTrash(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v2

    const/16 v1, 0xe

    invoke-virtual {v0, v2, v3, v1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findSpecialFolder(JI)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-wide v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parent_id:J

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v0

    cmp-long v0, v2, v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    return v4
.end method

.method public findSpecialFolder(I)Ljava/util/UUID;
    .locals 4
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findSpecialFolder(JI)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    :cond_0
    return-object v0
.end method

.method public getCallingCardsFolderUUID()Ljava/util/UUID;
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v2

    const/4 v1, 0x2

    invoke-virtual {v0, v2, v3, v1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findSpecialFolder(JI)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    return-object v0

    :cond_0
    return-object v4
.end method

.method public getCaps()Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    return-object v0
.end method

.method public getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    return-object v0
.end method

.method public getExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->executor:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->executor:Ljava/util/concurrent/ExecutorService;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->executor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_10310(JLjava/util/UUID;ZZ)V
    .locals 5

    const-string/jumbo v0, "Inventory: onFetchComplete: folderId = \'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->fetchRequests:Ljava/util/Map;

    invoke-interface {v0, p3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->sessionID:Ljava/util/UUID;

    xor-int/lit8 v0, p4, 0x1

    iput-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->fetchFailed:Z

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    if-eqz p4, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderEntryResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v0, p3, v1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    :goto_1
    invoke-direct {p0, p3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->updateFolderLoadingStatus(Ljava/util/UUID;)V

    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_2
    if-nez p5, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->folderEntryResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$InventoryFetchException;

    const-string/jumbo v2, "Failed to retrieve folder contents"

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$InventoryFetchException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, p3, v1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_27010(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_42520(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_48053(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;[BLjava/util/UUID;ZLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v1, 0x0

    const-string/jumbo v2, "Notecard: Starting to upload contents for entry %s"

    new-array v3, v5, [Ljava/lang/Object;

    if-eqz p1, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    :goto_0
    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p2, :cond_3

    invoke-direct {p0, p1, p3, p4, p2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->UploadNotecardContents(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[B)Ljava/lang/String;

    move-result-object v0

    :goto_1
    const-string/jumbo v2, "Notecard: Notecard entry %s updated"

    new-array v3, v5, [Ljava/lang/Object;

    if-eqz p1, :cond_0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    :cond_0
    aput-object v1, v3, v4

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p5, :cond_1

    invoke-interface {p5, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;->onNotecardUpdated(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;)V

    :cond_1
    return-void

    :cond_2
    move-object v0, v1

    goto :goto_0

    :cond_3
    move-object v0, v1

    goto :goto_1
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_49599(Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 6

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p4

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->StartUploadingNotecardContents(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_50229(Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 6

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p4

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->StartUploadingNotecardContents(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_51539(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/Runnable;)V
    .locals 8

    :try_start_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->getCaps()Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->CopyInventoryFromNotecard:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapabilityOrThrow(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    const/4 v3, 0x5

    new-array v3, v3, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v5, "notecard-id"

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    invoke-direct {v6, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-direct {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v5, "object-id"

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    invoke-direct {v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>()V

    invoke-direct {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v5, 0x1

    aput-object v4, v3, v5

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v5, "item-id"

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    invoke-direct {v6, p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-direct {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v5, 0x2

    aput-object v4, v3, v5

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v5, "folder-id"

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    invoke-direct {v6, p3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-direct {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v5, 0x3

    aput-object v4, v3, v5

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v5, "callback-id"

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;-><init>(I)V

    invoke-direct {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v5, 0x4

    aput-object v4, v3, v5

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$NoSuchCapabilityException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    if-eqz p4, :cond_0

    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_2
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_53068(Ljava/lang/String;Lcom/google/common/collect/ImmutableSet;ILcom/google/common/base/Function;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;

    invoke-direct {v1, p0, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/google/common/collect/ImmutableSet;ILcom/google/common/base/Function;)V

    const/4 v2, 0x1

    invoke-virtual {p0, v0, p1, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DoCreateNewFolder(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;ZLcom/google/common/base/Function;)Ljava/util/UUID;

    return-void
.end method

.method onFetchComplete(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;Ljava/util/UUID;JZZ)V
    .locals 9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->dbExecutor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$10;

    move v2, p5

    move v3, p6

    move-wide v4, p3

    move-object v6, p0

    move-object v7, p2

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$10;-><init>(ZZJLjava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
