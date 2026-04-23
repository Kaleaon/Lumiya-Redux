.class public Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;
.super Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$ICapsEventHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$1;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-caps-SLCapEventQueue$CapsEventTypeSwitchesValues:[I

.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I


# instance fields
.field private agentNameSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

.field private agentPaused:Z

.field private final agentUUID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final agentUserName:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ">;"
        }
    .end annotation
.end field

.field private final caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

.field private final capsEventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;",
            ">;"
        }
    .end annotation
.end field

.field private doingObjectSelection:Z

.field private final eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

.field private final forceNeedObjectNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;"
        }
    .end annotation
.end field

.field private isEstateManager:Z

.field private lastObjectSelection:J

.field private lastPauseId:I

.field private lastVisibleActivities:J

.field private final localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

.field private final modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

.field private final objectNamesRequested:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final objectPropertiesRateLimiter:Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;

.field private pendingGroupMessages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;",
            ">;"
        }
    .end annotation
.end field

.field private regionHandle:J

.field private regionID:Ljava/util/UUID;

.field private regionName:Ljava/lang/String;

.field private final startedGroupSessions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private teleportRequestSent:Z

.field private final typingUsers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)Lcom/lumiyaviewer/lumiya/eventbus/EventBus;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-caps-SLCapEventQueue$CapsEventTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-com-lumiyaviewer-lumiya-slproto-caps-SLCapEventQueue$CapsEventTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-com-lumiyaviewer-lumiya-slproto-caps-SLCapEventQueue$CapsEventTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->values()[Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->AgentGroupDataUpdate:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_9

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->AvatarGroupsReply:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_8

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->BulkUpdateInventory:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_7

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ChatterBoxInvitation:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_6

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ChatterBoxSessionStartReply:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_5

    :goto_4
    :try_start_5
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->EstablishAgentCommunication:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_4

    :goto_5
    :try_start_6
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ParcelProperties:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_3

    :goto_6
    :try_start_7
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->TeleportFailed:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_2

    :goto_7
    :try_start_8
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->TeleportFinish:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_1

    :goto_8
    :try_start_9
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->UnknownCapsEvent:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_0

    :goto_9
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-com-lumiyaviewer-lumiya-slproto-caps-SLCapEventQueue$CapsEventTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_9

    :catch_1
    move-exception v1

    goto :goto_8

    :catch_2
    move-exception v1

    goto :goto_7

    :catch_3
    move-exception v1

    goto :goto_6

    :catch_4
    move-exception v1

    goto :goto_5

    :catch_5
    move-exception v1

    goto :goto_4

    :catch_6
    move-exception v1

    goto :goto_3

    :catch_7
    move-exception v1

    goto :goto_2

    :catch_8
    move-exception v1

    goto :goto_1

    :catch_9
    move-exception v1

    goto :goto_0
.end method

.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->values()[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

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

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendCompleteAgentMovement()V

    return-void
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->notifyObjectPropertiesChange()V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v6, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x0

    invoke-direct {p0, p1, p2, p3, p5}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->capsEventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->startedGroupSessions:Ljava/util/Set;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->pendingGroupMessages:Ljava/util/List;

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionID:Ljava/util/UUID;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionName:Ljava/lang/String;

    iput-wide v6, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionHandle:J

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->isEstateManager:Z

    iput-wide v6, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastObjectSelection:J

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->doingObjectSelection:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$1;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/eventbus/EventBus;J)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectPropertiesRateLimiter:Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectNamesRequested:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->forceNeedObjectNames:Ljava/util/Map;

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentPaused:Z

    iput-wide v6, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastVisibleActivities:J

    iput v5, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastPauseId:I

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUserName:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->typingUsers:Ljava/util/Set;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastVisibleActivities:J

    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz p4, :cond_1

    iget-boolean v0, p3, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isTemporary:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    invoke-direct {v0, p0, p4, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    :goto_0
    iget-boolean v0, p3, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isTemporary:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->setActiveAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    :cond_0
    if-eqz p5, :cond_2

    invoke-virtual {p5}, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->getPendingMessages()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V

    goto :goto_1

    :cond_1
    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    goto :goto_0

    :cond_2
    return-void
.end method

.method private DoAgentPause()V
    .locals 4

    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentPaused:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "AgentPause: Sending agentPause with ID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastPauseId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause$AgentData;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastPauseId:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause$AgentData;->SerialNum:I

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastPauseId:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastPauseId:I

    return-void
.end method

.method private DoAgentResume()V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentPaused:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "AgentPause: Sending agentResume with ID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastPauseId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume$AgentData;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastPauseId:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume$AgentData;->SerialNum:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastPauseId:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastPauseId:I

    return-void
.end method

.method private HandleCapsEvent(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;)V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-getcom-lumiyaviewer-lumiya-slproto-caps-SLCapEventQueue$CapsEventTypeSwitchesValues()[I

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventType:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventType:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventBody:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->DefaultEventQueueHandler(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventBody:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatterBoxInvitation(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventBody:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatterBoxSessionStartReply(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventBody:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleTeleportFailed(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventBody:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleTeleportFinish(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    goto :goto_0

    :pswitch_4
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventBody:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleEstablishAgentCommunication(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_4
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private HandleChatterBoxInvitation(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 8

    const/4 v1, 0x0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ChatterBoxInvitation: event = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    :try_start_1
    const-string/jumbo v0, "session_id"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getGroupManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->getAvatarGroupList()Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    move-result-object v4

    if-eqz v4, :cond_4

    iget-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->Groups:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, v3}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    :goto_1
    const-string/jumbo v2, "instantmessage"

    invoke-virtual {p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    const-string/jumbo v5, "message_params"

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    const-string/jumbo v2, "from_id"

    invoke-virtual {v5, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v2, "from_id"

    invoke-virtual {v5, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v2

    :goto_2
    const-string/jumbo v6, "to_id"

    invoke-virtual {v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v6

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v6

    const-string/jumbo v7, "message"

    invoke-virtual {v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v5

    if-eqz v0, :cond_0

    :goto_3
    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupID:Ljava/util/UUID;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    invoke-direct {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;-><init>(Ljava/util/UUID;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, v3, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_4
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    :cond_0
    if-eqz v4, :cond_1

    :try_start_2
    iget-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->Groups:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, v6}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    goto :goto_3

    :cond_1
    move-object v0, v1

    goto :goto_3

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ChatterBoxInvitation: chat from unknown group ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "), to_id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V
    :try_end_2
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_4

    :catch_1
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ChatterBoxInvitation: LLSDException "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;->printStackTrace()V

    goto :goto_4

    :cond_3
    move-object v2, v1

    goto/16 :goto_2

    :cond_4
    move-object v0, v1

    goto/16 :goto_1
.end method

.method private HandleChatterBoxSessionStartReply(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 5

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ChatterBoxSessionStartReply: event = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    const-string/jumbo v0, "session_id"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->onGroupSessionReady(Ljava/util/UUID;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->startedGroupSessions:Ljava/util/Set;

    monitor-enter v2
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->startedGroupSessions:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->pendingGroupMessages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    invoke-virtual {v4, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v2

    throw v0
    :try_end_3
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ChatterBoxSessionStartReply: LLSDException "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;->printStackTrace()V

    :goto_2
    return-void

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :cond_1
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_2
.end method

.method private HandleChatterOnlineStatus(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->isChatterActive(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatOnlineOfflineEvent;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    move-object v0, p1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;-><init>(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, v2, v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatOnlineOfflineEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Z)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    :cond_0
    return-void
.end method

.method private HandleEstablishAgentCommunication(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 8

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    if-eqz v0, :cond_0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "EstablishAgentCommunication: event = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    :try_start_1
    const-string/jumbo v0, "sim-ip-and-port"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "seed-capability"

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v1, "agent-id"

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v4

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    const/4 v3, 0x0

    aget-object v5, v2, v3

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    const/4 v2, 0x1

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;-><init>(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;ZZLjava/util/UUID;Ljava/lang/String;ILjava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->addTempCircuit(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :cond_0
    :goto_1
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private HandleGroupNotice(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V
    .locals 9

    const/4 v8, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    const/16 v2, 0x12

    if-ge v1, v2, :cond_0

    return-void

    :cond_0
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    const-string/jumbo v4, ""

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    new-array v4, v4, [B

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "HandleGroupNotice: group UUID = "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v6

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    const/16 v5, 0x7c

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-ltz v5, :cond_2

    invoke-virtual {v0, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v7, "\n"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_2
    if-eqz v2, :cond_3

    if-eqz v1, :cond_3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v5, "\n"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v5, "(This notice contains attached item \'"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v5, "\')"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_3
    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v5, p2, v7, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v6, v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    if-eqz v1, :cond_4

    xor-int/lit8 v0, v2, 0x1

    if-eqz v0, :cond_4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedByGroupNoticeEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v5

    move-object v1, p2

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedByGroupNoticeEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)V

    invoke-virtual {p0, v6, v0, v8}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    :cond_4
    return-void
.end method

.method private HandleIM(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V
    .locals 7

    const/16 v6, 0x14

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->onIncomingIM(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "HandleIM: unknown type = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", sessionId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "toAgentID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ToAgentID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "fromGroup = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-boolean v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromGroup:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "message = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto :goto_0

    :pswitch_2
    invoke-direct {p0, p2, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleTypingNotification(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Z)V

    goto :goto_0

    :pswitch_3
    invoke-direct {p0, p2, v4}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleTypingNotification(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Z)V

    goto :goto_0

    :pswitch_4
    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleGroupNotice(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V

    goto :goto_0

    :pswitch_5
    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleSessionIM(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V

    goto :goto_0

    :pswitch_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getDefaultChatter(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, p2, v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V

    invoke-virtual {p0, v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto :goto_0

    :pswitch_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;-><init>(Ljava/util/UUID;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, v2, v3, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V

    invoke-virtual {p0, v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto :goto_0

    :pswitch_8
    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    if-ne v1, v2, :cond_3

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v1

    if-eqz v0, :cond_3

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->autoAcceptTeleport(Ljava/util/UUID;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TeleportToLure(Ljava/util/UUID;)V

    goto :goto_0

    :cond_2
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLure(Ljava/util/UUID;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getDefaultChatter(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, p2, v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V

    invoke-virtual {p0, v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto/16 :goto_0

    :pswitch_9
    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    if-ne v1, v2, :cond_4

    if-eqz v0, :cond_4

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLure(Ljava/util/UUID;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getDefaultChatter(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, p2, v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V

    invoke-virtual {p0, v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto/16 :goto_0

    :pswitch_a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getDefaultChatter(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatFriendshipOfferedEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, p2, v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatFriendshipOfferedEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V

    invoke-virtual {p0, v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto/16 :goto_0

    :pswitch_b
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getDefaultChatter(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatFriendshipResultEvent;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v2, p2, v3, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatFriendshipResultEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V

    invoke-virtual {p0, v0, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    const/16 v0, 0x27

    if-ne v1, v0, :cond_1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    if-ne v0, v1, :cond_1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getFriendManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->addFriend(Ljava/util/UUID;)V

    const-string/jumbo v1, "requestonlinenotification"

    new-array v2, v5, [Ljava/lang/String;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendGenericMessage(Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_c
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getDefaultChatter(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, p2, v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V

    invoke-virtual {p0, v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto/16 :goto_0

    :pswitch_d
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v2, p2, v0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getDefaultChatter(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->isChatterActive(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Z

    move-result v3

    invoke-virtual {p0, v0, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->isChatterMuted(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Z

    move-result v2

    if-nez v2, :cond_1

    if-eq v1, v6, :cond_1

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    if-nez v1, :cond_1

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    array-length v1, v1

    if-eqz v1, :cond_1

    if-nez v3, :cond_1

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getAutoresponse()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v0, v1, v6}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendInstantMessage(Ljava/util/UUID;Ljava/lang/String;I)Z

    goto/16 :goto_0

    :pswitch_e
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getDefaultChatter(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, p2, v2, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_1
        :pswitch_1
        :pswitch_c
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_e
        :pswitch_d
        :pswitch_0
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_9
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_e
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_a
        :pswitch_b
        :pswitch_b
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private HandleSessionIM(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    const/4 v3, 0x0

    invoke-direct {v1, p2, v2, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    return-void
.end method

.method private HandleTeleportFailed(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 4

    const/4 v3, 0x0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "TeleportFailed: event = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    if-eqz v0, :cond_0

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;

    const-string/jumbo v2, "Teleport has failed."

    invoke-direct {v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;-><init>(ZLjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method private HandleTeleportFinish(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 8

    const/4 v2, 0x0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "TeleportFinish: event = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    if-eqz v0, :cond_0

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    :try_start_1
    const-string/jumbo v0, "Info"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    const-string/jumbo v1, "SeedCapability"

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v1, "SimIP"

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBinary()[B

    move-result-object v1

    const-string/jumbo v2, "%d.%d.%d.%d"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aget-byte v4, v1, v4

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v4, 0x1

    aget-byte v4, v1, v4

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const/4 v4, 0x2

    aget-byte v4, v1, v4

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    const/4 v4, 0x3

    aget-byte v1, v1, v4

    and-int/lit16 v1, v1, 0xff

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v4, 0x3

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v1, "SimPort"

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v6

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v4, v2, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentID:Ljava/util/UUID;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;-><init>(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;ZZLjava/util/UUID;Ljava/lang/String;ILjava/lang/String;)V

    const-string/jumbo v1, "new sim address: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simAddress:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setEnableAgentUpdates(Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->HandleTeleportFinish(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;)V
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    :catch_1
    move-exception v0

    const-string/jumbo v1, "TeleportFinish: LLSDException, teleport apparently failed"

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;->printStackTrace()V

    goto :goto_1

    :cond_0
    const-string/jumbo v0, "TeleportFinish: stale teleport finish?"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private HandleTypingNotification(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Z)V
    .locals 2

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eqz p2, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->typingUsers:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateUserTypingStatus(Ljava/util/UUID;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->typingUsers:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateUserTypingStatus(Ljava/util/UUID;)V

    goto :goto_0
.end method

.method private ProcessObjectSelection()V
    .locals 8

    const/16 v7, 0x10

    const/4 v0, 0x0

    const/4 v6, 0x1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getNeedObjectNames()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->doingObjectSelection:Z

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->forceNeedObjectNames:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-nez v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;-><init>()V

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$AgentData;->SessionID:Ljava/util/UUID;

    :cond_0
    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v3, v7, :cond_4

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-nez v1, :cond_2

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;-><init>()V

    iget-object v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$AgentData;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$AgentData;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$AgentData;->SessionID:Ljava/util/UUID;

    :cond_2
    iget-object v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-le v4, v7, :cond_5

    move-object v0, v1

    :goto_2
    monitor-exit v2

    if-eqz v0, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ObjectSelect: Sending ObjectSelect for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " objects, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " remains."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iput-boolean v6, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastObjectSelection:J

    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->doingObjectSelection:Z

    :cond_3
    return-void

    :cond_4
    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$ObjectData;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$ObjectData;-><init>()V

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$ObjectData;->ObjectLocalID:I

    iget-object v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v6, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameRequested:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameRequestedAt:J

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectNamesRequested:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v4

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    :cond_5
    :try_start_1
    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$ObjectData;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$ObjectData;-><init>()V

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect$ObjectData;->ObjectLocalID:I

    iget-object v5, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v4, 0x1

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameRequested:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameRequestedAt:J

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectNamesRequested:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v5

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_6
    move-object v0, v1

    goto/16 :goto_2
.end method

.method private ProcessObjectSelectionTimeout()V
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectNamesRequested:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v1, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->forceNeedObjectNames:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectNamesRequested:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method private SendAgentFOV()V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->circuitCode:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;->CircuitCode:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->FOVBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;

    const/4 v2, 0x0

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;->GenCounter:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->FOVBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;

    const v2, 0x40437a15

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;->VerticalAngle:F

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private SendCompleteAgentMovement()V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->circuitCode:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement$AgentData;->CircuitCode:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement$AgentData;->SessionID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private SendEstateOwnerMessage(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6

    const-wide/16 v4, 0x0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage;-><init>()V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$AgentData;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$AgentData;->TransactionID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$MethodData;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$MethodData;->Method:[B

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$MethodData;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$MethodData;->Invoice:Ljava/util/UUID;

    const/4 v0, 0x0

    array-length v2, p2

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p2, v0

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$ParamList;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$ParamList;-><init>()V

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage$ParamList;->Parameter:[B

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage;->ParamList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private SendGroupSessionStart(Ljava/util/UUID;)V
    .locals 8

    const-wide/16 v6, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-boolean v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromGroup:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ToAgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ParentEstateID:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v6, v7, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->RegionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentPosition()Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const/16 v2, 0xf

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Timestamp:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const-string/jumbo v2, "todo"

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const-string/jumbo v2, ""

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-array v2, v4, [B

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private SendInstantMessage(Ljava/util/UUID;Ljava/lang/String;I)Z
    .locals 12

    const-wide/16 v4, 0x0

    const/4 v11, 0x1

    const/4 v10, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canSendIM(Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_0

    return v10

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-boolean v10, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromGroup:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ToAgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v10, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ParentEstateID:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->RegionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v10, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v6

    xor-long/2addr v4, v6

    invoke-virtual {p1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v6

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v8

    xor-long/2addr v6, v8

    invoke-direct {v2, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v10, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Timestamp:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const-string/jumbo v2, "todo"

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-array v2, v10, [B

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    iput-boolean v11, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    const/16 v0, 0x14

    if-eq p3, v0, :cond_1

    const/16 v0, 0x29

    if-eq p3, v0, :cond_1

    const/16 v0, 0x2a

    if-eq p3, v0, :cond_1

    const/16 v0, 0x1a

    if-ne p3, v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestedEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, p2, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestedEvent;-><init>(Ljava/lang/String;Ljava/util/UUID;)V

    invoke-virtual {p0, v0, v1, v10}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    :cond_1
    :goto_0
    return v11

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;-><init>(Ljava/util/UUID;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, v2, v3, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1, v10}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto :goto_0
.end method

.method private SendRetrieveInstantMessages()V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RetrieveInstantMessages;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RetrieveInstantMessages;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RetrieveInstantMessages;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RetrieveInstantMessages$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RetrieveInstantMessages$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RetrieveInstantMessages;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RetrieveInstantMessages$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RetrieveInstantMessages$AgentData;->SessionID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RetrieveInstantMessages;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private getActiveGroupID()Ljava/util/UUID;
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->groupManager:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->getActiveGroupID()Ljava/util/UUID;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method private getNeedObjectNames()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->forceNeedObjectNames:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->forceNeedObjectNames:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->isObjectSelectEnabled()Z

    move-result v0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isEventMuted(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)Z
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->muteList:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getSource()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    if-ne v2, v3, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->AGENT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->isMuted(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v4

    :cond_0
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Object:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    if-ne v2, v3, :cond_2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v2

    if-eqz v2, :cond_1

    sget-object v3, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->OBJECT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->isMuted(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;)Z

    move-result v2

    if-eqz v2, :cond_1

    return v4

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceName(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->isMutedByName(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v4

    :cond_2
    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v1, :cond_3

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->GROUP:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->isMuted(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v4

    :cond_3
    const/4 v0, 0x0

    return v0
.end method

.method private notifyObjectPropertiesChange()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestObjectListUpdate()V

    :cond_0
    return-void
.end method

.method private processMyAvatarUpdate(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->getAbsolutePosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->getObjectCoords()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(I)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setAgentPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public AcceptFriendship(Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getFriendManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->addFriend(Ljava/util/UUID;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship;-><init>()V

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->getCallingCardsFolderUUID()Ljava/util/UUID;

    move-result-object v0

    :cond_0
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship$FolderData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship$FolderData;-><init>()V

    if-nez v0, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    :cond_1
    iput-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship$FolderData;->FolderID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship;->FolderData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship;->TransactionBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship$TransactionBlock;

    iput-object p2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship$TransactionBlock;->TransactionID:Ljava/util/UUID;

    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public AcceptInventoryOffer(IZLjava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 8

    const-wide/16 v6, 0x0

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-boolean v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromGroup:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ToAgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ParentEstateID:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v6, v7, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->RegionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    if-eqz p2, :cond_0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    add-int/lit8 v2, p1, 0x1

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    :goto_0
    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Timestamp:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const-string/jumbo v2, "todo"

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const-string/jumbo v2, ""

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    if-eqz p5, :cond_1

    const/16 v1, 0x10

    new-array v1, v1, [B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p5}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {p5}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iput-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    :goto_1
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void

    :cond_0
    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    add-int/lit8 v2, p1, 0x2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    goto :goto_0

    :cond_1
    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-array v2, v4, [B

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    goto :goto_1
.end method

.method public AddFriend(Ljava/util/UUID;Ljava/lang/String;)V
    .locals 11

    const-wide/16 v4, 0x0

    const/4 v10, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-boolean v10, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromGroup:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ToAgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v10, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ParentEstateID:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->RegionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v10, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const/16 v2, 0x26

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v6

    xor-long/2addr v4, v6

    invoke-virtual {p1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v6

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-virtual {v3}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v8

    xor-long/2addr v6, v8

    invoke-direct {v2, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v10, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Timestamp:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const-string/jumbo v2, "todo"

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-array v2, v10, [B

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public BuyObject(IBI)V
    .locals 4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getActiveGroupID()Ljava/util/UUID;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy;-><init>()V

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$AgentData;

    if-eqz v0, :cond_0

    :goto_0
    iput-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$AgentData;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->rootFolder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$AgentData;->CategoryID:Ljava/util/UUID;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$ObjectData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$ObjectData;-><init>()V

    iput p1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$ObjectData;->ObjectLocalID:I

    iput p2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$ObjectData;->SaleType:I

    iput p3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy$ObjectData;->SalePrice:I

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    goto :goto_0
.end method

.method public CloseCircuit()V
    .locals 3

    const/4 v2, 0x0

    const-string/jumbo v0, "AgentCircuit: closing circuit."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->HandleCloseCircuit()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->clearActiveAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentNameSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentNameSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentNameSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_2
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->CloseCircuit()V

    return-void
.end method

.method public DerezObject(ILcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;)V
    .locals 7

    const/4 v6, 0x1

    const-wide/16 v4, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getActiveGroupID()Ljava/util/UUID;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;-><init>()V

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    if-eqz v0, :cond_0

    :goto_0
    iput-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->GroupID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/types/EDeRezDestination;->getCode()I

    move-result v2

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->Destination:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->DestinationID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    iput v6, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->PacketCount:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    const/4 v2, 0x0

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->PacketNumber:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->TransactionID:Ljava/util/UUID;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$ObjectData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$ObjectData;-><init>()V

    iput p1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$ObjectData;->ObjectLocalID:I

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v6, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void

    :cond_0
    new-instance v0, Ljava/util/UUID;

    invoke-direct {v0, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    goto :goto_0
.end method

.method public DoRequestPayPrice(Ljava/util/UUID;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getPayInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/events/SLObjectPayInfoEvent;

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/events/SLObjectPayInfoEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestPayPrice;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestPayPrice;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestPayPrice;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestPayPrice$ObjectData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestPayPrice$ObjectData;->ObjectID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestPayPrice;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    goto :goto_0
.end method

.method public GenerateChatMoneyEvent(Ljava/util/UUID;II)V
    .locals 7

    const/4 v3, 0x1

    if-eqz p1, :cond_1

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;-><init>(Ljava/util/UUID;)V

    :goto_0
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    move-object v6, v0

    :goto_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;ZII)V

    invoke-virtual {p0, v6, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->financialInfo:Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;

    invoke-virtual {v0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->RecordChatEvent(Ljava/util/UUID;II)V

    :cond_0
    return-void

    :cond_1
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-object v6, v0

    goto :goto_1
.end method

.method public HandleAgentMovementComplete(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;)V
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;->RegionHandle:J

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setAgentPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const-string/jumbo v0, "Got agentPosition: %s"

    new-array v1, v4, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentPosition()Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getImmutablePosition()Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendAgentFOV()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->SendAgentWearablesRequest()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendRetrieveInstantMessages()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setEnableAgentUpdates(Z)V

    return-void
.end method

.method public HandleAlertMessage(Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;)V
    .locals 4

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;->Message:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    return-void
.end method

.method public HandleAvatarAnimation(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->ApplyAvatarAnimation(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;)V

    :cond_0
    return-void
.end method

.method public HandleAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Got AvatarAppearance, ID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->Sender_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$Sender;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$Sender;->ID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " isTrial = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->Sender_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$Sender;

    iget-boolean v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$Sender;->IsTrial:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", our ID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->Sender_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$Sender;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$Sender;->ID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->HandleAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->ApplyAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)V

    :cond_1
    return-void
.end method

.method public HandleAvatarInterestsReply(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "got AvatarInterestsReply: wantToText = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->WantToText:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "got AvatarInterestsReply: skillText = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->SkillsText:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    return-void
.end method

.method public HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->isEventMuted(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    return-void
.end method

.method public HandleChatFromSimulator(Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;)V
    .locals 7

    const/4 v6, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->onIncomingChat(Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->SourceID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->FromName:[B

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->Message:[B

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->ChatType:I

    const/16 v5, 0x8

    if-ne v4, v5, :cond_1

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->SourceType:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_1

    const-string/jumbo v4, "#Firestorm LSL Bridge"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string/jumbo v4, "<bridgeURL>"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    return-void

    :cond_1
    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->SourceType:I

    if-ne v4, v6, :cond_2

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0, v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canRecvChat(Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_2

    return-void

    :cond_2
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->Audible:I

    if-eq v0, v6, :cond_3

    return-void

    :cond_3
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->ChatType:I

    const/4 v4, 0x6

    if-eq v0, v4, :cond_4

    const/4 v4, 0x4

    if-ne v0, v4, :cond_5

    :cond_4
    return-void

    :cond_5
    const/4 v4, 0x5

    if-eq v0, v4, :cond_4

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->SourceType:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v2

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1, v6}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    invoke-direct {v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;-><init>(Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v2, v4, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;

    invoke-direct {v5, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;-><init>(Ljava/util/UUID;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v4, v5, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public HandleImprovedInstantMessage(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V
    .locals 3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    const/16 v1, 0x13

    if-eq v0, v1, :cond_0

    const/16 v1, 0x1f

    if-ne v0, v1, :cond_2

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;-><init>(Ljava/util/UUID;Ljava/lang/String;)V

    :cond_1
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleIM(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V

    return-void

    :cond_2
    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v0

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v0

    goto :goto_0

    :cond_4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;-><init>(Ljava/util/UUID;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canRecvIM(Ljava/util/UUID;)Z

    move-result v1

    if-nez v1, :cond_1

    return-void
.end method

.method public HandleImprovedTerseObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;)V
    .locals 9

    const/4 v4, 0x0

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move-object v2, v3

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getLocalID(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;)I

    move-result v7

    iget-object v1, v5, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/UUID;

    if-eqz v1, :cond_7

    iget-object v8, v5, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v8, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ApplyTerseObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;)V

    instance-of v0, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v0

    :goto_1
    if-eqz v0, :cond_3

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->processMyAvatarUpdate(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V

    :cond_0
    :goto_2
    if-nez v1, :cond_6

    if-nez v2, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;-><init>()V

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$AgentData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$AgentData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$AgentData;->SessionID:Ljava/util/UUID;

    :cond_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$ObjectData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$ObjectData;-><init>()V

    iput v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$ObjectData;->CacheMissType:I

    iput v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$ObjectData;->ID:I

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v0, v2

    :goto_3
    move-object v2, v0

    goto :goto_0

    :cond_2
    move v0, v4

    goto :goto_1

    :cond_3
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isMyAttachment()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->processMyAttachmentUpdate(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    goto :goto_2

    :cond_4
    if-eqz v2, :cond_5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Handing cache miss for terse update: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " objects."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;->isReliable:Z

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :cond_5
    return-void

    :cond_6
    move-object v0, v2

    goto :goto_3

    :cond_7
    move-object v1, v3

    goto :goto_2
.end method

.method public HandleKillObject(Lcom/lumiyaviewer/lumiya/slproto/messages/KillObject;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    const/4 v0, 0x0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/KillObject;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KillObject$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KillObject$ObjectData;->ID:I

    invoke-virtual {v2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->killObject(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;I)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectPropertiesRateLimiter:Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->fire()V

    :cond_1
    return-void

    :cond_2
    move v0, v1

    goto :goto_1
.end method

.method public HandleLayerData(Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;)V
    .locals 2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->LayerID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerID;->Type:I

    const/16 v1, 0x4c

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->terrainData:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->LayerDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;->Data:[B

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->ProcessLayerData([B)V

    :cond_0
    return-void
.end method

.method public HandleLoadURL(Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;)V
    .locals 4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->ObjectID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->ObjectName:[B

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;-><init>(Ljava/util/UUID;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v2, v0, v3, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    return-void
.end method

.method public HandleObjectProperties(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties;)V
    .locals 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ObjectProperties: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " ObjectSelect replies. Reqd "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectNamesRequested:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " obj, remains "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " objects."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->objectNamesQueue:Ljava/util/Map;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;->ObjectID:Ljava/util/UUID;

    invoke-interface {v1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ApplyObjectProperties(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v3

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-virtual {v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestObjectProfileUpdate(I)V

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->forceNeedObjectNames:Ljava/util/Map;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;->ObjectID:Ljava/util/UUID;

    invoke-interface {v1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v1, :cond_1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ApplyObjectProperties(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v3

    iget v4, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-virtual {v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestObjectProfileUpdate(I)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getParentObject()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestTouchableChildrenUpdate(Ljava/util/UUID;)V

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectNamesRequested:Ljava/util/Map;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;->ObjectID:Ljava/util/UUID;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectNamesRequested:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->doingObjectSelection:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->ProcessObjectSelection()V

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectPropertiesRateLimiter:Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->fire()V

    return-void
.end method

.method public HandleObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;)V
    .locals 9

    const/4 v3, 0x0

    const/4 v5, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v2, v3

    move v4, v3

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PCode:I

    const/16 v8, 0x2f

    if-eq v1, v8, :cond_0

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PCode:I

    const/16 v8, 0x9

    if-ne v1, v8, :cond_3

    :cond_0
    iget-object v1, v6, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->FullID:Ljava/util/UUID;

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v1, :cond_4

    iget v4, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ApplyObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;)V

    invoke-virtual {v6, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->updateObjectParent(ILcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Z

    iget v0, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    if-eq v0, v4, :cond_1

    instance-of v0, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v0, :cond_1

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v0

    if-eqz v0, :cond_1

    move v2, v5

    :cond_1
    move v4, v5

    :cond_2
    :goto_1
    instance-of v0, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v0, :cond_6

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v0

    :goto_2
    if-eqz v0, :cond_7

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->processMyAvatarUpdate(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V

    move v0, v2

    move v1, v4

    :goto_3
    move v2, v0

    move v4, v1

    goto :goto_0

    :cond_3
    move v0, v2

    move v1, v4

    goto :goto_3

    :cond_4
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v8, v8, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {v1, v0, v8}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v1

    invoke-virtual {v6, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->addObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Z

    move-result v0

    if-eqz v0, :cond_5

    move v4, v5

    :cond_5
    instance-of v0, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "ObjectUpdate: got my avatar (normal)"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->setAgentAvatar(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->OnMyAvatarCreated(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V

    move v2, v5

    goto :goto_1

    :cond_6
    move v0, v3

    goto :goto_2

    :cond_7
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isMyAttachment()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->processMyAttachmentUpdate(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    move v0, v2

    move v1, v4

    goto :goto_3

    :cond_8
    if-eqz v2, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_9
    if-eqz v4, :cond_a

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->ProcessObjectSelection()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectPropertiesRateLimiter:Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->fire()V

    :cond_a
    return-void

    :cond_b
    move v0, v2

    move v1, v4

    goto :goto_3
.end method

.method public HandleObjectUpdateCached(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCached;)V
    .locals 5

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;-><init>()V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCached;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCached$ObjectData;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$ObjectData;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$ObjectData;-><init>()V

    const/4 v4, 0x0

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$ObjectData;->CacheMissType:I

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCached$ObjectData;->ID:I

    iput v0, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects$ObjectData;->ID:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public HandleObjectUpdateCompressed(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed;)V
    .locals 11

    const/4 v8, 0x0

    const/4 v6, 0x1

    const/4 v4, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v9, v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    move v3, v4

    move v5, v4

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed$ObjectData;

    :try_start_0
    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getLocalID(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed$ObjectData;)I

    move-result v2

    iget-object v7, v9, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->uuidsNearby:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/UUID;

    if-eqz v2, :cond_a

    iget-object v7, v9, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    :goto_1
    if-eqz v2, :cond_2

    iget v7, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ApplyObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed$ObjectData;)V

    invoke-virtual {v9, v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->updateObjectParent(ILcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Z

    iget v1, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    if-eq v1, v7, :cond_9

    move v1, v6

    :goto_2
    move v7, v1

    move v5, v6

    :goto_3
    instance-of v1, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v1, :cond_4

    move-object v0, v2

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-object v1, v0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v1

    :goto_4
    if-eqz v1, :cond_5

    if-eqz v7, :cond_0

    move v3, v6

    :cond_0
    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-direct {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->processMyAvatarUpdate(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;)V

    :cond_1
    :goto_5
    move v1, v3

    move v2, v5

    :goto_6
    move v3, v1

    move v5, v2

    goto :goto_0

    :cond_2
    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->create(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed$ObjectData;)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v2

    invoke-virtual {v9, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->addObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Z

    move-result v1

    if-eqz v1, :cond_3

    move v5, v6

    :cond_3
    move v7, v4

    goto :goto_3

    :cond_4
    move v1, v4

    goto :goto_4

    :cond_5
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isMyAttachment()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->processMyAttachmentUpdate(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/objects/UnsupportedObjectTypeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_5

    :catch_0
    move-exception v1

    move v1, v3

    move v2, v5

    goto :goto_6

    :catch_1
    move-exception v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move v1, v3

    move v2, v5

    goto :goto_6

    :cond_6
    if-eqz v5, :cond_7

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->ProcessObjectSelection()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectPropertiesRateLimiter:Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->fire()V

    :cond_7
    if-eqz v3, :cond_8

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_8
    return-void

    :cond_9
    move v1, v4

    goto :goto_2

    :cond_a
    move-object v2, v8

    goto :goto_1
.end method

.method public HandleOfflineNotification(Lcom/lumiyaviewer/lumiya/slproto/messages/OfflineNotification;)V
    .locals 3

    new-instance v1, Ljava/util/ArrayList;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/OfflineNotification;->AgentBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/OfflineNotification;->AgentBlock_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OfflineNotification$AgentBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OfflineNotification$AgentBlock;->AgentID:Ljava/util/UUID;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getFriendManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->setUsersOnline(Ljava/util/List;Z)V

    return-void
.end method

.method public HandleOnlineNotification(Lcom/lumiyaviewer/lumiya/slproto/messages/OnlineNotification;)V
    .locals 3

    new-instance v1, Ljava/util/ArrayList;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/OnlineNotification;->AgentBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/OnlineNotification;->AgentBlock_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OnlineNotification$AgentBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OnlineNotification$AgentBlock;->AgentID:Ljava/util/UUID;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getFriendManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->setUsersOnline(Ljava/util/List;Z)V

    return-void
.end method

.method public HandlePayPriceReply(Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply;)V
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->allObjectsNearby:Ljava/util/Map;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply$ObjectData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply$ObjectData;->ObjectID:Ljava/util/UUID;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_2

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply$ObjectData;

    iget v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply$ObjectData;->DefaultPayPrice:I

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply;->ButtonData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v4, v1, [I

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply;->ButtonData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v2, v1, :cond_0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply;->ButtonData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply$ButtonData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply$ButtonData;->PayButton:I

    aput v1, v4, v2

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_0

    :cond_0
    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->create(I[I)Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->setPayInfo(Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v1

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestObjectProfileUpdate(I)V

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/events/SLObjectPayInfoEvent;

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/events/SLObjectPayInfoEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public HandleRegionHandshake(Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isTemporary:Z

    if-nez v0, :cond_2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$RegionInfo;

    const/4 v2, 0x0

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$RegionInfo;->Flags:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->terrainData:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->ApplyRegionInfo(Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;)V

    :cond_0
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->SimName:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionName:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;->RegionID:Ljava/util/UUID;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;->RegionID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionID:Ljava/util/UUID;

    :cond_1
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->IsEstateManager:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->isEstateManager:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserNames()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$K1xWCpEh0d4XNuVVYxGUJwEFRxU;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$K1xWCpEh0d4XNuVVYxGUJwEFRxU;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentNameSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLRegionInfoChangedEvent;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/events/SLRegionInfoChangedEvent;-><init>()V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public HandleScriptDialog(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;)V
    .locals 7

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v0, 0x0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Buttons_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Buttons_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v4, v0, [Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Buttons_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v1, v2

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Buttons;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Buttons;->ButtonLabel:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v1

    aget-object v0, v4, v1

    const-string/jumbo v6, "!!llTextBox!!"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v2, v1

    move v0, v3

    move-object v1, v4

    :goto_1
    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v2, p1, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;Ljava/util/UUID;[Ljava/lang/String;)V

    invoke-virtual {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    :goto_2
    return-void

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-direct {v1, p1, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;Ljava/util/UUID;I)V

    invoke-virtual {p0, v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto :goto_2

    :cond_2
    move v0, v2

    move-object v1, v4

    goto :goto_1

    :cond_3
    move-object v1, v0

    move v0, v2

    goto :goto_1
.end method

.method public HandleSimulatorViewerTimeMessage(Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isTemporary:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->SunPhase:F

    const v1, 0x40c90fdb

    div-float/2addr v0, v1

    const/high16 v1, 0x3e800000    # 0.25f

    add-float/2addr v0, v1

    float-to-double v2, v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    sub-double v0, v2, v0

    double-to-float v0, v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->setSunHour(F)V

    :cond_0
    return-void
.end method

.method public HandleTeleportFailed(Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFailed;)V
    .locals 4

    const/4 v3, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "TeleportFailed: reason = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFailed;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFailed$Info;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFailed$Info;->Reason:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFailed;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFailed$Info;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFailed$Info;->Reason:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;

    invoke-direct {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;-><init>(ZLjava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    return-void
.end method

.method public HandleTeleportLocal(Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocal;)V
    .locals 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;-><init>(ZLjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    return-void
.end method

.method public HandleTeleportProgress(Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Teleport progress: flags = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;->TeleportFlags:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", progress = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;->Message:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    return-void
.end method

.method public HandleTeleportStart(Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportStart;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "TeleportStart: flags = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportStart;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportStart$Info;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportStart$Info;->TeleportFlags:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    return-void
.end method

.method public OfferInventoryItem(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$K1xWCpEh0d4XNuVVYxGUJwEFRxU$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$K1xWCpEh0d4XNuVVYxGUJwEFRxU$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public OfferTeleport(Ljava/util/UUID;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure$Info;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure$Info;->Message:[B

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure$TargetData;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure$TargetData;-><init>()V

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure$TargetData;->TargetID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure;->TargetData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public OnCapsEvent(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;)V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->capsEventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public ProcessIdle()V
    .locals 6

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->doingObjectSelection:Z

    if-eqz v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastObjectSelection:J

    const-wide/16 v4, 0x3a98

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->doingObjectSelection:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->ProcessObjectSelectionTimeout()V

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getNeedObjectNames()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->doingObjectSelection:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastObjectSelection:J

    const-wide/16 v4, 0x1f4

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->ProcessObjectSelection()V

    :cond_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentPaused:Z

    if-nez v0, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->hasVisibleActivities()Z

    move-result v2

    if-nez v2, :cond_4

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastVisibleActivities:J

    const-wide/16 v4, 0x2710

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->DoAgentPause()V

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectPropertiesRateLimiter:Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectPropertiesRateLimiter:Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->firePending()V

    :cond_3
    return-void

    :cond_4
    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastVisibleActivities:J

    goto :goto_0
.end method

.method public ProcessNetworkError()V
    .locals 3

    const/4 v2, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->ProcessNetworkError()V

    const-string/jumbo v0, "Network: Network error."

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setEnableAgentUpdates(Z)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isTemporary:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    const-string/jumbo v1, "Network connection lost."

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->processDisconnect(ZLjava/lang/String;)V

    :cond_1
    return-void
.end method

.method public ProcessTimeout()V
    .locals 3

    const/4 v2, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->ProcessTimeout()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setEnableAgentUpdates(Z)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isTemporary:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    const-string/jumbo v1, "Connection has timed out."

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->processDisconnect(ZLjava/lang/String;)V

    :cond_1
    return-void
.end method

.method public ProcessWakeup()V
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->ProcessWakeup()V

    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->capsEventQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleCapsEvent(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->ProcessIdle()V

    return-void
.end method

.method public RemoveFriend(Ljava/util/UUID;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->ExBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$ExBlock;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$ExBlock;->OtherID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getFriendManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->removeFriend(Ljava/util/UUID;)V

    return-void
.end method

.method RequestObjectName(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->objectNamesRequested:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->forceNeedObjectNames:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->forceNeedObjectNames:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TryWakeUp()V

    return-void
.end method

.method public RequestTeleport(Ljava/util/UUID;Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0x1a

    invoke-direct {p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendInstantMessage(Ljava/util/UUID;Ljava/lang/String;I)Z

    return-void
.end method

.method public RestartRegion(I)Z
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->isEstateManager:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "restart"

    new-array v1, v4, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendEstateOwnerMessage(Ljava/lang/String;[Ljava/lang/String;)V

    return v4

    :cond_0
    return v3
.end method

.method public RezObject(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 7

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v0, 0x0

    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfoSnapshot()Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->isGroupOwned()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getOwnerID()Ljava/util/UUID;

    move-result-object v2

    :goto_0
    if-eqz v2, :cond_2

    sget-object v3, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v3, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    :goto_1
    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getGroupManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->getAvatarGroupList()Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    move-result-object v2

    if-eqz v2, :cond_4

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->Groups:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2, v0}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :goto_2
    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    :cond_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;-><init>()V

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

    iput-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    sget-object v2, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->FromTaskID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iput v6, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->BypassRaycast:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentPosition()Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayStart:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayStart:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v3

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentHeading()F

    move-result v3

    const/high16 v4, 0x3fc00000    # 1.5f

    invoke-virtual {v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->getRotatedOffset(FF)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayEnd:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iput-boolean v6, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayEndIsIntersection:Z

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    sget-object v2, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayTargetID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iput-boolean v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RezSelected:Z

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iput-boolean v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RemoveItem:Z

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iput v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->ItemFlags:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->GroupMask:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->EveryoneMask:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->NextOwnerMask:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->FolderID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->CreatorID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->OwnerID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupUUID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->GroupID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->BaseMask:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->OwnerMask:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->GroupMask:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->EveryoneMask:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->NextOwnerMask:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isGroupOwned:Z

    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->GroupOwned:Z

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->TransactionID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Type:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->InvType:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Flags:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->saleType:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->SaleType:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->salePrice:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->SalePrice:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Name:[B

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Description:[B

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creationDate:I

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->CreationDate:I

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iput v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->CRC:I

    iput-boolean v6, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->isReliable:Z

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    const v2, 0x8000

    and-int/2addr v0, v2

    if-nez v0, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$9;

    invoke-direct {v2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$9;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Ljava/util/UUID;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    :cond_1
    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void

    :cond_2
    move-object v0, v2

    goto/16 :goto_1

    :cond_3
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getActiveGroupID()Ljava/util/UUID;

    move-result-object v0

    goto/16 :goto_2

    :cond_4
    move-object v0, v1

    goto/16 :goto_2

    :cond_5
    move-object v0, v2

    goto/16 :goto_1

    :cond_6
    move-object v2, v0

    goto/16 :goto_0
.end method

.method public SendChatMessage(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-getcom-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendLocalChatMessage(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendInstantMessage(Ljava/util/UUID;Ljava/lang/String;)Z

    goto :goto_0

    :pswitch_2
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendGroupInstantMessage(Ljava/util/UUID;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public SendGenericMessage(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6

    const-wide/16 v4, 0x0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage;-><init>()V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$AgentData;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$AgentData;->TransactionID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$MethodData;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$MethodData;->Method:[B

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$MethodData;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$MethodData;->Invoice:Ljava/util/UUID;

    const/4 v0, 0x0

    array-length v2, p2

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p2, v0

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$ParamList;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$ParamList;-><init>()V

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage$ParamList;->Parameter:[B

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage;->ParamList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public SendGroupInstantMessage(Ljava/util/UUID;Ljava/lang/String;)V
    .locals 8

    const-wide/16 v6, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-boolean v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromGroup:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ToAgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ParentEstateID:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v6, v7, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->RegionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentPosition()Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const/16 v2, 0x11

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Timestamp:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const-string/jumbo v2, "todo"

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-array v2, v4, [B

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->isReliable:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->startedGroupSessions:Ljava/util/Set;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->startedGroupSessions:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendGroupSessionStart(Ljava/util/UUID;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->pendingGroupMessages:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v1

    return-void

    :cond_0
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public SendInstantMessage(Ljava/util/UUID;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendInstantMessage(Ljava/util/UUID;Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public SendLocalChatMessage(Ljava/lang/String;)V
    .locals 5

    const/4 v3, 0x0

    const/4 v1, 0x1

    const-string/jumbo v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    move v2, v3

    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_0

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    if-ltz v2, :cond_1

    add-int/lit8 v0, v2, 0x1

    const/4 v4, 0x1

    :try_start_0
    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v0, v2, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0, v3, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->onSendLocalChat(ILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :cond_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;-><init>()V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Channel:I

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    iput v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Type:I

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Message:[B

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method SendLogoutRequest()V
    .locals 3

    const-string/jumbo v0, "Logout: Sending logout request."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setEnableAgentUpdates(Z)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest$AgentData;->SessionID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$7;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$7;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public SendScriptDialogReply(Ljava/util/UUID;IILjava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;->SessionID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->isReliable:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ObjectID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    iput p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ChatChannel:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    iput p3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ButtonIndex:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    invoke-static {p4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ButtonLabel:[B

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method SendUseCode()V
    .locals 5

    const/4 v4, 0x1

    const-string/jumbo v0, "Using circuitCode: %d"

    new-array v1, v4, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->circuitCode:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;->CircuitCode_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->circuitCode:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;->Code:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;->CircuitCode_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;->CircuitCode_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;->ID:Ljava/util/UUID;

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$2;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public StartGroupSessionForVoice(Ljava/util/UUID;)V
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->startedGroupSessions:Ljava/util/Set;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->startedGroupSessions:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendGroupSessionStart(Ljava/util/UUID;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    :cond_0
    monitor-exit v1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->onGroupSessionReady(Ljava/util/UUID;)V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public TeleportToGlobalPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 9

    const/4 v8, 0x1

    const/high16 v5, 0x43800000    # 256.0f

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v1, v2

    rem-int/lit16 v2, v0, 0x100

    sub-int/2addr v0, v2

    rem-int/lit16 v2, v1, 0x100

    sub-int/2addr v1, v2

    int-to-long v2, v0

    const/16 v0, 0x20

    shl-long/2addr v2, v0

    int-to-long v0, v1

    or-long/2addr v0, v2

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    rem-float/2addr v3, v5

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    rem-float/2addr v4, v5

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-direct {v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const/high16 v5, 0x3f800000    # 1.0f

    add-float/2addr v4, v5

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const-string/jumbo v4, "regionHandle = %s, globalPos = %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    aput-object p1, v5, v8

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v8, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;-><init>()V

    iget-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v6, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v6, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    iput-wide v0, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->RegionHandle:J

    iget-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    iput-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-boolean v8, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->isReliable:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$5;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$5;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    invoke-virtual {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public TeleportToLandmarkAsset(Ljava/util/UUID;)V
    .locals 4

    const/4 v3, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLandmark()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest$Info;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest$Info;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest$Info;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest$Info;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest$Info;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest$Info;->LandmarkID:Ljava/util/UUID;

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$3;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public TeleportToLocalPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Z
    .locals 5

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "Teleport: localPos = %s, regionHandle = %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionHandle:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionHandle:J

    iput-wide v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->RegionHandle:J

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const/high16 v3, 0x41200000    # 10.0f

    add-float/2addr v2, v3

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$8;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$8;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return v4

    :cond_0
    return v3
.end method

.method public TeleportToLure(Ljava/util/UUID;)V
    .locals 4

    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest$Info;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest$Info;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest$Info;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest$Info;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest$Info;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest$Info;->LureID:Ljava/util/UUID;

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$4;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$4;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public TeleportToRegion(JIII)V
    .locals 9

    const/4 v7, 0x1

    const/4 v6, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLocation()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "TeleportToRegion: regionHandle = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", pos = ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iput-boolean v7, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->teleportRequestSent:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    iput-wide p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->RegionHandle:J

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    int-to-float v3, p3

    int-to-float v4, p4

    int-to-float v5, p5

    invoke-direct {v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v2, v6, v3, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-boolean v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->isReliable:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$6;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$6;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public TouchObject(I)V
    .locals 4

    const/4 v3, 0x1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$ObjectData;

    iput p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$ObjectData;->LocalID:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$ObjectData;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$ObjectData;->GrabOffset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$ObjectData;

    iput p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$ObjectData;->LocalID:I

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public TouchObjectFace(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;IFFFFFFF)V
    .locals 6

    const-string/jumbo v0, "Touch: Object %d, face %d, pos (%f, %f, %f), uv (%f, %f)"

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x4

    aput-object v2, v1, v3

    invoke-static {p6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x5

    aput-object v2, v1, v3

    invoke-static {p7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x6

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$ObjectData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$ObjectData;->LocalID:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$ObjectData;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$ObjectData;->GrabOffset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$SurfaceInfo;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$SurfaceInfo;-><init>()V

    iput p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$SurfaceInfo;->FaceIndex:I

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, p3, p4, p5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$SurfaceInfo;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v3, 0x0

    invoke-direct {v2, p6, p7, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$SurfaceInfo;->UVCoord:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v3, 0x0

    invoke-direct {v2, p8, p9, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$SurfaceInfo;->STCoord:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$SurfaceInfo;->Normal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab$SurfaceInfo;->Binormal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;->SurfaceInfo_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$ObjectData;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$ObjectData;->LocalID:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public TryWakeUp()V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public UnpauseAgent()V
    .locals 2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->lastVisibleActivities:J

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentPaused:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->DoAgentResume()V

    :cond_0
    return-void
.end method

.method public getAgentGlobalPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;
    .locals 8
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const-wide v4, 0xffffffffL

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentPosition()Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v0

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionHandle:J

    const/16 v1, 0x20

    shr-long/2addr v2, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionHandle:J

    and-long/2addr v2, v4

    long-to-int v2, v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;-><init>()V

    int-to-double v4, v1

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    float-to-double v6, v1

    add-double/2addr v4, v6

    iput-wide v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->x:D

    int-to-double v4, v2

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    float-to-double v6, v1

    add-double/2addr v4, v6

    iput-wide v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->y:D

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    float-to-double v0, v0

    iput-wide v0, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->z:D

    return-object v3

    :cond_0
    return-object v1
.end method

.method public getAgentSLURL()Ljava/lang/String;
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->loginURL:Ljava/lang/String;

    const-string/jumbo v1, "https://login.agni.lindenlab.com/cgi-bin/login.cgi"

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentPosition()Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v0

    :try_start_0
    const-string/jumbo v1, "http://maps.secondlife.com/secondlife/%s/%d/%d/%d"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionName:Ljava/lang/String;

    const-string/jumbo v4, "UTF-8"

    invoke-static {v3, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    float-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v3, 0x3

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    return-object v5

    :cond_0
    return-object v5
.end method

.method public getAgentUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public getCaps()Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    return-object v0
.end method

.method public getIsEstateManager()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->isEstateManager:Z

    return v0
.end method

.method public getLocalChatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    return-object v0
.end method

.method public getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    return-object v0
.end method

.method public getObjectProfile(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getObjectInfo(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->create(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/base/Optional;->isPresent()Z

    move-result v2

    if-nez v2, :cond_0

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->RequestObjectName(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    :cond_0
    return-object v1

    :cond_1
    return-object v1
.end method

.method public getRegionName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->regionName:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    return-object v0
.end method

.method public isUserTyping(Ljava/util/UUID;)Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->typingUsers:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_SLAgentCircuit_14593(Lcom/lumiyaviewer/lumiya/dao/UserName;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUserName:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_SLAgentCircuit_77024(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;)V
    .locals 8

    const-wide/16 v6, 0x0

    const/4 v5, 0x0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->modules:Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->CollectGiveableItems(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;-><init>()V

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-boolean v5, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromGroup:Z

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput-object p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ToAgentID:Ljava/util/UUID;

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v5, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ParentEstateID:I

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v3, Ljava/util/UUID;

    invoke-direct {v3, v6, v7, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->RegionID:Ljava/util/UUID;

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v5, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const/4 v3, 0x4

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iput v5, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Timestamp:I

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const-string/jumbo v3, "todo"

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x11

    new-array v1, v1, [B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v1, :cond_1

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    :goto_1
    int-to-byte v1, v1

    invoke-virtual {v3, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    invoke-virtual {v3, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto :goto_0

    :cond_1
    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    goto :goto_1

    :cond_2
    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    const/4 v0, 0x1

    iput-boolean v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->isReliable:Z

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    invoke-static {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedByYouEvent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->agentUUID:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedByYouEvent;-><init>(Ljava/util/UUID;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    return-void
.end method

.method processMyAttachmentUpdate(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameKnown:Z

    if-nez v0, :cond_0

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->RequestObjectName(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->UpdateMyAttachments()V

    return-void
.end method

.method public sendTypingNotify(Ljava/util/UUID;Z)V
    .locals 2

    const-string/jumbo v1, ""

    if-eqz p2, :cond_0

    const/16 v0, 0x29

    :goto_0
    invoke-direct {p0, p1, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendInstantMessage(Ljava/util/UUID;Ljava/lang/String;I)Z

    return-void

    :cond_0
    const/16 v0, 0x2a

    goto :goto_0
.end method
