.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$PidStat;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$RegionInfo;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Stat;
    }
.end annotation


# instance fields
.field public PidStat_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$PidStat;

.field public RegionInfo_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$RegionInfo;",
            ">;"
        }
    .end annotation
.end field

.field public Region_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;

.field public Stat_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Stat;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Stat_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->RegionInfo_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Region_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$PidStat;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$PidStat;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->PidStat_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$PidStat;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Stat_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0x15

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->RegionInfo_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSimStats(Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x74

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Region_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;->RegionX:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Region_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;->RegionY:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Region_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;->RegionFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Region_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;->ObjectCapacity:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Stat_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Stat_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Stat;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Stat;->StatID:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Stat;->StatValue:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->packFloat(Ljava/nio/ByteBuffer;F)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->PidStat_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$PidStat;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$PidStat;->PID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->RegionInfo_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->RegionInfo_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$RegionInfo;

    iget-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$RegionInfo;->RegionFlagsExtended:J

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->packLong(Ljava/nio/ByteBuffer;J)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 6

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Region_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;->RegionX:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Region_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;->RegionY:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Region_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;->RegionFlags:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Region_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Region;->ObjectCapacity:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Stat;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Stat;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Stat;->StatID:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$Stat;->StatValue:F

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->Stat_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->PidStat_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$PidStat;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$PidStat;->PID:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    :goto_1
    if-ge v0, v1, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$RegionInfo;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$RegionInfo;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats$RegionInfo;->RegionFlagsExtended:J

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;->RegionInfo_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method
