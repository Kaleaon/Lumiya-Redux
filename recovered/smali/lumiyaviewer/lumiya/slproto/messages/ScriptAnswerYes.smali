.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x48

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleScriptAnswerYes(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x7c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;->TaskID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;->Questions:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;->TaskID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;->ItemID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes$Data;->Questions:I

    return-void
.end method
