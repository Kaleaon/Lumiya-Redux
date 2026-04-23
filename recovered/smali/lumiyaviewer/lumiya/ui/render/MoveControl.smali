.class public final enum Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

.field public static final enum Backward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

.field public static final enum Forward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

.field public static final enum Left:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

.field public static final enum Right:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    const-string/jumbo v1, "Forward"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Forward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    const-string/jumbo v1, "Backward"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Backward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    const-string/jumbo v1, "Left"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Left:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    const-string/jumbo v1, "Right"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Right:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Forward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Backward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Left:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Right:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    aput-object v1, v0, v5

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    return-object v0
.end method
