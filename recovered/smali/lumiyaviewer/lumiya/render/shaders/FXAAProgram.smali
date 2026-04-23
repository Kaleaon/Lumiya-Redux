.class public Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;
.super Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;


# instance fields
.field public noAAtextureSampler:I

.field public texcoordOffset:I

.field public textureSampler:I

.field public uMVPMatrix:I

.field public vPosition:I

.field public vTexCoord:I


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->FXAAVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->FXAAFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V

    return-void
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

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->handle:I

    const-string/jumbo v1, "vPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->vPosition:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->handle:I

    const-string/jumbo v1, "vTexCoord"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->vTexCoord:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->handle:I

    const-string/jumbo v1, "textureSampler"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->textureSampler:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->handle:I

    const-string/jumbo v1, "noAAtextureSampler"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->noAAtextureSampler:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->handle:I

    const-string/jumbo v1, "uMVPMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->uMVPMatrix:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->handle:I

    const-string/jumbo v1, "texcoordOffset"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->texcoordOffset:I

    return-void
.end method

.method public bridge synthetic getHandle()I
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->getHandle()I

    move-result v0

    return v0
.end method
