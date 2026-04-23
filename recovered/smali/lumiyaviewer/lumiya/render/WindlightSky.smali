.class public Lcom/lumiyaviewer/lumiya/render/WindlightSky;
.super Ljava/lang/Object;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "InlinedApi"
    }
.end annotation


# static fields
.field private static final NumStars:I = 0x1f4

.field private static final Q:F

.field private static final SKY_INDEX_BUFFER:I = 0x1

.field private static final SKY_VERTEX_BUFFER:I = 0x0

.field private static final STARS_INDEX_BUFFER:I = 0x3

.field private static final STARS_VERTEX_BUFFER:I = 0x2

.field private static final StarsRadius:F = 0.8f

.field private static final ico1:F

.field private static final icoQ:F

.field private static final icoRadius:F

.field private static final icosahedronIndices:[S

.field private static final icosahedronVertices:[F


# instance fields
.field private final buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

.field private final cloudsTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;

.field private skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

.field private starsCoords:Ljava/nio/FloatBuffer;

.field private starsIndices:Ljava/nio/ShortBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const-wide/high16 v0, 0x4014000000000000L    # 5.0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    add-double/2addr v0, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v2

    double-to-float v0, v0

    sput v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->Q:F

    sget v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->Q:F

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->Q:F

    mul-float/2addr v0, v1

    add-float/2addr v0, v5

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    sput v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoRadius:F

    sget v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoRadius:F

    div-float v0, v5, v0

    sput v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    sget v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->Q:F

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoRadius:F

    div-float/2addr v0, v1

    sput v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    const/16 v0, 0x24

    new-array v0, v0, [F

    const/4 v1, 0x0

    aput v4, v0, v1

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    const/4 v2, 0x1

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    const/4 v2, 0x2

    aput v1, v0, v2

    const/4 v1, 0x3

    aput v4, v0, v1

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    neg-float v1, v1

    const/4 v2, 0x4

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    const/4 v2, 0x5

    aput v1, v0, v2

    const/4 v1, 0x6

    aput v4, v0, v1

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    neg-float v1, v1

    const/4 v2, 0x7

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    neg-float v1, v1

    const/16 v2, 0x8

    aput v1, v0, v2

    const/16 v1, 0x9

    aput v4, v0, v1

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    const/16 v2, 0xa

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    neg-float v1, v1

    const/16 v2, 0xb

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    const/16 v2, 0xc

    aput v1, v0, v2

    const/16 v1, 0xd

    aput v4, v0, v1

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    const/16 v2, 0xe

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    neg-float v1, v1

    const/16 v2, 0xf

    aput v1, v0, v2

    const/16 v1, 0x10

    aput v4, v0, v1

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    const/16 v2, 0x11

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    neg-float v1, v1

    const/16 v2, 0x12

    aput v1, v0, v2

    const/16 v1, 0x13

    aput v4, v0, v1

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    neg-float v1, v1

    const/16 v2, 0x14

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    const/16 v2, 0x15

    aput v1, v0, v2

    const/16 v1, 0x16

    aput v4, v0, v1

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    neg-float v1, v1

    const/16 v2, 0x17

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    const/16 v2, 0x18

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    neg-float v1, v1

    const/16 v2, 0x19

    aput v1, v0, v2

    const/16 v1, 0x1a

    aput v4, v0, v1

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    neg-float v1, v1

    const/16 v2, 0x1b

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    neg-float v1, v1

    const/16 v2, 0x1c

    aput v1, v0, v2

    const/16 v1, 0x1d

    aput v4, v0, v1

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    neg-float v1, v1

    const/16 v2, 0x1e

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    const/16 v2, 0x1f

    aput v1, v0, v2

    const/16 v1, 0x20

    aput v4, v0, v1

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->ico1:F

    const/16 v2, 0x21

    aput v1, v0, v2

    sget v1, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icoQ:F

    const/16 v2, 0x22

    aput v1, v0, v2

    const/16 v1, 0x23

    aput v4, v0, v1

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icosahedronVertices:[F

    const/16 v0, 0x3c

    new-array v0, v0, [S

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icosahedronIndices:[S

    return-void

    nop

    :array_0
    .array-data 2
        0x5s
        0x0s
        0x1s
        0xas
        0x0s
        0x5s
        0x5s
        0x1s
        0x9s
        0xas
        0x5s
        0x6s
        0x6s
        0x5s
        0x9s
        0xbs
        0x0s
        0xas
        0x3s
        0xbs
        0xas
        0x3s
        0xas
        0x6s
        0x3s
        0x6s
        0x2s
        0x7s
        0x3s
        0x2s
        0x8s
        0x7s
        0x2s
        0x4s
        0x7s
        0x8s
        0x1s
        0x4s
        0x8s
        0x9s
        0x8s
        0x2s
        0x9s
        0x2s
        0x6s
        0xbs
        0x3s
        0x7s
        0x4s
        0x0s
        0xbs
        0x4s
        0xbs
        0x7s
        0x1s
        0x0s
        0x4s
        0x1s
        0x8s
        0x9s
    .end array-data
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 14

    const v13, 0x8893

    const v12, 0x8892

    const/high16 v11, 0x40000000    # 2.0f

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    const/16 v0, 0x5dc

    invoke-static {v0}, Ljava/nio/FloatBuffer;->allocate(I)Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->starsCoords:Ljava/nio/FloatBuffer;

    const/16 v0, 0x1f4

    invoke-static {v0}, Ljava/nio/ShortBuffer;->allocate(I)Ljava/nio/ShortBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->starsIndices:Ljava/nio/ShortBuffer;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    move v0, v3

    :goto_0
    const/16 v2, 0x1f4

    if-ge v0, v2, :cond_0

    const v2, 0x3f4ccccd    # 0.8f

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v4

    double-to-float v4, v4

    mul-float/2addr v4, v11

    sub-float/2addr v4, v10

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    double-to-float v5, v6

    mul-float/2addr v5, v11

    sub-float/2addr v5, v10

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    double-to-float v6, v6

    mul-float/2addr v6, v11

    sub-float/2addr v6, v10

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v8

    double-to-float v7, v8

    mul-float/2addr v7, v11

    sub-float/2addr v7, v10

    invoke-direct {v2, v4, v5, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->normalize()F

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->starsCoords:Ljava/nio/FloatBuffer;

    iget v4, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    invoke-virtual {v2, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->starsCoords:Ljava/nio/FloatBuffer;

    iget v4, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    invoke-virtual {v2, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->starsCoords:Ljava/nio/FloatBuffer;

    iget v4, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-virtual {v2, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->starsIndices:Ljava/nio/ShortBuffer;

    int-to-short v4, v0

    invoke-virtual {v2, v4}, Ljava/nio/ShortBuffer;->put(S)Ljava/nio/ShortBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->hasCloudsTexture()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->loadClouds(Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->cloudsTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;

    :goto_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icosahedronVertices:[F

    invoke-static {v0}, Ljava/nio/FloatBuffer;->wrap([F)Ljava/nio/FloatBuffer;

    move-result-object v1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icosahedronIndices:[S

    invoke-static {v0}, Ljava/nio/ShortBuffer;->wrap([S)Ljava/nio/ShortBuffer;

    move-result-object v2

    move v0, v3

    :goto_2
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    array-length v4, v4

    if-ge v0, v4, :cond_2

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    new-instance v5, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v6, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    aput-object v5, v4, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->cloudsTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    aget-object v0, v0, v3

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icosahedronVertices:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    invoke-virtual {v1, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v1

    const v4, 0x88e4

    invoke-static {v12, v0, v1, v4}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v13, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icosahedronIndices:[S

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x2

    invoke-virtual {v2, v3}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v1

    const v2, 0x88e4

    invoke-static {v13, v0, v1, v2}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->vPosition:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->vPosition:I

    const/4 v1, 0x3

    const/16 v2, 0x1406

    const/16 v4, 0xc

    move v5, v3

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->starsCoords:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->capacity()I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->starsCoords:Ljava/nio/FloatBuffer;

    invoke-virtual {v1, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v1

    const v2, 0x88e4

    invoke-static {v12, v0, v1, v2}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v13, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->starsIndices:Ljava/nio/ShortBuffer;

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->starsIndices:Ljava/nio/ShortBuffer;

    invoke-virtual {v1, v3}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v1

    const v2, 0x88e4

    invoke-static {v13, v0, v1, v2}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;->vPosition:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;->vPosition:I

    const/4 v1, 0x3

    const/16 v2, 0x1406

    const/16 v4, 0xc

    move v5, v3

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    return-void
.end method

.method private loadClouds(Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;
    .locals 14

    :try_start_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAssetManager()Landroid/content/res/AssetManager;

    move-result-object v10

    const/4 v0, 0x6

    new-array v11, v0, [I

    fill-array-data v11, :array_0

    const/4 v0, 0x6

    new-array v12, v0, [Ljava/lang/String;

    const-string/jumbo v0, "clouds_nx.tga"

    const/4 v1, 0x0

    aput-object v0, v12, v1

    const-string/jumbo v0, "clouds_py.tga"

    const/4 v1, 0x1

    aput-object v0, v12, v1

    const-string/jumbo v0, "clouds_nz.tga"

    const/4 v1, 0x2

    aput-object v0, v12, v1

    const-string/jumbo v0, "clouds_px.tga"

    const/4 v1, 0x3

    aput-object v0, v12, v1

    const-string/jumbo v0, "clouds_ny.tga"

    const/4 v1, 0x4

    aput-object v0, v12, v1

    const-string/jumbo v0, "clouds_pz.tga"

    const/4 v1, 0x5

    aput-object v0, v12, v1

    array-length v0, v11

    new-array v13, v0, [Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    const/4 v1, 0x0

    const/4 v0, 0x0

    move v8, v0

    move v9, v1

    :goto_0
    array-length v0, v11

    if-ge v8, v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "windlight/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-object v1, v12, v8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    new-instance v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    sget-object v2, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->TGA:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(Ljava/io/InputStream;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;ZZFFZ)V

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    const-string/jumbo v1, "WindlightSky: texture %dx%d,  numcomps %d, bpp %d"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget v3, v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget v3, v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->num_components:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    iget v3, v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bytes_per_pixel:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    aput-object v0, v13, v8

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getLoadedSize()I

    move-result v0

    add-int v1, v9, v0

    add-int/lit8 v0, v8, 0x1

    move v8, v0

    move v9, v1

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-direct {v1, v0, v9}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V

    iget v0, v1, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;->handle:I

    const v2, 0x8513

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/4 v0, 0x0

    :goto_1
    array-length v2, v11

    if-ge v0, v2, :cond_1

    aget-object v2, v13, v0

    aget v3, v11, v0

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->SetAsTextureTarget(I)I

    const/4 v2, 0x0

    aput-object v2, v13, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    const v0, 0x8513

    const/16 v2, 0x2800

    const/16 v3, 0x2601

    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const v0, 0x8513

    const/16 v2, 0x2801

    const/16 v3, 0x2601

    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const v0, 0x8513

    const/16 v2, 0x2802

    const/16 v3, 0x2901

    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const v0, 0x8513

    const/16 v2, 0x2803

    const/16 v3, 0x2901

    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return-object v0

    nop

    :array_0
    .array-data 4
        0x8516
        0x8518
        0x851a
        0x8515
        0x8517
        0x8519
    .end array-data
.end method


# virtual methods
.method public GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;FF)V
    .locals 8

    const/16 v4, 0xc

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v1, 0x3

    const/4 v6, 0x0

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    const/16 v0, 0x203

    invoke-static {v0}, Landroid/opengl/GLES20;->glDepthFunc(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPushMatrix()V

    cmpl-float v0, p3, v6

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p3, v7, v6, v6}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glRotatef(FFFF)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    neg-float v2, p2

    const/high16 v5, 0x42b40000    # 90.0f

    add-float/2addr v2, v5

    invoke-virtual {v0, v2, v6, v6, v7}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glRotatef(FFFF)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->ApplyWindlight(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->uMVPMatrix:I

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glApplyUniformMatrix(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    aget-object v0, v0, v3

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    const v2, 0x8892

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->vPosition:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->vPosition:I

    const/16 v2, 0x1406

    move v5, v3

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    const/4 v2, 0x1

    aget-object v0, v0, v2

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    const v2, 0x8893

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->hasCloudsTexture()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->cloudsTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;->handle:I

    const v2, 0x8513

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    :cond_2
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->icosahedronIndices:[S

    array-length v0, v0

    const/4 v2, 0x4

    const/16 v5, 0x1403

    invoke-static {v2, v0, v5, v3}, Landroid/opengl/GLES20;->glDrawElements(IIII)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightPreset:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->star_brightness:F

    cmpl-float v0, v0, v6

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;->ApplyWindlight(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;->uMVPMatrix:I

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glApplyUniformMatrix(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    const/4 v2, 0x2

    aget-object v0, v0, v2

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    const v2, 0x8892

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;->vPosition:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;->vPosition:I

    const/16 v2, 0x1406

    move v5, v3

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->buffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    aget-object v0, v0, v1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    const v1, 0x8893

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->starsIndices:Ljava/nio/ShortBuffer;

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v0

    const/16 v1, 0x1403

    invoke-static {v3, v0, v1, v3}, Landroid/opengl/GLES20;->glDrawElements(IIII)V

    :cond_3
    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    const/16 v0, 0x201

    invoke-static {v0}, Landroid/opengl/GLES20;->glDepthFunc(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPopMatrix()V

    return-void
.end method

.method public updateMatrix(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 10

    const/4 v9, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    const/high16 v6, -0x40800000    # -1.0f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    :cond_0
    const/16 v0, 0x10

    new-array v0, v0, [F

    invoke-static {v0, v7}, Ljava/util/Arrays;->fill([FF)V

    iget v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->FOVAngle:F

    float-to-double v2, v1

    const-wide v4, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v2, v4

    const-wide v4, 0x4076800000000000L    # 360.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->tan(D)D

    move-result-wide v2

    double-to-float v1, v2

    div-float v1, v8, v1

    iget v2, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->aspectRatio:F

    div-float v2, v8, v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    aput v1, v0, v9

    div-float/2addr v1, v2

    const/4 v2, 0x5

    aput v1, v0, v2

    const/16 v1, 0xa

    aput v6, v0, v1

    const/16 v1, 0xb

    aput v6, v0, v1

    const/16 v1, 0xe

    aput v6, v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->reset()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v1, v0, v9}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glLoadMatrixf([FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->skyMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    const/high16 v1, -0x3d4c0000    # -90.0f

    invoke-virtual {v0, v1, v8, v7, v7}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glRotatef(FFFF)V

    return-void
.end method
