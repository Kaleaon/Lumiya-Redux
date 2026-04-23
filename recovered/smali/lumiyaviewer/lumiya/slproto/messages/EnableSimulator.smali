.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;
    }
.end annotation


# instance fields
.field public SimulatorInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->SimulatorInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x12

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleEnableSimulator(Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x69

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->SimulatorInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;->Handle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->SimulatorInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;->IP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->SimulatorInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;->Port:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->packShort(Ljava/nio/ByteBuffer;S)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->SimulatorInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;->Handle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->SimulatorInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;->IP:Ljava/net/Inet4Address;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->SimulatorInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;->Port:I

    return-void
.end method
