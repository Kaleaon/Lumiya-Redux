.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

.field public FOVBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->FOVBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;

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

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAgentFOV(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x52

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;->CircuitCode:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->FOVBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;->GenCounter:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->FOVBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;->VerticalAngle:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->packFloat(Ljava/nio/ByteBuffer;F)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$AgentData;->CircuitCode:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->FOVBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;->GenCounter:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->FOVBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV$FOVBlock;->VerticalAngle:F

    return-void
.end method
