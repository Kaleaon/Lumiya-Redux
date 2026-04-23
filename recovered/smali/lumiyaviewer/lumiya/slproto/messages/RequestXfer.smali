.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;
    }
.end annotation


# instance fields
.field public XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->Filename:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x9

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRequestXfer(Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x64

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->ID:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->Filename:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->FilePath:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->DeleteOnCompletion:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->UseBigPackets:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->VFileID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->VFileType:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->packShort(Ljava/nio/ByteBuffer;S)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->ID:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->Filename:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->FilePath:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->DeleteOnCompletion:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->UseBigPackets:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->VFileID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer$XferID;->VFileType:I

    return-void
.end method
