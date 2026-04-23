.class public Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLResource;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$1;,
        Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$GLQueryReference;,
        Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;
    }
.end annotation


# static fields
.field private static final MIN_OCCLUSION_QUERY_FRAMES:I

.field private static idQuery:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[I>;"
        }
    .end annotation
.end field


# instance fields
.field private isQueryRunning:Z

.field private queryResult:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private queryStartedFrameCount:I


# direct methods
.method static synthetic -get0()Ljava/lang/ThreadLocal;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->idQuery:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->idQuery:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/GLResource;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->isQueryRunning:Z

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;->NotReady:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->queryResult:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->queryStartedFrameCount:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$GLQueryReference;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->handle:I

    invoke-direct {v0, p0, v1, p1}, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$GLQueryReference;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResource;ILcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V

    return-void
.end method


# virtual methods
.method protected Allocate(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)I
    .locals 3

    const/4 v2, 0x0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->idQuery:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x1

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES30;->glGenQueries(I[II)V

    aget v0, v0, v2

    return v0
.end method

.method public BeginOcclusionQuery(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->handle:I

    const v1, 0x8c2f

    invoke-static {v1, v0}, Landroid/opengl/GLES30;->glBeginQuery(II)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->isQueryRunning:Z

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;->NotReady:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->queryResult:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCount:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->queryStartedFrameCount:I

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->enqueueOcclusionQuery(Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;)V

    return-void
.end method

.method public EndOcclusionQuery()V
    .locals 1

    const v0, 0x8c2f

    invoke-static {v0}, Landroid/opengl/GLES30;->glEndQuery(I)V

    return-void
.end method

.method public checkResult()Z
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->isQueryRunning:Z

    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;->NotReady:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->queryResult:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    return v4

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->idQuery:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->handle:I

    const v2, 0x8867

    invoke-static {v1, v2, v0, v3}, Landroid/opengl/GLES30;->glGetQueryObjectuiv(II[II)V

    aget v1, v0, v3

    if-eqz v1, :cond_2

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->isQueryRunning:Z

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->handle:I

    const v2, 0x8866

    invoke-static {v1, v2, v0, v3}, Landroid/opengl/GLES30;->glGetQueryObjectuiv(II[II)V

    aget v0, v0, v3

    if-eqz v0, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;->Visible:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->queryResult:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    return v4

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;->Invisible:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    goto :goto_0

    :cond_2
    return v3
.end method

.method public getOcclusionQueryResult()Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->queryResult:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    return-object v0
.end method

.method public isQueryRunning()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->isQueryRunning:Z

    return v0
.end method
