.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;
    }
.end annotation


# instance fields
.field public TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x4e

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleLogFailedMoneyTransaction(Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x14

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->TransactionTime:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->TransactionType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->SourceID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->DestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->Flags:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->Amount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->SimulatorIP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->GridX:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->GridY:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->FailureType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->packByte(Ljava/nio/ByteBuffer;B)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->TransactionTime:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->TransactionType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->SourceID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->DestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->Amount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->SimulatorIP:Ljava/net/Inet4Address;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->GridX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->GridY:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;->FailureType:I

    return-void
.end method
