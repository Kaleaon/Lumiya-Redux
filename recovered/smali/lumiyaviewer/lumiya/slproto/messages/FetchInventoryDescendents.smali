.class public Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;

.field public InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x4a

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleFetchInventoryDescendents(Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x15

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->FolderID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->SortOrder:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->FetchFolders:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->FetchItems:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->FolderID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->SortOrder:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->FetchFolders:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->FetchItems:Z

    return-void
.end method
