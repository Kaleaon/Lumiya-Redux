.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

.field public InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

.field public RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Name:[B

    array-length v0, v0

    add-int/lit16 v0, v0, 0x81

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Description:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit16 v0, v0, 0x80

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRezObject(Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x25

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->FromTaskID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->BypassRaycast:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayStart:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayEnd:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayTargetID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayEndIsIntersection:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RezSelected:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RemoveItem:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->ItemFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->GroupMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->EveryoneMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->NextOwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->FolderID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->CreatorID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->BaseMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->OwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->GroupMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->EveryoneMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->NextOwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->GroupOwned:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->InvType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->SaleType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->SalePrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->CreationDate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->CRC:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->FromTaskID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->BypassRaycast:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayStart:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayEnd:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayTargetID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RayEndIsIntersection:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RezSelected:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->RemoveItem:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->ItemFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->GroupMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->EveryoneMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;->NextOwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->FolderID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->CreatorID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->BaseMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->OwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->GroupMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->EveryoneMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->NextOwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->GroupOwned:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->InvType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->SaleType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->SalePrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->Description:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->CreationDate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;->CRC:I

    return-void
.end method
