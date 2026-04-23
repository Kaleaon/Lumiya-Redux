.class Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/RenderContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Shaders30"
.end annotation


# instance fields
.field final boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

.field final riggedMeshProgram30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

.field final riggedMeshProgramOpaque30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;->riggedMeshProgram30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;->riggedMeshProgramOpaque30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;->riggedMeshProgram30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;->riggedMeshProgramOpaque30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)V

    return-void
.end method
