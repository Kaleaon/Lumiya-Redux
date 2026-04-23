.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$CameraProperty;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$ObjectData;
    }
.end annotation


# instance fields
.field public CameraProperty_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$CameraProperty;",
            ">;"
        }
    .end annotation
.end field

.field public ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$ObjectData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->CameraProperty_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$ObjectData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$ObjectData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$ObjectData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->CameraProperty_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0x15

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSetFollowCamProperties(Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x61

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$ObjectData;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->CameraProperty_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->CameraProperty_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$CameraProperty;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$CameraProperty;->Type:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$CameraProperty;->Value:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->packFloat(Ljava/nio/ByteBuffer;F)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$ObjectData;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$CameraProperty;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$CameraProperty;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$CameraProperty;->Type:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties$CameraProperty;->Value:F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;->CameraProperty_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
