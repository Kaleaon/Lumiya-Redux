.class public Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;
    }
.end annotation


# instance fields
.field public PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;

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

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleStartPingCheck(Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;->PingID:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;->OldestUnacked:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;->PingID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;->OldestUnacked:I

    return-void
.end method
