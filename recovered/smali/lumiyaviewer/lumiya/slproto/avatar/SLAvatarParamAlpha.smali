.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;
.super Ljava/lang/Object;


# instance fields
.field public final domain:F

.field public final multiplyBlend:Z

.field public final skipIfZero:Z

.field public final tgaFile:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(FLjava/lang/String;ZZ)V
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->domain:F

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->tgaFile:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->skipIfZero:Z

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->multiplyBlend:Z

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    :cond_1
    return v1

    :cond_2
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->domain:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->domain:F

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-eqz v2, :cond_3

    return v1

    :cond_3
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->skipIfZero:Z

    iget-boolean v3, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->skipIfZero:Z

    if-eq v2, v3, :cond_4

    return v1

    :cond_4
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->multiplyBlend:Z

    iget-boolean v3, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->multiplyBlend:Z

    if-eq v2, v3, :cond_5

    return v1

    :cond_5
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->tgaFile:Ljava/lang/String;

    if-eqz v2, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->tgaFile:Ljava/lang/String;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->tgaFile:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :cond_6
    :goto_0
    return v0

    :cond_7
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->tgaFile:Ljava/lang/String;

    if-eqz v2, :cond_6

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 4

    const/4 v2, 0x1

    const/4 v1, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->domain:F

    const/4 v3, 0x0

    cmpl-float v0, v0, v3

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->domain:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    :goto_0
    mul-int/lit8 v3, v0, 0x1f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->tgaFile:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->tgaFile:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_1
    add-int/2addr v0, v3

    mul-int/lit8 v3, v0, 0x1f

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->skipIfZero:Z

    if-eqz v0, :cond_2

    move v0, v2

    :goto_2
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->multiplyBlend:Z

    if-eqz v3, :cond_3

    :goto_3
    add-int/2addr v0, v2

    return v0

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1

    :cond_2
    move v0, v1

    goto :goto_2

    :cond_3
    move v2, v1

    goto :goto_3
.end method
