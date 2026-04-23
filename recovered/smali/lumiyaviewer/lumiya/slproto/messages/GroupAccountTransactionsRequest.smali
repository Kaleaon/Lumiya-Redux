.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;

.field public MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x4c

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleGroupAccountTransactionsRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x65

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;->RequestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;->IntervalDays:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;->CurrentInterval:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;->RequestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;->IntervalDays:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest$MoneyData;->CurrentInterval:I

    return-void
.end method
