.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;


# static fields
.field private static final DELIM_ANY:Ljava/lang/String; = " \t\n"

.field private static final DELIM_EOL:Ljava/lang/String; = "\n"


# instance fields
.field private final requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;",
            ">;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->RequestTaskInventory(I)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;)V

    invoke-direct {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->getTaskInventoryRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    :goto_0
    return-void

    :cond_0
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    goto :goto_0
.end method

.method private RequestTaskInventory(I)V
    .locals 5

    const/4 v4, 0x1

    const-string/jumbo v0, "taskID = %d"

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory$InventoryData;

    iput p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory$InventoryData;->LocalID:I

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private parseTaskInventory([B)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;
    .locals 6

    if-nez p1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;-><init>()V

    return-object v0

    :cond_0
    :try_start_0
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v0

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    const-string/jumbo v3, " \t\n"

    invoke-direct {v2, v1, v3}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->endOfString()Z

    move-result v1

    if-nez v1, :cond_3

    const-string/jumbo v1, " \t\n"

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v3, "TaskInventory: got token: \'%s\'"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v3, "inv_object"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string/jumbo v1, "\n"

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "{"

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v1, v3}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    :goto_1
    const-string/jumbo v1, "\n"

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v3, "}"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    :cond_2
    const-string/jumbo v3, "inv_item"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, "\n"

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getIntToken(Ljava/lang/String;)I

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parseString(Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;-><init>()V

    return-object v0

    :cond_3
    :try_start_1
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;-><init>(Ljava/util/Collection;)V
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v1
.end method


# virtual methods
.method public HandleCloseCircuit()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->getTaskInventoryRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCloseCircuit()V

    return-void
.end method

.method public HandleReplyTaskInventory(Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;)V
    .locals 6
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v3, 0x1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->Filename:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v0, "taskID = %s, serial = %d, filename = \'%s\'"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->TaskID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v2, v5

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->Serial:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v4, 0x2

    aput-object v1, v2, v4

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->xferManager:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_CACHE:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    iget-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->TaskID:Ljava/util/UUID;

    move-object v4, p0

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->RequestXfer(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;ZLcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->TaskID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getObjectLocalID(Ljava/util/UUID;)I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;-><init>()V

    invoke-interface {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onXferComplete(Ljava/lang/Object;Ljava/lang/String;[B)V
    .locals 5

    const/4 v3, 0x1

    const/4 v4, 0x0

    instance-of v0, p1, Ljava/util/UUID;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/util/UUID;

    const-string/jumbo v0, "onXferComplete with file = \'%s\', data length = %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p2, v1, v4

    array-length v2, p3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0, p3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->parseTaskInventory([B)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    move-result-object v0

    const-string/jumbo v1, "task inventory count = %d"

    new-array v2, v3, [Ljava/lang/Object;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getObjectLocalID(Ljava/util/UUID;)I

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v2, v1, v0}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
