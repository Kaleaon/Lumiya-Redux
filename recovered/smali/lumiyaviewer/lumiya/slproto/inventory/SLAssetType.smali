.class public final enum Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_CALLINGCARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_GESTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_IMAGE_JPEG:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_IMAGE_TGA:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_LANDMARK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_LSL_BYTECODE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_LSL_TEXT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_MESH:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_NOTECARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_SCRIPT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_SIMSTATE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_SOUND:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_SOUND_WAV:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_TEXTURE_TGA:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field public static final enum AT_WIDGET:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field private static final tagMap:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final actionDescription:I

.field private final drawableResource:I

.field private final invType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field private final specialFolderType:I

.field private final stringCode:Ljava/lang/String;

.field private final typeCode:I

.field private final typeDescription:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_TEXTURE"

    const-string/jumbo v4, "texture"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    const v7, 0x7f0200c2

    const v8, 0x7f090075

    const v9, 0x7f090050

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_SOUND"

    const-string/jumbo v4, "sound"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_SOUND:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/4 v2, 0x1

    const/4 v3, 0x1

    const/4 v6, 0x1

    const v7, 0x7f0200ca

    const v8, 0x7f090074

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SOUND:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_CALLINGCARD"

    const-string/jumbo v4, "callcard"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_CALLINGCARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/4 v2, 0x2

    const/4 v3, 0x2

    const/4 v6, 0x2

    const v7, 0x7f0200cd

    const v8, 0x7f090065

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CALLINGCARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_LANDMARK"

    const-string/jumbo v4, "landmark"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_LANDMARK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/4 v2, 0x3

    const/4 v3, 0x3

    const/4 v6, 0x3

    const v7, 0x7f0200c3

    const v8, 0x7f090069

    const v9, 0x7f09004f

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LANDMARK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_SCRIPT"

    const-string/jumbo v4, "script"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_LSL:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/4 v2, 0x4

    const/4 v3, 0x4

    const/16 v6, 0xa

    const v7, 0x7f0200c8

    const v8, 0x7f090071

    const v9, 0x7f09004d

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SCRIPT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_CLOTHING"

    const-string/jumbo v4, "clothing"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/4 v2, 0x5

    const/4 v3, 0x5

    const/4 v6, 0x5

    const v7, 0x7f0200bf

    const v8, 0x7f090066

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_OBJECT"

    const-string/jumbo v4, "object"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/4 v2, 0x6

    const/4 v3, 0x6

    const/4 v6, 0x6

    const v7, 0x7f0200c6

    const v8, 0x7f09006f

    const v9, 0x7f09004e

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_NOTECARD"

    const-string/jumbo v4, "notecard"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_NOTECARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/4 v2, 0x7

    const/4 v3, 0x7

    const/4 v6, 0x7

    const v7, 0x7f0200c5

    const v8, 0x7f09006e

    const v9, 0x7f09004d

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_NOTECARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_CATEGORY"

    const-string/jumbo v4, "category"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0x8

    const/16 v3, 0x8

    const/4 v6, -0x1

    const v7, 0x7f0200c0

    const v8, 0x7f090067

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_LSL_TEXT"

    const-string/jumbo v4, "lsltext"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_LSL:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0x9

    const/16 v3, 0xa

    const/16 v6, 0xa

    const v7, 0x7f0200c8

    const v8, 0x7f09006c

    const v9, 0x7f09004d

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LSL_TEXT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_LSL_BYTECODE"

    const-string/jumbo v4, "lslbyte"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_LSL:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0xa

    const/16 v3, 0xb

    const/16 v6, 0xa

    const v7, 0x7f0200c8

    const v8, 0x7f09006d

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LSL_BYTECODE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_TEXTURE_TGA"

    const-string/jumbo v4, "txtr_tga"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0xb

    const/16 v3, 0xc

    const/4 v6, 0x0

    const v7, 0x7f0200c2

    const v8, 0x7f090076

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_TEXTURE_TGA:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_BODYPART"

    const-string/jumbo v4, "bodypart"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0xc

    const/16 v3, 0xd

    const/16 v6, 0xd

    const v7, 0x7f0200c1

    const v8, 0x7f090064

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_SOUND_WAV"

    const-string/jumbo v4, "snd_wav"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_SOUND:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0xd

    const/16 v3, 0x11

    const/4 v6, 0x1

    const v7, 0x7f0200ca

    const v8, 0x7f090074

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SOUND_WAV:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_IMAGE_TGA"

    const-string/jumbo v4, "img_tga"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0xe

    const/16 v3, 0x12

    const/4 v6, 0x0

    const v7, 0x7f0200c2

    const v8, 0x7f090076

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_IMAGE_TGA:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_IMAGE_JPEG"

    const-string/jumbo v4, "jpeg"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0xf

    const/16 v3, 0x13

    const/4 v6, 0x0

    const v7, 0x7f0200c2

    const v8, 0x7f090075

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_IMAGE_JPEG:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_ANIMATION"

    const-string/jumbo v4, "animatn"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0x10

    const/16 v3, 0x14

    const/16 v6, 0x14

    const v7, 0x7f0200bd

    const v8, 0x7f090062

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_GESTURE"

    const-string/jumbo v4, "gesture"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_GESTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0x11

    const/16 v3, 0x15

    const/16 v6, 0x15

    const v7, 0x7f0200c9

    const v8, 0x7f090068

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_GESTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_SIMSTATE"

    const-string/jumbo v4, "simstate"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0x12

    const/16 v3, 0x16

    const/4 v6, 0x6

    const v7, 0x7f0200c8

    const v8, 0x7f090072

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SIMSTATE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_LINK"

    const-string/jumbo v4, "link"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0x13

    const/16 v3, 0x18

    const/4 v6, 0x6

    const v7, 0x7f0200c4

    const v8, 0x7f09006a

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_LINK_FOLDER"

    const-string/jumbo v4, "link_f"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0x14

    const/16 v3, 0x19

    const/4 v6, 0x6

    const v7, 0x7f0200c4

    const v8, 0x7f09006a

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_MESH"

    const-string/jumbo v4, "mesh"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_MESH:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0x15

    const/16 v3, 0x31

    const/4 v6, 0x6

    const v7, 0x7f0200c6

    const v8, 0x7f09006f

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_MESH:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_WIDGET"

    const-string/jumbo v4, "widget"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WIDGET:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0x16

    const/16 v3, 0x28

    const/4 v6, 0x6

    const v7, 0x7f0200c6

    const v8, 0x7f09006f

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_WIDGET:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const-string/jumbo v1, "AT_UNKNOWN"

    const-string/jumbo v4, "unknown"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v2, 0x17

    const/4 v3, -0x1

    const/4 v6, -0x1

    const/4 v7, -0x1

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-direct/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;-><init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v0, 0x18

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SOUND:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CALLINGCARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LANDMARK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SCRIPT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_NOTECARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LSL_TEXT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LSL_BYTECODE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_TEXTURE_TGA:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SOUND_WAV:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_IMAGE_TGA:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_IMAGE_JPEG:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_GESTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SIMSTATE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_MESH:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_WIDGET:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v2

    const/4 v0, 0x0

    array-length v3, v2

    :goto_0
    if-ge v0, v3, :cond_0

    aget-object v4, v2, v0

    iget-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->stringCode:Ljava/lang/String;

    invoke-virtual {v1, v5, v4}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->tagMap:Lcom/google/common/collect/ImmutableMap;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;IIII)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->typeCode:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->stringCode:Ljava/lang/String;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->invType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    iput p6, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->specialFolderType:I

    iput p7, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->drawableResource:I

    iput p8, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->typeDescription:I

    iput p9, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->actionDescription:I

    return-void
.end method

.method public static getByString(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->tagMap:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, p0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    :cond_0
    return-object v0
.end method

.method public static getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
    .locals 5

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v1

    const/4 v0, 0x0

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, v1, v0

    iget v4, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->typeCode:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    return-object v0
.end method


# virtual methods
.method public getActionDescription()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->actionDescription:I

    return v0
.end method

.method public getDrawableResource()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->drawableResource:I

    return v0
.end method

.method public getInventoryType()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->invType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    return-object v0
.end method

.method public getSpecialFolderType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->specialFolderType:I

    return v0
.end method

.method public getStringCode()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->stringCode:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->typeCode:I

    return v0
.end method

.method public getTypeDescription()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->typeDescription:I

    return v0
.end method
