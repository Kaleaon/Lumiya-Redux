.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParcelData"
.end annotation


# instance fields
.field public AuthBuyerID:Ljava/util/UUID;

.field public Category:I

.field public Desc:[B

.field public Flags:I

.field public GroupID:Ljava/util/UUID;

.field public LandingType:I

.field public LocalID:I

.field public MediaAutoScale:I

.field public MediaID:Ljava/util/UUID;

.field public MediaURL:[B

.field public MusicURL:[B

.field public Name:[B

.field public ParcelFlags:I

.field public PassHours:F

.field public PassPrice:I

.field public SalePrice:I

.field public SnapshotID:Ljava/util/UUID;

.field public UserLocation:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public UserLookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
