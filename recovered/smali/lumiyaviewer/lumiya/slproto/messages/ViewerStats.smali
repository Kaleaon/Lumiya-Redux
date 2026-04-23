.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$MiscStats;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

.field public DownloadTotals_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;

.field public FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

.field public MiscStats_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$MiscStats;",
            ">;"
        }
    .end annotation
.end field

.field public NetStats_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;


# direct methods
.method public constructor <init>()V
    .locals 4

    const/4 v3, 0x2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-array v0, v3, [Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->NetStats_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->MiscStats_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->DownloadTotals_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->NetStats_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SysOS:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x4a

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SysCPU:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SysGPU:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0x20

    add-int/lit8 v0, v0, 0x18

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->MiscStats_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0xc

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleViewerStats(Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v0, 0x0

    const/4 v4, 0x1

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v1, -0x7d

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->IP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->StartTime:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->RunTime:F

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SimFPS:F

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->FPS:F

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->AgentsInView:I

    int-to-byte v1, v1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->Ping:F

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget-wide v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->MetersTraveled:D

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packDouble(Ljava/nio/ByteBuffer;D)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->RegionsVisited:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SysRAM:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SysOS:[B

    invoke-virtual {p0, p1, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SysCPU:[B

    invoke-virtual {p0, p1, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SysGPU:[B

    invoke-virtual {p0, p1, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->DownloadTotals_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;->World:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->DownloadTotals_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;->Objects:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->DownloadTotals_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;->Textures:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    :goto_0
    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->NetStats_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;->Bytes:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->NetStats_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;->Packets:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->NetStats_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;->Compressed:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->NetStats_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;->Savings:I

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->SendPacket:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->Dropped:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->Resent:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->FailedResends:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->OffCircuit:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->Invalid:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->MiscStats_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->MiscStats_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$MiscStats;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$MiscStats;->Type:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$MiscStats;->Value:D

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->packDouble(Ljava/nio/ByteBuffer;D)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 6

    const/4 v0, 0x0

    const/4 v4, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->IP:Ljava/net/Inet4Address;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->StartTime:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->RunTime:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SimFPS:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->FPS:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->AgentsInView:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->Ping:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackDouble(Ljava/nio/ByteBuffer;)D

    move-result-wide v2

    iput-wide v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->MetersTraveled:D

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->RegionsVisited:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SysRAM:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SysOS:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SysCPU:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;->SysGPU:[B

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->DownloadTotals_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;->World:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->DownloadTotals_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;->Objects:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->DownloadTotals_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$DownloadTotals;->Textures:I

    move v1, v0

    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->NetStats_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    aget-object v2, v2, v1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;->Bytes:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->NetStats_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    aget-object v2, v2, v1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;->Packets:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->NetStats_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    aget-object v2, v2, v1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;->Compressed:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->NetStats_Fields:[Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;

    aget-object v2, v2, v1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$NetStats;->Savings:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->SendPacket:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->Dropped:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->Resent:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->FailedResends:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->OffCircuit:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->FailStats_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;->Invalid:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    :goto_1
    if-ge v0, v1, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$MiscStats;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$MiscStats;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$MiscStats;->Type:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->unpackDouble(Ljava/nio/ByteBuffer;)D

    move-result-wide v4

    iput-wide v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$MiscStats;->Value:D

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;->MiscStats_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method
