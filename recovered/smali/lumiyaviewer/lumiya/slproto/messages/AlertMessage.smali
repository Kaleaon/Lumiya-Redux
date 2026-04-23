.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;
    }
.end annotation


# instance fields
.field public AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;

.field public AlertInfo_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->AlertInfo_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;->Message:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->AlertInfo_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;->Message:[B

    array-length v3, v3

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;->ExtraParams:[B

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

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAlertMessage(Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v3, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x7a

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;->Message:[B

    invoke-virtual {p0, p1, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->AlertInfo_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->AlertInfo_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;->Message:[B

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;->ExtraParams:[B

    invoke-virtual {p0, p1, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->AlertData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertData;->Message:[B

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;-><init>()V

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;->Message:[B

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage$AlertInfo;->ExtraParams:[B

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;->AlertInfo_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
