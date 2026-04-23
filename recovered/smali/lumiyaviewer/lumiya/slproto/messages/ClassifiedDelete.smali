.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$Data;

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

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleClassifiedDelete(Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x2e

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$Data;->ClassifiedID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete$Data;->ClassifiedID:Ljava/util/UUID;

    return-void
.end method
