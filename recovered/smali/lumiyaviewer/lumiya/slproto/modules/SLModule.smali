.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;
.super Ljava/lang/Object;


# instance fields
.field protected agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

.field protected circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

.field protected final eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

.field protected gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->RegisterMessageHandler(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public HandleCircuitReady()V
    .locals 0

    return-void
.end method

.method public HandleCloseCircuit()V
    .locals 0

    return-void
.end method

.method public HandleGlobalOptionsChange()V
    .locals 0

    return-void
.end method

.method public SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public getCircuitInfo()Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    return-object v0
.end method
