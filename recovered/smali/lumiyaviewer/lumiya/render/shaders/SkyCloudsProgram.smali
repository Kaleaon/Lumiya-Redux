.class public Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;
.super Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;


# instance fields
.field public cloudAdd:I

.field public cloudColor:I

.field public cloudGamma:I

.field public textureSampler:I


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->SkyFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V

    return-void
.end method


# virtual methods
.method public ApplyWindlight(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 7

    const/4 v6, 0x2

    const/4 v5, 0x0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->ApplyWindlight(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightPreset:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->cloudColor:I

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_color:[F

    aget v2, v2, v5

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_color:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_color:[F

    aget v4, v4, v6

    invoke-static {v1, v2, v3, v4}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->cloudGamma:I

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density1:[F

    aget v2, v2, v6

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->cloudAdd:I

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_shadow:[F

    aget v0, v0, v5

    const/high16 v2, 0x3f000000    # 0.5f

    sub-float/2addr v0, v2

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->textureSampler:I

    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glUniform1i(II)V

    return-void
.end method

.method protected bindVariables()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->bindVariables()V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->handle:I

    const-string/jumbo v1, "textureSampler"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->textureSampler:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->handle:I

    const-string/jumbo v1, "cloudColor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->cloudColor:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->handle:I

    const-string/jumbo v1, "cloudGamma"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->cloudGamma:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->handle:I

    const-string/jumbo v1, "cloudAdd"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;->cloudAdd:I

    return-void
.end method

.method public hasCloudsTexture()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
