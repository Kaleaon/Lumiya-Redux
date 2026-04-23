.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# instance fields
.field private RLVEnabled:Z

.field private RLVEnablingCommand:Ljava/lang/String;

.field private RLVEnablingOffered:Z

.field private RLVEnablingUUID:Ljava/util/UUID;

.field private restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingOffered:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingCommand:Ljava/lang/String;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingUUID:Ljava/util/UUID;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getRLVEnabled()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    return-void
.end method

.method private handleRLVCommand(Ljava/util/UUID;Ljava/lang/String;)V
    .locals 4

    const/4 v3, 0x0

    const-string/jumbo v0, "RLV command: \'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, ""

    const-string/jumbo v1, ""

    const/16 v2, 0x3d

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_0

    add-int/lit8 v0, v2, 0x1

    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    :cond_0
    const/16 v2, 0x3a

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_1

    add-int/lit8 v1, v2, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    :cond_1
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->handleRLVCommandParsed(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private handleRLVCommandParsed(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const-string/jumbo v0, "RLV command: \'%s\' param \'%s\' option \'%s\'"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    aput-object p3, v1, v2

    const/4 v2, 0x2

    aput-object p4, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->getCommand(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;->getHandler()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommand;

    move-result-object v0

    if-eqz v0, :cond_0

    move-object v1, p0

    move-object v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-interface/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommand;->Handle(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private handleRLVCommands(Ljava/util/UUID;Ljava/lang/String;)V
    .locals 4

    const-string/jumbo v0, ","

    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v0, 0x0

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    invoke-direct {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->handleRLVCommand(Ljava/util/UUID;Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private offerRLVEnable(Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getLocalChatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/chat/SLEnableRLVOfferEvent;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLEnableRLVOfferEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;Ljava/util/UUID;)V

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    return-void
.end method


# virtual methods
.method public HandleGlobalOptionsChange()V
    .locals 5

    const/4 v4, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getRLVEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingOffered:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingCommand:Ljava/lang/String;

    if-eqz v1, :cond_0

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingOffered:Z

    const-string/jumbo v1, "Enabling accepted, original command: \'%s\'"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingCommand:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingUUID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingCommand:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->handleRLVCommands(Ljava/util/UUID;Ljava/lang/String;)V

    :cond_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    return-void
.end method

.method public autoAcceptTeleport(Ljava/util/UUID;)Z
    .locals 5

    const/4 v4, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->accepttp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    return v4
.end method

.method public canDetachItem(ILjava/util/UUID;)Z
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v0, 0x0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v1, :cond_0

    return v4

    :cond_0
    if-ltz p1, :cond_1

    const/16 v1, 0x38

    if-ge p1, v1, :cond_1

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    aget-object v1, v1, p1

    if-eqz v1, :cond_1

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->name:Ljava/lang/String;

    :cond_1
    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->detach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {v1, v2, v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_2

    return v3

    :cond_2
    return v4
.end method

.method public canRecvChat(Ljava/lang/String;Ljava/util/UUID;)Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    const-string/jumbo v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->recvchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {p2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canRecvIM(Ljava/util/UUID;)Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->recvim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canSendIM(Ljava/util/UUID;)Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sendim:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canShowInventory()Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->showinv:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canSit()Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canStandUp()Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->unsit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->remoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canTeleportBySitting()Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sittp:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canTeleportToLandmark()Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->tplm:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canTeleportToLocation()Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->tploc:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canTeleportToLure(Ljava/util/UUID;)Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->tplure:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canViewNotecard()Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->viewnote:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public canWearItem(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z
    .locals 5

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->addoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v4
.end method

.method public getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    return-object v0
.end method

.method public getRestrictions()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    return-object v0
.end method

.method public onIncomingChat(Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;)Z
    .locals 4

    const/4 v3, 0x1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->SourceType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->ChatType:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->Message:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->SourceID:Ljava/util/UUID;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-eqz v2, :cond_1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->handleRLVCommands(Ljava/util/UUID;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return v3

    :cond_1
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingOffered:Z

    if-nez v2, :cond_0

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingOffered:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingUUID:Ljava/util/UUID;

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnablingCommand:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->offerRLVEnable(Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public onIncomingIM(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)Z
    .locals 8

    const/4 v7, 0x1

    const/4 v6, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v6

    :cond_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "IM: type %d from \'%s\' text \'%s\'"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    aput-object v1, v4, v7

    const/4 v1, 0x2

    aput-object v2, v4, v1

    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    packed-switch v0, :pswitch_data_0

    :cond_1
    return v6

    :pswitch_0
    const-string/jumbo v0, "@version"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdVersion;->getManualVersionReply()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendInstantMessage(Ljava/util/UUID;Ljava/lang/String;)Z

    return v7

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onSendLocalChat(ILjava/lang/String;)Z
    .locals 8

    const/4 v7, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return v5

    :cond_0
    if-nez p1, :cond_2

    const-string/jumbo v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->redirchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->getTargetsForRestriction(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;)Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;-><init>()V

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    iput v0, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Channel:I

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    const/4 v3, 0x1

    iput v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Type:I

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Message:[B

    const/4 v0, 0x1

    iput-boolean v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->isReliable:Z

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sendchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v2, ""

    invoke-virtual {v0, v1, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_3

    return v6

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sendchannel:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_3

    return v6

    :cond_3
    return v5
.end method

.method public sayOnChannel(ILjava/lang/String;)V
    .locals 5

    const/4 v4, 0x1

    const-string/jumbo v0, "RLV reply (%d): \'%s\'"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    aput-object p2, v1, v4

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    iput p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Channel:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    iput v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Type:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Message:[B

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public teleportToGlobalPos(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 4

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->RLVEnabled:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->restrictions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->tploc:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;)Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TeleportToGlobalPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method
