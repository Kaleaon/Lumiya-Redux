.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UserReport$ReportData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/UserReport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReportData"
.end annotation


# instance fields
.field public AbuseRegionID:Ljava/util/UUID;

.field public AbuseRegionName:[B

.field public AbuserID:Ljava/util/UUID;

.field public Category:I

.field public CheckFlags:I

.field public Details:[B

.field public ObjectID:Ljava/util/UUID;

.field public Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public ReportType:I

.field public ScreenshotID:Ljava/util/UUID;

.field public Summary:[B

.field public VersionString:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
