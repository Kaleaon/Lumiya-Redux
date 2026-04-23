.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;

.field public InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

.field public UpdateData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->UpdateData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Name:[B

    array-length v0, v0

    add-int/lit16 v0, v0, 0x81

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Description:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x29

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleUpdateTaskInventory(Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x1e

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->UpdateData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;->LocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->UpdateData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;->Key:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->FolderID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->CreatorID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->BaseMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->OwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->GroupMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->EveryoneMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->NextOwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->GroupOwned:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->InvType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->SaleType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->SalePrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->CreationDate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->CRC:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->UpdateData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;->LocalID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->UpdateData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$UpdateData;->Key:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->FolderID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->CreatorID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->BaseMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->OwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->GroupMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->EveryoneMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->NextOwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->GroupOwned:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->InvType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->SaleType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->SalePrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->Description:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->CreationDate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory$InventoryData;->CRC:I

    return-void
.end method
