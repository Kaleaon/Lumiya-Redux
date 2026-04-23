.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$TelehubBlock;
    }
.end annotation


# instance fields
.field public NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;

.field public SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

.field public SimulatorPublicHostBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;

.field public TelehubBlock_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$TelehubBlock;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    const/4 v3, 0x4

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-array v1, v3, [Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->TelehubBlock_Fields:Ljava/util/ArrayList;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->zeroCoded:Z

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorPublicHostBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;

    :goto_0
    if-ge v0, v3, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->SimName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x2a

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->TelehubBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0xd

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSimulatorPresentAtLocation(Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v1, 0xb

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorPublicHostBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;->Port:I

    int-to-short v1, v1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorPublicHostBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;->SimulatorIP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorPublicHostBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;->GridX:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorPublicHostBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;->GridY:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packInt(Ljava/nio/ByteBuffer;I)V

    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;->IP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;->Port:I

    int-to-short v1, v1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packShort(Ljava/nio/ByteBuffer;S)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->SimName:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->SimAccess:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->RegionFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->EstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->ParentEstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->TelehubBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->TelehubBlock_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$TelehubBlock;

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$TelehubBlock;->HasTelehub:Z

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$TelehubBlock;->TelehubPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const v4, 0xffff

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorPublicHostBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v2

    and-int/2addr v2, v4

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;->Port:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorPublicHostBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;->SimulatorIP:Ljava/net/Inet4Address;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorPublicHostBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;->GridX:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorPublicHostBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;->GridY:I

    move v1, v0

    :goto_0
    const/4 v2, 0x4

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;

    aget-object v2, v2, v1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;->IP:Ljava/net/Inet4Address;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->NeighborBlock_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;

    aget-object v2, v2, v1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v3

    and-int/2addr v3, v4

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$NeighborBlock;->Port:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->SimName:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->SimAccess:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->RegionFlags:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->RegionID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->EstateID:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->SimulatorBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorBlock;->ParentEstateID:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    :goto_1
    if-ge v0, v1, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$TelehubBlock;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$TelehubBlock;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v3

    iput-boolean v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$TelehubBlock;->HasTelehub:Z

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$TelehubBlock;->TelehubPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;->TelehubBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method
