.class public Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;
.super Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;


# instance fields
.field public uTexMatrix:I


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    if-eqz p1, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimOpaqueFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    :goto_0
    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V

    return-void

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    goto :goto_0
.end method


# virtual methods
.method protected bindVariables()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/render/shaders/BasicPrimProgram;->bindVariables()V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->handle:I

    const-string/jumbo v1, "uTexMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uTexMatrix:I

    return-void
.end method
