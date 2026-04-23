.class public final enum Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

.field public static final enum Asset:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

.field public static final enum Lowest:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

.field public static final enum PrimInvisible:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

.field public static final enum PrimVisibleClose:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

.field public static final enum PrimVisibleFar:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

.field public static final enum PrimVisibleMedium:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

.field public static final enum Sculpt:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

.field public static final enum Terrain:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const-string/jumbo v1, "Asset"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Asset:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const-string/jumbo v1, "Sculpt"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Sculpt:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const-string/jumbo v1, "PrimVisibleClose"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimVisibleClose:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const-string/jumbo v1, "PrimVisibleMedium"

    invoke-direct {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimVisibleMedium:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const-string/jumbo v1, "Terrain"

    invoke-direct {v0, v1, v7}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Terrain:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const-string/jumbo v1, "PrimVisibleFar"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimVisibleFar:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const-string/jumbo v1, "PrimInvisible"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimInvisible:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const-string/jumbo v1, "Lowest"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Lowest:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const/16 v0, 0x8

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Asset:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Sculpt:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimVisibleClose:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimVisibleMedium:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Terrain:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimVisibleFar:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->PrimInvisible:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->Lowest:Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->$VALUES:[Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->$VALUES:[Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    return-object v0
.end method
