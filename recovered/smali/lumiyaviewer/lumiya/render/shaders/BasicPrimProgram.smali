.class public Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;
.super Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;


# instance fields
.field public LightAmbientColor:I

.field public LightDiffuseColor:I

.field public LightDiffuseDir:I

.field public sTexture:I

.field public uMVPMatrix:I

.field public uObjCoordScale:I

.field public uObjWorldMatrix:I

.field public useTexture:I

.field public vColor:I

.field public vNormal:I

.field public vPosition:I

.field public vTexCoord:I


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    move-result v0

    return v0
.end method

.method public SetupLighting(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;)V
    .locals 7

    const/4 v6, 0x0

    const/4 v5, 0x1

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    if-eqz p2, :cond_3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->LightDiffuseDir:I

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lightnorm:[F

    aget v1, v1, v6

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lightnorm:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lightnorm:[F

    aget v3, v3, v5

    neg-float v3, v3

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lightnorm:[F

    aget v0, v0, v5

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3dcccccd    # 0.1f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->LightDiffuseColor:I

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->underWater:Z

    if-eqz v0, :cond_0

    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlightBelowWater:[F

    :goto_0
    invoke-static {v1, v5, v0, v6}, Landroid/opengl/GLES20;->glUniform3fv(II[FI)V

    :goto_1
    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->LightAmbientColor:I

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->underWater:Z

    if-eqz v0, :cond_2

    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambientBelowWater:[F

    :goto_2
    invoke-static {v1, v5, v0, v6}, Landroid/opengl/GLES20;->glUniform3fv(II[FI)V

    :goto_3
    return-void

    :cond_0
    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->LightDiffuseColor:I

    invoke-static {v0, v4, v4, v4}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    goto :goto_1

    :cond_2
    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    goto :goto_2

    :cond_3
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->LightDiffuseDir:I

    invoke-static {v0, v4, v1, v4}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->LightDiffuseColor:I

    invoke-static {v0, v4, v4, v4}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->LightAmbientColor:I

    invoke-static {v0, v1, v1, v1}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    goto :goto_3
.end method

.method protected bindVariables()V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "vPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->vPosition:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "vTexCoord"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->vTexCoord:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "vNormal"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->vNormal:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "vColor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->vColor:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "sTexture"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->sTexture:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "useTexture"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->useTexture:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "uMVPMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->uMVPMatrix:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "uObjWorldMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->uObjWorldMatrix:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "uObjCoordScale"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->uObjCoordScale:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "LightDiffuseDir"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->LightDiffuseDir:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "LightDiffuseColor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->LightDiffuseColor:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->handle:I

    const-string/jumbo v1, "LightAmbientColor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->LightAmbientColor:I

    return-void
.end method

.method public bridge synthetic getHandle()I
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->getHandle()I

    move-result v0

    return v0
.end method

.method public setTextureEnabled(Z)V
    .locals 2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->useTexture:I

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
