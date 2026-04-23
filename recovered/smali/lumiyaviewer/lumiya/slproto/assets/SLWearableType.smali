.class public final enum Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_ALPHA:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_EYES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_GLOVES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_HAIR:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_JACKET:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_PANTS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_PHYSICS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_SHAPE:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_SHIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_SHOES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_SKIN:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_SOCKS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_TATTOO:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_UNDERPANTS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

.field public static final enum WT_UNDERSHIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;


# instance fields
.field private assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field private isCritical:Z

.field private name:Ljava/lang/String;

.field private typeCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    const/4 v15, 0x4

    const/4 v14, 0x3

    const/4 v13, 0x2

    const/4 v5, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v1, "WT_SHAPE"

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v6, "Shape"

    move v3, v2

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SHAPE:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v4, "WT_SKIN"

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v9, "Skin"

    move v6, v5

    move v8, v5

    invoke-direct/range {v3 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SKIN:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_HAIR"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Hair"

    move v8, v13

    move v9, v13

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_HAIR:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_EYES"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Eyes"

    move v8, v14

    move v9, v14

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_EYES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_SHIRT"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Shirt"

    move v8, v15

    move v9, v15

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SHIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_PANTS"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Pants"

    const/4 v8, 0x5

    const/4 v9, 0x5

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_PANTS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_SHOES"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Shoes"

    const/4 v8, 0x6

    const/4 v9, 0x6

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SHOES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_SOCKS"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Socks"

    const/4 v8, 0x7

    const/4 v9, 0x7

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SOCKS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_JACKET"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Jacket"

    const/16 v8, 0x8

    const/16 v9, 0x8

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_JACKET:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_GLOVES"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Gloves"

    const/16 v8, 0x9

    const/16 v9, 0x9

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_GLOVES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_UNDERSHIRT"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Undershirt"

    const/16 v8, 0xa

    const/16 v9, 0xa

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_UNDERSHIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_UNDERPANTS"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Underpants"

    const/16 v8, 0xb

    const/16 v9, 0xb

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_UNDERPANTS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_SKIRT"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Skirt"

    const/16 v8, 0xc

    const/16 v9, 0xc

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_ALPHA"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Alpha"

    const/16 v8, 0xd

    const/16 v9, 0xd

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_ALPHA:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_TATTOO"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Tattoo"

    const/16 v8, 0xe

    const/16 v9, 0xe

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_TATTOO:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const-string/jumbo v7, "WT_PHYSICS"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v12, "Physics"

    const/16 v8, 0xf

    const/16 v9, 0xf

    move v11, v2

    invoke-direct/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;-><init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V

    sput-object v6, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_PHYSICS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v0, 0x10

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SHAPE:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SKIN:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_HAIR:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    aput-object v1, v0, v13

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_EYES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    aput-object v1, v0, v14

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SHIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    aput-object v1, v0, v15

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_PANTS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SHOES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SOCKS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_JACKET:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_GLOVES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_UNDERSHIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_UNDERPANTS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_ALPHA:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_TATTOO:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_PHYSICS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;ZLjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->typeCode:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isCritical:Z

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->name:Ljava/lang/String;

    return-void
.end method

.method public static getByCode(I)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;
    .locals 5

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->values()[Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v1

    const/4 v0, 0x0

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, v1, v0

    iget v4, v3, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->typeCode:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    return-object v0
.end method


# virtual methods
.method public getAssetType()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    return-object v0
.end method

.method public getIsCritical()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isCritical:Z

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->typeCode:I

    return v0
.end method

.method public isBodyPart()Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
