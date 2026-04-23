.class public Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;
.super Lcom/lumiyaviewer/lumiya/slproto/SLConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;,
        Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues:[I = null

.field private static final DEFAULT_SYSTEM_ACCOUNT:Ljava/lang/String; = "Second Life"

.field private static autoresponseEnabled:Z

.field private static autoresponseText:Ljava/lang/String;


# instance fields
.field private activeAgentUUID:Ljava/util/UUID;

.field private agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

.field private authParams:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;

.field public authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

.field public capEventQueue:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;

.field private connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

.field private final eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

.field private volatile firstConnect:Z

.field private volatile hadConnected:Z

.field private volatile isReconnecting:Z

.field private volatile loginThread:Ljava/lang/Thread;

.field private modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

.field public final parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

.field private volatile reconnectAttempts:I

.field private tempCircuits:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;",
            "Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;",
            ">;"
        }
    .end annotation
.end field

.field private userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

.field private volatile userWantsConnected:Z


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;)Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->authParams:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;

    return-object v0
.end method

.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->-com-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->-com-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->values()[Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connecting:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->-com-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->loginThread:Ljava/lang/Thread;

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->DoConnect(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;Ljava/lang/String;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-boolean v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->autoresponseEnabled:Z

    const-string/jumbo v0, ""

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->autoresponseText:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;-><init>()V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->firstConnect:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->userWantsConnected:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->hadConnected:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->isReconnecting:Z

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectAttempts:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->loginThread:Ljava/lang/Thread;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->tempCircuits:Ljava/util/Map;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    return-void
.end method

.method private DoConnect(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;Ljava/lang/String;)V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth;-><init>()V

    :try_start_0
    invoke-virtual {p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->withLocation(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth;->Login(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;)Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    iget-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->success:Z

    if-nez v1, :cond_0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->setConnectionState(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->message:Ljava/lang/String;

    invoke-direct {p0, v3, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectOrDrop(ZZLjava/lang/String;)V

    return-void

    :catch_0
    move-exception v0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->setConnectionState(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;)V

    const-string/jumbo v0, "Failed to connect to login server."

    invoke-direct {p0, v3, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectOrDrop(ZZLjava/lang/String;)V

    return-void

    :cond_0
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne v1, v2, :cond_1

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentID:Ljava/util/UUID;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->activeAgentUUID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->activeAgentUUID:Ljava/util/UUID;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getFriendManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->friends:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->updateFriendList(Lcom/google/common/collect/ImmutableList;)V

    :cond_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->reset(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->startCircuit(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized Reconnect()Z
    .locals 4

    const/4 v2, 0x0

    const/4 v3, 0x1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->userWantsConnected:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->hadConnected:Z

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getAutoReconnect()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectAttempts:I

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getMaxReconnectAttempts()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->authParams:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectAttempts:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectAttempts:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->isReconnecting:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLReconnectingEvent;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectAttempts:I

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLReconnectingEvent;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    const-string/jumbo v0, "last"

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->startConnecting(ZLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return v3

    :cond_1
    const/4 v0, 0x0

    :try_start_1
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->isReconnecting:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v2

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static getAutoresponse()Ljava/lang/String;
    .locals 1

    sget-boolean v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->autoresponseEnabled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->autoresponseText:Ljava/lang/String;

    return-object v0
.end method

.method private reconnectOrDrop(ZZLjava/lang/String;)V
    .locals 4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->Reconnect()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->activeAgentUUID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->activeAgentUUID:Ljava/util/UUID;

    invoke-static {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/GridConnectionManager;->removeConnection(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;)V

    :cond_0
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->activeAgentUUID:Ljava/util/UUID;

    const/4 v3, 0x0

    invoke-direct {v1, v3, p3, v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;-><init>(ZLjava/lang/String;Ljava/util/UUID;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLDisconnectEvent;

    invoke-direct {v1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/events/SLDisconnectEvent;-><init>(ZLjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static setAutoresponseInfo(ZLjava/lang/String;)V
    .locals 0

    sput-boolean p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->autoresponseEnabled:Z

    sput-object p1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->autoresponseText:Ljava/lang/String;

    return-void
.end method

.method private setConnectionState(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLConnectionStateChangedEvent;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/events/SLConnectionStateChangedEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private startCircuit(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;)V
    .locals 7

    const/4 v6, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "login reply: ip = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simAddress:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", port = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simPort:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", ccode = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->circuitCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->inventoryRoot:Ljava/util/UUID;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "inventory root: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->inventoryRoot:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :goto_0
    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->loginURL:Ljava/lang/String;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->seedCapability:Ljava/lang/String;

    invoke-virtual {v4, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->GetCapabilites(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    invoke-direct {v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;-><init>(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;)V

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-object v1, p0

    move-object v3, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    :try_start_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->EventQueueGet:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapabilityOrThrow(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$ICapsEventHandler;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->capEventQueue:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$NoSuchCapabilityException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->reset(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->textureFetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->setFetcher(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->AddCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendUseCode()V

    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->firstConnect:Z

    return-void

    :cond_0
    const-string/jumbo v0, "inventory root is null"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->setConnectionState(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;)V

    const-string/jumbo v0, "Failed to connect to the simulator."

    const/4 v1, 0x1

    invoke-direct {p0, v1, v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectOrDrop(ZZLjava/lang/String;)V

    return-void

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$NoSuchCapabilityException;->printStackTrace()V

    goto :goto_1
.end method

.method private startConnecting(ZLjava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;ZLjava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->loginThread:Ljava/lang/Thread;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connecting:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->setConnectionState(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->loginThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method


# virtual methods
.method public declared-synchronized CancelConnect()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->userWantsConnected:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->isReconnecting:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->hadConnected:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->closeConnectionObjects()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized Connect(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v0, v1, :cond_0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->authParams:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->userWantsConnected:Z

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectAttempts:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->isReconnecting:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->hadConnected:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->firstConnect:Z

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->startConnecting(ZLjava/lang/String;)V
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

.method public declared-synchronized Disconnect()V
    .locals 2

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->userWantsConnected:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->isReconnecting:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->hadConnected:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendLogoutRequest()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    const-string/jumbo v0, "Logged out"

    const/4 v1, 0x1

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->processDisconnect(ZLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized HandleTeleportFinish(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->CloseCircuit()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->capEventQueue:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->capEventQueue:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->stopQueue()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->capEventQueue:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;

    :cond_1
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->tempCircuits:Ljava/util/Map;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->startCircuit(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized addTempCircuit(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->tempCircuits:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    :try_start_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;-><init>(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;)V

    invoke-direct {v0, p0, v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->tempCircuits:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->AddCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->SendUseCode()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized closeConnectionObjects()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->loginThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->loginThread:Ljava/lang/Thread;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->CloseCircuit()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->capEventQueue:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->capEventQueue:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->stopQueue()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->capEventQueue:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;

    :cond_2
    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->setFetcher(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->tempCircuits:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->CloseCircuit()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->tempCircuits:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->setConnectionState(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void
.end method

.method public declared-synchronized forceDisconnect(Z)V
    .locals 2

    monitor-enter p0

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->userWantsConnected:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->isReconnecting:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->hadConnected:Z

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "GridConnection: forceDisconnect() called, fromLogoutRequest = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p1, :cond_1

    const-string/jumbo v0, "true"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->-getcom-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues()[I

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->ordinal()I

    move-result v1

    aget v0, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    packed-switch v0, :pswitch_data_0

    :goto_1
    :pswitch_0
    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    const-string/jumbo v0, "false"

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->closeConnectionObjects()V

    const-string/jumbo v0, "Network connection lost."

    const/4 v1, 0x1

    invoke-direct {p0, v1, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectOrDrop(ZZLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :pswitch_2
    :try_start_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->closeConnectionObjects()V

    const-string/jumbo v0, "Network connection lost."

    const/4 v1, 0x0

    invoke-direct {p0, v1, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectOrDrop(ZZLjava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getActiveAgentUUID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->activeAgentUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public getAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    return-object v0

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;-><init>()V

    throw v0
.end method

.method public declared-synchronized getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getIsReconnecting()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->isReconnecting:Z

    return v0
.end method

.method public declared-synchronized getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0
.end method

.method public getReconnectAttempt()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectAttempts:I

    return v0
.end method

.method public isFirstConnect()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->firstConnect:Z

    return v0
.end method

.method public declared-synchronized notifyLoginError(Ljava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->closeConnectionObjects()V

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectOrDrop(ZZLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized notifyLoginSuccess()V
    .locals 5

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->hadConnected:Z

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectAttempts:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->isReconnecting:Z

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->setConnectionState(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->activeAgentUUID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->activeAgentUUID:Ljava/util/UUID;

    invoke-static {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/GridConnectionManager;->setConnection(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->activeAgentUUID:Ljava/util/UUID;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;-><init>(ZLjava/lang/String;Ljava/util/UUID;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized processDisconnect(ZLjava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->connectionState:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->closeConnectionObjects()V

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->reconnectOrDrop(ZZLjava/lang/String;)V
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

.method declared-synchronized removeTempCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->tempCircuits:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->CloseCircuit()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void
.end method
