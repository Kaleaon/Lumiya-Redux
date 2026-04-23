.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;
    }
.end annotation


# instance fields
.field public InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->Filename:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x13

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleReplyTaskInventory(Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x22

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->TaskID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->Serial:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->Filename:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->TaskID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->Serial:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory$InventoryData;->Filename:[B

    return-void
.end method
