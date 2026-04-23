.class final enum Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

.field public static final enum pageBalance:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

.field public static final enum pageBlockList:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

.field public static final enum pageOutfits:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

.field public static final enum pageProfile:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;


# instance fields
.field private final titleResource:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    const-string/jumbo v1, "pageProfile"

    const v2, 0x7f0901c7

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageProfile:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    const-string/jumbo v1, "pageOutfits"

    const v2, 0x7f0901c6

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageOutfits:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    const-string/jumbo v1, "pageBlockList"

    const v2, 0x7f090080

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageBlockList:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    const-string/jumbo v1, "pageBalance"

    const/4 v2, -0x1

    invoke-direct {v0, v1, v6, v2}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageBalance:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageProfile:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageOutfits:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageBlockList:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageBalance:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    aput-object v1, v0, v6

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->titleResource:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    return-object v0
.end method


# virtual methods
.method public getTitleResource()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->titleResource:I

    return v0
.end method
