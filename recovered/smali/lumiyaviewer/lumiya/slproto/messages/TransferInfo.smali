.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;
    }
.end annotation


# instance fields
.field public TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->Params:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x22

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTransferInfo(Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x66

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->TransferID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->ChannelType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->TargetType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->Status:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->Size:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->Params:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->TransferID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->ChannelType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->TargetType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->Status:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->Size:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->TransferInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo$TransferInfoData;->Params:[B

    return-void
.end method
