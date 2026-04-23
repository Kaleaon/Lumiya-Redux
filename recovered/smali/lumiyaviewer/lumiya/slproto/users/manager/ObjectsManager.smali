.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$1;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$2;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$3;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$4;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;
    }
.end annotation


# instance fields
.field private filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

.field private final filterLock:Ljava/lang/Object;

.field private final myAvatarStatePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;",
            ">;"
        }
    .end annotation
.end field

.field private final nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;

.field private final objectDisplayListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;",
            ">;"
        }
    .end annotation
.end field

.field private final objectProfilePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;",
            ">;"
        }
    .end annotation
.end field

.field private final objectProfileRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final onChatterNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever$OnChatterNameUpdated;

.field private final parcelInfo:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final runningAnimationsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Ljava/util/UUID;",
            ">;>;"
        }
    .end annotation
.end field

.field private final taskInventoryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;",
            ">;"
        }
    .end annotation
.end field

.field private final touchableObjectsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Ljava/util/UUID;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private final touchableObjectsRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final updateObjectListRunnable:Ljava/lang/Runnable;

.field private final updateRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            ">;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->filterLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectDisplayListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectProfilePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->parcelInfo:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method static synthetic -get6(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->touchableObjectsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method static synthetic -get7(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->updateObjectListRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -get8(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 4

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->parcelInfo:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->filterLock:Ljava/lang/Object;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->create()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$n3FxEEuksYOCADj00lseQFiZ3z4;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$n3FxEEuksYOCADj00lseQFiZ3z4;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->onChatterNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever$OnChatterNameUpdated;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->updateRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectProfileRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$3;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->touchableObjectsRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$4;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$4;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->updateObjectListRunnable:Ljava/lang/Runnable;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectDisplayListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectProfilePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->taskInventoryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarStatePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->runningAnimationsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->touchableObjectsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->onChatterNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever$OnChatterNameUpdated;

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;-><init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectDisplayListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->updateRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectProfilePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectProfileRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->touchableObjectsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->touchableObjectsRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    return-void
.end method


# virtual methods
.method public clearParcelInfo(Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->parcelInfo:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method

.method public getObjectDisplayList()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectDisplayListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getObjectProfile()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectProfilePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getObjectTaskInventory()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->taskInventoryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getTaskInventoryRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/RequestSource",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->taskInventoryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectsManager_2320(Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;)V
    .locals 0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestObjectListUpdate()V

    return-void
.end method

.method public myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarStatePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public requestObjectListUpdate()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectDisplayListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public requestObjectProfileUpdate(I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->objectProfilePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public requestTaskInventoryUpdate(I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->taskInventoryPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public requestTouchableChildrenUpdate(Ljava/util/UUID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->touchableObjectsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public runningAnimations()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Ljava/util/UUID;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->runningAnimationsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    return-object v0
.end method

.method public setFilter(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;)V
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->filterLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    invoke-virtual {v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    :cond_0
    monitor-exit v1

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestObjectListUpdate()V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setParcelInfo(Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->parcelInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestObjectListUpdate()V

    return-void
.end method

.method public touchableObjects()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/util/UUID;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->touchableObjectsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method
