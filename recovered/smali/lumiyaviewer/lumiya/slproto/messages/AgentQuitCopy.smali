.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$FuseBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;

.field public FuseBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$FuseBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$FuseBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$FuseBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->FuseBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$FuseBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x28

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAgentQuitCopy(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x55

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->FuseBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$FuseBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$FuseBlock;->ViewerCircuitCode:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->FuseBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$FuseBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy$FuseBlock;->ViewerCircuitCode:I

    return-void
.end method
