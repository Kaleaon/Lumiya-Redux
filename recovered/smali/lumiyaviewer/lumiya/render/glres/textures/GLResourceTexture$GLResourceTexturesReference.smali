.class Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture$GLResourceTexturesReference;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLResourceReference;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GLResourceTexturesReference"
.end annotation


# instance fields
.field private final loadedSize:I


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResource;ILcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLResourceReference;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResource;ILcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V

    iput p4, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture$GLResourceTexturesReference;->loadedSize:I

    invoke-static {p4}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->allocTextureMemory(I)V

    return-void
.end method


# virtual methods
.method public GLFree()V
    .locals 3

    const/4 v2, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture$GLResourceTexturesReference;->loadedSize:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->releaseTextureMemory(I)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;->-get0()Ljava/lang/ThreadLocal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture$GLResourceTexturesReference;->handle:I

    aput v1, v0, v2

    const/4 v1, 0x1

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES11;->glDeleteTextures(I[II)V

    return-void
.end method
