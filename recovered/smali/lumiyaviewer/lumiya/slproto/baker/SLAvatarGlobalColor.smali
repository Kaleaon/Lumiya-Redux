.class public final enum Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

.field public static final enum eye_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

.field public static final enum hair_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

.field public static final enum skin_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;


# instance fields
.field private paramIDs:[I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    const-string/jumbo v1, "skin_color"

    const/16 v2, 0x6f

    const/16 v3, 0x6e

    const/16 v4, 0x6c

    filled-new-array {v2, v3, v4}, [I

    move-result-object v2

    invoke-direct {v0, v1, v6, v2}, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;-><init>(Ljava/lang/String;I[I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->skin_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    const-string/jumbo v1, "hair_color"

    const/16 v2, 0x72

    const/16 v3, 0x71

    const/16 v4, 0x73

    const/16 v5, 0x70

    filled-new-array {v2, v3, v4, v5}, [I

    move-result-object v2

    invoke-direct {v0, v1, v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;-><init>(Ljava/lang/String;I[I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->hair_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    const-string/jumbo v1, "eye_color"

    const/16 v2, 0x63

    const/16 v3, 0x62

    filled-new-array {v2, v3}, [I

    move-result-object v2

    invoke-direct {v0, v1, v8, v2}, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;-><init>(Ljava/lang/String;I[I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->eye_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->skin_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->hair_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->eye_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    aput-object v1, v0, v8

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I[I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->paramIDs:[I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    return-object v0
.end method


# virtual methods
.method public getParamIDs()[I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->paramIDs:[I

    return-object v0
.end method
