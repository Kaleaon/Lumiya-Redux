.class public final enum Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

.field public static final enum BAKED_EYES:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

.field public static final enum BAKED_HAIR:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

.field public static final enum BAKED_HEAD:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

.field public static final enum BAKED_LOWER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

.field public static final enum BAKED_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

.field public static final enum BAKED_UPPER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;


# instance fields
.field private faceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const-string/jumbo v1, "BAKED_HEAD"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_HEAD_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_HEAD:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const-string/jumbo v1, "BAKED_UPPER"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_UPPER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const-string/jumbo v1, "BAKED_LOWER"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-direct {v0, v1, v6, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_LOWER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const-string/jumbo v1, "BAKED_EYES"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_EYES_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-direct {v0, v1, v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_EYES:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const-string/jumbo v1, "BAKED_SKIRT"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_SKIRT_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-direct {v0, v1, v8, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const-string/jumbo v1, "BAKED_HAIR"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_HAIR_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/4 v3, 0x5

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;-><init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_HAIR:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_HEAD:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_UPPER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_LOWER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_EYES:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    aput-object v1, v0, v8

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_HAIR:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->faceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    return-object v0
.end method


# virtual methods
.method public getFaceIndex()Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->faceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    return-object v0
.end method
