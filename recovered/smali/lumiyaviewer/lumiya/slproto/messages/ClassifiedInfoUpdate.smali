.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x15

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->Desc:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x18

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleClassifiedInfoUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x2d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->ClassifiedID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->Category:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->Name:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->Desc:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->ParcelID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->ParentEstate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->SnapshotID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packLLVector3d(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->ClassifiedFlags:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->PriceForListing:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->ClassifiedID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->Category:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->Desc:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->ParcelID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->ParentEstate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->SnapshotID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackLLVector3d(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->ClassifiedFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate$Data;->PriceForListing:I

    return-void
.end method
