.class public final enum Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

.field public static final enum Error:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

.field public static final enum Idle:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

.field public static final enum Loaded:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

.field public static final enum Loading:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    const-string/jumbo v1, "Idle"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Idle:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    const-string/jumbo v1, "Loading"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loading:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    const-string/jumbo v1, "Loaded"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loaded:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    const-string/jumbo v1, "Error"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Error:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Idle:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loading:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loaded:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Error:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    aput-object v1, v0, v5

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    return-object v0
.end method
