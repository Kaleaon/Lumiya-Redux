.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;
    }
.end annotation


# instance fields
.field public DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

.field public DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;->MediaURL:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaType:[B

    array-length v1, v1

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaDesc:[B

    array-length v2, v2

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x4

    add-int/lit8 v1, v1, 0x4

    add-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelMediaUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x5c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;->MediaURL:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;->MediaID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;->MediaAutoScale:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaType:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaDesc:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaWidth:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaHeight:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaLoop:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;->MediaURL:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;->MediaID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlock;->MediaAutoScale:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaType:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaDesc:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaWidth:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaHeight:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->DataBlockExtended_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate$DataBlockExtended;->MediaLoop:I

    return-void
.end method
