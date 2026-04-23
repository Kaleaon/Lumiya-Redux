.class public final enum Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_APP_SETTINGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_CACHE:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_CHARACTER:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_CHAT_LOGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_DEFAULT_SKIN:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_EXECUTABLE:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_FONTS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_HELP:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_LOCAL_ASSETS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_LOGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_NONE:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_PER_ACCOUNT_CHAT_LOGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_PER_SL_ACCOUNT:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_SKINS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_TEMP:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_TOP_SKIN:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_USER_SETTINGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

.field public static final enum LL_PATH_USER_SKIN:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;


# instance fields
.field private code:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_NONE"

    invoke-direct {v0, v1, v4, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_NONE:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_USER_SETTINGS"

    invoke-direct {v0, v1, v5, v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_USER_SETTINGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_APP_SETTINGS"

    invoke-direct {v0, v1, v6, v6}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_APP_SETTINGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_PER_SL_ACCOUNT"

    invoke-direct {v0, v1, v7, v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_PER_SL_ACCOUNT:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_CACHE"

    invoke-direct {v0, v1, v8, v8}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_CACHE:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_CHARACTER"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_CHARACTER:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_HELP"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_HELP:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_LOGS"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_LOGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_TEMP"

    const/16 v2, 0x8

    const/16 v3, 0x8

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_TEMP:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_SKINS"

    const/16 v2, 0x9

    const/16 v3, 0x9

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_SKINS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_TOP_SKIN"

    const/16 v2, 0xa

    const/16 v3, 0xa

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_TOP_SKIN:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_CHAT_LOGS"

    const/16 v2, 0xb

    const/16 v3, 0xb

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_CHAT_LOGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_PER_ACCOUNT_CHAT_LOGS"

    const/16 v2, 0xc

    const/16 v3, 0xc

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_PER_ACCOUNT_CHAT_LOGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_USER_SKIN"

    const/16 v2, 0xd

    const/16 v3, 0xe

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_USER_SKIN:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_LOCAL_ASSETS"

    const/16 v2, 0xe

    const/16 v3, 0xf

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_LOCAL_ASSETS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_EXECUTABLE"

    const/16 v2, 0xf

    const/16 v3, 0x10

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_EXECUTABLE:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_DEFAULT_SKIN"

    const/16 v2, 0x10

    const/16 v3, 0x11

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_DEFAULT_SKIN:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const-string/jumbo v1, "LL_PATH_FONTS"

    const/16 v2, 0x11

    const/16 v3, 0x12

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_FONTS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/16 v0, 0x12

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_NONE:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_USER_SETTINGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_APP_SETTINGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_PER_SL_ACCOUNT:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_CACHE:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    aput-object v1, v0, v8

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_CHARACTER:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_HELP:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_LOGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_TEMP:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_SKINS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_TOP_SKIN:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_CHAT_LOGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_PER_ACCOUNT_CHAT_LOGS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_USER_SKIN:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_LOCAL_ASSETS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_EXECUTABLE:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_DEFAULT_SKIN:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->LL_PATH_FONTS:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->code:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;

    return-object v0
.end method


# virtual methods
.method public getCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;->code:I

    return v0
.end method
