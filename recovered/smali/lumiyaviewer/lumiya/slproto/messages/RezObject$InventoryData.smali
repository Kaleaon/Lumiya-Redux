.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$InventoryData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InventoryData"
.end annotation


# instance fields
.field public BaseMask:I

.field public CRC:I

.field public CreationDate:I

.field public CreatorID:Ljava/util/UUID;

.field public Description:[B

.field public EveryoneMask:I

.field public Flags:I

.field public FolderID:Ljava/util/UUID;

.field public GroupID:Ljava/util/UUID;

.field public GroupMask:I

.field public GroupOwned:Z

.field public InvType:I

.field public ItemID:Ljava/util/UUID;

.field public Name:[B

.field public NextOwnerMask:I

.field public OwnerID:Ljava/util/UUID;

.field public OwnerMask:I

.field public SalePrice:I

.field public SaleType:I

.field public TransactionID:Ljava/util/UUID;

.field public Type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
