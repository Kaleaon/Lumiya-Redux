.class public Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$InventoryData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;

.field public InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$InventoryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$InventoryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$InventoryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$InventoryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x34

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandlePurgeInventoryDescendents(Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x1d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$InventoryData;->FolderID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents$InventoryData;->FolderID:Ljava/util/UUID;

    return-void
.end method
