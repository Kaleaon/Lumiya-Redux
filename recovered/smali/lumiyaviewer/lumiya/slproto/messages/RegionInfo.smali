.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo3;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;

.field public RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

.field public RegionInfo3_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo3;",
            ">;"
        }
    .end annotation
.end field

.field public RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo3_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->SimName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x24

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->ProductSKU:[B

    array-length v1, v1

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->ProductName:[B

    array-length v2, v2

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x4

    add-int/lit8 v1, v1, 0x4

    add-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo3_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRegionInfo(Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x72

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->SimName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->EstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->ParentEstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->RegionFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->SimAccess:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->MaxAgents:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->BillableFactor:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->ObjectBonusFactor:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->WaterHeight:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->TerrainRaiseLimit:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->TerrainLowerLimit:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->PricePerMeter:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->RedirectGridX:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->RedirectGridY:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->UseEstateSun:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->SunHour:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->ProductSKU:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->ProductName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->MaxAgents32:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->HardMaxAgents:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->HardMaxObjects:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo3_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo3_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo3;

    iget-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo3;->RegionFlagsExtended:J

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->packLong(Ljava/nio/ByteBuffer;J)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 6

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->SimName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->EstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->ParentEstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->RegionFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->SimAccess:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->MaxAgents:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->BillableFactor:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->ObjectBonusFactor:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->WaterHeight:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->TerrainRaiseLimit:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->TerrainLowerLimit:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->PricePerMeter:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->RedirectGridX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->RedirectGridY:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->UseEstateSun:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfoData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;->SunHour:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->ProductSKU:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->ProductName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->MaxAgents32:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->HardMaxAgents:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo2_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo2;->HardMaxObjects:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo3;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo3;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfo3;->RegionFlagsExtended:J

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;->RegionInfo3_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
