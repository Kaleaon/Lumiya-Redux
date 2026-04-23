.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$EventData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;

.field public EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$EventData;

.field public InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$EventData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$EventData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$EventData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x28

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleCreateLandmarkForEvent(Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x32

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$EventData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$EventData;->EventID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;->FolderID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$EventData;->EventID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;->FolderID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->InventoryBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent$InventoryBlock;->Name:[B

    return-void
.end method
