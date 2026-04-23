.class public Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;
    }
.end annotation


# static fields
.field private static final DEFAULT_PRIORITY:F = 10000.0f


# instance fields
.field private final activeTransferIds:Lcom/google/common/collect/BiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/BiMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final activeTransfers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;",
            ">;"
        }
    .end annotation
.end field

.field private final assetRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
            ">;"
        }
    .end annotation
.end field

.field private final assetResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
            ">;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)Lcom/google/common/collect/BiMap;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->activeTransferIds:Lcom/google/common/collect/BiMap;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->activeTransfers:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->BeginTransfer(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->CancelTransfer(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 4

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->activeTransfers:Ljava/util/Map;

    invoke-static {}, Lcom/google/common/collect/HashBiMap;->create()Lcom/google/common/collect/HashBiMap;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/collect/Maps;->synchronizedBiMap(Lcom/google/common/collect/BiMap;)Lcom/google/common/collect/BiMap;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->activeTransferIds:Lcom/google/common/collect/BiMap;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)V

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->assetRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAssetResponseCacher()Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->setAssetResponseCacher(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;)V

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAssetResponseCacher()Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->assetRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    :cond_1
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->assetResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    return-void
.end method

.method private BeginTransfer(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;)V
    .locals 4

    const-string/jumbo v0, "Transfer: Starting transfer: assetUUID %s, assetType %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->getAssetUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->getAssetType()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->activeTransfers:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->getTransferUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->makeTransferRequest()Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private CancelTransfer(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->activeTransfers:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->getTransferUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->getTransferUUID()Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;->TransferID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->getChannelType()I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;->ChannelType:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->isReliable:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method


# virtual methods
.method EndTransfer(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;)V
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->activeTransfers:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->getTransferUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->activeTransferIds:Lcom/google/common/collect/BiMap;

    invoke-interface {v0}, Lcom/google/common/collect/BiMap;->inverse()Lcom/google/common/collect/BiMap;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->getTransferUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/collect/BiMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->assetResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->getStatus()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->assetResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->getData()[B

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;-><init>(I[B)V

    invoke-interface {v2, v0, v3}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleCloseCircuit()V
    .locals 2

    const/4 v1, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->setAssetResponseCacher(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAssetResponseCacher()Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->assetRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCloseCircuit()V

    return-void
.end method

.method public HandleTransferInfo(Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;)V
    .locals 5
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->activeTransfers:Ljava/util/Map;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->TransferID:Ljava/util/UUID;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;

    if-eqz v0, :cond_0

    const-string/jumbo v1, "Transfer: Info recd, status %d, size %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->Status:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->Size:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->HandleTransferInfo(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;)V

    :cond_0
    return-void
.end method

.method public HandleTransferPacket(Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;)V
    .locals 5
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->activeTransfers:Ljava/util/Map;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->TransferID:Ljava/util/UUID;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;

    if-eqz v0, :cond_0

    const-string/jumbo v1, "Transfer: data recd, packet %d, status %d, size %d."

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Packet:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Status:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Data:[B

    array-length v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->HandleTransferPacket(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;)V

    :cond_0
    return-void
.end method
