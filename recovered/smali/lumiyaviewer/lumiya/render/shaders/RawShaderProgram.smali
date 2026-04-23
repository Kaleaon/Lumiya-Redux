.class public Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;
.super Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;


# instance fields
.field public textureSampler:I

.field public uMVPMatrix:I

.field public vPosition:I

.field public vTexCoord:I

.field public vTextureTransformMatrix:I


# direct methods
.method public constructor <init>(Z)V
    .locals 2

    if-eqz p1, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->ExtTextureVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    move-object v1, v0

    :goto_0
    if-eqz p1, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->ExtTextureFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    :goto_1
    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V

    return-void

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->RawVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    move-object v1, v0

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->RawFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    goto :goto_1
.end method


# virtual methods
.method public bridge synthetic Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    move-result v0

    return v0
.end method

.method protected bindVariables()V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->handle:I

    const-string/jumbo v1, "vPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->vPosition:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->handle:I

    const-string/jumbo v1, "vTexCoord"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->vTexCoord:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->handle:I

    const-string/jumbo v1, "uMVPMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->uMVPMatrix:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->handle:I

    const-string/jumbo v1, "vTexture"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->textureSampler:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->handle:I

    const-string/jumbo v1, "vTextureTransformMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->vTextureTransformMatrix:I

    return-void
.end method

.method public bridge synthetic getHandle()I
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->getHandle()I

    move-result v0

    return v0
.end method
