.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;

.field public RequestImageData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->RequestImageData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->RequestImageData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1a

    add-int/lit8 v0, v0, 0x22

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRequestImage(Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->RequestImageData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->RequestImageData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->Image:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->DiscardLevel:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->DownloadPriority:F

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->Packet:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->packByte(Ljava/nio/ByteBuffer;B)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->Image:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->DiscardLevel:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->DownloadPriority:F

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->Packet:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->Type:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->RequestImageData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
