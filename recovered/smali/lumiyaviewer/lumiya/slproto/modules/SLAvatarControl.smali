.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$1;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;
    }
.end annotation


# static fields
.field private static final IDLE_AGENT_UPDATE_INTERVAL:I = 0x7d0

.field public static final MANUAL_FLY_SPEED:F = 1.0f

.field public static final MANUAL_MOVE_SPEED:F = 1.0f

.field public static final MANUAL_STRAFE_SPEED:F = 1.0f

.field public static final MANUAL_TURN_SPEED:F = 45.0f

.field private static final MIN_AGENT_UPDATE_INTERVAL:I = 0xc8

.field private static final animUUID_Falldown:Ljava/util/UUID;

.field private static final animUUID_Land:Ljava/util/UUID;

.field private static final animUUID_PreJump:Ljava/util/UUID;

.field private static final animUUID_Run:Ljava/util/UUID;

.field private static final animUUID_Softland:Ljava/util/UUID;

.field private static final animUUID_Stand:Ljava/util/UUID;

.field private static final animUUID_Standup:Ljava/util/UUID;

.field private static final animUUID_Walk:Ljava/util/UUID;


# instance fields
.field private volatile ActiveMotionMask:I

.field private volatile AgentMotionMask:I

.field private volatile AgentWantStand:Z

.field private volatile agentHeading:F

.field private final agentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

.field private final agentUpdateCameraCenter:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field private final agentUpdateScheduleLock:Ljava/lang/Object;

.field private volatile agentUpdateTask:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;

.field private final avatarStateRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            ">;"
        }
    .end annotation
.end field

.field private final cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

.field private final cammingLock:Ljava/lang/Object;

.field private volatile enableAgentUpdates:Z

.field private volatile initialAnimCount:I

.field private isCamming:Z

.field private volatile isFlying:Z

.field private isManualCamming:Z

.field private isTurning:Z

.field private lastTurnedAngle:F

.field private final myAvatarStateResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;",
            ">;"
        }
    .end annotation
.end field

.field private volatile needClearAnims:Z

.field private volatile needFastUpdates:I

.field private final parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

.field private final turningLock:Ljava/lang/Object;

.field private turningSpeed:F

.field private turningStartTime:J

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->enableAgentUpdates:Z

    return v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->myAvatarStateResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getMyAvatarState()Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendAgentUpdate(Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "7a4e87fe-de39-6fcb-6223-024b00893244"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_PreJump:Ljava/util/UUID;

    const-string/jumbo v0, "f4f00d6e-b9fe-9292-f4cb-0ae06ea58d57"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Softland:Ljava/util/UUID;

    const-string/jumbo v0, "666307d9-a860-572d-6fd4-c3ab8865c094"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Falldown:Ljava/util/UUID;

    const-string/jumbo v0, "7a17b059-12b2-41b1-570a-186368b6aa6f"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Land:Ljava/util/UUID;

    const-string/jumbo v0, "05ddbff8-aaa9-92a1-2b74-8fe77a29b445"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Run:Ljava/util/UUID;

    const-string/jumbo v0, "6ed24bd8-91aa-4b12-ccc7-c97c857ab4e0"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Walk:Ljava/util/UUID;

    const-string/jumbo v0, "2408fe9e-df1d-1d7d-f4ff-1384fa7b350f"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Stand:Ljava/util/UUID;

    const-string/jumbo v0, "3da1d753-028a-5446-24f3-9c9b856d9422"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Standup:Ljava/util/UUID;

    return-void
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 5

    const/4 v4, 0x0

    const/4 v0, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->enableAgentUpdates:Z

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentMotionMask:I

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ActiveMotionMask:I

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentWantStand:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needClearAnims:Z

    const/4 v0, 0x5

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->initialAnimCount:I

    const/16 v0, 0xa

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needFastUpdates:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isCamming:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isManualCamming:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->turningLock:Ljava/lang/Object;

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isTurning:Z

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->turningSpeed:F

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->turningStartTime:J

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->lastTurnedAngle:F

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isFlying:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentUpdateScheduleLock:Ljava/lang/Object;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->avatarStateRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentUpdateCameraCenter:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->avatarStateRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->myAvatarStateResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    :goto_0
    return-void

    :cond_0
    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->myAvatarStateResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    goto :goto_0
.end method

.method private SendAgentAnimation()V
    .locals 4

    const/4 v3, 0x1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;-><init>()V

    sget-object v2, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->AnimID:Ljava/util/UUID;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->StartAnim:Z

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;-><init>()V

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Stand:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->AnimID:Ljava/util/UUID;

    iput-boolean v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->StartAnim:Z

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private SendAgentUpdate(Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;)V
    .locals 11

    const v10, 0xc000

    const/4 v9, 0x1

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentUpdateCameraCenter:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentMotionMask:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ActiveMotionMask:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isCamming:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->getHeading()F

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F

    :cond_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F

    float-to-double v2, v1

    const-wide v4, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v2, v4

    const-wide v4, 0x4066800000000000L    # 180.0

    div-double/2addr v2, v4

    const-string/jumbo v1, "AgentUpdate: agent heading %.2f"

    new-array v4, v9, [Ljava/lang/Object;

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    double-to-float v1, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    double-to-float v2, v2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YZX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    invoke-static {v6, v6, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->mayaQ(FFFLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iput-object v3, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->BodyRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iput-object v3, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->HeadRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentUpdateCameraCenter:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->CameraCenter:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->is3DViewEnabled()Z

    move-result v3

    if-eqz v3, :cond_7

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4, v1, v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->CameraAtAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    neg-float v2, v2

    invoke-direct {v4, v2, v1, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->CameraLeftAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, v6, v6, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->CameraUpAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    :goto_0
    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->getDrawDistanceForUpdate()F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->Far:F

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needClearAnims:Z

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    or-int/2addr v2, v10

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    :cond_1
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->initialAnimCount:I

    if-lez v1, :cond_2

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    or-int/2addr v2, v10

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->initialAnimCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->initialAnimCount:I

    :cond_2
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentWantStand:Z

    if-eqz v1, :cond_8

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    const v3, 0x1c000

    or-int/2addr v2, v3

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    iput-boolean v7, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentWantStand:Z

    iput-boolean v9, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needClearAnims:Z

    const/16 v1, 0xa

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needFastUpdates:I

    :cond_3
    :goto_1
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isFlying:Z

    if-eqz v1, :cond_4

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    or-int/lit16 v2, v2, 0x2000

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    :cond_4
    iput-boolean v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needClearAnims:Z

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendAgentAnimation()V

    iput-boolean v7, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needClearAnims:Z

    :cond_5
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needFastUpdates:I

    if-lez v0, :cond_6

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needFastUpdates:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needFastUpdates:I

    :cond_6
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->rescheduleAgentUpdate()V

    return-void

    :cond_7
    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, v6, v6, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->CameraAtAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, v8, v6, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->CameraLeftAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, v6, v8, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->CameraUpAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    goto :goto_0

    :cond_8
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ActiveMotionMask:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_9

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    or-int/lit16 v2, v2, 0x401

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    :cond_9
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ActiveMotionMask:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_a

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    or-int/lit16 v2, v2, 0x402

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    :cond_a
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ActiveMotionMask:I

    and-int/lit8 v1, v1, 0x20

    if-eqz v1, :cond_b

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    or-int/lit16 v2, v2, 0x804

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    :cond_b
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ActiveMotionMask:I

    and-int/lit8 v1, v1, 0x40

    if-eqz v1, :cond_c

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    or-int/lit16 v2, v2, 0x808

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    :cond_c
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ActiveMotionMask:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_d

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    or-int/lit16 v2, v2, 0x1010

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    :cond_d
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ActiveMotionMask:I

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_3

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    or-int/lit16 v2, v2, 0x1020

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate$AgentData;->ControlFlags:I

    goto/16 :goto_1
.end method

.method private declared-synchronized getIsFlying()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isFlying:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private getMyAvatarState()Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;
    .locals 9
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getIsFlying()Z

    move-result v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getAgentAvatar()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->getParentObject()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v3

    if-eqz v3, :cond_2

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    move v4, v1

    :goto_0
    :try_start_0
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "#"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentID:I

    if-ltz v0, :cond_0

    const/16 v7, 0x38

    if-ge v0, v7, :cond_0

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    aget-object v0, v7, v0

    if-eqz v0, :cond_0

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->isHUD:Z
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_1
    move v2, v0

    move v1, v4

    move v0, v3

    :goto_2
    invoke-static {v1, v0, v5, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->create(ZIZZ)Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move v0, v3

    move v1, v4

    goto :goto_2

    :cond_1
    move v0, v2

    goto :goto_1

    :cond_2
    move v3, v2

    move v4, v2

    goto :goto_0

    :cond_3
    move v0, v2

    move v1, v2

    goto :goto_2
.end method

.method private processStopAvatarAnimations()V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v0, 0x0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;-><init>()V

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;-><init>()V

    sget-object v3, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->AnimID:Ljava/util/UUID;

    iput-boolean v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->StartAnim:Z

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v5, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;-><init>()V

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getAgentAvatar()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->getAvatarVisualState()Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarVisualState;->getRunningAnimations()Ljava/util/Set;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Stand:Ljava/util/UUID;

    invoke-virtual {v0, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;-><init>()V

    iput-object v0, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->AnimID:Ljava/util/UUID;

    iput-boolean v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->StartAnim:Z

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_3

    iput-boolean v5, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :cond_3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;-><init>()V

    sget-object v2, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->AnimID:Ljava/util/UUID;

    iput-boolean v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->StartAnim:Z

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private rescheduleAgentUpdate()V
    .locals 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->enableAgentUpdates:Z

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->isValid()Z

    move-result v2

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentMotionMask:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ActiveMotionMask:I

    if-ne v3, v4, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->needUpdateDrawDistance()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->is3DViewEnabled()Z

    move-result v2

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentWantStand:Z

    if-nez v2, :cond_0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needFastUpdates:I

    if-lez v2, :cond_3

    :cond_0
    :goto_0
    if-eqz v0, :cond_4

    const/16 v0, 0xc8

    :goto_1
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentMotionMask:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ActiveMotionMask:I

    if-ne v2, v3, :cond_1

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentWantStand:Z

    if-eqz v2, :cond_5

    :cond_1
    move v5, v1

    move v1, v0

    move v0, v5

    :goto_2
    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->scheduleAgentUpdate(II)V

    return-void

    :cond_2
    move v0, v1

    goto :goto_2

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    const/16 v0, 0x7d0

    goto :goto_1

    :cond_5
    move v1, v0

    goto :goto_2

    :cond_6
    move v0, v1

    goto :goto_2
.end method

.method private scheduleAgentUpdate(II)V
    .locals 7

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->getTimer()Ljava/util/Timer;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentUpdateScheduleLock:Ljava/lang/Object;

    monitor-enter v6

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentUpdateTask:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;->getScheduledInterval()I

    move-result v1

    :cond_0
    if-ne v1, p2, :cond_1

    if-ge p1, p2, :cond_3

    :cond_1
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;->cancel()Z

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentUpdateTask:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;

    :cond_2
    if-eqz p2, :cond_3

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p2, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;ILcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentUpdateTask:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentUpdateTask:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;

    int-to-long v2, p1

    int-to-long v4, p2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    monitor-exit v6

    :cond_4
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v6

    throw v0
.end method


# virtual methods
.method public ApplyAvatarAnimation(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;)V
    .locals 6

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;->AnimID:Ljava/util/UUID;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Own animation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", sequence ID = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;->AnimSequenceID:I

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_PreJump:Ljava/util/UUID;

    invoke-virtual {v3, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Land:Ljava/util/UUID;

    invoke-virtual {v3, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Softland:Ljava/util/UUID;

    invoke-virtual {v3, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->animUUID_Standup:Ljava/util/UUID;

    invoke-virtual {v3, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needClearAnims:Z

    :cond_1
    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_2
    monitor-exit p0

    invoke-static {v1}, Lcom/google/common/collect/ImmutableSet;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->runningAnimations()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_3
    return-void
.end method

.method DisableFastUpdates()V
    .locals 1

    const-string/jumbo v0, "AgentUpdate: Disabling fast updates."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->rescheduleAgentUpdate()V

    return-void
.end method

.method EnableFastUpdates()V
    .locals 1

    const-string/jumbo v0, "AgentUpdate: Enabling fast updates."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->rescheduleAgentUpdate()V

    return-void
.end method

.method public ForceSitOnObject(Ljava/util/UUID;)V
    .locals 3

    if-eqz p1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "AvatarSit: Attempting to sit on object "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->TargetObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;->TargetID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->TargetObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;->Offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :cond_0
    return-void
.end method

.method public declared-synchronized ForceStand()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentWantStand:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->rescheduleAgentUpdate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public HandleAvatarSitResponse(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;)V
    .locals 6
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const-wide/16 v4, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitObject;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitObject;->ID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    cmp-long v1, v2, v4

    if-eqz v1, :cond_1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "AvatarSit: Got sit response for object "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSit;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSit;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSit;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSit$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSit$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSit;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSit$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSit$AgentData;->SessionID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSit;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :goto_0
    return-void

    :cond_1
    const-string/jumbo v0, "AvatarSit: Got null sit response"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public HandleCloseCircuit()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->avatarStateRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    :cond_0
    invoke-direct {p0, v2, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->scheduleAgentUpdate(II)V

    return-void
.end method

.method public HandleScriptQuestion(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;)V
    .locals 6
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ScriptQuestion: ItemID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;->ItemID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", questions = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "%08x"

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;->Questions:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;Ljava/util/UUID;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->getQuestions()I

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getLocalChatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-virtual {v1, v2, v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    :cond_0
    return-void
.end method

.method public ScriptAnswerYes(Ljava/util/UUID;Ljava/util/UUID;I)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;->TaskID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;->ItemID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;

    iput p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;->Questions:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public SitOnObject(Ljava/util/UUID;)V
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canSit()Z

    move-result v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getImmutablePosition()Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    move-result-object v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getAbsolutePosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->getDistanceTo(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v0

    const-string/jumbo v1, "RLV: Distance to object for sitting: %f"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/high16 v1, 0x3fc00000    # 1.5f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportBySitting()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-nez v0, :cond_0

    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ForceSitOnObject(Ljava/util/UUID;)V

    :cond_1
    return-void
.end method

.method public declared-synchronized Stand()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canStandUp()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ForceStand()V
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

.method public StartAgentMotion(I)V
    .locals 3

    const/4 v1, 0x1

    const/4 v0, 0x0

    monitor-enter p0

    and-int/lit8 v2, p1, 0x8

    if-nez v2, :cond_0

    and-int/lit8 v2, p1, 0x10

    if-eqz v2, :cond_1

    :cond_0
    :try_start_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isFlying:Z

    if-nez v2, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isFlying:Z

    move v0, v1

    :cond_1
    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentMotionMask:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->rescheduleAgentUpdate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_2
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized StopAgentMotion()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentMotionMask:I

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentMotionMask:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needClearAnims:Z

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->rescheduleAgentUpdate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public StopAvatarAnimations()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->processStopAvatarAnimations()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needClearAnims:Z

    const/16 v0, 0xa

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->needFastUpdates:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentMotionMask:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->rescheduleAgentUpdate()V

    return-void
.end method

.method public getAgentAndCameraPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;)Z
    .locals 8
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getInterpolatedPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Z

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->turningLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isTurning:Z

    if-eqz v0, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->turningStartTime:J

    sub-long/2addr v4, v6

    long-to-float v0, v4

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v0, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->turningSpeed:F

    mul-float/2addr v3, v0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->lastTurnedAngle:F

    sub-float v0, v3, v0

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->lastTurnedAngle:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_1
    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isCamming:Z

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isManualCamming:Z

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_1

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->rotate(FF)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->setPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :goto_1
    monitor-exit v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->copyFrom(Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isFlinging()Z

    move-result v0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_1
    :try_start_2
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F

    add-float/2addr v0, v1

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method public getAgentHeading()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F

    return v0
.end method

.method public getAgentPosition()Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    return-object v0
.end method

.method public getIsManualCamming()Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isManualCamming:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public getVRCamera(Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;)V
    .locals 2
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getInterpolatedPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isManualCamming:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->setPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {p3, v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->getVRCamera(Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;)V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public playAnimation(Ljava/util/UUID;Z)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;-><init>()V

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->AnimID:Ljava/util/UUID;

    iput-boolean p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation$AnimationList;->StartAnim:Z

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public processCameraFling(FF)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->fling(FF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public processCameraRotate(FF)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->rotate(FF)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isCamming:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->getHeading()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public processCameraZoom(FFFFF)V
    .locals 7

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v6

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isCamming:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->zoom(FFFFF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v6

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v6

    throw v0
.end method

.method public setAgentHeading(F)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->setHeading(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->getHeading()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setAgentPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isCamming:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isManualCamming:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->setPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->updateSpatialVoicePosition()V

    :cond_2
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setCameraManualControl(Z)V
    .locals 4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isManualCamming:Z

    if-nez p1, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isCamming:Z

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isCamming:Z

    if-nez v0, :cond_1

    xor-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->setPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setEnableAgentUpdates(Z)V
    .locals 2

    const/4 v1, 0x0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->enableAgentUpdates:Z

    if-eqz p1, :cond_0

    const/16 v0, 0x3e8

    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->scheduleAgentUpdate(II)V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0, v1, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->scheduleAgentUpdate(II)V

    goto :goto_0
.end method

.method public startCameraManualControl(FFFF)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isCamming:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isManualCamming:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->startManualControl(FFFF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public startTurning(F)V
    .locals 4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->turningLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isTurning:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->turningSpeed:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isTurning:Z

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->turningSpeed:F

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->turningStartTime:J

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->lastTurnedAngle:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public stopCameraManualControl()V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->stopManualControl()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public stopCamming()V
    .locals 4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cammingLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isCamming:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isCamming:Z

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isManualCamming:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentHeading:F

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->setPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public stopFlying()V
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isFlying:Z

    if-eqz v2, :cond_1

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isFlying:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->AgentWantStand:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public stopTurning()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->turningLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->isTurning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
