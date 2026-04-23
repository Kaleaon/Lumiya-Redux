.class public final enum Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

.field public static final enum Page3D:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

.field public static final enum PageAppearance:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

.field public static final enum PageCache:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

.field public static final enum PageChat:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

.field public static final enum PageConnection:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

.field public static final enum PageNotifications:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

.field public static final enum PageRLV:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;


# instance fields
.field private final pageResourceId:I

.field private final pageTitle:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    const-string/jumbo v1, "PageConnection"

    const v2, 0x7f070009

    const v3, 0x7f090283

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageConnection:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    const-string/jumbo v1, "PageAppearance"

    const v2, 0x7f070006

    const v3, 0x7f090280

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageAppearance:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    const-string/jumbo v1, "PageChat"

    const v2, 0x7f070008

    const v3, 0x7f090282

    invoke-direct {v0, v1, v7, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageChat:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    const-string/jumbo v1, "PageNotifications"

    const v2, 0x7f07000a

    const v3, 0x7f090284

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageNotifications:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    const-string/jumbo v1, "Page3D"

    const v2, 0x7f070003

    const v3, 0x7f09027e

    invoke-direct {v0, v1, v9, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->Page3D:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    const-string/jumbo v1, "PageRLV"

    const/4 v2, 0x5

    const v3, 0x7f07000e

    const v4, 0x7f090288

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageRLV:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    const-string/jumbo v1, "PageCache"

    const/4 v2, 0x6

    const v3, 0x7f070007

    const v4, 0x7f090281

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageCache:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    const/4 v0, 0x7

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageConnection:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageAppearance:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageChat:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageNotifications:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    aput-object v1, v0, v8

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->Page3D:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    aput-object v1, v0, v9

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageRLV:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageCache:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->pageResourceId:I

    iput p4, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->pageTitle:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    return-object v0
.end method


# virtual methods
.method public getPageResourceId()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->pageResourceId:I

    return v0
.end method

.method public getPageTitle()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->pageTitle:I

    return v0
.end method
