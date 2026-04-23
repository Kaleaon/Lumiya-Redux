.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;
    }
.end annotation


# instance fields
.field public CommandBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->CommandBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x10

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelMediaCommandMessage(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x5d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->CommandBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->CommandBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;->Command:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->CommandBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;->Time:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->packFloat(Ljava/nio/ByteBuffer;F)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->CommandBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->CommandBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;->Command:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->CommandBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;->Time:F

    return-void
.end method
