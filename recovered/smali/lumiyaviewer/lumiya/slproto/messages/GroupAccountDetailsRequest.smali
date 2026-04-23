.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;

.field public MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;

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

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleGroupAccountDetailsRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x63

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;->RequestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;->IntervalDays:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;->CurrentInterval:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;->RequestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;->IntervalDays:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest$MoneyData;->CurrentInterval:I

    return-void
.end method
