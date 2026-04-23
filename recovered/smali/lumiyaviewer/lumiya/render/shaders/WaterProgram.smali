.class public Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;
.super Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;


# instance fields
.field public uAmplitude:I

.field public uDirection:I

.field public uFrequency:I

.field public uMVPMatrix:I

.field public uObjWorldMatrix:I

.field public uPhase:I

.field public uTime:I

.field public vColor:I

.field public vPosition:I


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->WaterVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->WaterFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

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

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->handle:I

    const-string/jumbo v1, "vPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->vPosition:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->handle:I

    const-string/jumbo v1, "vColor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->vColor:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->handle:I

    const-string/jumbo v1, "uMVPMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uMVPMatrix:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->handle:I

    const-string/jumbo v1, "uObjWorldMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uObjWorldMatrix:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->handle:I

    const-string/jumbo v1, "time"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uTime:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->handle:I

    const-string/jumbo v1, "frequency"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uFrequency:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->handle:I

    const-string/jumbo v1, "phase"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uPhase:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->handle:I

    const-string/jumbo v1, "amplitude"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uAmplitude:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->handle:I

    const-string/jumbo v1, "direction"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->uDirection:I

    return-void
.end method

.method public bridge synthetic getHandle()I
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->getHandle()I

    move-result v0

    return v0
.end method
