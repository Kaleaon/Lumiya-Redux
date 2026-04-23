.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$TargetData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;

.field public TargetData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$TargetData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$TargetData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$TargetData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->TargetData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$TargetData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x34

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTrackAgent(Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x7e

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->TargetData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$TargetData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$TargetData;->PreyID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->TargetData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$TargetData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent$TargetData;->PreyID:Ljava/util/UUID;

    return-void
.end method
