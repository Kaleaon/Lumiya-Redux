.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo4;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;
    }
.end annotation


# instance fields
.field public RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;

.field public RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

.field public RegionInfo4_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo4;",
            ">;"
        }
    .end annotation
.end field

.field public RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo4_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->SimName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x6

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x10

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->ColoName:[B

    array-length v1, v1

    add-int/lit8 v1, v1, 0x9

    add-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->ProductSKU:[B

    array-length v2, v2

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->ProductName:[B

    array-length v2, v2

    add-int/2addr v1, v2

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo4_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRegionHandshake(Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x6c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->RegionFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->SimAccess:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->SimName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->SimOwner:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->IsEstateManager:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->WaterHeight:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->BillableFactor:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->CacheID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainBase0:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainBase1:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainBase2:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainBase3:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail0:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail1:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail2:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail3:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight00:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight01:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight10:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight11:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange00:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange01:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange10:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange11:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->CPUClassID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->CPURatio:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->ColoName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->ProductSKU:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->ProductName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo4_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo4_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo4;

    iget-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo4;->RegionFlagsExtended:J

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo4;->RegionProtocols:J

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->packLong(Ljava/nio/ByteBuffer;J)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 6

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->RegionFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->SimAccess:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->SimName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->SimOwner:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->IsEstateManager:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->WaterHeight:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->BillableFactor:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->CacheID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainBase0:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainBase1:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainBase2:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainBase3:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail0:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail1:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail2:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail3:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight00:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight01:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight10:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight11:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange00:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange01:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange10:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange11:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo2;->RegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->CPUClassID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->CPURatio:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->ColoName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->ProductSKU:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo3_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo3;->ProductName:[B

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo4;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo4;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo4;->RegionFlagsExtended:J

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo4;->RegionProtocols:J

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;->RegionInfo4_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
