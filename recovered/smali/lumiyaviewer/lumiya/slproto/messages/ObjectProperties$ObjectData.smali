.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectData"
.end annotation


# instance fields
.field public AggregatePermTextures:I

.field public AggregatePermTexturesOwner:I

.field public AggregatePerms:I

.field public BaseMask:I

.field public Category:I

.field public CreationDate:J

.field public CreatorID:Ljava/util/UUID;

.field public Description:[B

.field public EveryoneMask:I

.field public FolderID:Ljava/util/UUID;

.field public FromTaskID:Ljava/util/UUID;

.field public GroupID:Ljava/util/UUID;

.field public GroupMask:I

.field public InventorySerial:I

.field public ItemID:Ljava/util/UUID;

.field public LastOwnerID:Ljava/util/UUID;

.field public Name:[B

.field public NextOwnerMask:I

.field public ObjectID:Ljava/util/UUID;

.field public OwnerID:Ljava/util/UUID;

.field public OwnerMask:I

.field public OwnershipCost:I

.field public SalePrice:I

.field public SaleType:I

.field public SitName:[B

.field public TextureID:[B

.field public TouchName:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
