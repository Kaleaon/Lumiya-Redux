.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;
.super Ljava/lang/Object;


# instance fields
.field private final textures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

.field private final volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->textures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, p0, :cond_0

    return v1

    :cond_0
    if-nez p1, :cond_1

    return v2

    :cond_1
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    if-nez v0, :cond_2

    return v2

    :cond_2
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    if-nez v0, :cond_3

    move v0, v1

    :goto_0
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    if-nez v3, :cond_4

    move v3, v1

    :goto_1
    if-eq v0, v3, :cond_5

    return v2

    :cond_3
    move v0, v2

    goto :goto_0

    :cond_4
    move v3, v2

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    return v2

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->textures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    if-nez v0, :cond_7

    move v0, v1

    :goto_2
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->textures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    if-nez v3, :cond_8

    move v3, v1

    :goto_3
    if-eq v0, v3, :cond_9

    return v2

    :cond_7
    move v0, v2

    goto :goto_2

    :cond_8
    move v3, v2

    goto :goto_3

    :cond_9
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->textures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->textures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->textures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    return v2

    :cond_a
    return v1
.end method

.method public final getTextures()Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->textures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    return-object v0
.end method

.method public final getVolumeParams()Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->hashCode()I

    move-result v0

    add-int/lit8 v0, v0, 0x0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->textures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->textures:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    return v0
.end method
