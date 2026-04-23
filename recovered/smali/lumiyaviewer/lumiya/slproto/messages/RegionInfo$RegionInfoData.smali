.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo$RegionInfoData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RegionInfoData"
.end annotation


# instance fields
.field public BillableFactor:F

.field public EstateID:I

.field public MaxAgents:I

.field public ObjectBonusFactor:F

.field public ParentEstateID:I

.field public PricePerMeter:I

.field public RedirectGridX:I

.field public RedirectGridY:I

.field public RegionFlags:I

.field public SimAccess:I

.field public SimName:[B

.field public SunHour:F

.field public TerrainLowerLimit:F

.field public TerrainRaiseLimit:F

.field public UseEstateSun:Z

.field public WaterHeight:F


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
