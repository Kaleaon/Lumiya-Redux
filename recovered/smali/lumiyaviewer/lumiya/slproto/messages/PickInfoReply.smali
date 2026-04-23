.class public Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x32

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Desc:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->User:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->OriginalName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SimName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x18

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandlePickInfoReply(Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x48

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PickID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->CreatorID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->TopPick:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->ParcelID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Name:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Desc:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SnapshotID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->User:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->OriginalName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SimName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packLLVector3d(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SortOrder:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Enabled:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PickID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->CreatorID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->TopPick:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->ParcelID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Desc:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SnapshotID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->User:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->OriginalName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SimName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackLLVector3d(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SortOrder:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Enabled:Z

    return-void
.end method
