.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;
    }
.end annotation


# instance fields
.field public DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->SimName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x25

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleLogDwellTime(Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x12

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->Duration:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->SimName:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->RegionX:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->RegionY:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->AvgAgentsInView:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->AvgViewerFPS:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->packByte(Ljava/nio/ByteBuffer;B)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->Duration:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->SimName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->RegionX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->RegionY:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->AvgAgentsInView:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->DwellInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;->AvgViewerFPS:I

    return-void
.end method
