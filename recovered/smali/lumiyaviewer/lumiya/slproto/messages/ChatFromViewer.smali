.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

.field public ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Message:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleChatFromViewer(Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x50

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Message:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Channel:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Message:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer$ChatData;->Channel:I

    return-void
.end method
