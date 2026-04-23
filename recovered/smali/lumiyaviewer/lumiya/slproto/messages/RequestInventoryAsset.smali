.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;
    }
.end annotation


# instance fields
.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x44

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRequestInventoryAsset(Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x1a

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset$QueryData;->ItemID:Ljava/util/UUID;

    return-void
.end method
