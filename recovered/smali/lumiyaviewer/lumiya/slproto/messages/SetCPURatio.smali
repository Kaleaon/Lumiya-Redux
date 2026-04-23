.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio$Data;
    }
.end annotation


# instance fields
.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/4 v0, 0x5

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSetCPURatio(Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x47

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio$Data;->Ratio:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio;->packByte(Ljava/nio/ByteBuffer;B)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio$Data;->Ratio:I

    return-void
.end method
