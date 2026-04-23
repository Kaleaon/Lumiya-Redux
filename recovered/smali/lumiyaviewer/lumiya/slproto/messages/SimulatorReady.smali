.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;
    }
.end annotation


# instance fields
.field public SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

.field public TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->SimName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0xd

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSimulatorReady(Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->SimName:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->SimAccess:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->RegionFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->EstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->ParentEstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;->HasTelehub:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;->TelehubPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->SimName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->SimAccess:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->RegionFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->RegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->EstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$SimulatorBlock;->ParentEstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;->HasTelehub:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady$TelehubBlock;->TelehubPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method
