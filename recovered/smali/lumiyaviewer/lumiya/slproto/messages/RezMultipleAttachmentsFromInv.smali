.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

.field public HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

.field public ObjectData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->ObjectData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 4

    const/16 v0, 0x37

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->Name:[B

    array-length v3, v3

    add-int/lit8 v3, v3, 0x32

    add-int/lit8 v3, v3, 0x1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->Description:[B

    array-length v0, v0

    add-int/2addr v0, v3

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRezMultipleAttachmentsFromInv(Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v3, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x74

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->CompoundMsgID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->TotalObjects:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->FirstDetachAll:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->AttachmentPt:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->ItemFlags:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->GroupMask:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->EveryoneMask:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->NextOwnerMask:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->Name:[B

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->Description:[B

    invoke-virtual {p0, p1, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->CompoundMsgID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->TotalObjects:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->HeaderData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$HeaderData;->FirstDetachAll:Z

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->AttachmentPt:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->ItemFlags:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->GroupMask:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->EveryoneMask:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->NextOwnerMask:I

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->Name:[B

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv$ObjectData;->Description:[B

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
