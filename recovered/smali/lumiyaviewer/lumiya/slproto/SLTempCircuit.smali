.class public Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;
.super Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;


# instance fields
.field private pendingMessages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/SLMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;)V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->pendingMessages:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public DefaultMessageHandler(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->pendingMessages:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public ProcessNetworkError()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->removeTempCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;)V

    return-void
.end method

.method public ProcessTimeout()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->removeTempCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;)V

    return-void
.end method

.method public SendUseCode()V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;->CircuitCode_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->circuitCode:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;->Code:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;->CircuitCode_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;->CircuitCode_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode$CircuitCode;->ID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public getPendingMessages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/SLMessage;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLTempCircuit;->pendingMessages:Ljava/util/List;

    return-object v0
.end method
