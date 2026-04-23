.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$ObjectData;
    }
.end annotation


# instance fields
.field public AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;

.field public ObjectData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$ObjectData;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->ObjectData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x58

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleDeRezObject(Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x23

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->Destination:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->DestinationID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->PacketCount:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->PacketNumber:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$ObjectData;->ObjectLocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->packInt(Ljava/nio/ByteBuffer;I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->Destination:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->DestinationID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->PacketCount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->AgentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$AgentBlock;->PacketNumber:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$ObjectData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$ObjectData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject$ObjectData;->ObjectLocalID:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
