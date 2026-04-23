.class public Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;
    }
.end annotation


# instance fields
.field public MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->Description:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x58

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleMoneyTransferBackend(Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x38

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->TransactionTime:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->SourceID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->DestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->Flags:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->Amount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->AggregatePermNextOwner:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->AggregatePermInventory:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->TransactionType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->GridX:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->GridY:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->TransactionTime:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->SourceID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->DestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->Amount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->AggregatePermNextOwner:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->AggregatePermInventory:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->TransactionType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->RegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->GridX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->GridY:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend$MoneyData;->Description:[B

    return-void
.end method
