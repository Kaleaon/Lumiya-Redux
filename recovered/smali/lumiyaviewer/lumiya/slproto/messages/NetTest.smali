.class public Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest$NetBlock;
    }
.end annotation


# instance fields
.field public NetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest$NetBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest$NetBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest$NetBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest;->NetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest$NetBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/4 v0, 0x6

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleNetTest(Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x46

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest;->NetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest$NetBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest$NetBlock;->Port:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest;->packShort(Ljava/nio/ByteBuffer;S)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest;->NetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest$NetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest$NetBlock;->Port:I

    return-void
.end method
