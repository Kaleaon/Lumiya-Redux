.class public final enum Lcom/lumiyaviewer/lumiya/utils/LEDAction;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/utils/LEDAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/utils/LEDAction;

.field public static final enum Always:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

.field public static final enum Fast:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

.field public static final enum None:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

.field public static final enum Slow:Lcom/lumiyaviewer/lumiya/utils/LEDAction;


# instance fields
.field private preferenceValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    const-string/jumbo v1, "None"

    const-string/jumbo v2, "none"

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->None:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    const-string/jumbo v1, "Slow"

    const-string/jumbo v2, "slow"

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->Slow:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    const-string/jumbo v1, "Fast"

    const-string/jumbo v2, "fast"

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->Fast:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    const-string/jumbo v1, "Always"

    const-string/jumbo v2, "always"

    invoke-direct {v0, v1, v6, v2}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->Always:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->None:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->Slow:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->Fast:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->Always:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    aput-object v1, v0, v6

    sput-object v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->$VALUES:[Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->preferenceValue:Ljava/lang/String;

    return-void
.end method

.method public static getByPreferenceString(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/LEDAction;
    .locals 2

    const/4 v0, 0x0

    :goto_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->values()[Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->values()[Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    move-result-object v1

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->preferenceValue:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->values()[Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    move-result-object v1

    aget-object v0, v1, v0

    return-object v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->None:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/LEDAction;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/utils/LEDAction;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->$VALUES:[Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    return-object v0
.end method
