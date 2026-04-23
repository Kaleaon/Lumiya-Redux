.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck$PingID;
    }
.end annotation


# instance fields
.field public PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck$PingID;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck$PingID;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck$PingID;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck$PingID;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleCompletePingCheck(Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck$PingID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck$PingID;->PingID:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;->packByte(Ljava/nio/ByteBuffer;B)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck$PingID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck$PingID;->PingID:I

    return-void
.end method
