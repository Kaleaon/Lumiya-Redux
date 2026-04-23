.class public final enum Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_ATTACHMENT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_CALLINGCARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_GESTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_LANDMARK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_LSL:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_MESH:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_NOTECARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_ROOT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_SNAPSHOT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_SOUND:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_TRASH:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field public static final enum IT_WIDGET:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

.field private static final tagMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private readableName:Ljava/lang/String;

.field private stringCode:Ljava/lang/String;

.field private typeCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    const/4 v12, 0x6

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v1, "IT_TEXTURE"

    const-string/jumbo v4, "texture"

    const-string/jumbo v5, "Texture"

    move v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_SOUND"

    const-string/jumbo v7, "sound"

    const-string/jumbo v8, "Sound"

    move v5, v9

    move v6, v9

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_SOUND:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_CALLINGCARD"

    const-string/jumbo v7, "callcard"

    const-string/jumbo v8, "Calling card"

    move v5, v10

    move v6, v10

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_CALLINGCARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_LANDMARK"

    const-string/jumbo v7, "landmark"

    const-string/jumbo v8, "Landmark"

    move v5, v11

    move v6, v11

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_LANDMARK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_OBJECT"

    const-string/jumbo v7, "object"

    const-string/jumbo v8, "Object"

    const/4 v5, 0x4

    move v6, v12

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_NOTECARD"

    const-string/jumbo v7, "notecard"

    const-string/jumbo v8, "Note card"

    const/4 v5, 0x5

    const/4 v6, 0x7

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_NOTECARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_CATEGORY"

    const-string/jumbo v7, "category"

    const-string/jumbo v8, "Folder"

    const/16 v6, 0x8

    move v5, v12

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_ROOT_CATEGORY"

    const-string/jumbo v7, "root"

    const-string/jumbo v8, "Root folder"

    const/4 v5, 0x7

    const/16 v6, 0x9

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_ROOT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_LSL"

    const-string/jumbo v7, "script"

    const-string/jumbo v8, "Script"

    const/16 v5, 0x8

    const/16 v6, 0xa

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_LSL:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_TRASH"

    const-string/jumbo v7, "trash"

    const-string/jumbo v8, "Trash"

    const/16 v5, 0x9

    const/16 v6, 0xe

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_TRASH:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_SNAPSHOT"

    const-string/jumbo v7, "snapshot"

    const-string/jumbo v8, "Snapshot"

    const/16 v5, 0xa

    const/16 v6, 0xf

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_SNAPSHOT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_ATTACHMENT"

    const-string/jumbo v7, "attach"

    const-string/jumbo v8, "Attachment"

    const/16 v5, 0xb

    const/16 v6, 0x11

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_ATTACHMENT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_WEARABLE"

    const-string/jumbo v7, "wearable"

    const-string/jumbo v8, "Wearable"

    const/16 v5, 0xc

    const/16 v6, 0x12

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_ANIMATION"

    const-string/jumbo v7, "animation"

    const-string/jumbo v8, "Animation"

    const/16 v5, 0xd

    const/16 v6, 0x13

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_GESTURE"

    const-string/jumbo v7, "gesture"

    const-string/jumbo v8, "Gesture"

    const/16 v5, 0xe

    const/16 v6, 0x14

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_GESTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_MESH"

    const-string/jumbo v7, "mesh"

    const-string/jumbo v8, "Mesh"

    const/16 v5, 0xf

    const/16 v6, 0x16

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_MESH:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_WIDGET"

    const-string/jumbo v7, "widget"

    const-string/jumbo v8, "Widget"

    const/16 v5, 0x10

    const/16 v6, 0x17

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WIDGET:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const-string/jumbo v4, "IT_UNKNOWN"

    const-string/jumbo v7, "unknown"

    const-string/jumbo v8, "Unknown"

    const/16 v5, 0x11

    const/4 v6, -0x1

    invoke-direct/range {v3 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v0, 0x12

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_SOUND:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    aput-object v1, v0, v9

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_CALLINGCARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    aput-object v1, v0, v10

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_LANDMARK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    aput-object v1, v0, v11

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/4 v3, 0x4

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_NOTECARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/4 v3, 0x5

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    aput-object v1, v0, v12

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_ROOT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/4 v3, 0x7

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_LSL:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v3, 0x8

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_TRASH:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v3, 0x9

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_SNAPSHOT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v3, 0xa

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_ATTACHMENT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v3, 0xb

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WEARABLE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v3, 0xc

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v3, 0xd

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_GESTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v3, 0xe

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_MESH:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v3, 0xf

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_WIDGET:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v3, 0x10

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    const/16 v3, 0x11

    aput-object v1, v0, v3

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    new-instance v0, Ljava/util/HashMap;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    move-result-object v1

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->tagMap:Ljava/util/Map;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    move-result-object v0

    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->tagMap:Ljava/util/Map;

    iget-object v5, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->stringCode:Ljava/lang/String;

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->typeCode:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->stringCode:Ljava/lang/String;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->readableName:Ljava/lang/String;

    return-void
.end method

.method public static getByString(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->tagMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    :cond_0
    return-object v0
.end method

.method public static getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;
    .locals 5

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    move-result-object v1

    const/4 v0, 0x0

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, v1, v0

    iget v4, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->typeCode:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    return-object v0
.end method


# virtual methods
.method public getReadableName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->readableName:Ljava/lang/String;

    return-object v0
.end method

.method public getStringCode()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->stringCode:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->typeCode:I

    return v0
.end method
