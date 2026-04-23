.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParcelData"
.end annotation


# instance fields
.field public AABBMax:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public AABBMin:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public Area:I

.field public AuctionID:I

.field public AuthBuyerID:Ljava/util/UUID;

.field public Bitmap:[B

.field public Category:I

.field public ClaimDate:I

.field public ClaimPrice:I

.field public Desc:[B

.field public GroupID:Ljava/util/UUID;

.field public GroupPrims:I

.field public IsGroupOwned:Z

.field public LandingType:I

.field public LocalID:I

.field public MaxPrims:I

.field public MediaAutoScale:I

.field public MediaID:Ljava/util/UUID;

.field public MediaURL:[B

.field public MusicURL:[B

.field public Name:[B

.field public OtherCleanTime:I

.field public OtherCount:I

.field public OtherPrims:I

.field public OwnerID:Ljava/util/UUID;

.field public OwnerPrims:I

.field public ParcelFlags:I

.field public ParcelPrimBonus:F

.field public PassHours:F

.field public PassPrice:I

.field public PublicCount:I

.field public RegionDenyAnonymous:Z

.field public RegionDenyIdentified:Z

.field public RegionDenyTransacted:Z

.field public RegionPushOverride:Z

.field public RentPrice:I

.field public RequestResult:I

.field public SalePrice:I

.field public SelectedPrims:I

.field public SelfCount:I

.field public SequenceID:I

.field public SimWideMaxPrims:I

.field public SimWideTotalPrims:I

.field public SnapSelection:Z

.field public SnapshotID:Ljava/util/UUID;

.field public Status:I

.field public TotalPrims:I

.field public UserLocation:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public UserLookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
