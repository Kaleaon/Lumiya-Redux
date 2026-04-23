.class public Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;

.field public MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Description:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2c

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleMoneyTransferRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x37

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->SourceID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->DestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Flags:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Amount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->AggregatePermNextOwner:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->AggregatePermInventory:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->TransactionType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->SourceID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->DestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Amount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->AggregatePermNextOwner:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->AggregatePermInventory:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->TransactionType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Description:[B

    return-void
.end method
