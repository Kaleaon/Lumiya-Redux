.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;

.field public InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->Name:[B

    array-length v0, v0

    add-int/lit16 v0, v0, 0x81

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->Description:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRezRestoreToWorld(Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x57

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->FolderID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->CreatorID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->BaseMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->OwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->GroupMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->EveryoneMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->NextOwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->GroupOwned:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->InvType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->SaleType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->SalePrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->CreationDate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->CRC:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->FolderID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->CreatorID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->BaseMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->OwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->GroupMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->EveryoneMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->NextOwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->GroupOwned:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->InvType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->SaleType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->SalePrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->Description:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->CreationDate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld$InventoryData;->CRC:I

    return-void
.end method
