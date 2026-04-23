.class public Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;
    }
.end annotation


# instance fields
.field public CircuitInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;->CircuitInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0xa

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleOpenCircuit(Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, -0x4

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;->CircuitInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;->IP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;->CircuitInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;->Port:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;->packShort(Ljava/nio/ByteBuffer;S)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;->CircuitInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;->IP:Ljava/net/Inet4Address;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;->CircuitInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit$CircuitInfo;->Port:I

    return-void
.end method
