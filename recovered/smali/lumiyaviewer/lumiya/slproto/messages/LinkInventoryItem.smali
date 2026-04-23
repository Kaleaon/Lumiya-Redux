.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;

.field public InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x37

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->Description:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleLinkInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x56

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->CallbackID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->FolderID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->OldItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->InvType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->CallbackID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->FolderID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->OldItemID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->InvType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem$InventoryBlock;->Description:[B

    return-void
.end method
