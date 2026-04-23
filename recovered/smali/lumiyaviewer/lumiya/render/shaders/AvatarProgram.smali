.class public Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;
.super Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;


# instance fields
.field public uJointMap:I

.field public uJointMapLength:I

.field public uJointMatrix:I

.field public uUseWeight:I

.field public vWeight:I


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->AvatarVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V

    return-void
.end method


# virtual methods
.method protected bindVariables()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->bindVariables()V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->handle:I

    const-string/jumbo v1, "vWeight"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->vWeight:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->handle:I

    const-string/jumbo v1, "uJointMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uJointMatrix:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->handle:I

    const-string/jumbo v1, "uJointMap"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uJointMap:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->handle:I

    const-string/jumbo v1, "uJointMapLength"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uJointMapLength:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->handle:I

    const-string/jumbo v1, "uUseWeight"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uUseWeight:I

    return-void
.end method
