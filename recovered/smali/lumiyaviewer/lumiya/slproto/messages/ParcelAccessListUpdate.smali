.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$List;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

.field public List_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$List;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->List_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->List_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x18

    add-int/lit8 v0, v0, 0x45

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelAccessListUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x27

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;->LocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;->SequenceID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;->Sections:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->List_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->List_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$List;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$List;->ID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$List;->Time:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$List;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;->LocalID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;->SequenceID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$Data;->Sections:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$List;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$List;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$List;->ID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$List;->Time:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate$List;->Flags:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;->List_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
