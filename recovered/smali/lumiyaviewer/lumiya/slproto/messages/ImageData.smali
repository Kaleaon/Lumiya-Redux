.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;
    }
.end annotation


# instance fields
.field public ImageDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;

.field public ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;->Data:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x18

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleImageData(Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->ID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->Codec:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->Size:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->Packets:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;->Data:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->ID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->Codec:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->Size:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->Packets:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;->Data:[B

    return-void
.end method
