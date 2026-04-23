.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;
    }
.end annotation


# instance fields
.field private final clipboardPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final currentSessionID:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final entryListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;",
            ">;"
        }
    .end annotation
.end field

.field private final folderEntryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final folderLoadingPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final folderRequestProcessor:Lcom/lumiyaviewer/lumiya/react/RequestProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestProcessor",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final inventoryDB:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final inventoryDbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

.field private final queryRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;",
            ">;"
        }
    .end annotation
.end field

.field private final rootFolderID:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final searchProcessPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final searchRunningPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_InventoryManager-mthref-0(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->close()V

    return-void
.end method

.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->currentSessionID:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->entryListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->folderEntryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Lcom/lumiyaviewer/lumiya/orm/InventoryDB;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->inventoryDB:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->inventoryDbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    return-object v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->rootFolderID:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->updateSearchResults()V

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;)V
    .locals 4
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v1, "InventoryDB"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->inventoryDbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->folderLoadingPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->folderEntryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->entryListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->rootFolderID:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->currentSessionID:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->searchProcessPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->searchRunningPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->clipboardPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->queryRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDBManager;->getUserInventoryDB(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Null inventory database"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->inventoryDB:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$2;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->folderEntryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->inventoryDbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/orm/InventoryDB;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->folderRequestProcessor:Lcom/lumiyaviewer/lumiya/react/RequestProcessor;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->folderEntryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$JIBenvPHaOomPgMJhTFPuiVXBzY$2;

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$JIBenvPHaOomPgMJhTFPuiVXBzY$2;-><init>(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->inventoryDbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->setCacheInvalidateHandler(Lcom/lumiyaviewer/lumiya/react/Refreshable;Ljava/util/concurrent/Executor;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->entryListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->inventoryDbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->queryRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->entryListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$JIBenvPHaOomPgMJhTFPuiVXBzY$1;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$JIBenvPHaOomPgMJhTFPuiVXBzY$1;-><init>()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->inventoryDbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->setDisposeHandler(Lcom/lumiyaviewer/lumiya/react/DisposeHandler;Ljava/util/concurrent/Executor;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_InventoryManager_3450(Lcom/lumiyaviewer/lumiya/orm/InventoryDB;Ljava/util/UUID;)V
    .locals 2

    const/4 v1, 0x0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->sessionID:Ljava/util/UUID;

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_InventoryManager_6838(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)Z
    .locals 1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->containsString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateSearchResults()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->entryListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$JIBenvPHaOomPgMJhTFPuiVXBzY;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$JIBenvPHaOomPgMJhTFPuiVXBzY;-><init>()V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdateSome(Lcom/google/common/base/Predicate;)V

    return-void
.end method


# virtual methods
.method public copyToClipboard(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->clipboardPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public getClipboard()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->clipboardPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    return-object v0
.end method

.method public getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->inventoryDB:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    return-object v0
.end method

.method public getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->inventoryDbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    return-object v0
.end method

.method public getFolderEntryPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->folderEntryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getFolderLoading()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->folderLoadingPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getFolderLoadingRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/RequestSource",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->folderLoadingPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getFolderRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/RequestSource",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->folderRequestProcessor:Lcom/lumiyaviewer/lumiya/react/RequestProcessor;

    return-object v0
.end method

.method public getInventoryEntries()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->entryListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getRootFolder()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->rootFolderID:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    return-object v0
.end method

.method public getSearchProcess()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->searchProcessPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getSearchProcessRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/RequestSource",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->searchProcessPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getSearchRunning()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->searchRunningPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public requestFolderUpdate(Ljava/util/UUID;)V
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->folderEntryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public setCurrentSessionID(Ljava/util/UUID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->currentSessionID:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void
.end method

.method public setRootFolder(Ljava/util/UUID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->rootFolderID:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void
.end method
