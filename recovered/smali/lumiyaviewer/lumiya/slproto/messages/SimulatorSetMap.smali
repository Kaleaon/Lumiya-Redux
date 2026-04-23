.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;
    }
.end annotation


# instance fields
.field public MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x20

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSimulatorSetMap(Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;->Type:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;->MapImage:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;->MapImage:Ljava/util/UUID;

    return-void
.end method
