.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x21

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Desc:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->SimName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelInfoReply(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x37

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->ParcelID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Desc:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->ActualArea:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->BillableArea:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Flags:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalX:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalY:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalZ:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->SimName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->SnapshotID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Dwell:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->SalePrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->AuctionID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->ParcelID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Desc:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->ActualArea:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->BillableArea:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalX:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalY:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalZ:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->SimName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->SnapshotID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Dwell:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->SalePrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->AuctionID:I

    return-void
.end method
