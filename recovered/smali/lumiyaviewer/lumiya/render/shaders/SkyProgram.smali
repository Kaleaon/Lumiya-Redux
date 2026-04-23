.class public Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;
.super Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;


# instance fields
.field public hazeColor:I

.field public hazeHorizon:I

.field public skyColor:I

.field public uMVPMatrix:I

.field public vPosition:I


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->SkyVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->SkyNoCloudsFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->SkyVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V

    return-void
.end method


# virtual methods
.method public ApplyWindlight(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 9

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightPreset:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->skyColor:I

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_horizon:[F

    aget v2, v2, v6

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    aget v3, v3, v6

    add-float/2addr v2, v3

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    aget v3, v3, v6

    add-float/2addr v2, v3

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_density:[F

    aget v3, v3, v6

    mul-float/2addr v2, v3

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_horizon:[F

    aget v3, v3, v7

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    aget v4, v4, v7

    add-float/2addr v3, v4

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    aget v4, v4, v7

    add-float/2addr v3, v4

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_density:[F

    aget v4, v4, v7

    mul-float/2addr v3, v4

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_horizon:[F

    aget v4, v4, v8

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    aget v5, v5, v8

    add-float/2addr v4, v5

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    aget v5, v5, v8

    add-float/2addr v4, v5

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_density:[F

    aget v5, v5, v8

    mul-float/2addr v4, v5

    invoke-static {v1, v2, v3, v4}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->hazeHorizon:I

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_horizon:[F

    aget v2, v2, v6

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->hazeColor:I

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_density:[F

    aget v2, v2, v6

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    aget v3, v3, v6

    mul-float/2addr v2, v3

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_density:[F

    aget v3, v3, v6

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    aget v4, v4, v7

    mul-float/2addr v3, v4

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_density:[F

    aget v4, v4, v6

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    aget v0, v0, v8

    mul-float/2addr v0, v4

    invoke-static {v1, v2, v3, v0}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    return-void
.end method

.method public bridge synthetic Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    move-result v0

    return v0
.end method

.method protected bindVariables()V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->handle:I

    const-string/jumbo v1, "vPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->vPosition:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->handle:I

    const-string/jumbo v1, "uMVPMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->uMVPMatrix:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->handle:I

    const-string/jumbo v1, "skyColor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->skyColor:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->handle:I

    const-string/jumbo v1, "hazeHorizon"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->hazeHorizon:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->handle:I

    const-string/jumbo v1, "hazeColor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->hazeColor:I

    return-void
.end method

.method public bridge synthetic getHandle()I
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->getHandle()I

    move-result v0

    return v0
.end method

.method public hasCloudsTexture()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
