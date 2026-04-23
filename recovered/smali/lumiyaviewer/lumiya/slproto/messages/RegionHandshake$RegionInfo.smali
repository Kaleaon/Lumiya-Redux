.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RegionInfo"
.end annotation


# instance fields
.field public BillableFactor:F

.field public CacheID:Ljava/util/UUID;

.field public IsEstateManager:Z

.field public RegionFlags:I

.field public SimAccess:I

.field public SimName:[B

.field public SimOwner:Ljava/util/UUID;

.field public TerrainBase0:Ljava/util/UUID;

.field public TerrainBase1:Ljava/util/UUID;

.field public TerrainBase2:Ljava/util/UUID;

.field public TerrainBase3:Ljava/util/UUID;

.field public TerrainDetail0:Ljava/util/UUID;

.field public TerrainDetail1:Ljava/util/UUID;

.field public TerrainDetail2:Ljava/util/UUID;

.field public TerrainDetail3:Ljava/util/UUID;

.field public TerrainHeightRange00:F

.field public TerrainHeightRange01:F

.field public TerrainHeightRange10:F

.field public TerrainHeightRange11:F

.field public TerrainStartHeight00:F

.field public TerrainStartHeight01:F

.field public TerrainStartHeight10:F

.field public TerrainStartHeight11:F

.field public WaterHeight:F


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
