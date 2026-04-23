.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;

.field public InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2c

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Description:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleCreateInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x31

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->CallbackID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->FolderID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->NextOwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->InvType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->WearableType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->CallbackID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->FolderID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->NextOwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->InvType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->WearableType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem$InventoryBlock;->Description:[B

    return-void
.end method
