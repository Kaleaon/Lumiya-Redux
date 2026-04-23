.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;
    }
.end annotation


# instance fields
.field public DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;->StringValue:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x36

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRpcScriptReplyInbound(Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x5f

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;->TaskID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;->ChannelID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;->IntValue:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;->StringValue:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;->TaskID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;->ItemID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;->ChannelID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;->IntValue:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound$DataBlock;->StringValue:[B

    return-void
.end method
