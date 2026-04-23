.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$AgentList;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;
    }
.end annotation


# instance fields
.field public AgentList_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$AgentList;",
            ">;"
        }
    .end annotation
.end field

.field public SimulatorLoadData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->AgentList_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->SimulatorLoadData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->AgentList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x6

    add-int/lit8 v0, v0, 0xe

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSimulatorLoad(Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->SimulatorLoadData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;->TimeDilation:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->SimulatorLoadData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;->AgentCount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->SimulatorLoadData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;->CanAcceptAgents:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->AgentList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->AgentList_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$AgentList;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$AgentList;->CircuitCode:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$AgentList;->X:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$AgentList;->Y:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->packByte(Ljava/nio/ByteBuffer;B)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->SimulatorLoadData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;->TimeDilation:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->SimulatorLoadData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;->AgentCount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->SimulatorLoadData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$SimulatorLoadData;->CanAcceptAgents:Z

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$AgentList;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$AgentList;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$AgentList;->CircuitCode:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$AgentList;->X:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad$AgentList;->Y:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;->AgentList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
