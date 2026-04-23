.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;

.field public MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;

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

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleGroupAccountSummaryRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x61

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;->RequestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;->IntervalDays:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;->CurrentInterval:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;->RequestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;->IntervalDays:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;->CurrentInterval:I

    return-void
.end method
