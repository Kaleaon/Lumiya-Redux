.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$1;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;
    }
.end annotation


# static fields
.field private static final Param_agentSizeVPHeadSize:I = 0x2aa

.field private static final Param_agentSizeVPHeelHeight:I = 0xc6

.field private static final Param_agentSizeVPHeight:I = 0x21

.field private static final Param_agentSizeVPHipLength:I = 0x34a

.field private static final Param_agentSizeVPLegLength:I = 0x2b4

.field private static final Param_agentSizeVPNeckLength:I = 0x2f4

.field private static final Param_agentSizeVPPlatformHeight:I = 0x1f7


# instance fields
.field private agentBakedTextures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

.field private agentSizeKnown:Z

.field private agentSizeVPHeadSize:F

.field private agentSizeVPHeelHeight:F

.field private agentSizeVPHeight:F

.field private agentSizeVPHipLength:F

.field private agentSizeVPLegLength:F

.field private agentSizeVPNeckLength:F

.field private agentSizeVPPlatformHeight:F

.field private agentVisualParams:[I

.field private volatile bakeProcess:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;

.field private bakingThread:Ljava/lang/Thread;

.field private final caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

.field private final cofFolderUUID:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private volatile cofReady:Z

.field private volatile currentCofAppearanceVersion:I

.field private volatile currentCofInventoryVersion:I

.field private final currentOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;",
            ">;"
        }
    .end annotation
.end field

.field private final findCofFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;",
            ">;"
        }
    .end annotation
.end field

.field private final inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

.field private volatile lastCofUpdateError:Z

.field private volatile lastCofUpdatedVersion:I

.field private volatile legacyAppearanceReady:Z

.field private volatile multiLayerDone:Z

.field private volatile needUpdateAppearance:Z

.field private final needUpdateCOF:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

.field private serverSideAppearanceUpdateTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private setAppearanceSerialNum:I

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

.field private final wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

.field private volatile wornAttachments:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final wornItemsRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            ">;"
        }
    .end annotation
.end field

.field private final wornItemsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;",
            ">;>;"
        }
    .end annotation
.end field

.field private volatile wornWearables:Lcom/google/common/collect/Table;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornItemsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;)Lcom/google/common/collect/ImmutableList;
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->getWornItems()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    return-object v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    const/4 v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->setAppearanceSerialNum:I

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeKnown:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->needUpdateAppearance:Z

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->needUpdateCOF:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    invoke-static {}, Lcom/google/common/collect/ImmutableTable;->of()Lcom/google/common/collect/ImmutableTable;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->bakingThread:Ljava/lang/Thread;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->serverSideAppearanceUpdateTask:Ljava/util/concurrent/Future;

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofInventoryVersion:I

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofAppearanceVersion:I

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->lastCofUpdatedVersion:I

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->lastCofUpdateError:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->legacyAppearanceReady:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->cofReady:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->multiLayerDone:Z

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->cofFolderUUID:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornItemsRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->bakeProcess:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/-$Lambda$Jp5Too8LbDpaKzeYKjkvQvC1hZo;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/-$Lambda$Jp5Too8LbDpaKzeYKjkvQvC1hZo;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/-$Lambda$Jp5Too8LbDpaKzeYKjkvQvC1hZo$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/-$Lambda$Jp5Too8LbDpaKzeYKjkvQvC1hZo$1;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->findCofFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornItems()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornItemsRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornItemsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    :goto_0
    return-void

    :cond_0
    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornItemsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    goto :goto_0
.end method

.method private DetachItem(I)V
    .locals 6

    const/4 v1, 0x1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Outfits: detaching item "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_2

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getAgentAvatar()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachedToUUID:Ljava/util/UUID;

    if-eqz v5, :cond_0

    iget-boolean v5, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    xor-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    if-ne v5, p1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    if-eqz v5, :cond_4

    move v0, v1

    :goto_0
    move v2, v0

    :cond_1
    :goto_1
    if-eqz v2, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v3}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    :cond_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach;-><init>()V

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach$ObjectData;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach$ObjectData;-><init>()V

    iput p1, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach$ObjectData;->ObjectLocalID:I

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->needUpdateCOF:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateCOFContents()V

    :cond_3
    return-void

    :cond_4
    :try_start_1
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachedToUUID:Ljava/util/UUID;

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_5
    move v0, v2

    goto :goto_0
.end method

.method private ForceUpdateAppearance(Z)V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->needUpdateAppearance:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateAvatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;

    invoke-direct {v1, v3, v2, v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;-><init>(ZZI)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->StartUpdatingAppearance()V

    return-void

    :cond_1
    if-eqz p1, :cond_0

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->lastCofUpdatedVersion:I

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofAppearanceVersion:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->RequestServerRebake()V

    goto :goto_0
.end method

.method private ProcessMultiLayer()V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->multiLayerDone:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->cofReady:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->legacyAppearanceReady:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateMultiLayer()V

    :cond_0
    return-void
.end method

.method private RequestServerRebake()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateAvatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->getFolder()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->version:I

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofInventoryVersion:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofInventoryVersion:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->lastCofUpdatedVersion:I

    if-eq v2, v3, :cond_1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofInventoryVersion:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofAppearanceVersion:I

    if-eq v2, v3, :cond_1

    :goto_0
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofInventoryVersion:I

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->lastCofUpdatedVersion:I

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->lastCofUpdateError:Z

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->version:I

    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateServerSideAppearance(Ljava/lang/String;I)V

    :cond_0
    return-void

    :cond_1
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->lastCofUpdateError:Z

    if-eqz v2, :cond_0

    goto :goto_0
.end method

.method private SendAgentIsNowWearing()V
    .locals 12

    const-wide/16 v10, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing;-><init>()V

    iget-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$AgentData;->SessionID:Ljava/util/UUID;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->values()[Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v5

    array-length v6, v5

    move v3, v2

    :goto_0
    if-ge v3, v6, :cond_3

    aget-object v7, v5, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-interface {v0, v7}, Lcom/google/common/collect/Table;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move v0, v1

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$WearableData;

    invoke-direct {v9}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$WearableData;-><init>()V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->itemID:Ljava/util/UUID;

    iput-object v0, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$WearableData;->ItemID:Ljava/util/UUID;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getTypeCode()I

    move-result v0

    iput v0, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$WearableData;->WearableType:I

    iget-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing;->WearableData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v0, v2

    goto :goto_1

    :cond_0
    move v0, v1

    :cond_1
    if-eqz v0, :cond_2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$WearableData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$WearableData;-><init>()V

    new-instance v8, Ljava/util/UUID;

    invoke-direct {v8, v10, v11, v10, v11}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$WearableData;->ItemID:Ljava/util/UUID;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getTypeCode()I

    move-result v7

    iput v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing$WearableData;->WearableType:I

    iget-object v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing;->WearableData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_0

    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "AvatarAppearance: Sending AgentIsNowWearing, "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing;->WearableData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " wearables."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iput-boolean v1, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing;->isReliable:Z

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->needUpdateCOF:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateCOFContents()V

    return-void
.end method

.method private SendAvatarSetAppearance()V
    .locals 7

    const/4 v6, 0x1

    const/4 v1, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateCOFContents()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateAvatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getAgentAvatar()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-result-object v0

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentBakedTextures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    if-eqz v2, :cond_1

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentBakedTextures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    invoke-virtual {v0, v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->ApplyAvatarTextures(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;Z)V

    :cond_1
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;-><init>()V

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->setAppearanceSerialNum:I

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->SerialNum:I

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput v5, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput v5, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput v5, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentBakedTextures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    if-eqz v3, :cond_3

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentBakedTextures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->packByteArray()[B

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;->TextureEntry:[B

    :goto_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->getAppearanceParams()[I

    move-result-object v3

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentVisualParams:[I

    if-eqz v0, :cond_2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentVisualParams:[I

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->ApplyAvatarVisualParams([I)V

    :cond_2
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentVisualParams:[I

    array-length v4, v3

    move v0, v1

    :goto_1
    if-ge v0, v4, :cond_4

    aget v1, v3, v0

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$VisualParam;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$VisualParam;-><init>()V

    iput v1, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$VisualParam;->ParamValue:I

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;

    new-array v4, v1, [B

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;->TextureEntry:[B

    goto :goto_0

    :cond_4
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeKnown:Z

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->areWearablesReady()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v1, 0x3ee66666    # 0.45f

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v1, 0x3f19999a    # 0.6f

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->getAgentHeight()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "set agent height to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :cond_5
    iput-boolean v6, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->isReliable:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "AvatarAppearance: Sending agentSetAppearance: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " params, hasTextures = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentBakedTextures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    if-eqz v0, :cond_7

    const-string/jumbo v0, "yes"

    :goto_2
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->setAppearanceSerialNum:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->setAppearanceSerialNum:I

    :cond_6
    return-void

    :cond_7
    const-string/jumbo v0, "no"

    goto :goto_2
.end method

.method private StartUpdatingAppearance()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->updateIfWearablesReady()V

    return-void
.end method

.method private UpdateCOFContents()V
    .locals 15

    const/4 v14, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->areWearablesReady()Z

    move-result v0

    const-string/jumbo v1, "Wearables ready %b, cofReady %b"

    new-array v2, v14, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v9

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->cofReady:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->cofReady:Z

    :goto_0
    if-nez v0, :cond_1

    return-void

    :cond_0
    move v0, v9

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    if-nez v0, :cond_2

    return-void

    :cond_2
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->getFolder()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v1

    if-nez v1, :cond_3

    return-void

    :cond_3
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->needUpdateCOF:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_10

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->version:I

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofInventoryVersion:I

    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-interface {v2}, Lcom/google/common/collect/Table;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_4
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->getIsFailed()Z

    move-result v7

    if-nez v7, :cond_4

    iget-object v7, v2, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->itemID:Ljava/util/UUID;

    invoke-interface {v5, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v7, v2, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->itemID:Ljava/util/UUID;

    invoke-interface {v4, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_5
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_6

    invoke-interface {v10, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_6
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v7, v8

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v12, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v12}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v12

    if-ne v11, v12, :cond_9

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v12, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v12}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v12

    if-ne v11, v12, :cond_8

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-interface {v5, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_7

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-interface {v3, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_7
    :goto_3
    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-interface {v4, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-interface {v10, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move v0, v7

    :goto_4
    move v7, v0

    goto :goto_2

    :cond_8
    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v12, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v12}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v12

    if-ne v11, v12, :cond_7

    if-eqz v2, :cond_7

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-interface {v2, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_7

    const-string/jumbo v11, "Attached entry %s (%s) not found in wanted attachments"

    new-array v12, v14, [Ljava/lang/Object;

    iget-object v13, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    aput-object v13, v12, v9

    iget-object v13, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    aput-object v13, v12, v8

    invoke-static {v11, v12}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-interface {v3, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_9
    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v12, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v12}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v12

    if-ne v11, v12, :cond_12

    iget-object v11, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v11, :cond_12

    iget-object v11, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v11, v11, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iget-object v12, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v11, v12}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v0, v7

    goto :goto_4

    :cond_a
    move v0, v9

    goto :goto_4

    :cond_b
    const-string/jumbo v0, "Update COF: addWearablesList %d, killList %d"

    new-array v2, v14, [Ljava/lang/Object;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v9

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v8

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-virtual {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DeleteMultiInventoryItemRaw(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/List;)V

    move v0, v8

    :goto_5
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_6
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    const-string/jumbo v0, "Update COF: adding %s, name = \'%s\'"

    new-array v2, v14, [Ljava/lang/Object;

    iget-object v3, v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->itemID:Ljava/util/UUID;

    aput-object v3, v2, v9

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v2, v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->itemID:Ljava/util/UUID;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v3

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v4

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, ""

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->LinkInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;IILjava/lang/String;Ljava/lang/String;)V

    move v0, v8

    goto :goto_6

    :cond_c
    invoke-interface {v10}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_7
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/util/Map$Entry;

    const-string/jumbo v0, "Update COF: adding attachment %s, name = \'%s\'"

    new-array v2, v14, [Ljava/lang/Object;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v9

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/UUID;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v3

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v4

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string/jumbo v6, ""

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->LinkInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;IILjava/lang/String;Ljava/lang/String;)V

    move v0, v8

    goto :goto_7

    :cond_d
    if-eqz v7, :cond_e

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v2, :cond_e

    const-string/jumbo v0, "Update COF: adding outfit link for outfit folder %s"

    new-array v2, v8, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    aput-object v3, v2, v9

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v3

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const-string/jumbo v6, ""

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->LinkInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;IILjava/lang/String;Ljava/lang/String;)V

    move v0, v8

    :cond_e
    const-string/jumbo v2, "Update COF: COF updated (had changes: %b)."

    new-array v3, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v9

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    :cond_f
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->RequestServerRebake()V

    :cond_10
    return-void

    :cond_11
    move v0, v9

    goto/16 :goto_5

    :cond_12
    move v0, v7

    goto/16 :goto_4
.end method

.method private UpdateCurrentOutfitLink(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v3

    if-ne v2, v3, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornOutfitLink()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method private declared-synchronized UpdateMultiLayer()V
    .locals 14

    const/4 v1, 0x0

    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "AvatarAppearance: MultiLayer: Updating multi layer appearance."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v2

    move-object v3, v2

    :goto_0
    if-eqz v0, :cond_8

    if-eqz v3, :cond_8

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v7

    if-ne v6, v7, :cond_2

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    move-object v3, v1

    goto :goto_0

    :cond_2
    :try_start_1
    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v7

    if-eq v6, v7, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isLink()Z

    move-result v6

    if-eqz v6, :cond_0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v7

    if-ne v6, v7, :cond_0

    :cond_3
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    const/4 v0, 0x0

    invoke-direct {p0, v3, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->WearItemList(Lcom/lumiyaviewer/lumiya/orm/InventoryDB;Ljava/util/List;Z)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string/jumbo v0, "AvatarAppearance: MultiLayer: had some extra layers."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendAgentIsNowWearing()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->StartUpdatingAppearance()V

    :goto_2
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_9

    const-string/jumbo v0, "AvatarAppearance: Re-attaching %d attachments from COF."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v2, v6

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move-object v2, v1

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->resolveLink(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v8

    if-eqz v8, :cond_a

    if-nez v2, :cond_5

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;-><init>()V

    iget-object v9, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    iget-object v10, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v10, v10, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v9, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    iget-object v10, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v10, v10, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v9, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    iput-object v6, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->CompoundMsgID:Ljava/util/UUID;

    iget-object v9, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v10

    iput v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->TotalObjects:I

    iget-object v9, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    const/4 v10, 0x0

    iput-boolean v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->FirstDetachAll:Z

    :cond_5
    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;

    invoke-direct {v9}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;-><init>()V

    const-string/jumbo v10, "Re-attaching attachment: entry %s (%s)"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    iget-object v12, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    const/4 v13, 0x0

    aput-object v12, v11, v13

    iget-object v12, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const/4 v13, 0x1

    aput-object v12, v11, v13

    invoke-static {v10, v11}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v10, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-interface {v5, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v10, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->ItemID:Ljava/util/UUID;

    iget-object v10, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    iput-object v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->OwnerID:Ljava/util/UUID;

    const/16 v10, 0x80

    iput v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->AttachmentPt:I

    iget v10, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    iput v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->ItemFlags:I

    iget v10, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    iput v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->GroupMask:I

    iget v10, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    iput v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->EveryoneMask:I

    iget v8, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    iput v8, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->NextOwnerMask:I

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v8}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v8

    iput-object v8, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->Name:[B

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->Description:[B

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v8, 0x4

    if-lt v0, v8, :cond_a

    const/4 v0, 0x1

    iput-boolean v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->isReliable:Z

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    move-object v0, v1

    :goto_4
    move-object v2, v0

    goto/16 :goto_3

    :cond_6
    const-string/jumbo v0, "AvatarAppearance: MultiLayer: no extra layers."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_2

    :cond_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v5}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    if-eqz v2, :cond_8

    const/4 v0, 0x1

    iput-boolean v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->isReliable:Z

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :cond_8
    :goto_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->multiLayerDone:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_9
    :try_start_2
    const-string/jumbo v0, "AvatarAppearance: No attachments in COF."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_5

    :cond_a
    move-object v0, v2

    goto :goto_4
.end method

.method private declared-synchronized UpdateServerSideAppearance(Ljava/lang/String;I)V
    .locals 4

    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "AvatarAppearance: capURL \'%s\', cofVersion %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->serverSideAppearanceUpdateTask:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->serverSideAppearanceUpdateTask:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;->getInstance()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/-$Lambda$Jp5Too8LbDpaKzeYKjkvQvC1hZo$2;

    invoke-direct {v1, p2, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/-$Lambda$Jp5Too8LbDpaKzeYKjkvQvC1hZo$2;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->serverSideAppearanceUpdateTask:Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private UpdateWearableNames()V
    .locals 6

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v1

    :cond_0
    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolderOrFolderLink()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->resolveLink(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v3

    if-eqz v3, :cond_1

    iget v0, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v4

    if-ne v0, v4, :cond_1

    iget v0, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    and-int/lit16 v0, v0, 0xff

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getByCode(I)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    iget-object v5, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-interface {v4, v0, v5}, Lcom/google/common/collect/Table;->get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    if-eqz v0, :cond_1

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->setInventoryName(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method private WearItemList(Lcom/lumiyaviewer/lumiya/orm/InventoryDB;Ljava/util/List;Z)Z
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryDB;",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;Z)Z"
        }
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v7, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-static {v1}, Lcom/google/common/collect/HashBasedTable;->create(Lcom/google/common/collect/Table;)Lcom/google/common/collect/HashBasedTable;

    move-result-object v1

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move v3, v0

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->resolveLink(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v9

    if-eqz v9, :cond_8

    iget v0, v9, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    and-int/lit16 v0, v0, 0xff

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getByCode(I)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v2

    if-eqz v2, :cond_8

    if-nez p3, :cond_1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isBodyPart()Z

    move-result v0

    move v4, v0

    :goto_1
    const/4 v6, 0x1

    invoke-virtual {v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canWearItem(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    :goto_2
    if-eqz v0, :cond_8

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-interface {v1, v2, v0}, Lcom/google/common/collect/Table;->contains(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    if-eqz v4, :cond_5

    new-instance v0, Ljava/util/HashSet;

    invoke-interface {v1, v2}, Lcom/google/common/collect/Table;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iget-object v3, v9, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-interface {v0, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-interface {v1, v2, v0}, Lcom/google/common/collect/Table;->remove(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->dispose()V

    goto :goto_3

    :cond_1
    const/4 v0, 0x1

    move v4, v0

    goto :goto_1

    :cond_2
    if-eqz v4, :cond_3

    invoke-virtual {v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_9

    const/4 v0, 0x0

    invoke-interface {v1, v2}, Lcom/google/common/collect/Table;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    move v5, v0

    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    iget-object v11, v9, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v0, v11}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_5
    move v5, v0

    goto :goto_4

    :cond_3
    move v0, v6

    goto :goto_2

    :cond_4
    if-eqz v5, :cond_9

    const/4 v0, 0x0

    goto :goto_2

    :cond_5
    iget-object v3, v9, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iget-object v4, v9, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    iget-object v5, v9, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->addWearable(Lcom/google/common/collect/Table;Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    const/4 v3, 0x1

    move v0, v3

    :goto_6
    move v3, v0

    goto/16 :goto_0

    :cond_6
    if-eqz v3, :cond_7

    invoke-static {v1}, Lcom/google/common/collect/ImmutableTable;->copyOf(Lcom/google/common/collect/Table;)Lcom/google/common/collect/ImmutableTable;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornWearablesPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornItems()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_7
    return v3

    :cond_8
    move v0, v3

    goto :goto_6

    :cond_9
    move v0, v6

    goto/16 :goto_2

    :cond_a
    move v0, v5

    goto :goto_5
.end method

.method private addWearable(Lcom/google/common/collect/Table;Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ")",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-object v3, p3

    move-object v4, p4

    move-object v5, p2

    move-object v6, p0

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/util/concurrent/Executor;Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;)V

    if-eqz p5, :cond_0

    invoke-virtual {v0, p5}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->setInventoryName(Ljava/lang/String;)V

    :cond_0
    invoke-interface {p1, p2, p4, v0}, Lcom/google/common/collect/Table;->put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private areWearablesReady()Z
    .locals 15

    const/4 v14, 0x2

    const/4 v4, 0x1

    const/4 v2, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->values()[Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v7

    array-length v8, v7

    move v6, v2

    move v5, v2

    move v0, v2

    :goto_0
    if-ge v6, v8, :cond_5

    aget-object v9, v7, v6

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getIsCritical()Z

    move-result v10

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-interface {v1, v9}, Lcom/google/common/collect/Table;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v11

    if-eqz v11, :cond_1

    invoke-interface {v11}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move v1, v2

    move v3, v0

    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->getIsValid()Z

    move-result v13

    if-eqz v13, :cond_0

    move v0, v4

    move v1, v3

    :goto_2
    move v3, v1

    move v1, v0

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->getIsFailed()Z

    move-result v0

    if-nez v0, :cond_8

    move v0, v1

    move v1, v4

    goto :goto_2

    :cond_1
    move v1, v2

    move v3, v0

    :cond_2
    if-eqz v10, :cond_3

    xor-int/lit8 v0, v1, 0x1

    if-eqz v0, :cond_7

    const-string/jumbo v1, "missing wearables on critical layer %s (worn: %d entries)"

    new-array v5, v14, [Ljava/lang/Object;

    aput-object v9, v5, v2

    if-eqz v11, :cond_4

    invoke-interface {v11}, Ljava/util/Map;->size()I

    move-result v0

    :goto_3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v4

    invoke-static {v1, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    move v0, v4

    :goto_4
    add-int/lit8 v1, v6, 0x1

    move v6, v1

    move v5, v0

    move v0, v3

    goto :goto_0

    :cond_3
    move v0, v5

    goto :goto_4

    :cond_4
    move v0, v2

    goto :goto_3

    :cond_5
    const-string/jumbo v1, "hasNotDownloaded %b, hasCriticalMissing %b"

    new-array v3, v14, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v3, v2

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-nez v0, :cond_6

    xor-int/lit8 v2, v5, 0x1

    :cond_6
    return v2

    :cond_7
    move v0, v5

    goto :goto_4

    :cond_8
    move v0, v1

    move v1, v3

    goto :goto_2
.end method

.method private canDetachItem(Ljava/util/UUID;)Z
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getAgentAvatar()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachedToUUID:Ljava/util/UUID;

    if-eqz v2, :cond_0

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachedToUUID:Ljava/util/UUID;

    invoke-virtual {v2, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentID:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v3

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v3, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canDetachItem(ILjava/util/UUID;)Z
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private canWearItem(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canWearItem(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v0

    return v0
.end method

.method private getAgentHeight()F
    .locals 3

    const v2, 0x3fda5e35    # 1.706f

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPLegLength:F

    const v1, 0x3e446738    # 0.1918f

    mul-float/2addr v0, v1

    add-float/2addr v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPHipLength:F

    const v2, 0x3d19999a    # 0.0375f

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPHeight:F

    const v2, 0x3df635e7    # 0.12022f

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPHeadSize:F

    const v2, 0x3c370260    # 0.01117f

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPNeckLength:F

    const v2, 0x3d1ba5e3    # 0.038f

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPHeelHeight:F

    const v2, 0x3da3d70a    # 0.08f

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPPlatformHeight:F

    const v2, 0x3d8f5c29    # 0.07f

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method private getAppearanceParams()[I
    .locals 11

    const/16 v7, 0xda

    const/high16 v10, 0x437f0000    # 255.0f

    const/16 v4, 0xff

    const/4 v3, 0x0

    new-array v5, v7, [I

    move v1, v3

    :goto_0
    if-ge v1, v7, :cond_3

    aput v3, v5, v1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramDefs:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    aget-object v0, v0, v1

    if-eqz v0, :cond_1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, v3}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;

    if-eqz v0, :cond_1

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->defValue:F

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->minValue:F

    sub-float/2addr v2, v6

    mul-float/2addr v2, v10

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->maxValue:F

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->minValue:F

    sub-float v0, v6, v0

    div-float v0, v2, v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    if-gez v0, :cond_2

    move v0, v3

    :cond_0
    :goto_1
    aput v0, v5, v1

    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_2
    if-le v0, v4, :cond_0

    move v0, v4

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-interface {v0}, Lcom/google/common/collect/Table;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->getWearableData()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;->params:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_5
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramByIDs:Lcom/google/common/collect/ImmutableMap;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    if-eqz v1, :cond_5

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    if-lez v2, :cond_5

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->appearanceIndex:I

    if-ltz v2, :cond_5

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2, v3}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;

    iget v8, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramValue:F

    iget v9, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->minValue:F

    sub-float/2addr v8, v9

    mul-float/2addr v8, v10

    iget v9, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->maxValue:F

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->minValue:F

    sub-float v2, v9, v2

    div-float v2, v8, v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    if-gez v2, :cond_7

    move v2, v3

    :cond_6
    :goto_3
    iget v8, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->appearanceIndex:I

    aput v2, v5, v8

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->id:I

    sparse-switch v1, :sswitch_data_0

    goto :goto_2

    :sswitch_0
    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramValue:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPHeight:F

    goto :goto_2

    :cond_7
    if-le v2, v4, :cond_6

    move v2, v4

    goto :goto_3

    :sswitch_1
    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramValue:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPHeelHeight:F

    goto :goto_2

    :sswitch_2
    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramValue:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPPlatformHeight:F

    goto :goto_2

    :sswitch_3
    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramValue:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPHeadSize:F

    goto :goto_2

    :sswitch_4
    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramValue:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPLegLength:F

    goto :goto_2

    :sswitch_5
    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramValue:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPNeckLength:F

    goto :goto_2

    :sswitch_6
    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramValue:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeVPHipLength:F

    goto :goto_2

    :cond_8
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentSizeKnown:Z

    return-object v5

    nop

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_0
        0xc6 -> :sswitch_1
        0x1f7 -> :sswitch_2
        0x2aa -> :sswitch_3
        0x2b4 -> :sswitch_4
        0x2f4 -> :sswitch_5
        0x34a -> :sswitch_6
    .end sparse-switch
.end method

.method private getWornItems()Lcom/google/common/collect/ImmutableList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;",
            ">;"
        }
    .end annotation

    const/4 v3, 0x0

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v8

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-interface {v1}, Lcom/google/common/collect/Table;->cellSet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/google/common/collect/Table$Cell;

    invoke-interface {v4}, Lcom/google/common/collect/Table$Cell;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    if-eqz v5, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;

    invoke-interface {v4}, Lcom/google/common/collect/Table$Cell;->getRowKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    invoke-interface {v4}, Lcom/google/common/collect/Table$Cell;->getColumnKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/UUID;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->getName()Ljava/lang/String;

    move-result-object v5

    move v6, v3

    move v7, v3

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;-><init>(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;ILjava/util/UUID;Ljava/lang/String;IZ)V

    invoke-virtual {v8, v1}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getAgentAvatar()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-result-object v1

    if-eqz v1, :cond_2

    :try_start_0
    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-object v2, v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;

    iget v3, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentID:I

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getName()Ljava/lang/String;

    move-result-object v5

    iget v6, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isTouchable()Z

    move-result v7

    const/4 v2, 0x0

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;-><init>(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;ILjava/util/UUID;Ljava/lang/String;IZ)V

    invoke-virtual {v8, v1}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_2
    invoke-virtual {v8}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    return-object v1
.end method

.method private isItemWorn(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Z)Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-virtual {p1, v0, v1, p2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->whatIsItemWornOn(Lcom/google/common/collect/ImmutableMap;Lcom/google/common/collect/Table;Z)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onCofFolderEntry(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 8

    const/4 v2, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_0

    iget-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v4, :cond_0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    const/16 v5, 0x2e

    if-ne v4, v5, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->cofFolderUUID:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->findCofFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getInventoryEntries()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v7

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    const/4 v4, 0x0

    move v3, v2

    move-object v5, v1

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->create(Ljava/util/UUID;Ljava/lang/String;ZZZLcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    invoke-virtual {v6, v7, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method private onCurrentOutfitFolder(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->getFolder()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->sessionID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "AvatarAppearance: COF has been fetched from inventory."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateWearableNames()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->cofReady:Z

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateCurrentOutfitLink(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->ProcessMultiLayer()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateCOFContents()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->RequestServerRebake()V

    :cond_0
    return-void
.end method

.method private startBaking()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->bakeProcess:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->cancel()V

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->textureUploader:Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    invoke-direct {v0, v1, p0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;-><init>(Lcom/google/common/collect/Table;Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;Lcom/lumiyaviewer/lumiya/eventbus/EventBus;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->bakeProcess:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;

    return-void
.end method

.method private updateIfWearablesReady()V
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->areWearablesReady()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendAvatarSetAppearance()V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->needUpdateAppearance:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UpdateAvatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->startBaking()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateCOFContents()V

    goto :goto_0
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_slproto_modules_SLAvatarAppearance-mthref-0(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->onCurrentOutfitFolder(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_modules_SLAvatarAppearance-mthref-1(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->onCofFolderEntry(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V

    return-void
.end method

.method public AttachInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;IZ)V
    .locals 5

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v0, 0x0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->resolveLink(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object p1

    :cond_1
    if-nez p1, :cond_2

    return-void

    :cond_2
    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v3

    if-eq v0, v3, :cond_3

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v3

    if-ne v0, v3, :cond_4

    :cond_3
    invoke-virtual {p0, p1, p3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->WearItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Z)V

    return-void

    :cond_4
    const-string/jumbo v0, "Outfits: Attaching inventory item %s"

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_5

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_9

    :cond_5
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    if-eqz v0, :cond_6

    invoke-interface {v1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_6
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v1}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    move v0, v2

    :goto_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;-><init>()V

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;->SessionID:Ljava/util/UUID;

    if-nez p3, :cond_7

    or-int/lit16 p2, p2, 0x80

    :cond_7
    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->ItemID:Ljava/util/UUID;

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->OwnerID:Ljava/util/UUID;

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iput p2, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->AttachmentPt:I

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->ItemFlags:I

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->GroupMask:I

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->EveryoneMask:I

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->NextOwnerMask:I

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->Name:[B

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->Description:[B

    iput-boolean v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->needUpdateCOF:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateCOFContents()V

    :cond_8
    return-void

    :cond_9
    move v0, v1

    goto :goto_0
.end method

.method public ChangeOutfit(Ljava/util/List;ZLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;Z",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v2, :cond_3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v2

    move-object v8, v2

    :goto_0
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_4

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    move-object v11, v4

    :goto_1
    if-eqz p2, :cond_27

    const/4 v2, 0x1

    invoke-interface {v11}, Ljava/util/Map;->clear()V

    :goto_2
    if-eqz p3, :cond_5

    if-eqz p2, :cond_26

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-nez v3, :cond_6

    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const/4 v2, 0x1

    move v3, v2

    :goto_3
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-interface/range {p1 .. p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v8, :cond_7

    invoke-virtual {v8, v2}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->resolveLink(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v4

    :goto_5
    if-eqz v4, :cond_1

    move-object v2, v4

    :cond_1
    if-eqz v2, :cond_0

    iget v4, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v9

    if-eq v4, v9, :cond_2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isLink()Z

    move-result v4

    if-eqz v4, :cond_0

    iget v4, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v9

    if-ne v4, v9, :cond_0

    :cond_2
    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_3
    const/4 v2, 0x0

    move-object v8, v2

    goto :goto_0

    :cond_4
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    move-object v11, v2

    goto :goto_1

    :cond_5
    move v3, v2

    goto :goto_3

    :cond_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    move-object/from16 v0, p3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_26

    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedOutfitFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const/4 v2, 0x1

    move v3, v2

    goto :goto_3

    :cond_7
    move-object v4, v2

    goto :goto_5

    :cond_8
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;-><init>()V

    iget-object v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v7, v7, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v7, v7, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->CompoundMsgID:Ljava/util/UUID;

    iget-object v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    iput v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->TotalObjects:I

    iget-object v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    move/from16 v0, p2

    iput-boolean v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->FirstDetachAll:Z

    const-string/jumbo v4, "Wearing: totalAttachments %d"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v10, 0x0

    aput-object v9, v7, v10

    invoke-static {v4, v7}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v9, v3

    move-object v3, v2

    :goto_6
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-nez v3, :cond_25

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;-><init>()V

    iget-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v9, v9, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v9, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v9, v9, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v9, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->CompoundMsgID:Ljava/util/UUID;

    iget-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    iput v9, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->TotalObjects:I

    iget-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    move/from16 v0, p2

    iput-boolean v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->FirstDetachAll:Z

    move-object v4, v3

    :goto_7
    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;

    invoke-direct {v9}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;-><init>()V

    iget-object v10, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    const-string/jumbo v3, "Wearing: entry \'%s\' actualUUID %s"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    iget-object v13, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const/4 v14, 0x0

    aput-object v13, v12, v14

    const/4 v13, 0x1

    aput-object v10, v12, v13

    invoke-static {v3, v12}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-interface {v11, v10, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x1

    iput-object v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->ItemID:Ljava/util/UUID;

    iget-object v10, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    iput-object v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->OwnerID:Ljava/util/UUID;

    const/16 v10, 0x80

    iput v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->AttachmentPt:I

    iget v10, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    iput v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->ItemFlags:I

    iget v10, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    iput v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->GroupMask:I

    iget v10, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    iput v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->EveryoneMask:I

    iget v10, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    iput v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->NextOwnerMask:I

    iget-object v10, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v10}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v10

    iput-object v10, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->Name:[B

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->Description:[B

    iget-object v2, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v2, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v9, 0x4

    if-lt v2, v9, :cond_24

    const/4 v2, 0x1

    iput-boolean v2, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->isReliable:Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    const/4 v2, 0x0

    :goto_8
    move v9, v3

    move-object v3, v2

    goto/16 :goto_6

    :cond_9
    if-eqz v3, :cond_a

    const/4 v2, 0x1

    iput-boolean v2, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->isReliable:Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :cond_a
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v3

    iget-object v12, v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    new-instance v13, Ljava/util/HashSet;

    invoke-direct {v13}, Ljava/util/HashSet;-><init>()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-static {v3}, Lcom/google/common/collect/HashBasedTable;->create(Lcom/google/common/collect/Table;)Lcom/google/common/collect/HashBasedTable;

    move-result-object v3

    invoke-interface/range {p1 .. p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    move v5, v2

    :goto_9
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v8, :cond_d

    invoke-virtual {v8, v2}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->resolveLink(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v2

    move-object v10, v2

    :goto_a
    if-eqz v10, :cond_21

    iget v2, v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v4

    if-eq v2, v4, :cond_b

    iget v2, v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v4

    if-ne v2, v4, :cond_e

    :cond_b
    iget v2, v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    and-int/lit16 v2, v2, 0xff

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getByCode(I)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v4

    if-eqz v4, :cond_21

    const/4 v7, 0x1

    invoke-virtual {v12, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canWearItem(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v2

    if-nez v2, :cond_f

    const/4 v2, 0x0

    :goto_b
    if-eqz v2, :cond_21

    iget-object v2, v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-interface {v13, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v2, v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-interface {v3, v4, v2}, Lcom/google/common/collect/Table;->contains(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_21

    iget-object v5, v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iget-object v6, v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    iget-object v7, v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->addWearable(Lcom/google/common/collect/Table;Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    const/4 v5, 0x1

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isBodyPart()Z

    move-result v2

    if-eqz v2, :cond_21

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v3, v4}, Lcom/google/common/collect/Table;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_c
    :goto_c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/UUID;

    iget-object v15, v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v2, v15}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_c

    invoke-interface {v6, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_c

    :cond_d
    move-object v10, v2

    goto :goto_a

    :cond_e
    move v2, v5

    :goto_d
    move v5, v2

    goto/16 :goto_9

    :cond_f
    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isBodyPart()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v12, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_22

    invoke-interface {v3, v4}, Lcom/google/common/collect/Table;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v6

    const/4 v2, 0x0

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    move v6, v2

    :goto_e
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/UUID;

    iget-object v0, v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_23

    const/4 v2, 0x1

    :goto_f
    move v6, v2

    goto :goto_e

    :cond_10
    move v2, v7

    goto/16 :goto_b

    :cond_11
    if-eqz v6, :cond_22

    const/4 v2, 0x0

    goto/16 :goto_b

    :cond_12
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_13
    :goto_10
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/UUID;

    invoke-interface {v3, v4}, Lcom/google/common/collect/Table;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->size()I

    move-result v7

    const/4 v10, 0x1

    if-le v7, v10, :cond_13

    invoke-interface {v3, v4, v2}, Lcom/google/common/collect/Table;->remove(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    if-eqz v2, :cond_13

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->dispose()V

    goto :goto_10

    :cond_14
    if-eqz p2, :cond_1a

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->values()[Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v6

    const/4 v2, 0x0

    array-length v7, v6

    move v4, v5

    move v5, v2

    :goto_11
    if-ge v5, v7, :cond_1b

    aget-object v2, v6, v5

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isBodyPart()Z

    move-result v8

    if-eqz v8, :cond_16

    :cond_15
    :goto_12
    add-int/lit8 v2, v5, 0x1

    move v5, v2

    goto :goto_11

    :cond_16
    invoke-virtual {v12, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v8

    if-eqz v8, :cond_15

    invoke-interface {v3, v2}, Lcom/google/common/collect/Table;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v8

    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_17
    :goto_13
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/UUID;

    invoke-interface {v13, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_17

    invoke-interface {v10, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_18
    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    move v2, v4

    :goto_14
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_20

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/UUID;

    invoke-interface {v8, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    if-eqz v2, :cond_19

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->dispose()V

    :cond_19
    const/4 v2, 0x1

    goto :goto_14

    :cond_1a
    move v4, v5

    :cond_1b
    if-eqz v4, :cond_1c

    invoke-static {v3}, Lcom/google/common/collect/ImmutableTable;->copyOf(Lcom/google/common/collect/Table;)Lcom/google/common/collect/ImmutableTable;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornWearablesPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-virtual {v2, v3, v5}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornItems()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_1c
    if-eqz v9, :cond_1d

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v11}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    :cond_1d
    if-eqz v4, :cond_1e

    invoke-direct/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendAgentIsNowWearing()V

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->ForceUpdateAppearance(Z)V

    const/4 v9, 0x0

    :cond_1e
    if-eqz v9, :cond_1f

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->needUpdateCOF:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-direct/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateCOFContents()V

    :cond_1f
    return-void

    :cond_20
    move v4, v2

    goto/16 :goto_12

    :cond_21
    move v2, v5

    goto/16 :goto_d

    :cond_22
    move v2, v7

    goto/16 :goto_b

    :cond_23
    move v2, v6

    goto/16 :goto_f

    :cond_24
    move-object v2, v4

    goto/16 :goto_8

    :cond_25
    move-object v4, v3

    goto/16 :goto_7

    :cond_26
    move v3, v2

    goto/16 :goto_3

    :cond_27
    move v2, v3

    goto/16 :goto_2
.end method

.method public DetachInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 6

    const/4 v2, 0x1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canDetachItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isLink()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    move-object v1, v0

    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Outfits: Detaching inventory item "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-interface {v3, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wantedAttachments:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v3}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    move v0, v2

    :goto_1
    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/DetachAttachmentIntoInv;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/DetachAttachmentIntoInv;-><init>()V

    iget-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/DetachAttachmentIntoInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DetachAttachmentIntoInv$ObjectData;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/DetachAttachmentIntoInv$ObjectData;->AgentID:Ljava/util/UUID;

    iget-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/DetachAttachmentIntoInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DetachAttachmentIntoInv$ObjectData;

    iput-object v1, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/DetachAttachmentIntoInv$ObjectData;->ItemID:Ljava/util/UUID;

    iput-boolean v2, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/DetachAttachmentIntoInv;->isReliable:Z

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->needUpdateCOF:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateCOFContents()V

    :cond_0
    return-void

    :cond_1
    move v0, v3

    goto :goto_1

    :cond_2
    move v0, v3

    goto :goto_1

    :cond_3
    move-object v1, v0

    goto :goto_0
.end method

.method public DetachItem(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;)V
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canDetachItem(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->DetachItem(I)V

    :cond_0
    return-void
.end method

.method public DetachItemFromPoint(I)V
    .locals 5

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getAgentAvatar()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    :try_start_0
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachedToUUID:Ljava/util/UUID;

    if-eqz v2, :cond_1

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_1

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentID:I

    if-ne v2, p1, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v2, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canDetachItem(ILjava/util/UUID;)Z

    move-result v2

    if-eqz v2, :cond_4

    if-nez v1, :cond_0

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    move-object v1, v2

    :cond_0
    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_2
    if-eqz v1, :cond_3

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->DetachItem(I)V

    goto :goto_2

    :cond_3
    return-void

    :cond_4
    move-object v0, v1

    goto :goto_1
.end method

.method public ForceTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)V
    .locals 5

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Table;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-static {v2}, Lcom/google/common/collect/HashBasedTable;->create(Lcom/google/common/collect/Table;)Lcom/google/common/collect/HashBasedTable;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/common/collect/Table;->rowKeySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-static {v2}, Lcom/google/common/collect/ImmutableTable;->copyOf(Lcom/google/common/collect/Table;)Lcom/google/common/collect/ImmutableTable;

    move-result-object v2

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornWearablesPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-virtual {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornItems()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :goto_0
    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendAgentIsNowWearing()V

    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->ForceUpdateAppearance(Z)V

    :cond_0
    return-void

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public HandleAgentWearablesUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate;)V
    .locals 10
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const-wide/16 v8, 0x0

    const/4 v5, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "AvatarAppearance: Got AgentWearablesUpdate, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate;->WearableData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " wearables."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-static {v0}, Lcom/google/common/collect/HashBasedTable;->create(Lcom/google/common/collect/Table;)Lcom/google/common/collect/HashBasedTable;

    move-result-object v1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate;->WearableData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate$WearableData;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Wearable: type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate$WearableData;->WearableType:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", itemID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate$WearableData;->ItemID:Ljava/util/UUID;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", assetID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate$WearableData;->AssetID:Ljava/util/UUID;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate$WearableData;->AssetID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    cmp-long v2, v2, v8

    if-nez v2, :cond_1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate$WearableData;->AssetID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    cmp-long v2, v2, v8

    if-eqz v2, :cond_0

    :cond_1
    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate$WearableData;->AssetID:Ljava/util/UUID;

    invoke-interface {v6, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate$WearableData;->WearableType:I

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getByCode(I)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate$WearableData;->AssetID:Ljava/util/UUID;

    invoke-interface {v1, v2, v3}, Lcom/google/common/collect/Table;->get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    if-nez v3, :cond_0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate$WearableData;->ItemID:Ljava/util/UUID;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate$WearableData;->AssetID:Ljava/util/UUID;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->addWearable(Lcom/google/common/collect/Table;Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "AvatarAppearance: AgentWearablesUpdate: wearing now: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v6}, Ljava/util/Set;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " ids"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v1}, Lcom/google/common/collect/Table;->columnKeySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-interface {v6, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-interface {v1, v0}, Lcom/google/common/collect/Table;->column(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->dispose()V

    goto :goto_3

    :cond_5
    invoke-interface {v3}, Ljava/util/Map;->clear()V

    goto :goto_2

    :cond_6
    invoke-static {v1}, Lcom/google/common/collect/ImmutableTable;->copyOf(Lcom/google/common/collect/Table;)Lcom/google/common/collect/ImmutableTable;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornWearablesPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornItems()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateWearableNames()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->legacyAppearanceReady:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->ProcessMultiLayer()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendAgentIsNowWearing()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->StartUpdatingAppearance()V

    return-void
.end method

.method public HandleAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->AppearanceData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->AppearanceData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$AppearanceData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$AppearanceData;->CofVersion:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofAppearanceVersion:I

    const-string/jumbo v0, "AvatarAppearance: inventory COF %d, last updated COF %d, appearance COF %d"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofInventoryVersion:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->lastCofUpdatedVersion:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentCofAppearanceVersion:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleCircuitReady()V
    .locals 9

    const/16 v8, 0x2e

    const/4 v2, 0x1

    const/4 v4, 0x0

    const/4 v1, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCircuitReady()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getRootFolder()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v3

    invoke-virtual {v3, v0, v8}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findSpecialFolder(Ljava/util/UUID;I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string/jumbo v3, "Found existing COF folder: %s"

    new-array v5, v2, [Ljava/lang/Object;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    aput-object v6, v5, v4

    invoke-static {v3, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->cofFolderUUID:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v3, v5}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getInventoryEntries()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v7

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    move v3, v2

    move-object v5, v1

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->create(Ljava/util/UUID;Ljava/lang/String;ZZZLcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    invoke-virtual {v6, v7, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :goto_0
    if-nez v2, :cond_0

    const-string/jumbo v0, "Existing COF folder not found, requesting."

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->findCofFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getInventoryEntries()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-static {v1, v8}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->findFolderWithType(Ljava/util/UUID;I)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    move v2, v4

    goto :goto_0
.end method

.method public HandleCloseCircuit()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->findCofFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->currentOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornAttachmentsPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornWearablesPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornItems()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornItemsRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->bakingThread:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->bakingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->bakingThread:Ljava/lang/Thread;

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->serverSideAppearanceUpdateTask:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->serverSideAppearanceUpdateTask:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_2
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCloseCircuit()V

    return-void
.end method

.method public OnMyAvatarCreated(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentVisualParams:[I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentVisualParams:[I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->ApplyAvatarVisualParams([I)V

    :cond_0
    return-void
.end method

.method public SendAgentWearablesRequest()V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesRequest$AgentData;->SessionID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public TakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->resolveLink(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object p1

    :cond_1
    if-eqz p1, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->TakeItemOff(Ljava/util/UUID;)V

    :cond_2
    return-void
.end method

.method public TakeItemOff(Ljava/util/UUID;)V
    .locals 9

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-static {v0}, Lcom/google/common/collect/HashBasedTable;->create(Lcom/google/common/collect/Table;)Lcom/google/common/collect/HashBasedTable;

    move-result-object v5

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->values()[Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v6

    array-length v7, v6

    move v2, v3

    move v1, v3

    :goto_0
    if-ge v2, v7, :cond_1

    aget-object v0, v6, v2

    invoke-virtual {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v8

    if-nez v8, :cond_0

    move v0, v1

    :goto_1
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-interface {v5, v0, p1}, Lcom/google/common/collect/Table;->remove(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->dispose()V

    invoke-interface {v5}, Lcom/google/common/collect/Table;->columnKeySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    if-eqz v1, :cond_2

    invoke-static {v5}, Lcom/google/common/collect/ImmutableTable;->copyOf(Lcom/google/common/collect/Table;)Lcom/google/common/collect/ImmutableTable;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornWearablesPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornItems()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendAgentIsNowWearing()V

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->ForceUpdateAppearance(Z)V

    :cond_2
    return-void

    :cond_3
    move v0, v1

    goto :goto_1
.end method

.method public UpdateMyAttachments()V
    .locals 4

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getAgentAvatar()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachedToUUID:Ljava/util/UUID;

    if-eqz v3, :cond_0

    iget-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachedToUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/util/NoSuchElementException;->printStackTrace()V

    :cond_1
    invoke-static {v1}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableMap;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "AvatarAppearance: attachments changed."

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornAttachmentsPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornItems()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public WearItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Z)V
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-direct {p0, v0, v1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->WearItemList(Lcom/lumiyaviewer/lumiya/orm/InventoryDB;Ljava/util/List;Z)Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendAgentIsNowWearing()V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->ForceUpdateAppearance(Z)V

    :cond_1
    return-void
.end method

.method public canDetachItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_1

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_0

    return v3

    :cond_0
    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canDetachItem(Ljava/util/UUID;)Z

    move-result v0

    return v0

    :cond_1
    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-eq v0, v1, :cond_2

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_3

    :cond_2
    return v3

    :cond_3
    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canDetachItem(Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_4

    return v2

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canDetachItem(Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_5

    return v2

    :cond_5
    return v3

    :cond_6
    return v2
.end method

.method public canDetachItem(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;)Z
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->getAttachedTo()I

    move-result v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->itemID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canDetachItem(ILjava/util/UUID;)Z

    move-result v0

    return v0
.end method

.method public canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v0

    return v0
.end method

.method public canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->whatIsItemWornOn(Lcom/google/common/collect/ImmutableMap;Lcom/google/common/collect/Table;Z)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    if-eqz v2, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public canWearItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z
    .locals 3

    const/4 v2, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->resolveLink(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object p1

    :cond_1
    if-nez p1, :cond_2

    return v2

    :cond_2
    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    and-int/lit16 v0, v0, 0xff

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getByCode(I)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canWearItem(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v0

    if-nez v0, :cond_3

    return v2

    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method public finishBaking(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V
    .locals 2

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->agentBakedTextures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendAvatarSetAppearance()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->bakeProcess:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;

    if-ne v0, p1, :cond_1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->bakeProcess:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;

    :cond_1
    return-void
.end method

.method public getAttachmentUUID(I)Ljava/util/UUID;
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getAgentAvatar()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachedToUUID:Ljava/util/UUID;

    if-eqz v2, :cond_0

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentID:I

    if-ne v2, p1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_1
    return-object v3
.end method

.method public hasWornWearable(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->wornWearables:Lcom/google/common/collect/Table;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Table;->containsRow(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isItemWorn(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->isItemWorn(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Z)Z

    move-result v0

    return v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_modules_SLAvatarAppearance_17963(ILjava/lang/String;)V
    .locals 9

    const/4 v8, 0x1

    const/4 v7, 0x0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    new-array v0, v8, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v4, "cof_version"

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;

    invoke-direct {v5, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;-><init>(I)V

    invoke-direct {v1, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    aput-object v1, v0, v7

    invoke-direct {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    const/4 v0, 0x3

    move v1, v0

    :goto_0
    if-lez v1, :cond_1

    :try_start_0
    invoke-virtual {v2, p2, v3}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v4, "error"

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string/jumbo v4, "error"

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->isString()Z

    move-result v4

    if-eqz v4, :cond_2

    const-string/jumbo v4, "AvatarAppearance: server-side error: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v0

    const/4 v6, 0x0

    aput-object v0, v5, v6

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    :goto_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->lastCofUpdateError:Z

    :cond_1
    :goto_2
    return-void

    :cond_2
    const-string/jumbo v0, "AvatarAppearance: server-side update ok."

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string/jumbo v4, "AvatarAppearance: server-side update error: [exception %s]"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v7

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v8, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->lastCofUpdateError:Z

    add-int/lit8 v0, v1, -0x1

    const-wide/16 v4, 0x3e8

    :try_start_1
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    move v1, v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_2
.end method

.method public onWearableStatusChanged(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->updateIfWearablesReady()V

    return-void
.end method
