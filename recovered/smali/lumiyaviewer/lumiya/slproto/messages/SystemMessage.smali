.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$ParamList;
    }
.end annotation


# instance fields
.field public MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;

.field public ParamList_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$ParamList;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->ParamList_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;->Method:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x20

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->ParamList_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$ParamList;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$ParamList;->Parameter:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSystemMessage(Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x6c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;->Method:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;->Invoice:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;->Digest:[B

    const/16 v1, 0x20

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->packFixed(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->ParamList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->ParamList_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$ParamList;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$ParamList;->Parameter:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;->Method:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;->Invoice:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->MethodData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;

    const/16 v1, 0x20

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->unpackFixed(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$MethodData;->Digest:[B

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$ParamList;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$ParamList;-><init>()V

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage$ParamList;->Parameter:[B

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;->ParamList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
