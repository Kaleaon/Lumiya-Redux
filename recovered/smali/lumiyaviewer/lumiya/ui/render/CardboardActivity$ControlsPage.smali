.class final enum Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ControlsPage"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

.field public static final enum pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

.field public static final enum pageDetails:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

.field public static final enum pageObject:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

.field public static final enum pageScriptDialog:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

.field public static final enum pageSpeech:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

.field public static final enum pageTouchAim:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

.field public static final enum pageYesNo:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;


# instance fields
.field final pageViewId:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    const-string/jumbo v1, "pageDefault"

    const v2, 0x7f1000f5

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    const-string/jumbo v1, "pageSpeech"

    const v2, 0x7f10010d

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageSpeech:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    const-string/jumbo v1, "pageTouchAim"

    const v2, 0x7f100101

    invoke-direct {v0, v1, v6, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageTouchAim:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    const-string/jumbo v1, "pageObject"

    const v2, 0x7f100102

    invoke-direct {v0, v1, v7, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageObject:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    const-string/jumbo v1, "pageScriptDialog"

    const v2, 0x7f100112

    invoke-direct {v0, v1, v8, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageScriptDialog:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    const-string/jumbo v1, "pageYesNo"

    const/4 v2, 0x5

    const v3, 0x7f100108

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageYesNo:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    const-string/jumbo v1, "pageDetails"

    const/4 v2, 0x6

    const v3, 0x7f100113

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDetails:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    const/4 v0, 0x7

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageSpeech:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageTouchAim:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageObject:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageScriptDialog:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    aput-object v1, v0, v8

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageYesNo:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDetails:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageViewId:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    return-object v0
.end method
