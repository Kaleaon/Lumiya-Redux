.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Info"
.end annotation


# instance fields
.field public EnergyEfficiency:F

.field public ObjectCapacity:I

.field public ObjectCount:I

.field public PriceEnergyUnit:I

.field public PriceGroupCreate:I

.field public PriceObjectClaim:I

.field public PriceObjectRent:F

.field public PriceObjectScaleFactor:F

.field public PriceParcelClaim:I

.field public PriceParcelClaimFactor:F

.field public PriceParcelRent:I

.field public PricePublicObjectDecay:I

.field public PricePublicObjectDelete:I

.field public PriceRentLight:I

.field public PriceUpload:I

.field public TeleportMinPrice:I

.field public TeleportPriceExponent:F


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
