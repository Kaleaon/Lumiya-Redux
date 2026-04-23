.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AttachmentBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;

.field public AttachmentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AttachmentBlock;

.field public InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

.field public OperationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AttachmentBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AttachmentBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->AttachmentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AttachmentBlock;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->OperationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->Name:[B

    array-length v0, v0

    add-int/lit16 v0, v0, 0x81

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->Description:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x27

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleUpdateAttachment(Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x4b

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->AttachmentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AttachmentBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AttachmentBlock;->AttachmentPoint:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->OperationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;->AddItem:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->OperationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;->UseExistingAsset:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->FolderID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->CreatorID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->BaseMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->OwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->GroupMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->EveryoneMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->NextOwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->GroupOwned:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->AssetID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->InvType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->SaleType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->SalePrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->CreationDate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->CRC:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->AttachmentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AttachmentBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$AttachmentBlock;->AttachmentPoint:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->OperationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;->AddItem:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->OperationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$OperationData;->UseExistingAsset:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->FolderID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->CreatorID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->BaseMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->OwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->GroupMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->EveryoneMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->NextOwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->GroupOwned:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->AssetID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->InvType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->SaleType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->SalePrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->Description:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->CreationDate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment$InventoryData;->CRC:I

    return-void
.end method
