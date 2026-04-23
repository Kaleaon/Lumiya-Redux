.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ButtonLabel:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x19

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleScriptDialogReply(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x41

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ChatChannel:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ButtonIndex:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ButtonLabel:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ObjectID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ChatChannel:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ButtonIndex:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply$Data;->ButtonLabel:[B

    return-void
.end method
