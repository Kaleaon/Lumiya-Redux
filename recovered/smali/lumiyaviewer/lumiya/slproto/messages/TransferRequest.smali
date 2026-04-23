.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;
    }
.end annotation


# instance fields
.field public TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->Params:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1e

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTransferRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x67

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->TransferID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->ChannelType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->SourceType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->Priority:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->Params:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->TransferID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->ChannelType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->SourceType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->Priority:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest$TransferInfo;->Params:[B

    return-void
.end method
