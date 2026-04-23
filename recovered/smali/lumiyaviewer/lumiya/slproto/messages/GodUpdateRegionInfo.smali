.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo2;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;

.field public RegionInfo2_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo2;",
            ">;"
        }
    .end annotation
.end field

.field public RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo2_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->SimName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x24

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo2_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleGodUpdateRegionInfo(Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x71

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->SimName:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->EstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->ParentEstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->RegionFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->BillableFactor:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->PricePerMeter:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->RedirectGridX:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->RedirectGridY:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo2_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo2_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo2;

    iget-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo2;->RegionFlagsExtended:J

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->packLong(Ljava/nio/ByteBuffer;J)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->SimName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->EstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->ParentEstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->RegionFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->BillableFactor:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->PricePerMeter:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->RedirectGridX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;->RedirectGridY:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo2;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo2;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo2;->RegionFlagsExtended:J

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;->RegionInfo2_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
