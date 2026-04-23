.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;
    }
.end annotation


# instance fields
.field public TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Data:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1e

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTransferPacket(Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->TransferID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->ChannelType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Packet:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Status:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Data:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->TransferID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->ChannelType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Packet:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Status:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->TransferData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket$TransferData;->Data:[B

    return-void
.end method
