.class public Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$MoneyData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;

.field public MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$MoneyData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$MoneyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$MoneyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$MoneyData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x34

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleMoneyBalanceRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x39

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$MoneyData;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$MoneyData;->TransactionID:Ljava/util/UUID;

    return-void
.end method
