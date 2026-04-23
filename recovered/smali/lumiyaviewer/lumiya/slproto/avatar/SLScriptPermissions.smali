.class public final enum Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

.field public static final enum SCRIPT_PERMISSION_ATTACH:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

.field public static final enum SCRIPT_PERMISSION_CHANGE_JOINTS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

.field public static final enum SCRIPT_PERMISSION_CHANGE_LINKS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

.field public static final enum SCRIPT_PERMISSION_CHANGE_PERMISSIONS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

.field public static final enum SCRIPT_PERMISSION_CONTROL_CAMERA:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

.field public static final enum SCRIPT_PERMISSION_DEBIT:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

.field public static final enum SCRIPT_PERMISSION_RELEASE_OWNERSHIP:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

.field public static final enum SCRIPT_PERMISSION_REMAP_CONTROLS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

.field public static final enum SCRIPT_PERMISSION_TAKE_CONTROLS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

.field public static final enum SCRIPT_PERMISSION_TRACK_CAMERA:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

.field public static final enum SCRIPT_PERMISSION_TRIGGER_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;


# instance fields
.field private message:Ljava/lang/String;

.field private permMask:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/16 v7, 0x8

    const/4 v6, 0x4

    const/4 v5, 0x2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const-string/jumbo v1, "SCRIPT_PERMISSION_DEBIT"

    const-string/jumbo v2, "take Linden dollars (L$) from you"

    invoke-direct {v0, v1, v8, v5, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_DEBIT:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const-string/jumbo v1, "SCRIPT_PERMISSION_TAKE_CONTROLS"

    const-string/jumbo v2, "act on your control inputs"

    invoke-direct {v0, v1, v9, v6, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_TAKE_CONTROLS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const-string/jumbo v1, "SCRIPT_PERMISSION_REMAP_CONTROLS"

    const-string/jumbo v2, "remap your control inputs"

    invoke-direct {v0, v1, v5, v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_REMAP_CONTROLS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const-string/jumbo v1, "SCRIPT_PERMISSION_TRIGGER_ANIMATION"

    const-string/jumbo v2, "animate your avatar"

    const/4 v3, 0x3

    const/16 v4, 0x10

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_TRIGGER_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const-string/jumbo v1, "SCRIPT_PERMISSION_ATTACH"

    const-string/jumbo v2, "attach to your avatar"

    const/16 v3, 0x20

    invoke-direct {v0, v1, v6, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_ATTACH:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const-string/jumbo v1, "SCRIPT_PERMISSION_RELEASE_OWNERSHIP"

    const-string/jumbo v2, "release ownership and become public"

    const/4 v3, 0x5

    const/16 v4, 0x40

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_RELEASE_OWNERSHIP:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const-string/jumbo v1, "SCRIPT_PERMISSION_CHANGE_LINKS"

    const-string/jumbo v2, "link and delink from other objects"

    const/4 v3, 0x6

    const/16 v4, 0x80

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_CHANGE_LINKS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const-string/jumbo v1, "SCRIPT_PERMISSION_CHANGE_JOINTS"

    const-string/jumbo v2, "add and remove joints with other objects"

    const/4 v3, 0x7

    const/16 v4, 0x100

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_CHANGE_JOINTS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const-string/jumbo v1, "SCRIPT_PERMISSION_CHANGE_PERMISSIONS"

    const-string/jumbo v2, "change its permissions"

    const/16 v3, 0x200

    invoke-direct {v0, v1, v7, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_CHANGE_PERMISSIONS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const-string/jumbo v1, "SCRIPT_PERMISSION_TRACK_CAMERA"

    const-string/jumbo v2, "track your camera"

    const/16 v3, 0x9

    const/16 v4, 0x400

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_TRACK_CAMERA:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const-string/jumbo v1, "SCRIPT_PERMISSION_CONTROL_CAMERA"

    const-string/jumbo v2, "control your camera"

    const/16 v3, 0xa

    const/16 v4, 0x800

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_CONTROL_CAMERA:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const/16 v0, 0xb

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_DEBIT:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    aput-object v1, v0, v8

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_TAKE_CONTROLS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    aput-object v1, v0, v9

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_REMAP_CONTROLS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_TRIGGER_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_ATTACH:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_RELEASE_OWNERSHIP:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_CHANGE_LINKS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_CHANGE_JOINTS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_CHANGE_PERMISSIONS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_TRACK_CAMERA:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->SCRIPT_PERMISSION_CONTROL_CAMERA:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->permMask:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->message:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    return-object v0
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getPermMask()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->permMask:I

    return v0
.end method
