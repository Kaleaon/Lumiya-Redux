.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;
    }
.end annotation


# instance fields
.field public ReplyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;->ReplyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x1c

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRegionIDAndHandleReply(Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x36

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;->ReplyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;->ReplyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;->packLong(Ljava/nio/ByteBuffer;J)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;->ReplyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;->RegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;->ReplyBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply$ReplyBlock;->RegionHandle:J

    return-void
.end method
