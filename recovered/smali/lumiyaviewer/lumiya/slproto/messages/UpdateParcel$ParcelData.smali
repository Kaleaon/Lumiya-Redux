.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParcelData"
.end annotation


# instance fields
.field public ActualArea:I

.field public AllowPublish:Z

.field public AuthorizedBuyerID:Ljava/util/UUID;

.field public BillableArea:I

.field public Category:I

.field public Description:[B

.field public GroupOwned:Z

.field public IsForSale:Z

.field public MaturePublish:Z

.field public MusicURL:[B

.field public Name:[B

.field public OwnerID:Ljava/util/UUID;

.field public ParcelID:Ljava/util/UUID;

.field public RegionHandle:J

.field public RegionX:F

.field public RegionY:F

.field public SalePrice:I

.field public ShowDir:Z

.field public SnapshotID:Ljava/util/UUID;

.field public Status:I

.field public UserLocation:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
