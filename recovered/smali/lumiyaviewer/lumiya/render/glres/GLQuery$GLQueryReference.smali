.class Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$GLQueryReference;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLResourceReference;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GLQueryReference"
.end annotation


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResource;ILcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLResourceReference;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResource;ILcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V

    return-void
.end method


# virtual methods
.method public GLFree()V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->-get0()Ljava/lang/ThreadLocal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$GLQueryReference;->handle:I

    aput v1, v0, v4

    const-string/jumbo v1, "GLBuffer: deleted buffer %d"

    new-array v2, v5, [Ljava/lang/Object;

    aget v3, v0, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v5, v0, v4}, Landroid/opengl/GLES30;->glDeleteQueries(I[II)V

    return-void
.end method
