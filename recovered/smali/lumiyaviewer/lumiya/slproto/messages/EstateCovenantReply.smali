.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;
    }
.end annotation


# instance fields
.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;->EstateName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x15

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleEstateCovenantReply(Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x34

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;->CovenantID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;->CovenantTimestamp:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;->EstateName:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;->EstateOwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;->CovenantID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;->CovenantTimestamp:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;->EstateName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply$Data;->EstateOwnerID:Ljava/util/UUID;

    return-void
.end method
