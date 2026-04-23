.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# instance fields
.field private teleportTargetName:Ljava/lang/String;

.field private teleportTargetX:I

.field private teleportTargetY:I

.field private teleportTargetZ:I

.field private teleportToAgentUUID:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportToAgentUUID:Ljava/util/UUID;

    return-void
.end method


# virtual methods
.method public CancelPendingTeleports()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportToAgentUUID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetName:Ljava/lang/String;

    return-void
.end method

.method public HandleFindAgent(Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;)V
    .locals 13
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v12, 0x0

    const-wide/16 v8, 0x0

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportToAgentUUID:Ljava/util/UUID;

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;->Prey:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportToAgentUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "FindAgent: hunter %s prey %s"

    new-array v1, v11, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;->Hunter:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;->Prey:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v10

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->LocationBlock_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$LocationBlock;

    const-string/jumbo v2, "FindAgent: GlobalX %f GlobalY %f"

    new-array v3, v11, [Ljava/lang/Object;

    iget-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$LocationBlock;->GlobalX:D

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    aput-object v4, v3, v6

    iget-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$LocationBlock;->GlobalY:D

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    aput-object v0, v3, v10

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->LocationBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->LocationBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$LocationBlock;

    iget-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$LocationBlock;->GlobalX:D

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->LocationBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$LocationBlock;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$LocationBlock;->GlobalY:D

    cmpl-double v4, v2, v8

    if-nez v4, :cond_1

    cmpl-double v4, v0, v8

    if-eqz v4, :cond_2

    :cond_1
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v2, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    and-int/lit16 v4, v2, 0xff

    and-int/lit16 v5, v0, 0xff

    and-int/lit16 v1, v2, -0x100

    and-int/lit16 v0, v0, -0x100

    int-to-long v2, v1

    const/16 v1, 0x20

    shl-long/2addr v2, v1

    int-to-long v0, v0

    const-wide v8, 0xffffffffL

    and-long/2addr v0, v8

    or-long/2addr v2, v0

    const-string/jumbo v0, "Initiating teleport to regionHandle 0x%x x %d y %d"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v1, v6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v1, v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v1, v11

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual/range {v1 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TeleportToRegion(JIII)V

    :cond_2
    iput-object v12, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportToAgentUUID:Ljava/util/UUID;

    :cond_3
    return-void
.end method

.method public HandleMapBlockReply(Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockReply;)V
    .locals 14
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v1, 0x0

    const/4 v0, 0x0

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockReply;->Data_Fields:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    move v7, v0

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockReply$Data;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockReply$Data;->Name:[B

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockReply$Data;->X:I

    mul-int/lit16 v2, v2, 0x100

    int-to-long v2, v2

    const/16 v5, 0x20

    shl-long/2addr v2, v5

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockReply$Data;->Y:I

    mul-int/lit16 v5, v5, 0x100

    int-to-long v10, v5

    const-wide v12, 0xffffffffL

    and-long/2addr v10, v12

    or-long/2addr v2, v10

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetName:Ljava/lang/String;

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetName:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-wide/16 v10, 0x0

    cmp-long v5, v2, v10

    if-eqz v5, :cond_0

    const/4 v8, 0x1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "HandleMapBlockReply: regionName = \'"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v4, "\', X = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockReply$Data;->X:I

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v4, " Y = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockReply$Data;->Y:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetX:I

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetY:I

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetZ:I

    invoke-virtual/range {v1 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TeleportToRegion(JIII)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetName:Ljava/lang/String;

    move v0, v7

    move v1, v8

    :goto_1
    move v7, v0

    goto :goto_0

    :cond_0
    const/4 v7, 0x1

    move v0, v7

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetName:Ljava/lang/String;

    if-eqz v0, :cond_2

    if-eqz v7, :cond_2

    xor-int/lit8 v0, v1, 0x1

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetName:Ljava/lang/String;

    const-string/jumbo v0, "Destination region not found."

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;-><init>(ZLjava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_2
    return-void

    :cond_3
    move v0, v7

    goto :goto_1
.end method

.method public TeleportToAgent(Ljava/util/UUID;)Z
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLocation()Z

    move-result v0

    if-nez v0, :cond_0

    return v3

    :cond_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportToAgentUUID:Ljava/util/UUID;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;-><init>()V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;->Hunter:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;->Prey:Ljava/util/UUID;

    const/4 v0, 0x4

    :try_start_0
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;

    invoke-static {v0}, Ljava/net/Inet4Address;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v0

    check-cast v0, Ljava/net/Inet4Address;

    iput-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;->SpaceIP:Ljava/net/Inet4Address;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$LocationBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$LocationBlock;-><init>()V

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->LocationBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return v4

    :catch_0
    move-exception v0

    return v3

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public TeleportToRegionByName(Ljava/lang/String;III)Z
    .locals 4

    const/4 v3, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLocation()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetName:Ljava/lang/String;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetX:I

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetY:I

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->teleportTargetZ:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->NameData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;->Name:[B

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return v3
.end method
