.class public Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;
.super Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;


# instance fields
.field public uNumSectionMatrices:I

.field public uSectionMatrices:I


# direct methods
.method public constructor <init>(Z)V
    .locals 2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->FlexiVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    if-eqz p1, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimOpaqueFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    :goto_0
    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V

    return-void

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    goto :goto_0
.end method


# virtual methods
.method protected bindVariables()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->bindVariables()V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;->handle:I

    const-string/jumbo v1, "uSectionMatrices"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;->uSectionMatrices:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;->handle:I

    const-string/jumbo v1, "uNumSectionMatrices"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;->uNumSectionMatrices:I

    return-void
.end method
