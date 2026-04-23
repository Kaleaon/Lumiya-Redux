.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;
    }
.end annotation


# instance fields
.field public TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x18

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTransferAbort(Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x65

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;->TransferID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;->ChannelType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;->TransferID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->TransferInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort$TransferInfo;->ChannelType:I

    return-void
.end method
