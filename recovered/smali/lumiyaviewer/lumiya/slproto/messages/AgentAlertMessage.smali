.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AgentData;

.field public AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;->Message:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAgentAlertMessage(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x79

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;->Modal:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;->Message:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;->Modal:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage$AlertData;->Message:[B

    return-void
.end method
