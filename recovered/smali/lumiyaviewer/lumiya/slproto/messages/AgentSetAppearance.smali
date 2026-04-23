.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$VisualParam;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$WearableData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

.field public ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;

.field public VisualParam_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$VisualParam;",
            ">;"
        }
    .end annotation
.end field

.field public WearableData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$WearableData;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->WearableData_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->VisualParam_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->WearableData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x35

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;->TextureEntry:[B

    array-length v1, v1

    add-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAgentSetAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x54

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->SerialNum:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->WearableData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->WearableData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$WearableData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$WearableData;->CacheID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$WearableData;->TextureIndex:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->packByte(Ljava/nio/ByteBuffer;B)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;->TextureEntry:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$VisualParam;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$VisualParam;->ParamValue:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->packByte(Ljava/nio/ByteBuffer;B)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->SerialNum:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$WearableData;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$WearableData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$WearableData;->CacheID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$WearableData;->TextureIndex:I

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->WearableData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;

    const/4 v2, 0x2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$ObjectData;->TextureEntry:[B

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    :goto_1
    if-ge v0, v1, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$VisualParam;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$VisualParam;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance$VisualParam;->ParamValue:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;->VisualParam_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method
