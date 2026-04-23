.class public Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;
    }
.end annotation


# instance fields
.field public NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;


# direct methods
.method public constructor <init>()V
    .locals 4

    const/4 v3, 0x4

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-array v1, v3, [Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->zeroCoded:Z

    :goto_0
    if-ge v0, v3, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    const/4 v1, 0x1

    const/4 v0, 0x0

    :goto_0
    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v2, v2, v0

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->Name:[B

    array-length v2, v2

    add-int/lit8 v2, v2, 0x1d

    add-int/lit8 v2, v2, 0x1

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleNeighborList(Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->IP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->Port:I

    int-to-short v1, v1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->PublicIP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->PublicPort:I

    int-to-short v1, v1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->Name:[B

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->SimAccess:I

    int-to-byte v1, v1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->packByte(Ljava/nio/ByteBuffer;B)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const v3, 0xffff

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->IP:Ljava/net/Inet4Address;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v2

    and-int/2addr v2, v3

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->Port:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->PublicIP:Ljava/net/Inet4Address;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v2

    and-int/2addr v2, v3

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->PublicPort:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->RegionID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->Name:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;

    aget-object v1, v1, v0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;->SimAccess:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
