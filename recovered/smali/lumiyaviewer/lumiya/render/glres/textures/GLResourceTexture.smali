.class public Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture$1;,
        Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture$GLResourceTexturesReference;
    }
.end annotation


# static fields
.field private static idBuffer:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[I>;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0()Ljava/lang/ThreadLocal;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;->idBuffer:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;->idBuffer:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V
    .locals 2

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture$GLResourceTexturesReference;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;->handle:I

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture$GLResourceTexturesReference;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResource;ILcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V

    return-void
.end method


# virtual methods
.method protected Allocate(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)I
    .locals 3

    const/4 v2, 0x0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;->idBuffer:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x1

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES11;->glGenTextures(I[II)V

    aget v0, v0, v2

    return v0
.end method
