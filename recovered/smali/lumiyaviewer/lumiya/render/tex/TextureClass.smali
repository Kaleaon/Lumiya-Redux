.class public final enum Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

.field public static final enum Asset:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

.field public static final enum Baked:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

.field public static final enum Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

.field public static final enum Sculpt:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

.field public static final enum Terrain:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;


# instance fields
.field private final storePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    const-string/jumbo v1, "Prim"

    const-string/jumbo v2, "textures"

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    const-string/jumbo v1, "Sculpt"

    const-string/jumbo v2, "sculpt"

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Sculpt:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    const-string/jumbo v1, "Baked"

    const-string/jumbo v2, "baked"

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Baked:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    const-string/jumbo v1, "Asset"

    const-string/jumbo v2, "asset"

    invoke-direct {v0, v1, v6, v2}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Asset:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    const-string/jumbo v1, "Terrain"

    const-string/jumbo v2, "terrain"

    invoke-direct {v0, v1, v7, v2}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Terrain:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Sculpt:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Baked:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Asset:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Terrain:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    aput-object v1, v0, v7

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->$VALUES:[Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->storePath:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->$VALUES:[Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    return-object v0
.end method


# virtual methods
.method public final getStorePath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->storePath:Ljava/lang/String;

    return-object v0
.end method
