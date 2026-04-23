.class public Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;
    }
.end annotation


# instance fields
.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x25

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleInventoryAssetResponse(Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x1b

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;->AssetID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;->IsReadable:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;->AssetID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse$QueryData;->IsReadable:Z

    return-void
.end method
