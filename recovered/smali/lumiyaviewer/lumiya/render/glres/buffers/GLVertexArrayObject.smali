.class public Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/render/glres/GLGenericResource;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject$GLVertexArrayObjectReference;
    }
.end annotation


# instance fields
.field public final size:I

.field private final vaoIndices:[I


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->size:I

    new-array v0, p2, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->vaoIndices:[I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->vaoIndices:[I

    const/4 v1, 0x0

    invoke-static {p2, v0, v1}, Landroid/opengl/GLES30;->glGenVertexArrays(I[II)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject$GLVertexArrayObjectReference;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->vaoIndices:[I

    invoke-direct {v0, p0, p1, v1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject$GLVertexArrayObjectReference;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLGenericResource;Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;[I)V

    return-void
.end method


# virtual methods
.method public Bind(I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->vaoIndices:[I

    aget v0, v0, p1

    invoke-static {v0}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    return-void
.end method

.method public Unbind()V
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    return-void
.end method
