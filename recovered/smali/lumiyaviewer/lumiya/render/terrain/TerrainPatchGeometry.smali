.class public Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;
.super Ljava/lang/Object;


# static fields
.field public static final DrawPatchSize:I = 0x10

.field private static final index_size_bytes:I = 0xc00

.field private static final vertex_size_bytes:I = 0x2420

.field private static waterAmplitude:[F = null

.field private static waterDirection:[F = null

.field private static waterFrequency:[F = null

.field private static waterPhase:[F = null

.field private static final water_vertex_size_bytes:I = 0xd8c


# instance fields
.field private final indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private index_count:I

.field private final vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private final waterIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private final waterVertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private water_index_count:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v1, 0x4

    new-array v0, v1, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterFrequency:[F

    new-array v0, v1, [F

    fill-array-data v0, :array_1

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterPhase:[F

    new-array v0, v1, [F

    fill-array-data v0, :array_2

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterAmplitude:[F

    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_3

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterDirection:[F

    return-void

    :array_0
    .array-data 4
        0x418f9d9c
        0x41490fdb
        0x410f9d9c
        0x417b53d1
    .end array-data

    :array_1
    .array-data 4
        0x3fdd70a4    # 1.73f
        0x3f23d70a    # 0.64f
        0x3fa28f5c    # 1.27f
        0x3f666666    # 0.9f
    .end array-data

    :array_2
    .array-data 4
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3e99999a    # 0.3f
        0x3ecccccd    # 0.4f
    .end array-data

    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x3e99999a    # 0.3f
        0x3ecccccd    # 0.4f
        0x3f400000    # 0.75f
        -0x41000000    # -0.5f
        0x3f333333    # 0.7f
        0x3f2147ae    # 0.63f
        -0x41666666    # -0.3f
    .end array-data
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;)V
    .locals 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->index_count:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->water_index_count:I

    new-instance v3, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/16 v0, 0x2420

    invoke-direct {v3, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    new-instance v4, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/16 v0, 0xd8c

    invoke-direct {v4, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    new-instance v5, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/16 v0, 0xc00

    invoke-direct {v5, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    new-instance v6, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/16 v0, 0xc00

    invoke-direct {v6, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v0, 0x0

    invoke-virtual {v4, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->index_count:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->water_index_count:I

    const/4 v1, 0x0

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->getWaterHeight()F

    move-result v8

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->getHeightArray()[F

    move-result-object v9

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->getNormalArray()[F

    move-result-object v10

    const/4 v0, 0x0

    move v2, v1

    move v1, v0

    :goto_0
    const/16 v0, 0x11

    if-ge v1, v0, :cond_1

    const/4 v0, 0x0

    :goto_1
    const/16 v11, 0x11

    if-ge v0, v11, :cond_0

    int-to-float v11, v0

    invoke-virtual {v3, v11}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    int-to-float v11, v1

    invoke-virtual {v3, v11}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    add-int v11, v2, v0

    aget v11, v9, v11

    invoke-virtual {v3, v11}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    add-int v11, v2, v0

    mul-int/lit8 v11, v11, 0x2

    aget v11, v10, v11

    add-int v12, v2, v0

    mul-int/lit8 v12, v12, 0x2

    add-int/lit8 v12, v12, 0x1

    aget v12, v10, v12

    neg-float v11, v11

    const/high16 v13, 0x40000000    # 2.0f

    invoke-virtual {v7, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    iget v11, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    invoke-virtual {v3, v11}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    iget v11, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    invoke-virtual {v3, v11}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    iget v11, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-virtual {v3, v11}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    int-to-float v11, v0

    const/high16 v12, 0x41800000    # 16.0f

    div-float/2addr v11, v12

    int-to-float v12, v1

    const/high16 v13, 0x41800000    # 16.0f

    div-float/2addr v12, v13

    invoke-virtual {v3, v11}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    invoke-virtual {v3, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    int-to-float v11, v0

    invoke-virtual {v4, v11}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    int-to-float v11, v1

    invoke-virtual {v4, v11}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    invoke-virtual {v4, v8}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x11

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v1, 0x0

    const/4 v0, 0x0

    move v2, v1

    move v1, v0

    :goto_2
    const/16 v0, 0x10

    if-ge v1, v0, :cond_4

    const/4 v0, 0x0

    :goto_3
    const/16 v7, 0x10

    if-ge v0, v7, :cond_3

    add-int v7, v2, v0

    add-int/lit8 v9, v7, 0x1

    add-int/lit8 v10, v7, 0x11

    add-int/lit8 v11, v10, 0x1

    int-to-short v12, v7

    invoke-virtual {v5, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    int-to-short v12, v9

    invoke-virtual {v5, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    int-to-short v12, v10

    invoke-virtual {v5, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    int-to-short v12, v9

    invoke-virtual {v5, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    int-to-short v12, v11

    invoke-virtual {v5, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    int-to-short v12, v10

    invoke-virtual {v5, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    iget v12, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->index_count:I

    add-int/lit8 v12, v12, 0x6

    iput v12, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->index_count:I

    mul-int/lit8 v12, v7, 0x8

    add-int/lit8 v12, v12, 0x2

    invoke-virtual {v3, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getFloat(I)F

    move-result v12

    mul-int/lit8 v13, v9, 0x8

    add-int/lit8 v13, v13, 0x2

    invoke-virtual {v3, v13}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getFloat(I)F

    move-result v13

    invoke-static {v12, v13}, Ljava/lang/Math;->min(FF)F

    move-result v12

    mul-int/lit8 v13, v10, 0x8

    add-int/lit8 v13, v13, 0x2

    invoke-virtual {v3, v13}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getFloat(I)F

    move-result v13

    invoke-static {v12, v13}, Ljava/lang/Math;->min(FF)F

    move-result v12

    mul-int/lit8 v13, v11, 0x8

    add-int/lit8 v13, v13, 0x2

    invoke-virtual {v3, v13}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getFloat(I)F

    move-result v13

    invoke-static {v12, v13}, Ljava/lang/Math;->min(FF)F

    move-result v12

    cmpg-float v12, v12, v8

    if-gtz v12, :cond_2

    int-to-short v7, v7

    invoke-virtual {v6, v7}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    int-to-short v7, v9

    invoke-virtual {v6, v7}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    int-to-short v7, v10

    invoke-virtual {v6, v7}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    int-to-short v7, v9

    invoke-virtual {v6, v7}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    int-to-short v7, v11

    invoke-virtual {v6, v7}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    int-to-short v7, v10

    invoke-virtual {v6, v7}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putShort(S)V

    iget v7, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->water_index_count:I

    add-int/lit8 v7, v7, 0x6

    iput v7, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->water_index_count:I

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_3
    add-int/lit8 v2, v2, 0x11

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto/16 :goto_2

    :cond_4
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v0, v5}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v0, v4}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterVertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v0, v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    return-void
.end method

.method public static GLPrepare(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 7

    const v6, 0x3ecccccd    # 0.4f

    const/4 v5, 0x4

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uMVPMatrix:I

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelApplyMatrix(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightPreset:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    invoke-virtual {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->SetupLighting(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uObjCoordScale:I

    invoke-static {v0, v4, v4, v4, v4}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uTexMatrix:I

    invoke-static {}, Lcom/lumiyaviewer/lumiya/utils/IdentityMatrix;->getMatrix()[F

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v2, v3, v1, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->vColor:I

    const v1, 0x3f19999a    # 0.6f

    invoke-static {v0, v6, v6, v1, v4}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uMVPMatrix:I

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelApplyMatrix(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uTime:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterTime:F

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uFrequency:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterFrequency:[F

    invoke-static {v0, v5, v1, v3}, Landroid/opengl/GLES20;->glUniform1fv(II[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uPhase:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterPhase:[F

    invoke-static {v0, v5, v1, v3}, Landroid/opengl/GLES20;->glUniform1fv(II[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uAmplitude:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterAmplitude:[F

    invoke-static {v0, v5, v1, v3}, Landroid/opengl/GLES20;->glUniform1fv(II[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uDirection:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterDirection:[F

    invoke-static {v0, v5, v1, v3}, Landroid/opengl/GLES20;->glUniform2fv(II[FI)V

    :goto_0
    return-void

    :cond_0
    const/16 v0, 0x1702

    invoke-static {v0}, Landroid/opengl/GLES11;->glMatrixMode(I)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/utils/IdentityMatrix;->getMatrix()[F

    move-result-object v0

    invoke-static {v0, v3}, Landroid/opengl/GLES11;->glLoadMatrixf([FI)V

    const/16 v0, 0x1700

    invoke-static {v0}, Landroid/opengl/GLES11;->glMatrixMode(I)V

    goto :goto_0
.end method


# virtual methods
.method public final GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;[FLcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;)V
    .locals 7

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->index_count:I

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPushAndMultMatrixf([FI)V

    :cond_1
    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vPosition:I

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x20

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vNormal:I

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x20

    const/16 v6, 0xc

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uObjWorldMatrix:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, p2, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    if-eqz p3, :cond_4

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->GLDraw()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vTexCoord:I

    const/4 v3, 0x2

    const/16 v4, 0x1406

    const/16 v5, 0x20

    const/16 v6, 0x18

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->sTexture:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vColor:I

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->setTextureEnabled(Z)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->index_count:I

    const/4 v2, 0x4

    const/16 v3, 0x1403

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v1, v3, v4}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements20(IIII)V

    :goto_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->water_index_count:I

    if-eqz v0, :cond_2

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_7

    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uObjWorldMatrix:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, p2, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterVertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->vPosition:I

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->water_index_count:I

    const/4 v2, 0x4

    const/16 v3, 0x1403

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v1, v3, v4}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements20(IIII)V

    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    :cond_2
    :goto_2
    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPopMatrix()V

    :cond_3
    return-void

    :cond_4
    const/16 v0, 0xde1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vTexCoord:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->sTexture:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vColor:I

    const v1, 0x3dcccccd    # 0.1f

    const/high16 v2, 0x3f000000    # 0.5f

    const v3, 0x3dcccccd    # 0.1f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->setTextureEnabled(Z)V

    goto/16 :goto_0

    :cond_5
    const v0, 0x8075

    invoke-static {v0}, Landroid/opengl/GLES10;->glDisableClientState(I)V

    if-eqz p3, :cond_6

    const/16 v0, 0xde1

    invoke-static {v0}, Landroid/opengl/GLES10;->glEnable(I)V

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->GLDraw()V

    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES10;->glColor4f(FFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const v2, 0x8078

    const/4 v3, 0x2

    const/16 v4, 0x1406

    const/16 v5, 0x20

    const/16 v6, 0x18

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    :goto_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const v2, 0x8074

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x20

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->index_count:I

    const/4 v2, 0x4

    const/16 v4, 0x1403

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIII)V

    goto/16 :goto_1

    :cond_6
    const v0, 0x8078

    invoke-static {v0}, Landroid/opengl/GLES10;->glDisableClientState(I)V

    const/16 v0, 0xde1

    invoke-static {v0}, Landroid/opengl/GLES10;->glDisable(I)V

    const v0, 0x3dcccccd    # 0.1f

    const/high16 v1, 0x3f000000    # 0.5f

    const v2, 0x3dcccccd    # 0.1f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES10;->glColor4f(FFFF)V

    goto :goto_3

    :cond_7
    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES10;->glDisable(I)V

    const v0, 0x8078

    invoke-static {v0}, Landroid/opengl/GLES10;->glDisableClientState(I)V

    const/16 v0, 0xde1

    invoke-static {v0}, Landroid/opengl/GLES10;->glDisable(I)V

    const v0, 0x3ecccccd    # 0.4f

    const v1, 0x3ecccccd    # 0.4f

    const v2, 0x3f19999a    # 0.6f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES10;->glColor4f(FFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterVertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const v2, 0x8074

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->waterIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->water_index_count:I

    const/4 v2, 0x4

    const/16 v4, 0x1403

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIII)V

    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES10;->glEnable(I)V

    goto/16 :goto_2
.end method
