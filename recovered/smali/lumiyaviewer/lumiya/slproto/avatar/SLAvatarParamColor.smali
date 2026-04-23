.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;
    }
.end annotation


# instance fields
.field public final colorOperation:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final colorValues:[I
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;[I)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # [I
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorOperation:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorValues:[I

    return-void
.end method

.method public static colorAdd(II)I
    .locals 6

    const/16 v0, 0xff

    and-int/lit16 v1, p0, 0xff

    and-int/lit16 v2, p1, 0xff

    add-int v4, v1, v2

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    add-int v3, v1, v2

    shr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    shr-int/lit8 v2, p1, 0x10

    and-int/lit16 v2, v2, 0xff

    add-int/2addr v2, v1

    shr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    shr-int/lit8 v5, p1, 0x18

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v1, v5

    if-le v4, v0, :cond_0

    move v4, v0

    :cond_0
    if-le v3, v0, :cond_1

    move v3, v0

    :cond_1
    if-le v2, v0, :cond_2

    move v2, v0

    :cond_2
    if-le v1, v0, :cond_3

    :goto_0
    shl-int/lit8 v0, v0, 0x18

    shl-int/lit8 v1, v2, 0x10

    or-int/2addr v0, v1

    shl-int/lit8 v1, v3, 0x8

    or-int/2addr v0, v1

    or-int/2addr v0, v4

    return v0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public static colorLerp(IIF)I
    .locals 12

    const/16 v1, 0xff

    const/4 v0, 0x0

    and-int/lit16 v2, p0, 0xff

    int-to-float v2, v2

    shr-int/lit8 v3, p0, 0x8

    and-int/lit16 v3, v3, 0xff

    int-to-float v3, v3

    shr-int/lit8 v4, p0, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-float v6, v4

    shr-int/lit8 v4, p0, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-float v7, v4

    and-int/lit16 v4, p1, 0xff

    int-to-float v4, v4

    shr-int/lit8 v5, p1, 0x8

    and-int/lit16 v5, v5, 0xff

    int-to-float v8, v5

    shr-int/lit8 v5, p1, 0x10

    and-int/lit16 v5, v5, 0xff

    int-to-float v9, v5

    shr-int/lit8 v5, p1, 0x18

    and-int/lit16 v5, v5, 0xff

    int-to-float v10, v5

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float v11, v5, p2

    mul-float/2addr v2, v11

    mul-float/2addr v4, p2

    add-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v5

    mul-float v2, v11, v3

    mul-float v3, p2, v8

    add-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v4

    mul-float v2, v11, v6

    mul-float v3, p2, v9

    add-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v3

    mul-float v2, v11, v7

    mul-float v6, p2, v10

    add-float/2addr v2, v6

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    if-gez v5, :cond_3

    move v5, v0

    :cond_0
    :goto_0
    if-gez v4, :cond_4

    move v4, v0

    :cond_1
    :goto_1
    if-gez v3, :cond_5

    move v3, v0

    :cond_2
    :goto_2
    if-gez v2, :cond_6

    :goto_3
    shl-int/lit8 v0, v0, 0x18

    shl-int/lit8 v1, v3, 0x10

    or-int/2addr v0, v1

    shl-int/lit8 v1, v4, 0x8

    or-int/2addr v0, v1

    or-int/2addr v0, v5

    return v0

    :cond_3
    if-le v5, v1, :cond_0

    move v5, v1

    goto :goto_0

    :cond_4
    if-le v4, v1, :cond_1

    move v4, v1

    goto :goto_1

    :cond_5
    if-le v3, v1, :cond_2

    move v3, v1

    goto :goto_2

    :cond_6
    if-le v2, v1, :cond_7

    move v0, v1

    goto :goto_3

    :cond_7
    move v0, v2

    goto :goto_3
.end method

.method public static colorMult(II)I
    .locals 7

    const/16 v0, 0xff

    and-int/lit16 v1, p0, 0xff

    and-int/lit16 v2, p1, 0xff

    mul-int/2addr v1, v2

    shr-int/lit8 v2, p0, 0x8

    and-int/lit16 v2, v2, 0xff

    shr-int/lit8 v3, p1, 0x8

    and-int/lit16 v3, v3, 0xff

    mul-int/2addr v2, v3

    shr-int/lit8 v3, p0, 0x10

    and-int/lit16 v3, v3, 0xff

    shr-int/lit8 v4, p1, 0x10

    and-int/lit16 v4, v4, 0xff

    mul-int v5, v3, v4

    shr-int/lit8 v3, p0, 0x18

    and-int/lit16 v3, v3, 0xff

    shr-int/lit8 v4, p1, 0x18

    and-int/lit16 v4, v4, 0xff

    mul-int v6, v3, v4

    div-int/lit16 v4, v1, 0xff

    div-int/lit16 v3, v2, 0xff

    div-int/lit16 v2, v5, 0xff

    div-int/lit16 v1, v6, 0xff

    if-le v4, v0, :cond_0

    move v4, v0

    :cond_0
    if-le v3, v0, :cond_1

    move v3, v0

    :cond_1
    if-le v2, v0, :cond_2

    move v2, v0

    :cond_2
    if-le v1, v0, :cond_3

    :goto_0
    shl-int/lit8 v0, v0, 0x18

    shl-int/lit8 v1, v2, 0x10

    or-int/2addr v0, v1

    shl-int/lit8 v1, v3, 0x8

    or-int/2addr v0, v1

    or-int/2addr v0, v4

    return v0

    :cond_3
    move v0, v1

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_2

    :cond_1
    return v0

    :cond_2
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorOperation:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorOperation:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;

    if-ne v1, v2, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorValues:[I

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorValues:[I

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v0

    :cond_3
    return v0
.end method

.method public getColor(F)I
    .locals 4

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorValues:[I

    array-length v0, v0

    if-nez v0, :cond_0

    return v2

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorValues:[I

    array-length v0, v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorValues:[I

    aget v0, v0, v2

    return v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorValues:[I

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    int-to-float v1, v0

    mul-float/2addr v1, p1

    float-to-int v2, v1

    add-int/lit8 v3, v2, 0x1

    if-lt v2, v0, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorValues:[I

    aget v0, v1, v0

    return v0

    :cond_2
    int-to-float v0, v2

    sub-float v0, v1, v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorValues:[I

    aget v1, v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorValues:[I

    aget v2, v2, v3

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorLerp(IIF)I

    move-result v0

    return v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorOperation:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorValues:[I

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
