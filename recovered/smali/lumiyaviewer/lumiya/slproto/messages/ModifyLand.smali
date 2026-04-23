.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlockExtended;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;

.field public ModifyBlockExtended_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlockExtended;",
            ">;"
        }
    .end annotation
.end field

.field public ModifyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;

.field public ParcelData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ParcelData_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlockExtended_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ParcelData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x14

    add-int/lit8 v0, v0, 0x2f

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlockExtended_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleModifyLand(Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x7c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;->Action:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;->BrushSize:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;->Seconds:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;->Height:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ParcelData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ParcelData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;->LocalID:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;->West:F

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;->South:F

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;->East:F

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;->North:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packFloat(Ljava/nio/ByteBuffer;F)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlockExtended_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlockExtended_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlockExtended;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlockExtended;->BrushSize:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->packFloat(Ljava/nio/ByteBuffer;F)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;->Action:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;->BrushSize:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;->Seconds:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlock;->Height:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;->LocalID:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;->West:F

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;->South:F

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;->East:F

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ParcelData;->North:F

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ParcelData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    :goto_1
    if-ge v0, v1, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlockExtended;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlockExtended;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand$ModifyBlockExtended;->BrushSize:F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;->ModifyBlockExtended_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method
