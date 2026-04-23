.class public Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;
.super Ljava/lang/Object;


# static fields
.field public static final BUMP_MASK:B = 0x1ft

.field public static final FULLBRIGHT_MASK:B = 0x20t

.field public static final MEDIA_MASK:B = 0x1t

.field public static final SHINY_MASK:B = -0x40t

.field public static final TEX_MAP_MASK:B = 0x6t


# instance fields
.field glow:F

.field hasAttribute:I

.field materialb:B

.field mediab:B

.field offsetU:F

.field offsetV:F

.field repeatU:F

.field repeatV:F

.field rgba:I

.field rotation:F

.field textureID:Ljava/util/UUID;


# direct methods
.method public constructor <init>(I)V
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->rgba:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->repeatU:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->repeatV:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->offsetU:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->offsetV:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->rotation:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->glow:F

    iput-byte v3, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->materialb:B

    iput-byte v3, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->mediab:B

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    return-void
.end method


# virtual methods
.method public setGlow(F)V
    .locals 1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->glow:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    or-int/lit16 v0, v0, 0x200

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    return-void
.end method

.method public setMaterial(B)V
    .locals 1

    iput-byte p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->materialb:B

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    or-int/lit16 v0, v0, 0x80

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    return-void
.end method

.method public setMedia(B)V
    .locals 1

    iput-byte p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->mediab:B

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    or-int/lit16 v0, v0, 0x100

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    return-void
.end method

.method public setOffsetU(F)V
    .locals 1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->offsetU:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    return-void
.end method

.method public setOffsetV(F)V
    .locals 1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->offsetV:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    return-void
.end method

.method public setRGBA(I)V
    .locals 1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->rgba:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    return-void
.end method

.method public setRepeatU(F)V
    .locals 1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->repeatU:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    return-void
.end method

.method public setRepeatV(F)V
    .locals 1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->repeatV:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    return-void
.end method

.method public setRotation(F)V
    .locals 1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->rotation:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    return-void
.end method

.method public setTextureID(Ljava/util/UUID;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->textureID:Ljava/util/UUID;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    return-void
.end method
