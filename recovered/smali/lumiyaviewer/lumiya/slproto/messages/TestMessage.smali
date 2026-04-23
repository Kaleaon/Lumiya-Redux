.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$TestBlock1;
    }
.end annotation


# instance fields
.field public NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;

.field public TestBlock1_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$TestBlock1;


# direct methods
.method public constructor <init>()V
    .locals 4

    const/4 v3, 0x4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-array v0, v3, [Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$TestBlock1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$TestBlock1;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->TestBlock1_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$TestBlock1;

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x38

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTestMessage(Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->TestBlock1_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$TestBlock1;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$TestBlock1;->Test1:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->packInt(Ljava/nio/ByteBuffer;I)V

    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;->Test0:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;->Test1:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;->Test2:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->packInt(Ljava/nio/ByteBuffer;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->TestBlock1_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$TestBlock1;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$TestBlock1;->Test1:I

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;

    aget-object v1, v1, v0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;->Test0:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;

    aget-object v1, v1, v0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;->Test1:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;

    aget-object v1, v1, v0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage$NeighborBlock;->Test2:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
