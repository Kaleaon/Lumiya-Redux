.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$1;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$2;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$3;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$4;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$5;
    }
.end annotation

.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# static fields
.field public static final AVATAR_AGEVERIFIED:I = 0x20

.field public static final AVATAR_ALLOW_PUBLISH:I = 0x1

.field public static final AVATAR_IDENTIFIED:I = 0x4

.field public static final AVATAR_MATURE_PUBLISH:I = 0x2

.field public static final AVATAR_ONLINE:I = 0x10

.field public static final AVATAR_TRANSACTED:I = 0x8


# instance fields
.field private final agentDataUpdateRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private agentDataUpdateResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;",
            ">;"
        }
    .end annotation
.end field

.field private avatarGroupListsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;",
            ">;"
        }
    .end annotation
.end field

.field private final avatarNotesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private avatarNotesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;",
            ">;"
        }
    .end annotation
.end field

.field private final avatarPickInfosRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;",
            ">;"
        }
    .end annotation
.end field

.field private avatarPickInfosResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;",
            ">;"
        }
    .end annotation
.end field

.field private final avatarPicksRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private avatarPicksResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;",
            ">;"
        }
    .end annotation
.end field

.field private final avatarPropertiesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private avatarPropertiesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;",
            ">;"
        }
    .end annotation
.end field

.field private requestedNewGroupData:Z

.field private final setHomeLocationCap:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V
    .locals 8

    const-wide/16 v6, 0x3a98

    const/4 v5, 0x3

    const/4 v4, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->requestedNewGroupData:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$1;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)V

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPropertiesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$2;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)V

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentDataUpdateRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$3;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)V

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarNotesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$4;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$4;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)V

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPicksRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$5;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$5;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)V

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPickInfosRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->HomeLocation:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->setHomeLocationCap:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public DeletePick(Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete$Data;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete$Data;->PickID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$7;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$7;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public HandleAgentDataUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;)V
    .locals 2
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentDataUpdateResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentDataUpdateResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->AgentID:Ljava/util/UUID;

    invoke-interface {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleAgentGroupDataUpdate(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 3
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLEventQueueMessageHandler;
        eventName = .enum Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->AgentGroupDataUpdate:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;
    .end annotation

    :try_start_0
    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->toObject(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarGroupListsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarGroupListsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->avatarID:Ljava/util/UUID;

    invoke-interface {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->newGroupDataValid:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->requestedNewGroupData:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->requestedNewGroupData:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->requestAgentDataUpdate()V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public HandleAgentGroupDataUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate;)V
    .locals 3
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarGroupListsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarGroupListsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->avatarID:Ljava/util/UUID;

    invoke-interface {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleAvatarGroupsReply(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 3
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLEventQueueMessageHandler;
        eventName = .enum Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->AvatarGroupsReply:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;
    .end annotation

    :try_start_0
    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->toObject(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarGroupListsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;)V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->avatarID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarGroupListsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->avatarID:Ljava/util/UUID;

    invoke-interface {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;->printStackTrace()V

    goto :goto_0
.end method

.method public HandleAvatarGroupsReply(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;)V
    .locals 3
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;->AvatarID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarGroupListsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarGroupListsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->avatarID:Ljava/util/UUID;

    invoke-interface {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleAvatarNotesReply(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;)V
    .locals 2
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarNotesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarNotesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;->TargetID:Ljava/util/UUID;

    invoke-interface {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleAvatarPicksReply(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;)V
    .locals 2
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPicksResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPicksResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply$AgentData;->TargetID:Ljava/util/UUID;

    invoke-interface {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleAvatarPropertiesReply(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;)V
    .locals 2
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPropertiesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPropertiesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;->AvatarID:Ljava/util/UUID;

    invoke-interface {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleCircuitReady()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarProperties()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPropertiesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPropertiesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarNotes()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarNotesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarNotesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarPicks()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPicksRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPicksResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarPickInfos()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPickInfosRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPickInfosResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarGroupLists()Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPropertiesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarGroupListsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAgentDataUpdates()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentDataUpdateRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentDataUpdateResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    :cond_0
    return-void
.end method

.method public HandleCloseCircuit()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarProperties()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPropertiesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarNotes()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarNotesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarPicks()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPicksRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarPickInfos()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPickInfosRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    :cond_0
    return-void
.end method

.method public HandlePickInfoReply(Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;)V
    .locals 4
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPickInfosResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarPickInfosResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->CreatorID:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PickID:Ljava/util/UUID;

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;-><init>(Ljava/util/UUID;Ljava/util/UUID;)V

    invoke-interface {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public SaveUserNotes(Ljava/util/UUID;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate$Data;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate$Data;->TargetID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate$Data;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate$Data;->Notes:[B

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarNotesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;->Notes:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;->TargetID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->avatarNotesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v1, p1, v0}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public SetHomeLocation()Z
    .locals 13

    const/4 v12, 0x1

    const/4 v11, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->setHomeLocationCap:Ljava/lang/String;

    if-nez v0, :cond_0

    return v11

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentPosition()Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentHeading()F

    move-result v1

    float-to-double v2, v1

    const-wide v4, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v2, v4

    const-wide v4, 0x4066800000000000L    # 180.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    double-to-float v1, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    double-to-float v2, v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    new-array v2, v12, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v5, "HomeLocation"

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    const/4 v7, 0x3

    new-array v7, v7, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v9, "LocationId"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;

    invoke-direct {v10, v12}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;-><init>(I)V

    invoke-direct {v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    aput-object v8, v7, v11

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v9, "LocationPos"

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->toLLSD()Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-direct {v8, v9, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    aput-object v8, v7, v12

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v8, "LocationLookAt"

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->toLLSD()Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-direct {v0, v8, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v3, 0x2

    aput-object v0, v7, v3

    invoke-direct {v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    invoke-direct {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    aput-object v4, v2, v11

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->setHomeLocationCap:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string/jumbo v1, "SetHomeLocation: result %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v1, "success"

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBoolean()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    :cond_1
    return v11

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    return v11

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    return v11
.end method

.method public UpdateAvatarProperties(Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->ImageID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->FLImageID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    invoke-static {p3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->AboutText:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    invoke-static {p4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->FLAboutText:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iput-boolean p5, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->AllowPublish:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iput-boolean p6, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->MaturePublish:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    invoke-static {p7}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->ProfileURL:[B

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$6;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$6;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public UpdatePickInfo(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;IZ)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->PickID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->CreatorID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->TopPick:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iput-object p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->ParcelID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    invoke-static {p4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->Name:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    invoke-static {p5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->Desc:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iput-object p6, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->SnapshotID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iput-object p7, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iput p8, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->SortOrder:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iput-boolean p9, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->Enabled:Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$8;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$8;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;Ljava/util/UUID;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public requestAgentDataUpdate()V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;->SessionID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method
