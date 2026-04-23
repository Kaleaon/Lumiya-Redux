.class Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject$GLVertexArrayObjectReference;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLGenericResourceReference;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GLVertexArrayObjectReference"
.end annotation


# instance fields
.field private final vaoIndices:[I


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLGenericResource;Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;[I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLGenericResourceReference;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLGenericResource;Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject$GLVertexArrayObjectReference;->vaoIndices:[I

    return-void
.end method


# virtual methods
.method public GLFree()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject$GLVertexArrayObjectReference;->vaoIndices:[I

    array-length v0, v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject$GLVertexArrayObjectReference;->vaoIndices:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES30;->glDeleteVertexArrays(I[II)V

    return-void
.end method
