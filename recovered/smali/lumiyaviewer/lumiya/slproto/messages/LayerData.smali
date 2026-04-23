.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerID;
    }
.end annotation


# instance fields
.field public LayerDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;

.field public LayerID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerID;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerID;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerID;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->LayerID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerID;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->LayerDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->LayerDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;->Data:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleLayerData(Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->LayerID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerID;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->LayerDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;->Data:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->LayerID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerID;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->LayerDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData$LayerDataData;->Data:[B

    return-void
.end method
