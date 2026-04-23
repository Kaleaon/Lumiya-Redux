.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;
    }
.end annotation


# instance fields
.field public DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

.field public XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0xd

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSendXferPacket(Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/16 v0, 0x12

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;->ID:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;->Packet:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;->ID:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;->Packet:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->DataPacket_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$DataPacket;->Data:[B

    return-void
.end method
