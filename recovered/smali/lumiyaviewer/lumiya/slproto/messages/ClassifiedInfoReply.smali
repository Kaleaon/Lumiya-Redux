.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2d

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->Desc:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->SimName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x18

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ParcelName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleClassifiedInfoReply(Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x2c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ClassifiedID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->CreatorID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->CreationDate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ExpirationDate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->Category:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->Name:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->Desc:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ParcelID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ParentEstate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->SnapshotID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->SimName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packLLVector3d(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ParcelName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ClassifiedFlags:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->PriceForListing:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ClassifiedID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->CreatorID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->CreationDate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ExpirationDate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->Category:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->Desc:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ParcelID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ParentEstate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->SnapshotID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->SimName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackLLVector3d(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ParcelName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->ClassifiedFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;->PriceForListing:I

    return-void
.end method
