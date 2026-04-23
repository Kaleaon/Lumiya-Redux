.class public Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x32

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->Desc:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x18

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandlePickInfoUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x47

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->PickID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->CreatorID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->TopPick:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->ParcelID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->Name:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->Desc:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->SnapshotID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packLLVector3d(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->SortOrder:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->Enabled:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->PickID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->CreatorID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->TopPick:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->ParcelID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->Desc:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->SnapshotID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackLLVector3d(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->SortOrder:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;->Enabled:Z

    return-void
.end method
