.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;

.field public ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x32

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->Description:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRezSingleAttachmentFromInv(Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x75

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->AttachmentPt:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->ItemFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->GroupMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->EveryoneMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->NextOwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->ItemID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->AttachmentPt:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->ItemFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->GroupMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->EveryoneMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->NextOwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv$ObjectData;->Description:[B

    return-void
.end method
