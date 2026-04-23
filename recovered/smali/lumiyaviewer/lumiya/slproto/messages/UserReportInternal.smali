.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;
    }
.end annotation


# instance fields
.field public ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->AbuseRegionName:[B

    array-length v0, v0

    add-int/lit16 v0, v0, 0x9b

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->Summary:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->Details:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->VersionString:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleUserReportInternal(Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x15

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->ReportType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->Category:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->ReporterID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->ViewerPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->AgentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->ScreenshotID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->LastOwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->CreatorID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->AbuserID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->AbuseRegionName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->AbuseRegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->Summary:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->Details:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->VersionString:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->ReportType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->Category:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->ReporterID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->ViewerPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->AgentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->ScreenshotID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->ObjectID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->LastOwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->CreatorID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->RegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->AbuserID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->AbuseRegionName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->AbuseRegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->Summary:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->Details:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->ReportData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;->VersionString:[B

    return-void
.end method
