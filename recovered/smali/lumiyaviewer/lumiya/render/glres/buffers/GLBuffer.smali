.class public Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLResource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer$1;,
        Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer$GLResourceBufferReference;
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


# instance fields
.field private final rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;


# direct methods
.method static synthetic -get0()Ljava/lang/ThreadLocal;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->idBuffer:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->idBuffer:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V
    .locals 3

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/GLResource;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getCapacity()I

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->allocBufferMemory(I)V

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer$GLResourceBufferReference;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, p0, v1, p1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer$GLResourceBufferReference;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResource;ILcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    return-void
.end method


# virtual methods
.method protected Allocate(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)I
    .locals 5

    const/4 v2, 0x1

    const/4 v4, 0x0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->idBuffer:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    invoke-static {v2, v0, v4}, Landroid/opengl/GLES11;->glGenBuffers(I[II)V

    const-string/jumbo v1, "GLBuffer: allocated buffer %d"

    new-array v2, v2, [Ljava/lang/Object;

    aget v3, v0, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    aget v0, v0, v4

    return v0
.end method
