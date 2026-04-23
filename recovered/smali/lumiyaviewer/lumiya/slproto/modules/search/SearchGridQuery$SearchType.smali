.class public final enum Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SearchType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

.field public static final enum Groups:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

.field public static final enum People:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

.field public static final enum Places:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    const-string/jumbo v1, "People"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->People:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    const-string/jumbo v1, "Groups"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Groups:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    const-string/jumbo v1, "Places"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Places:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->People:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Groups:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Places:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    return-object v0
.end method
