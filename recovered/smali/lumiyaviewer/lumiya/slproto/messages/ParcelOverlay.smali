.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;
    }
.end annotation


# instance fields
.field public ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;->Data:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x6

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelOverlay(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x3c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;->SequenceID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;->Data:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;->SequenceID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;->Data:[B

    return-void
.end method
