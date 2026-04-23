.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;

.field public InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

.field public UpdateBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->UpdateBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->Name:[B

    array-length v0, v0

    add-int/lit16 v0, v0, 0x81

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->Description:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x39

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRezScript(Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x30

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->UpdateBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;->ObjectLocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->UpdateBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;->Enabled:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->FolderID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->CreatorID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->BaseMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->OwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->GroupMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->EveryoneMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->NextOwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->GroupOwned:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->InvType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->SaleType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->SalePrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->CreationDate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->CRC:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->UpdateBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;->ObjectLocalID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->UpdateBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$UpdateBlock;->Enabled:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->ItemID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->FolderID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->CreatorID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->BaseMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->OwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->GroupMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->EveryoneMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->NextOwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->GroupOwned:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->InvType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->SaleType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->SalePrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->Description:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->CreationDate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript$InventoryBlock;->CRC:I

    return-void
.end method
