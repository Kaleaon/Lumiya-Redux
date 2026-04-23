.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectData"
.end annotation


# instance fields
.field public BaseMask:I

.field public Category:I

.field public Description:[B

.field public EveryoneMask:I

.field public GroupID:Ljava/util/UUID;

.field public GroupMask:I

.field public LastOwnerID:Ljava/util/UUID;

.field public Name:[B

.field public NextOwnerMask:I

.field public ObjectID:Ljava/util/UUID;

.field public OwnerID:Ljava/util/UUID;

.field public OwnerMask:I

.field public OwnershipCost:I

.field public RequestFlags:I

.field public SalePrice:I

.field public SaleType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
