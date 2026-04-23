.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;
    }
.end annotation


# instance fields
.field public TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x30

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSimulatorViewerTimeMessage(Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x6a

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->UsecSinceStart:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->SecPerDay:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->SecPerYear:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->SunDirection:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->SunPhase:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->SunAngVelocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->UsecSinceStart:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->SecPerDay:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->SecPerYear:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->SunDirection:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->SunPhase:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->TimeInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;->SunAngVelocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method
