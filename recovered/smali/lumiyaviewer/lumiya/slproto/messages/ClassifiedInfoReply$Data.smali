.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply$Data;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Data"
.end annotation


# instance fields
.field public Category:I

.field public ClassifiedFlags:I

.field public ClassifiedID:Ljava/util/UUID;

.field public CreationDate:I

.field public CreatorID:Ljava/util/UUID;

.field public Desc:[B

.field public ExpirationDate:I

.field public Name:[B

.field public ParcelID:Ljava/util/UUID;

.field public ParcelName:[B

.field public ParentEstate:I

.field public PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

.field public PriceForListing:I

.field public SimName:[B

.field public SnapshotID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
