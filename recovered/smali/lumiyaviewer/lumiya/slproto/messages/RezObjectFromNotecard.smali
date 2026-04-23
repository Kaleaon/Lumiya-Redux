.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$InventoryData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;

.field public InventoryData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$InventoryData;",
            ">;"
        }
    .end annotation
.end field

.field public NotecardData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;

.field public RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->InventoryData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->NotecardData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->InventoryData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x10

    add-int/lit16 v0, v0, 0xa1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRezObjectFromNotecard(Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x26

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->FromTaskID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->BypassRaycast:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RayStart:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RayEnd:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RayTargetID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RayEndIsIntersection:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RezSelected:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RemoveItem:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->ItemFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->GroupMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->EveryoneMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->NextOwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->NotecardData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;->NotecardItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->NotecardData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->InventoryData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->InventoryData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$InventoryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$InventoryData;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->FromTaskID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->BypassRaycast:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RayStart:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RayEnd:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RayTargetID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RayEndIsIntersection:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RezSelected:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->RemoveItem:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->ItemFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->GroupMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->EveryoneMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->RezData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$RezData;->NextOwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->NotecardData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;->NotecardItemID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->NotecardData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$NotecardData;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$InventoryData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$InventoryData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard$InventoryData;->ItemID:Ljava/util/UUID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;->InventoryData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
