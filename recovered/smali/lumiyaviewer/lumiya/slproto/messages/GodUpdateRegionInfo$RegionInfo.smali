.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo$RegionInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RegionInfo"
.end annotation


# instance fields
.field public BillableFactor:F

.field public EstateID:I

.field public ParentEstateID:I

.field public PricePerMeter:I

.field public RedirectGridX:I

.field public RedirectGridY:I

.field public RegionFlags:I

.field public SimName:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
