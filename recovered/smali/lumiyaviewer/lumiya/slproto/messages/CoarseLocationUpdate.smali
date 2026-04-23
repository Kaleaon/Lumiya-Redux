.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;
    }
.end annotation


# instance fields
.field public AgentData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$AgentData;",
            ">;"
        }
    .end annotation
.end field

.field public Index_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;

.field public Location_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Location_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->AgentData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Index_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Location_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x3

    add-int/lit8 v0, v0, 0x3

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->AgentData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleCoarseLocationUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Location_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Location_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;->X:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;->Y:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;->Z:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Index_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;->You:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Index_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;->Prey:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->AgentData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->AgentData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;->X:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;->Y:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;->Z:I

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Location_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Index_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;->You:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Index_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;->Prey:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    :goto_1
    if-ge v0, v1, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$AgentData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$AgentData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->AgentData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method
