.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal$ReportData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReportData"
.end annotation


# instance fields
.field public AbuseRegionID:Ljava/util/UUID;

.field public AbuseRegionName:[B

.field public AbuserID:Ljava/util/UUID;

.field public AgentPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public Category:I

.field public CreatorID:Ljava/util/UUID;

.field public Details:[B

.field public LastOwnerID:Ljava/util/UUID;

.field public ObjectID:Ljava/util/UUID;

.field public OwnerID:Ljava/util/UUID;

.field public RegionID:Ljava/util/UUID;

.field public ReportType:I

.field public ReporterID:Ljava/util/UUID;

.field public ScreenshotID:Ljava/util/UUID;

.field public Summary:[B

.field public VersionString:[B

.field public ViewerPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
