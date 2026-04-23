.class public Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x44

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandlePickGodDelete(Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x45

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;->PickID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;->PickID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete$Data;->QueryID:Ljava/util/UUID;

    return-void
.end method
