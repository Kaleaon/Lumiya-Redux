.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate$MapData;
    }
.end annotation


# instance fields
.field public MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate$MapData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate$MapData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate$MapData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate;->MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate$MapData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x8

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSimulatorMapUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate;->MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate$MapData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate$MapData;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate;->MapData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate$MapData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate$MapData;->Flags:I

    return-void
.end method
