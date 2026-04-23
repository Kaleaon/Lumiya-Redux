.class public abstract Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
.super Ljava/lang/Object;


# static fields
.field public static final AttributeAll:I = -0x1

.field static final AttributeGlow:I = 0x200

.field static final AttributeMaterial:I = 0x80

.field static final AttributeMedia:I = 0x100

.field static final AttributeOffsetU:I = 0x10

.field static final AttributeOffsetV:I = 0x20

.field static final AttributeRGBA:I = 0x2

.field static final AttributeRepeatU:I = 0x4

.field static final AttributeRepeatV:I = 0x8

.field static final AttributeRotation:I = 0x40

.field static final AttributeTextureID:I = 0x1

.field private static final pool:Lcom/lumiyaviewer/lumiya/utils/InternPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/InternPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/InternPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->pool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
    .locals 13

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    sget-object v12, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->pool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->textureID:Ljava/util/UUID;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->rgba:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->repeatU:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->repeatV:F

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->offsetU:F

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->offsetV:F

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->rotation:F

    iget v8, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->glow:F

    iget-byte v9, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->materialb:B

    iget-byte v10, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->mediab:B

    iget v11, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->hasAttribute:I

    invoke-direct/range {v0 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;-><init>(Ljava/util/UUID;IFFFFFFBBI)V

    invoke-virtual {v12, v0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    return-object v0
.end method


# virtual methods
.method public final getGlow(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hasAttribute()I

    move-result v0

    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->glow()F

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->glow()F

    move-result v0

    goto :goto_0
.end method

.method public final getMaterial(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)B
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hasAttribute()I

    move-result v0

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->materialb()B

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->materialb()B

    move-result v0

    goto :goto_0
.end method

.method public final getMedia(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)B
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hasAttribute()I

    move-result v0

    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->mediab()B

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->mediab()B

    move-result v0

    goto :goto_0
.end method

.method public final getOffsetU(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hasAttribute()I

    move-result v0

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->offsetU()F

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->offsetU()F

    move-result v0

    goto :goto_0
.end method

.method public final getOffsetV(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hasAttribute()I

    move-result v0

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->offsetV()F

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->offsetV()F

    move-result v0

    goto :goto_0
.end method

.method public final getRGBA(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)I
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hasAttribute()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->rgba()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->rgba()I

    move-result v0

    goto :goto_0
.end method

.method public final getRepeatU(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hasAttribute()I

    move-result v0

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->repeatU()F

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->repeatU()F

    move-result v0

    goto :goto_0
.end method

.method public final getRepeatV(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hasAttribute()I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->repeatV()F

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->repeatV()F

    move-result v0

    goto :goto_0
.end method

.method public final getRotation(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hasAttribute()I

    move-result v0

    and-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->rotation()F

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->rotation()F

    move-result v0

    goto :goto_0
.end method

.method public final getTextureID(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)Ljava/util/UUID;
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hasAttribute()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->textureID()Ljava/util/UUID;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->textureID()Ljava/util/UUID;

    move-result-object v0

    goto :goto_0
.end method

.method public abstract glow()F
.end method

.method public abstract hasAttribute()I
.end method

.method public abstract materialb()B
.end method

.method public abstract mediab()B
.end method

.method public abstract offsetU()F
.end method

.method public abstract offsetV()F
.end method

.method public abstract repeatU()F
.end method

.method public abstract repeatV()F
.end method

.method public abstract rgba()I
.end method

.method public abstract rotation()F
.end method

.method public abstract textureID()Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method
