.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;
    }
.end annotation


# instance fields
.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

.field public RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x72

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRequestParcelTransfer(Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x24

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->TransactionTime:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->SourceID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->DestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->Flags:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->TransactionType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->Amount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->BillableArea:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->ActualArea:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->Final:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;->GridX:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;->GridY:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->TransactionTime:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->SourceID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->DestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->TransactionType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->Amount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->BillableArea:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->ActualArea:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;->Final:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;->RegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;->GridX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$RegionData;->GridY:I

    return-void
.end method
