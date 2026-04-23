.class public final enum Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/GlobalOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MeshRendering"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

.field public static final enum disabled:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

.field public static final enum high:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

.field public static final enum low:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

.field public static final enum lowest:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

.field public static final enum medium:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;


# instance fields
.field private lodName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    const-string/jumbo v1, "high"

    const-string/jumbo v2, "high_lod"

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->high:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    new-instance v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    const-string/jumbo v1, "medium"

    const-string/jumbo v2, "medium_lod"

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->medium:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    new-instance v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    const-string/jumbo v1, "low"

    const-string/jumbo v2, "low_lod"

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->low:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    new-instance v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    const-string/jumbo v1, "lowest"

    const-string/jumbo v2, "lowest_lod"

    invoke-direct {v0, v1, v6, v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->lowest:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    new-instance v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    const-string/jumbo v1, "disabled"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v7, v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->disabled:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    sget-object v1, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->high:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->medium:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->low:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->lowest:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->disabled:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    aput-object v1, v0, v7

    sput-object v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->$VALUES:[Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->lodName:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->$VALUES:[Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    return-object v0
.end method


# virtual methods
.method public getLODName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->lodName:Ljava/lang/String;

    return-object v0
.end method
