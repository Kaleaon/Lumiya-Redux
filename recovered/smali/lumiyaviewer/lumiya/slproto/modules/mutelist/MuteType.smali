.class public final enum Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

.field public static final enum AGENT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

.field public static final enum BY_NAME:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

.field public static final enum EXTERNAL:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

.field public static final enum GROUP:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

.field public static final enum OBJECT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;


# instance fields
.field private viewOrder:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    const-string/jumbo v1, "BY_NAME"

    invoke-direct {v0, v1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->BY_NAME:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    const-string/jumbo v1, "AGENT"

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->AGENT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    const-string/jumbo v1, "OBJECT"

    invoke-direct {v0, v1, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->OBJECT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    const-string/jumbo v1, "GROUP"

    invoke-direct {v0, v1, v5, v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->GROUP:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    const-string/jumbo v1, "EXTERNAL"

    invoke-direct {v0, v1, v6, v6}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->EXTERNAL:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->BY_NAME:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->AGENT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->OBJECT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->GROUP:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->EXTERNAL:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->viewOrder:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    return-object v0
.end method


# virtual methods
.method public getViewOrder()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->viewOrder:I

    return v0
.end method
