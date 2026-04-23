.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WornItem"
.end annotation


# instance fields
.field private final attachedTo:I

.field private final isTouchable:Z

.field private final itemID:Ljava/util/UUID;

.field private final name:Ljava/lang/String;

.field private final objectLocalID:I

.field private final wornOn:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->objectLocalID:I

    return v0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;ILjava/util/UUID;Ljava/lang/String;IZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->wornOn:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->attachedTo:I

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->itemID:Ljava/util/UUID;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->name:Ljava/lang/String;

    iput p5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->objectLocalID:I

    iput-boolean p6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->isTouchable:Z

    return-void
.end method


# virtual methods
.method getAttachedTo()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->attachedTo:I

    return v0
.end method

.method public getIsTouchable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->isTouchable:Z

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getObjectLocalID()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->objectLocalID:I

    return v0
.end method

.method public getWornOn()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->wornOn:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    return-object v0
.end method

.method public itemID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->itemID:Ljava/util/UUID;

    return-object v0
.end method
