.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;
    }
.end annotation


# instance fields
.field public ImageData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;

.field public ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;->Data:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x13

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleImagePacket(Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;->ID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;->Packet:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;->Data:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;->ID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;->Packet:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;->Data:[B

    return-void
.end method
