.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;

.field public InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x38

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRemoveTaskInventory(Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x1f

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;->LocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;->LocalID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory$InventoryData;->ItemID:Ljava/util/UUID;

    return-void
.end method
