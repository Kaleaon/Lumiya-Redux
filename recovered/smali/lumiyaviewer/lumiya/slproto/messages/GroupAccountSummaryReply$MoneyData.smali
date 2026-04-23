.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MoneyData"
.end annotation


# instance fields
.field public Balance:I

.field public CurrentInterval:I

.field public GroupTaxCurrent:I

.field public GroupTaxEstimate:I

.field public IntervalDays:I

.field public LandTaxCurrent:I

.field public LandTaxEstimate:I

.field public LastTaxDate:[B

.field public LightTaxCurrent:I

.field public LightTaxEstimate:I

.field public NonExemptMembers:I

.field public ObjectTaxCurrent:I

.field public ObjectTaxEstimate:I

.field public ParcelDirFeeCurrent:I

.field public ParcelDirFeeEstimate:I

.field public RequestID:Ljava/util/UUID;

.field public StartDate:[B

.field public TaxDate:[B

.field public TotalCredits:I

.field public TotalDebits:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
