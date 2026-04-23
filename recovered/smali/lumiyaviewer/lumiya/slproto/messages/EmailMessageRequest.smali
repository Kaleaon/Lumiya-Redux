.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;
    }
.end annotation


# instance fields
.field public DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;->FromAddress:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;->Subject:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleEmailMessageRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x4f

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;->FromAddress:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;->Subject:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;->ObjectID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;->FromAddress:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest$DataBlock;->Subject:[B

    return-void
.end method
