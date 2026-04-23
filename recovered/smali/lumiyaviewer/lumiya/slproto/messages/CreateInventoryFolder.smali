.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;

.field public FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x22

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleCreateInventoryFolder(Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->FolderID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->ParentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->FolderID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->ParentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->FolderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder$FolderData;->Name:[B

    return-void
.end method
