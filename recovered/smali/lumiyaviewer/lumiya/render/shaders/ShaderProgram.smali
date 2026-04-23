.class abstract Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;
.super Ljava/lang/Object;


# instance fields
.field private final fragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field protected handle:I

.field private final vertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->vertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->fragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    return-void
.end method


# virtual methods
.method public Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException;
        }
    .end annotation

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->vertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->fragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    const-string/jumbo v0, "Shaders: Linking..."

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->handle:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->handle:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->vertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->getHandle()I

    move-result v1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->handle:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->fragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->getHandle()I

    move-result v1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->handle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    new-array v0, v3, [I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->handle:I

    const v2, 0x8b82

    invoke-static {v1, v2, v0, v4}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    aget v0, v0, v4

    if-eq v0, v3, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->handle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException;

    const-string/jumbo v2, "Shader link error: \'%s\'"

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    const-string/jumbo v0, "Shaders: Binding variables..."

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->bindVariables()V

    const-string/jumbo v0, "Shaders: Compiled, handle %d"

    new-array v1, v3, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->handle:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->handle:I

    return v0
.end method

.method protected abstract bindVariables()V
.end method

.method public getHandle()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderProgram;->handle:I

    return v0
.end method
