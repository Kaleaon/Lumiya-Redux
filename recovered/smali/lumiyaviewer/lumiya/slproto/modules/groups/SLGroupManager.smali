.class public Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$1;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$2;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$3;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$4;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$5;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;
    }
.end annotation


# static fields
.field private static final RoleMemberChange_Add:I = 0x0

.field private static final RoleMemberChange_Remove:I = 0x1

.field private static final Role_Update_All:I = 0x3

.field private static final Role_Update_Create:I = 0x4

.field private static final Role_Update_Delete:I = 0x5


# instance fields
.field private volatile activeGroupID:Ljava/util/UUID;

.field private final groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

.field private final groupMemberDataURL:Ljava/lang/String;

.field private final groupMemberListHTTPRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final groupMemberListRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private groupMemberListResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final groupProfileRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private groupProfileResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;",
            ">;"
        }
    .end annotation
.end field

.field private final groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

.field private final groupRoleMemberListRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private groupRoleMemberListResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final groupRolesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private groupRolesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;",
            ">;"
        }
    .end annotation
.end field

.field private final groupTitlesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private groupTitlesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;",
            ">;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberDataURL:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberListResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->RequestGroupProfileData(Ljava/util/UUID;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->requestGroupTitles(Ljava/util/UUID;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 9

    const/4 v8, 0x0

    const-wide/16 v6, 0x3a98

    const/4 v5, 0x3

    const/4 v4, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->activeGroupID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$1;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)V

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupProfileRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$2;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)V

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupTitlesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$3;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)V

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRolesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$4;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$4;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)V

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRoleMemberListRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$5;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$5;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)V

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/react/AsyncLimitsRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;ZIJ)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberListRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;->getInstance()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;-><init>(Ljava/util/concurrent/ExecutorService;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberListHTTPRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getCaps()Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GroupMemberData:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberDataURL:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDaoSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getGroupMemberDao()Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDaoSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getGroupRoleMemberDao()Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    :goto_0
    return-void

    :cond_0
    iput-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    iput-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    goto :goto_0
.end method

.method private RequestGroupProfileData(Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest$GroupData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest$GroupData;->GroupID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private RequestRoleMemberChange(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;I)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;->GroupID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;-><init>()V

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;->RoleID:Ljava/util/UUID;

    iput-object p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;->MemberID:Ljava/util/UUID;

    iput p4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;->Change:I

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->RoleChange_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$8;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$8;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;Ljava/util/UUID;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private requestGroupTitles(Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest$AgentData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest$AgentData;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest$AgentData;->RequestID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method


# virtual methods
.method public AcceptGroupInvite(Ljava/util/UUID;Ljava/util/UUID;Z)V
    .locals 6

    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;-><init>()V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromGroup:Z

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ToAgentID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ParentEstateID:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->RegionID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    if-eqz p3, :cond_0

    const/16 v0, 0x23

    :goto_0
    iput v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Timestamp:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const-string/jumbo v2, "todo"

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const-string/jumbo v2, "todo"

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-array v2, v3, [B

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void

    :cond_0
    const/16 v0, 0x24

    goto :goto_0
.end method

.method public ActivateGroup(Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup$AgentData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup$AgentData;->GroupID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public AddMemberToRole(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->RequestRoleMemberChange(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;I)V

    return-void
.end method

.method public DeleteRole(Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;->GroupID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;-><init>()V

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->RoleID:Ljava/util/UUID;

    const-string/jumbo v2, ""

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->Name:[B

    const-string/jumbo v2, ""

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->Title:[B

    const-string/jumbo v2, ""

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->Description:[B

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->Powers:J

    const/4 v2, 0x5

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->UpdateType:I

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->RoleData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$11;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$11;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;Ljava/util/UUID;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public HandleCircuitReady()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCachedGroupProfiles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupProfileRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupProfileResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getGroupTitles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupTitlesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupTitlesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getGroupRoles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRolesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRolesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getGroupManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->getGroupMemberDataSetRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberDataURL:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberListRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    :goto_0
    invoke-interface {v1, v0}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberListResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getGroupManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->getGroupRoleMemberDataSetRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRoleMemberListRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRoleMemberListResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberListHTTPRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    goto :goto_0
.end method

.method public HandleCloseCircuit()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCachedGroupProfiles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupProfileRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getGroupTitles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupTitlesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getGroupRoles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRolesRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getGroupManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->getGroupMemberDataSetRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberListRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    :cond_0
    return-void
.end method

.method public HandleEjectGroupMemberReply(Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;)V
    .locals 2
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getGroupManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$GroupData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->requestRefreshMemberList(Ljava/util/UUID;)V

    return-void
.end method

.method public HandleGroupMembersReply(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;)V
    .locals 14
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v13, 0x1

    const/4 v12, 0x0

    const-string/jumbo v0, "GroupMember: got reply, %d members, memberCount %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->MemberData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v12

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->MemberCount:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v13

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->MemberData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->GroupID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->RequestID:Ljava/util/UUID;

    iget-object v3, v10, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->AgentID:Ljava/util/UUID;

    iget v4, v10, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->Contribution:I

    iget-object v5, v10, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->OnlineStatus:[B

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v5

    iget-wide v6, v10, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->AgentPowers:J

    iget-object v8, v10, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->Title:[B

    invoke-static {v8}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v8

    iget-boolean v9, v10, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->IsOwner:Z

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/dao/GroupMember;-><init>(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;ILjava/lang/String;JLjava/lang/String;Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;->insert(Ljava/lang/Object;)J

    const-string/jumbo v0, "GroupMember: userID = %s"

    new-array v1, v13, [Ljava/lang/Object;

    iget-object v2, v10, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->AgentID:Ljava/util/UUID;

    aput-object v2, v1, v12

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao$Properties;->GroupID:Lde/greenrobot/dao/Property;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v1

    new-array v2, v13, [Lde/greenrobot/dao/query/WhereCondition;

    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao$Properties;->RequestID:Lde/greenrobot/dao/Property;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->RequestID:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    aput-object v3, v2, v12

    invoke-virtual {v0, v1, v2}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->count()J

    move-result-wide v0

    const-string/jumbo v2, "GroupMemberList: count = %d"

    new-array v3, v13, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v12

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->MemberCount:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupMemberListResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->GroupID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->RequestID:Ljava/util/UUID;

    invoke-interface {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public HandleGroupProfileReply(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;)V
    .locals 2
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupProfileResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupProfileResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->GroupID:Ljava/util/UUID;

    invoke-interface {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleGroupRoleDataReply(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;)V
    .locals 2
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRolesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRolesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$GroupData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$GroupData;->GroupID:Ljava/util/UUID;

    invoke-interface {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleGroupRoleMembersReply(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;)V
    .locals 8
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v7, 0x1

    const/4 v6, 0x0

    const-string/jumbo v0, "GroupRoleMember: got reply, %d members, total pairs %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;->MemberData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v6

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;->TotalPairs:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v7

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;->MemberData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$MemberData;

    new-instance v2, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;->RequestID:Ljava/util/UUID;

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$MemberData;->RoleID:Ljava/util/UUID;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$MemberData;->MemberID:Ljava/util/UUID;

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;-><init>(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;->insert(Ljava/lang/Object;)J

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao$Properties;->GroupID:Lde/greenrobot/dao/Property;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;->GroupID:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v1

    new-array v2, v7, [Lde/greenrobot/dao/query/WhereCondition;

    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao$Properties;->RequestID:Lde/greenrobot/dao/Property;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;->RequestID:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->count()J

    move-result-wide v0

    const-string/jumbo v2, "GroupRoleMemberList: count = %d"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;->TotalPairs:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupRoleMemberListResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply$AgentData;->RequestID:Ljava/util/UUID;

    invoke-interface {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public HandleGroupTitlesReply(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;)V
    .locals 2
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupTitlesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->groupTitlesResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$AgentData;->GroupID:Ljava/util/UUID;

    invoke-interface {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public HandleJoinGroupReply(Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupReply;)V
    .locals 5
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v4, 0x1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;->SessionID:Ljava/util/UUID;

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLJoinLeaveGroupEvent;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupReply$GroupData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupReply$GroupData;->GroupID:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupReply$GroupData;

    iget-boolean v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupReply$GroupData;->Success:Z

    invoke-direct {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/events/SLJoinLeaveGroupEvent;-><init>(Ljava/util/UUID;ZZ)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    return-void
.end method

.method public HandleLeaveGroupReply(Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupReply;)V
    .locals 5
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;->SessionID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLJoinLeaveGroupEvent;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupReply$GroupData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupReply$GroupData;->GroupID:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupReply$GroupData;

    iget-boolean v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupReply$GroupData;->Success:Z

    const/4 v4, 0x0

    invoke-direct {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/events/SLJoinLeaveGroupEvent;-><init>(Ljava/util/UUID;ZZ)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    return-void
.end method

.method public RemoveMemberFromRole(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->RequestRoleMemberChange(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;I)V

    return-void
.end method

.method public RequestEjectFromGroup(Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest$GroupData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest$GroupData;->GroupID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest$EjectData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest$EjectData;-><init>()V

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest$EjectData;->EjecteeID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest;->EjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public RequestJoinGroup(Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest$GroupData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest$GroupData;->GroupID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public RequestLeaveGroup(Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest$GroupData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest$GroupData;->GroupID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public RequestMemberRoleChanges(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            "Ljava/util/Collection",
            "<",
            "Ljava/util/UUID;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Ljava/util/UUID;",
            ">;)V"
        }
    .end annotation

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-virtual {v0, p2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;-><init>()V

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$AgentData;->GroupID:Ljava/util/UUID;

    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    const-string/jumbo v4, "GroupRoleChange: groupID %s memberID %s add %s"

    new-array v5, v9, [Ljava/lang/Object;

    aput-object p1, v5, v7

    aput-object p2, v5, v6

    aput-object v0, v5, v8

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;-><init>()V

    iput-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;->RoleID:Ljava/util/UUID;

    iput-object p2, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;->MemberID:Ljava/util/UUID;

    iput v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;->Change:I

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->RoleChange_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-interface {p4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    const-string/jumbo v4, "GroupRoleChange: groupID %s memberID %s remove %s"

    new-array v5, v9, [Ljava/lang/Object;

    aput-object p1, v5, v7

    aput-object p2, v5, v6

    aput-object v0, v5, v8

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;-><init>()V

    iput-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;->RoleID:Ljava/util/UUID;

    iput-object p2, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;->MemberID:Ljava/util/UUID;

    iput v6, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges$RoleChange;->Change:I

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->RoleChange_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    iput-boolean v6, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->isReliable:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$9;

    invoke-direct {v0, p0, p1, v1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$9;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;Ljava/util/UUID;ZLjava/util/UUID;)V

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public SendGroupInvite(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 6

    const/4 v5, 0x1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest$GroupData;

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest$GroupData;->GroupID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest$InviteData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest$InviteData;-><init>()V

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest$InviteData;->InviteeID:Ljava/util/UUID;

    iput-object p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest$InviteData;->RoleID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest;->InviteData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationSentEvent;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    invoke-direct {v3, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;-><init>(Ljava/util/UUID;)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationSentEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;)V

    invoke-virtual {v0, v1, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    return-void
.end method

.method public SendGroupNotice(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 9

    const/4 v8, 0x1

    const/4 v7, 0x0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;-><init>()V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-boolean v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromGroup:Z

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ToAgentID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ParentEstateID:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    sget-object v2, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->RegionID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const/16 v2, 0x20

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    sget-object v2, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Timestamp:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const-string/jumbo v2, "todo"

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    if-eqz p4, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    const/4 v2, 0x2

    new-array v2, v2, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v4, "item_id"

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    iget-object v6, p4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-direct {v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-direct {v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    aput-object v3, v2, v7

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v4, "owner_id"

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    iget-object v6, p4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    invoke-direct {v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-direct {v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    aput-object v3, v2, v8

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    :try_start_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;->serializeToXML()Ljava/lang/String;

    move-result-object v0

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iput-boolean v8, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-array v2, v7, [B

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    goto :goto_0

    :cond_0
    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-array v2, v7, [B

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    goto :goto_0
.end method

.method public SetGroupContribution(Ljava/util/UUID;I)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;->GroupID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;

    iput p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;->Contribution:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$7;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$7;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public SetGroupOptions(Ljava/util/UUID;ZZ)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices$Data;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices$Data;->GroupID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices$Data;

    iput-boolean p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices$Data;->AcceptNotices:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices;->NewData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices$NewData;

    iput-boolean p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices$NewData;->ListInProfile:Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->requestAgentDataUpdate()V

    return-void
.end method

.method public SetGroupRole(Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate$AgentData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate$AgentData;

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate$AgentData;->TitleRoleID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->requestGroupTitles(Ljava/util/UUID;)V

    return-void
.end method

.method public SetRoleProperties(Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 4
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v3, 0x1

    const-string/jumbo v0, "GroupRole: setting role properties for role %s"

    new-array v1, v3, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;-><init>()V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$AgentData;->GroupID:Ljava/util/UUID;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;-><init>()V

    if-eqz p2, :cond_0

    move-object v0, p2

    :goto_0
    iput-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->RoleID:Ljava/util/UUID;

    invoke-static {p3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->Name:[B

    invoke-static {p4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->Title:[B

    invoke-static {p5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->Description:[B

    iput-wide p6, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->Powers:J

    if-eqz p2, :cond_1

    const/4 v0, 0x3

    :goto_1
    iput v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;->UpdateType:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->RoleData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->isReliable:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$10;

    invoke-direct {v0, p0, p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$10;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;Ljava/util/UUID;Ljava/util/UUID;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void

    :cond_0
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x4

    goto :goto_1
.end method

.method public getActiveGroupID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->activeGroupID:Ljava/util/UUID;

    return-object v0
.end method
