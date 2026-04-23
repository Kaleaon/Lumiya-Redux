.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply$DataBlock;
    }
.end annotation


# instance fields
.field public DataBlock_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply$DataBlock;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;->DataBlock_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;->zeroCoded:Z

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    const/4 v0, 0x5

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;->DataBlock_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply$DataBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply$DataBlock;->Reply:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0xa

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleScriptDataReply(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x52

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;->DataBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;->DataBlock_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply$DataBlock;

    iget-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply$DataBlock;->Hash:J

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply$DataBlock;->Reply:[B

    const/4 v2, 0x2

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 6

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply$DataBlock;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply$DataBlock;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply$DataBlock;->Hash:J

    const/4 v3, 0x2

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply$DataBlock;->Reply:[B

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;->DataBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
