.class public Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;
.implements Landroid/opengl/GLSurfaceView$EGLContextFactory;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "InlinedApi"
    }
.end annotation


# static fields
.field private static final EGL_CONTEXT_CLIENT_VERSION:I = 0x3098

.field private static final EMPTY_FRAMES_COUNT:I = 0x1

.field private static final EXT_TEXTURE_MATRIX:I = 0x0

.field private static final EXT_TEXTURE_MATRIX_EYE:I = 0x10

.field private static final EXT_TEXTURE_MATRIX_INVERSE:I = 0x30

.field private static final EXT_TEXTURE_MATRIX_RESULT:I = 0x20

.field private static final MIN_DRAW_LIST_UPDATE_FRAMES:I = 0x4

.field private static final MIN_DRAW_LIST_UPDATE_INTERVAL:J = 0x64L

.field public static final MSG_SCREENSHOT:I = 0x5

.field public static final MSG_SET_PICKED_OBJECT:I = 0x1

.field public static final MSG_SET_TOUCHED_OBJECT:I = 0x2

.field public static final MSG_SHADER_COMPILE_ERROR:I = 0x4

.field public static final MSG_SURFACE_CREATED:I = 0x3


# instance fields
.field private Colorbuffers:[I

.field private Framebuffers:[I

.field private Renderbuffers:[I

.field private final agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;",
            ">;"
        }
    .end annotation
.end field

.field private avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private avatarCountLimit:I

.field private final cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

.field private createdGL30:Z

.field private currentDrawList:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

.field private currentFrustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private volatile displayedHUDid:I

.field private drawDistance:I

.field private drawListUpdateFrameCount:I

.field private drawPickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

.field private drawingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final extTextureHitVector:[F

.field private final extTextureMatrix:[F

.field private final extTextureResultVector:[F

.field private firstFrameCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private firstFrameTime:J

.field private final fontSize:I

.field private volatile forcedTime:F

.field private fpsFrameCount:I

.field private headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

.field private hoverTextEnableHUDs:Z

.field private hoverTextEnableObjects:Z

.field private hudOffsetX:F

.field private hudOffsetY:F

.field private hudScaleFactor:F

.field private final initSpatialIndexRunnable:Ljava/lang/Runnable;

.field private volatile initialUpdateDone:Z

.field private isFlinging:Z

.field private isInteracting:Z

.field private volatile isResponsiveMode:Z

.field private lastDrawListUpdateTime:J

.field private lastFrameTime:J

.field private needPickObject:Z

.field private needPickX:F

.field private needPickY:F

.field private ownAvatarHidden:Z

.field private parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private pickHandler:Landroid/os/Handler;

.field private final pickLock:Ljava/lang/Object;

.field private previousFrameTime:J

.field private final renderContext:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/RenderContext;",
            ">;"
        }
    .end annotation
.end field

.field private final renderThreadExecutor:Lcom/lumiyaviewer/lumiya/render/SynchronousExecutor;

.field private final requestGL20:Z

.field private final responsiveModeLock:Ljava/lang/Object;

.field private screenshotHandler:Landroid/os/Handler;

.field private simSunHour:[F

.field private final stateHandler:Landroid/os/Handler;

.field private final systemFramebuffer:[I

.field private thisFrameTime:J

.field private touchHUDEvents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/TouchHUDEvent;",
            ">;"
        }
    .end annotation
.end field

.field private touchHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/os/Handler;ZLcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V
    .locals 10
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const-wide/16 v8, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/SynchronousExecutor;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/SynchronousExecutor;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderThreadExecutor:Lcom/lumiyaviewer/lumiya/render/SynchronousExecutor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderThreadExecutor:Lcom/lumiyaviewer/lumiya/render/SynchronousExecutor;

    new-instance v2, Lcom/lumiyaviewer/lumiya/render/-$Lambda$8oUVvA5ObkigeJxIgo2HrzT6_jA;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/render/-$Lambda$8oUVvA5ObkigeJxIgo2HrzT6_jA;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->initialUpdateDone:Z

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v5}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->firstFrameCount:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-wide v8, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->lastDrawListUpdateTime:J

    iput v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawListUpdateFrameCount:I

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawPickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    new-array v0, v5, [F

    const/high16 v1, 0x7fc00000    # Float.NaN

    aput v1, v0, v3

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->simSunHour:[F

    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->forcedTime:F

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->pickLock:Ljava/lang/Object;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->needPickObject:Z

    iput v6, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->needPickX:F

    iput v6, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->needPickY:F

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->pickHandler:Landroid/os/Handler;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->touchHUDEvents:Ljava/util/List;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->touchHandler:Landroid/os/Handler;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->ownAvatarHidden:Z

    const/16 v0, 0x14

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawDistance:I

    const/4 v0, 0x5

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->avatarCountLimit:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->responsiveModeLock:Ljava/lang/Object;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isInteracting:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isFlinging:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isResponsiveMode:Z

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->screenshotHandler:Landroid/os/Handler;

    iput v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->displayedHUDid:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudScaleFactor:F

    iput v6, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudOffsetX:F

    iput v6, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudOffsetY:F

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hoverTextEnableHUDs:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hoverTextEnableObjects:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->createdGL30:Z

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Framebuffers:[I

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Renderbuffers:[I

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    new-array v0, v5, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->systemFramebuffer:[I

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/-$Lambda$8oUVvA5ObkigeJxIgo2HrzT6_jA$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/render/-$Lambda$8oUVvA5ObkigeJxIgo2HrzT6_jA$1;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->initSpatialIndexRunnable:Ljava/lang/Runnable;

    iput-wide v8, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->thisFrameTime:J

    iput v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->fpsFrameCount:I

    iput-wide v8, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->previousFrameTime:J

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentDrawList:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    const/16 v0, 0x40

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    const/4 v0, 0x4

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureHitVector:[F

    const/4 v0, 0x4

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureResultVector:[F

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->stateHandler:Landroid/os/Handler;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->requestGL20:Z

    iput p4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->fontSize:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private handleHUDTouch(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;Lcom/lumiyaviewer/lumiya/render/TouchHUDEvent;Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V
    .locals 10

    const/high16 v5, 0x40000000    # 2.0f

    const/4 v2, 0x2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    aget v0, v0, v2

    int-to-float v0, v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    aget v1, v1, v2

    int-to-float v1, v1

    const/4 v3, 0x0

    div-float v2, v1, v5

    iget v4, p3, Lcom/lumiyaviewer/lumiya/render/TouchHUDEvent;->y:F

    sub-float/2addr v2, v4

    div-float/2addr v2, v1

    div-float/2addr v0, v5

    iget v4, p3, Lcom/lumiyaviewer/lumiya/render/TouchHUDEvent;->x:F

    sub-float/2addr v0, v4

    div-float/2addr v0, v1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->getAttachmentPoint()Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    move-result-object v1

    iget-object v4, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v4, v0

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-float v5, v2, v0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->touchHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v1, p4, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v1, p4, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v2, p4, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceID:I

    iget-object v6, p4, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->u:F

    iget-object v7, p4, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v7, v7, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->v:F

    iget-object v8, p4, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v8, v8, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->s:F

    iget-object v9, p4, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v9, v9, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->t:F

    invoke-virtual/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TouchObjectFace(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;IFFFFFFF)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 3

    const/4 v2, 0x0

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    const-string/jumbo v0, "WorldViewRenderer: got new agentCircuit."

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->initialUpdateDone:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->initialUpdateDone:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getCaps()Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetMesh:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->setMeshCapURL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->initSpatialIndexRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    goto :goto_0
.end method

.method private processObjectPick()V
    .locals 9

    const/4 v7, 0x1

    const/4 v0, 0x0

    const/high16 v3, 0x7fc00000    # Float.NaN

    const/4 v4, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->pickLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->needPickObject:Z

    if-eqz v2, :cond_3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->needPickObject:Z

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->needPickX:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->needPickY:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->pickHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v6, v0

    move v0, v7

    :goto_0
    monitor-exit v1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    if-eqz v1, :cond_2

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentDrawList:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->objects:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v8

    move-object v5, v4

    :goto_1
    :try_start_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->tryPickObject(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFLcom/lumiyaviewer/lumiya/render/picking/IntersectPickable;Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v5

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_0
    :try_start_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentDrawList:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatars:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->tryPickObject(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFLcom/lumiyaviewer/lumiya/render/picking/IntersectPickable;Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v5

    goto :goto_2

    :catch_0
    move-exception v0

    move-object v5, v4

    :goto_3
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_1
    if-eqz v5, :cond_2

    if-eqz v6, :cond_2

    invoke-virtual {v6, v7, v5}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_2
    return-void

    :catch_1
    move-exception v0

    goto :goto_3

    :cond_3
    move-object v6, v4

    move v2, v3

    goto :goto_0
.end method

.method private setIsFlinging(Z)V
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->responsiveModeLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isFlinging:Z

    if-eq v2, p1, :cond_0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isFlinging:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    :cond_0
    monitor-exit v1

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->updateResponsive()V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private takeScreenshot(Lcom/lumiyaviewer/lumiya/render/RenderContext;Landroid/os/Handler;)V
    .locals 10

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v0, 0x0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    aget v2, v1, v9

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/4 v3, 0x3

    aget v3, v1, v3

    new-instance v7, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    mul-int v1, v2, v3

    mul-int/lit8 v1, v1, 0x4

    invoke-direct {v7, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    invoke-virtual {v7}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    const/16 v4, 0x1908

    const/16 v5, 0x1401

    move v1, v0

    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES10;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v7}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    sget-object v4, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v7, -0x40800000    # -1.0f

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Matrix;->setScale(FF)V

    int-to-float v3, v3

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setDither(Z)V

    invoke-virtual {v4, v1, v5, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->fontSize:I

    int-to-float v1, v1

    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setSubpixelText(Z)V

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    const/4 v1, -0x1

    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setColor(I)V

    new-array v5, v9, [Ljava/lang/String;

    const-string/jumbo v1, "Lumiya Viewer"

    aput-object v1, v5, v0

    const-string/jumbo v1, "http://lumiyaviewer.com"

    aput-object v1, v5, v8

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->fontSize:I

    int-to-float v1, v1

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v1, v6

    array-length v6, v5

    :goto_0
    if-ge v0, v6, :cond_0

    aget-object v7, v5, v0

    iget v8, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->fontSize:I

    int-to-float v8, v8

    invoke-virtual {v4, v7, v8, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual {v3}, Landroid/graphics/Paint;->descent()F

    move-result v7

    invoke-virtual {v3}, Landroid/graphics/Paint;->ascent()F

    move-result v8

    sub-float/2addr v7, v8

    add-float/2addr v1, v7

    iget v7, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->fontSize:I

    int-to-float v7, v7

    const/high16 v8, 0x3f000000    # 0.5f

    mul-float/2addr v7, v8

    add-float/2addr v1, v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x5

    invoke-virtual {p2, v0, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method private tryPickObject(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFLcom/lumiyaviewer/lumiya/render/picking/IntersectPickable;Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;
    .locals 3

    const v0, -0x4099999a    # -0.9f

    invoke-interface {p4, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/render/picking/IntersectPickable;->PickObject(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFF)Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    if-nez p5, :cond_0

    return-object v0

    :cond_0
    iget v1, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->pickDepth:F

    iget v2, p5, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->pickDepth:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    return-object v0

    :cond_1
    return-object p5
.end method

.method private updateResponsive()V
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->responsiveModeLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isResponsiveMode:Z

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isInteracting:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isFlinging:Z

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isResponsiveMode:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    if-eq v2, v0, :cond_0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pause()V

    :cond_0
    :goto_1
    return-void

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_2
    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->resume()V

    goto :goto_1
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_render_WorldViewRenderer-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    return-void
.end method

.method public createContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 6

    const/4 v1, 0x0

    const/16 v5, 0x3098

    const/16 v4, 0x3038

    const/4 v3, 0x0

    const-string/jumbo v0, "EGL: createContext called."

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->requestGL20:Z

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-lt v0, v2, :cond_1

    const-string/jumbo v0, "EGL: trying to create 3.0 context."

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x3

    filled-new-array {v5, v0, v4}, [I

    move-result-object v0

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {p1, p2, p3, v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-eq v0, v2, :cond_0

    const-string/jumbo v1, "EGL: 3.0 context apparently created."

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->createdGL30:Z

    return-object v0

    :cond_0
    const-string/jumbo v0, "EGL: Failed to create 3.0 context."

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    const-string/jumbo v0, "EGL: Creating regular context."

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->createdGL30:Z

    const/4 v0, 0x2

    filled-new-array {v5, v0, v4}, [I

    move-result-object v0

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->requestGL20:Z

    if-eqz v3, :cond_2

    :goto_0
    invoke-interface {p1, p2, p3, v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    return-object v0

    :cond_2
    move-object v0, v1

    goto :goto_0
.end method

.method public destroyContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    const/4 v4, 0x0

    const-string/jumbo v0, "EGL: destroyContext called."

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onRendererShutdown()V

    invoke-interface {p1, p2, p3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "EGLError code %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const-string/jumbo v0, "EGL: destroyContext exiting."

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public disableDrawing()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method public drawCrosshair(FF)V
    .locals 13

    const/16 v12, 0x20

    const/4 v11, 0x1

    const/16 v1, 0x10

    const/4 v5, 0x0

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    if-eqz v10, :cond_0

    iget-object v0, v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;->crosshairTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    if-eqz v0, :cond_0

    const/16 v0, 0xb71

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    iget-object v0, v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;->rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    iget-object v0, v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;->crosshairTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->GLDraw()V

    iget-object v0, v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;->rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->textureSampler:I

    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    invoke-static {v0, v3}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;->rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->vTextureTransformMatrix:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    invoke-static {v0, v11, v3, v2, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    const v2, -0x400ccccd    # -1.9f

    invoke-static {v0, v3, v5, v5, v2}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    neg-float v4, p2

    move v6, v5

    invoke-static/range {v0 .. v6}, Landroid/opengl/Matrix;->translateM([FI[FIFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v0, v1, p1, p1, v2}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    iget-object v0, v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v6

    iget-object v0, v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v7

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    move v5, v12

    move v9, v1

    invoke-static/range {v4 .. v9}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    iget-object v0, v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;->rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->uMVPMatrix:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    invoke-static {v0, v11, v3, v1, v12}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    iget-object v0, v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quad:Lcom/lumiyaviewer/lumiya/render/Quad;

    iget-object v1, v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;->rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->vPosition:I

    iget-object v2, v10, Lcom/lumiyaviewer/lumiya/render/RenderContext;->rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->vTexCoord:I

    invoke-virtual {v0, v10, v1, v2}, Lcom/lumiyaviewer/lumiya/render/Quad;->DrawSingleQuadShader(Lcom/lumiyaviewer/lumiya/render/RenderContext;II)V

    :cond_0
    return-void
.end method

.method public drawExternalTexture(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;[FFFFFF[FI)V
    .locals 8
    .param p1    # Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    if-eqz v7, :cond_0

    iget-object v0, v7, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->update([F)V

    const/16 v0, 0xb71

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    iget-object v0, v7, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->bind()V

    iget-object v0, v7, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->textureSampler:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget-object v0, v7, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->vTextureTransformMatrix:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, p2, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    neg-float v2, p4

    const/4 v1, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    neg-float v2, p5

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v4, -0x40000000    # -2.0f

    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    neg-float v4, p3

    const/16 v1, 0x10

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v0 .. v6}, Landroid/opengl/Matrix;->translateM([FI[FIFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    const/16 v1, 0x10

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v0, v1, p6, p7, v2}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    iget-object v1, v7, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v2

    iget-object v1, v7, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    const/16 v1, 0x20

    const/16 v5, 0x10

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    const/16 v2, 0x30

    const/16 v3, 0x20

    invoke-static {v0, v2, v1, v3}, Landroid/opengl/Matrix;->invertM([FI[FI)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureResultVector:[F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureHitVector:[F

    const/4 v1, 0x0

    const/16 v3, 0x30

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureResultVector:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    aput v0, p8, p9

    add-int/lit8 v0, p9, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureResultVector:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    aput v1, p8, v0

    iget-object v0, v7, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->uMVPMatrix:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->extTextureMatrix:[F

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/16 v4, 0x20

    invoke-static {v0, v2, v3, v1, v4}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    iget-object v0, v7, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quad:Lcom/lumiyaviewer/lumiya/render/Quad;

    iget-object v1, v7, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->vPosition:I

    iget-object v2, v7, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->vTexCoord:I

    invoke-virtual {v0, v7, v1, v2}, Lcom/lumiyaviewer/lumiya/render/Quad;->DrawSingleQuadShader(Lcom/lumiyaviewer/lumiya/render/RenderContext;II)V

    :cond_0
    return-void
.end method

.method public enableDrawing()V
    .locals 2

    const/4 v1, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->firstFrameCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_render_WorldViewRenderer_6642()V
    .locals 3

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->initialUpdateDone:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_1

    const-string/jumbo v1, "WorldViewRenderer: making new spatial index."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->initSpatialIndex()V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->terrainData:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->updateEntireTerrain()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->spatialObjectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->completeInitialUpdate()V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->initialUpdateDone:Z

    :cond_1
    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 8

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onPrepareFrame(Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;)V

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    invoke-virtual/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;[F[I[F[FI)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onFinishFrame()V

    return-void
.end method

.method public declared-synchronized onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;[F[I[F[FI)V
    .locals 8
    .param p2    # Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # [F
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # [I
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # [F
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # [F
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_1

    monitor-exit p0

    return-void

    :cond_1
    if-eqz p5, :cond_2

    if-eqz p2, :cond_2

    :try_start_2
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelResetIdentity()V

    if-eqz p6, :cond_7

    invoke-virtual {v1, p6, p7}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->setActiveProjectionMatrix([FI)V

    :goto_0
    const/4 v0, 0x0

    invoke-virtual {v1, p5, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelMultMatrixf([FI)V

    iget v0, p2, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    neg-float v0, v0

    const/high16 v2, 0x42b40000    # 90.0f

    add-float/2addr v0, v2

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelRotatef(FFFF)V

    const/high16 v0, -0x3d4c0000    # -90.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelRotatef(FFFF)V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    neg-float v0, v0

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    neg-float v2, v2

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    neg-float v3, v3

    invoke-virtual {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelTranslatef(FFF)V

    :cond_2
    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_9

    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useFXAA:Z

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Framebuffers:[I

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->systemFramebuffer:[I

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput v2, v0, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->systemFramebuffer:[I

    const v2, 0x8ca6

    const/4 v3, 0x0

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Framebuffers:[I

    const/4 v2, 0x0

    aget v0, v0, v2

    const v2, 0x8d40

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    const/4 v2, 0x0

    aget v0, v0, v2

    const/16 v2, 0xde1

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    const/4 v2, 0x0

    aget v0, v0, v2

    const v2, 0x8d40

    const v3, 0x8ce0

    const/16 v4, 0xde1

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v0, v5}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    if-eqz p4, :cond_3

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/4 v2, 0x2

    aget v0, v0, v2

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/4 v3, 0x3

    aget v2, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v3, v4, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    :cond_3
    :goto_1
    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    const/16 v0, 0xb71

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    const/16 v0, 0x302

    const/16 v2, 0x303

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBlendFunc(II)V

    const/16 v0, 0x100

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    :cond_4
    :goto_2
    const/4 v0, 0x1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->firstFrameCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-lez v2, :cond_5

    const-string/jumbo v0, "onDrawFrame: drawing empty first frame!"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->firstFrameCount:Ljava/util/concurrent/atomic/AtomicInteger;

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    const/4 v0, 0x0

    :cond_5
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v2, :cond_6

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_a

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->systemFramebuffer:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const v1, 0x8d40

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_7
    :try_start_3
    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->setActiveProjectionMatrix(Lcom/lumiyaviewer/lumiya/render/MatrixStack;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_8
    if-eqz p4, :cond_3

    const/4 v0, 0x0

    :try_start_4
    aget v0, p4, v0

    const/4 v2, 0x1

    aget v2, p4, v2

    const/4 v3, 0x2

    aget v3, p4, v3

    const/4 v4, 0x3

    aget v4, p4, v4

    invoke-static {v0, v2, v3, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    goto :goto_1

    :cond_9
    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES10;->glEnable(I)V

    const/16 v0, 0xb71

    invoke-static {v0}, Landroid/opengl/GLES10;->glEnable(I)V

    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES10;->glEnable(I)V

    const/16 v0, 0xbc0

    invoke-static {v0}, Landroid/opengl/GLES10;->glEnable(I)V

    const/16 v0, 0x204

    const v2, 0x3ecccccd    # 0.4f

    invoke-static {v0, v2}, Landroid/opengl/GLES10;->glAlphaFunc(IF)V

    const/16 v0, 0x302

    const/16 v2, 0x303

    invoke-static {v0, v2}, Landroid/opengl/GLES10;->glBlendFunc(II)V

    const/16 v0, 0x4100

    invoke-static {v0}, Landroid/opengl/GLES10;->glClear(I)V

    const/high16 v0, 0x46040000    # 8448.0f

    const/16 v2, 0x2300

    const/16 v3, 0x2200

    invoke-static {v2, v3, v0}, Landroid/opengl/GLES10;->glTexEnvf(IIF)V

    if-eqz p4, :cond_4

    const/4 v0, 0x0

    aget v0, p4, v0

    const/4 v2, 0x1

    aget v2, p4, v2

    const/4 v3, 0x2

    aget v3, p4, v3

    const/4 v4, 0x3

    aget v4, p4, v4

    invoke-static {v0, v2, v3, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_2

    :cond_a
    :try_start_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentDrawList:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentFrustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    if-eqz v0, :cond_d

    if-nez p5, :cond_b

    if-eqz p3, :cond_b

    const/4 v0, 0x0

    aget v0, p3, v0

    const/4 v2, 0x1

    aget v2, p3, v2

    const/4 v3, 0x2

    aget v3, p3, v3

    invoke-virtual {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelTranslatef(FFF)V

    :cond_b
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->initAllPrimPrograms(Z)V

    const/4 v0, 0x0

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentDrawList:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_c

    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    :goto_3
    iget-object v4, v3, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->objects:Ljava/util/ArrayList;

    iget-object v5, v3, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->renderPasses:[I

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->clearFaceTexture()V

    const/4 v0, 0x0

    move v2, v0

    :goto_4
    if-ge v2, v6, :cond_10

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    const/4 v7, 0x1

    invoke-virtual {v0, v1, v7}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)I

    move-result v0

    aput v0, v5, v2

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_4

    :cond_c
    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES10;->glDisable(I)V

    const/16 v0, 0xbc0

    invoke-static {v0}, Landroid/opengl/GLES10;->glDisable(I)V
    :try_end_5
    .catch Ljava/util/ConcurrentModificationException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_3

    :catch_0
    move-exception v0

    :try_start_6
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_d
    :goto_5
    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_f

    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useFXAA:Z

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->systemFramebuffer:[I

    const/4 v2, 0x0

    aget v0, v0, v2

    const v2, 0x8d40

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    if-eqz p4, :cond_e

    const/4 v0, 0x0

    aget v0, p4, v0

    const/4 v2, 0x1

    aget v2, p4, v2

    const/4 v3, 0x2

    aget v3, p4, v3

    const/4 v4, 0x3

    aget v4, p4, v4

    invoke-static {v0, v2, v3, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    :cond_e
    const/16 v0, 0xb71

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    const/4 v2, 0x0

    aget v0, v0, v2

    const/16 v2, 0xde1

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const v0, 0x84c1

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    const/4 v2, 0x1

    aget v0, v0, v2

    const/16 v2, 0xde1

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v0, 0xde1

    const/16 v2, 0x2800

    const/16 v3, 0x2600

    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0xde1

    const/16 v2, 0x2801

    const/16 v3, 0x2600

    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0xde1

    const/16 v2, 0x2802

    const v3, 0x812f

    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0xde1

    const/16 v2, 0x2803

    const v3, 0x812f

    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quad:Lcom/lumiyaviewer/lumiya/render/Quad;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->vPosition:I

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->vTexCoord:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/render/Quad;->DrawSingleQuadShader(Lcom/lumiyaviewer/lumiya/render/RenderContext;II)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :cond_f
    monitor-exit p0

    return-void

    :cond_10
    const/4 v0, 0x0

    :try_start_7
    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->clearFaceTexture()V

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;->GLPrepare(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, v3, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->terrain:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;->GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    :try_end_7
    .catch Ljava/util/ConcurrentModificationException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_6

    :catch_1
    move-exception v0

    :try_start_8
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_5

    :cond_11
    const/4 v0, 0x0

    :try_start_9
    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->clearFaceTexture()V

    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_13

    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    :goto_7
    iget-object v0, v3, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatars:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_12
    :goto_8
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    iget-object v2, v3, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->myAvatar:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    if-ne v0, v2, :cond_14

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->ownAvatarHidden:Z

    :goto_9
    if-nez v2, :cond_12

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    goto :goto_8

    :cond_13
    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES10;->glEnable(I)V

    const/16 v0, 0xbc0

    invoke-static {v0}, Landroid/opengl/GLES10;->glEnable(I)V

    goto :goto_7

    :cond_14
    const/4 v2, 0x0

    goto :goto_9

    :cond_15
    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_16

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightSky:Lcom/lumiyaviewer/lumiya/render/WindlightSky;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->getHeading()F

    move-result v2

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->getTilt()F

    move-result v7

    invoke-virtual {v0, v1, v2, v7}, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;FF)V

    :cond_16
    const/4 v0, 0x0

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->clearFaceTexture()V

    add-int/lit8 v0, v6, -0x1

    move v2, v0

    :goto_a
    if-ltz v2, :cond_18

    aget v0, v5, v2

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_17

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    const/4 v6, 0x2

    invoke-virtual {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)I

    :cond_17
    add-int/lit8 v0, v2, -0x1

    move v2, v0

    goto :goto_a

    :cond_18
    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL30:Z

    if-eqz v0, :cond_1a

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->PrepareOcclusionQueries(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentFrustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->mvpMatrix:[F

    invoke-virtual {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->TestOcclusion(Lcom/lumiyaviewer/lumiya/render/RenderContext;[F)V

    goto :goto_b

    :cond_19
    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->EndOcclusionQueries(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    :cond_1a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->screenshotHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->screenshotHandler:Landroid/os/Handler;

    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->takeScreenshot(Lcom/lumiyaviewer/lumiya/render/RenderContext;Landroid/os/Handler;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->screenshotHandler:Landroid/os/Handler;

    :cond_1b
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawPickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawPickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1c

    iget-object v0, v3, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->objects:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawPickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->DrawIfPicked(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    goto :goto_c

    :cond_1c
    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_1d

    const/16 v0, 0x1701

    invoke-static {v0}, Landroid/opengl/GLES10;->glMatrixMode(I)V

    invoke-static {}, Landroid/opengl/GLES10;->glLoadIdentity()V

    const/16 v0, 0x1700

    invoke-static {v0}, Landroid/opengl/GLES10;->glMatrixMode(I)V

    :cond_1d
    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_1e

    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useFXAA:Z

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    if-eqz v0, :cond_1e

    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    const/4 v2, 0x1

    aget v0, v0, v2

    const/16 v2, 0xde1

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    const/4 v2, 0x1

    aget v0, v0, v2

    const v2, 0x8d40

    const v4, 0x8ce0

    const/16 v5, 0xde1

    const/4 v6, 0x0

    invoke-static {v2, v4, v5, v0, v6}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    const/4 v0, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v0, v2, v4, v5}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 v0, 0x4000

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    :cond_1e
    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quad:Lcom/lumiyaviewer/lumiya/render/Quad;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/Quad;->PrepareDrawQuads(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, v3, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatars:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1f
    :goto_d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    iget-object v2, v3, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->myAvatar:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    if-ne v0, v2, :cond_20

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->ownAvatarHidden:Z

    :goto_e
    if-nez v2, :cond_1f

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->DrawNameTag(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    goto :goto_d

    :cond_20
    const/4 v2, 0x0

    goto :goto_e

    :cond_21
    iget-object v0, v3, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatarStubs:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;->DrawNameTag(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    goto :goto_f

    :cond_22
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hoverTextEnableObjects:Z

    if-eqz v0, :cond_23

    iget-object v0, v3, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->objects:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->DrawHoverText(Lcom/lumiyaviewer/lumiya/render/RenderContext;Z)V

    goto :goto_10

    :cond_23
    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quad:Lcom/lumiyaviewer/lumiya/render/Quad;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/Quad;->EndDrawQuads(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    const/4 v0, 0x0

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->displayedHUDid:I

    if-eqz v0, :cond_28

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->touchHUDEvents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x1

    if-lt v0, v2, :cond_24

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->touchHUDEvents:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/TouchHUDEvent;

    move-object v5, v0

    :cond_24
    iget-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_26

    const/16 v0, 0x100

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->initAllPrimPrograms(Z)V

    :goto_11
    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionHUDMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->setActiveProjectionMatrix(Lcom/lumiyaviewer/lumiya/render/MatrixStack;)V

    const/high16 v0, 0x42b40000    # 90.0f

    const/4 v2, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    invoke-virtual {v1, v0, v2, v4, v6}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelRotatef(FFFF)V

    const/high16 v0, -0x3d4c0000    # -90.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v6, 0x0

    invoke-virtual {v1, v0, v2, v4, v6}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelRotatef(FFFF)V

    iget-object v0, v3, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->myAvatar:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    if-eqz v0, :cond_d

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->displayedHUDid:I

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->setDisplayedHUDid(I)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->getDrawableHUD()Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;

    move-result-object v0

    if-eqz v0, :cond_d

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudScaleFactor:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudOffsetX:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudOffsetY:F

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFFLcom/lumiyaviewer/lumiya/render/TouchHUDEvent;Z)Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    move-result-object v2

    if-eqz v2, :cond_25

    invoke-direct {p0, v1, v0, v5, v2}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->handleHUDTouch(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;Lcom/lumiyaviewer/lumiya/render/TouchHUDEvent;Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    :cond_25
    iget-boolean v2, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v2, :cond_27

    const/16 v2, 0xb71

    invoke-static {v2}, Landroid/opengl/GLES20;->glDisable(I)V

    :goto_12
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hoverTextEnableHUDs:Z

    if-eqz v2, :cond_d

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quad:Lcom/lumiyaviewer/lumiya/render/Quad;

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/render/Quad;->PrepareDrawQuads(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudScaleFactor:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudOffsetX:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudOffsetY:F

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHUD;->Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFFLcom/lumiyaviewer/lumiya/render/TouchHUDEvent;Z)Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quad:Lcom/lumiyaviewer/lumiya/render/Quad;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/Quad;->EndDrawQuads(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    goto/16 :goto_5

    :cond_26
    const/16 v0, 0x100

    invoke-static {v0}, Landroid/opengl/GLES10;->glClear(I)V

    goto :goto_11

    :cond_27
    const/16 v2, 0xb71

    invoke-static {v2}, Landroid/opengl/GLES10;->glDisable(I)V

    const/16 v2, 0x1701

    invoke-static {v2}, Landroid/opengl/GLES10;->glMatrixMode(I)V

    invoke-static {}, Landroid/opengl/GLES10;->glLoadIdentity()V

    const/16 v2, 0x1700

    invoke-static {v2}, Landroid/opengl/GLES10;->glMatrixMode(I)V

    goto :goto_12

    :cond_28
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->touchHUDEvents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_9
    .catch Ljava/util/ConcurrentModificationException; {:try_start_9 .. :try_end_9} :catch_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_5
.end method

.method public onFinishFrame()V
    .locals 8

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentDrawList:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->previousFrameTime:J

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->lastDrawListUpdateTime:J

    const-wide/16 v6, 0x64

    add-long/2addr v4, v6

    cmp-long v1, v2, v4

    if-gtz v1, :cond_1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawListUpdateFrameCount:I

    if-gtz v1, :cond_2

    :cond_1
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->spatialObjectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->updateDrawListIfNeeded()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->previousFrameTime:J

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->lastDrawListUpdateTime:J

    const/4 v0, 0x4

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawListUpdateFrameCount:I

    :cond_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawListUpdateFrameCount:I

    if-lez v0, :cond_3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawListUpdateFrameCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawListUpdateFrameCount:I

    :cond_3
    return-void
.end method

.method public onPrepareFrame(Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;)V
    .locals 13

    const/4 v12, 0x1

    const/high16 v11, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    const/4 v10, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderThreadExecutor:Lcom/lumiyaviewer/lumiya/render/SynchronousExecutor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/SynchronousExecutor;->runQueuedTasks()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    if-nez v9, :cond_1

    return-void

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->previousFrameTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x21

    cmp-long v4, v2, v4

    if-gez v4, :cond_2

    const-wide/16 v4, 0x21

    sub-long v2, v4, v2

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    :goto_0
    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->previousFrameTime:J

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->firstFrameTime:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->thisFrameTime:J

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->fpsFrameCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->fpsFrameCount:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->fpsFrameCount:I

    const/16 v1, 0xa

    if-lt v0, v1, :cond_3

    iput v10, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->fpsFrameCount:I

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->thisFrameTime:J

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->lastFrameTime:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_3

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->thisFrameTime:J

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->lastFrameTime:J

    sub-long/2addr v0, v2

    long-to-float v0, v0

    const v1, 0x461c4000    # 10000.0f

    div-float v0, v1, v0

    const-string/jumbo v1, "Renderer: FPS %.2f frame time %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v2, v10

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->thisFrameTime:J

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->lastFrameTime:J

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v2, v12

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->thisFrameTime:J

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->lastFrameTime:J

    :cond_3
    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->releaseFrameMemory()V

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->ClearFrameKeeps()V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->Cleanup()V

    iget v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCount:I

    iget-boolean v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL30:Z

    if-eqz v0, :cond_4

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->processOcclusionQueries()V

    :cond_4
    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelResetIdentity()V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v9, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->setActiveProjectionMatrix(Lcom/lumiyaviewer/lumiya/render/MatrixStack;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_5

    if-eqz p1, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->myAviPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0, p1, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getVRCamera(Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;)V

    invoke-direct {p0, v10}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setIsFlinging(Z)V

    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->getPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v0

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    if-eqz p1, :cond_b

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->headTransformMatrix:[F

    invoke-virtual {v9, v0, v10}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelMultMatrixf([FI)V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    neg-float v0, v0

    const/high16 v1, 0x42b40000    # 90.0f

    add-float/2addr v0, v1

    invoke-virtual {v9, v0, v8, v11, v8}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelRotatef(FFFF)V

    const/high16 v0, -0x3d4c0000    # -90.0f

    invoke-virtual {v9, v0, v11, v8, v8}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelRotatef(FFFF)V

    :goto_2
    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    neg-float v0, v0

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    neg-float v1, v1

    iget-object v2, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    neg-float v2, v2

    invoke-virtual {v9, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelTranslatef(FFF)V

    iget-boolean v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_d

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v2, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v3, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawDistance:I

    int-to-float v4, v4

    iget-object v5, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v5

    iget-object v6, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v6

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;-><init>(FFFF[FI)V

    :goto_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentFrustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    invoke-static {v1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentFrustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentFrustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->mvpMatrix:[F

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;-><init>([F)V

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->spatialObjectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentFrustrumInfo:Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->setViewport(Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;)V

    :cond_6
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isResponsiveMode:Z

    if-nez v0, :cond_7

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->RunLoadQueue()V

    :cond_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->terrainData:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->isUnderWater(F)Z

    move-result v0

    iput-boolean v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->underWater:Z

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->thisFrameTime:J

    const-wide/32 v2, 0xf4240

    rem-long/2addr v0, v2

    long-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    iput v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterTime:F

    iget-boolean v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_8

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->forcedTime:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_e

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->simSunHour:[F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->simSunHour:[F

    aget v2, v2, v10

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getSunHour([FZ)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string/jumbo v0, "Windlight: using sim hour of %f"

    new-array v1, v12, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->simSunHour:[F

    aget v2, v2, v10

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v1, v10

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightDay:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightPreset:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->simSunHour:[F

    aget v2, v2, v10

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->InterpolatePreset(Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;F)V

    :cond_8
    :goto_4
    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->spatialObjectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->getObjectsInFrustrum()Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentDrawList:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentDrawList:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->avatars:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_9
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->currentDrawList:Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->myAvatar:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    if-ne v0, v1, :cond_10

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->ownAvatarHidden:Z

    :goto_6
    if-nez v1, :cond_9

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->RunAnimations()V

    goto :goto_5

    :catch_0
    move-exception v2

    goto/16 :goto_0

    :cond_a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->myAviPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentAndCameraPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;)Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setIsFlinging(Z)V

    goto/16 :goto_1

    :cond_b
    const/high16 v0, -0x3d4c0000    # -90.0f

    invoke-virtual {v9, v0, v11, v8, v8}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelRotatef(FFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->getTilt()F

    move-result v0

    cmpl-float v1, v0, v8

    if-eqz v1, :cond_c

    invoke-virtual {v9, v0, v11, v8, v8}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelRotatef(FFFF)V

    :cond_c
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->cameraParams:Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->getHeading()F

    move-result v0

    neg-float v0, v0

    const/high16 v1, 0x42b40000    # 90.0f

    add-float/2addr v0, v1

    invoke-virtual {v9, v0, v8, v8, v11}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelRotatef(FFFF)V

    goto/16 :goto_2

    :cond_d
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v2, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v3, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawDistance:I

    int-to-float v4, v4

    iget-object v5, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v5

    iget-object v6, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v6

    iget-object v7, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v7

    iget-object v8, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v8

    invoke-direct/range {v0 .. v8}, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;-><init>(FFFF[FI[FI)V

    goto/16 :goto_3

    :cond_e
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->simSunHour:[F

    aget v1, v1, v10

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_f

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->simSunHour:[F

    aget v1, v1, v10

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_8

    :cond_f
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->simSunHour:[F

    aput v0, v1, v10

    const-string/jumbo v0, "Windlight: using forced hour of %f"

    new-array v1, v12, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->simSunHour:[F

    aget v2, v2, v10

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v1, v10

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightDay:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightPreset:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->simSunHour:[F

    aget v2, v2, v10

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->InterpolatePreset(Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;F)V

    goto/16 :goto_4

    :cond_10
    move v1, v10

    goto/16 :goto_6

    :cond_11
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->processObjectPick()V

    return-void
.end method

.method public onRendererShutdown()V
    .locals 4

    const/4 v1, 0x0

    const/4 v3, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->resume()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getInstance()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->DisableObjectIndex(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->StopLoadQueue()V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->ClearFrameKeeps()V

    const-string/jumbo v1, "EGL: destroyContext: calling Flush()."

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->Flush()V

    const-string/jumbo v0, "EGL: destroyContext: returned from Flush()."

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->releaseAllFrameMemory()V

    const-string/jumbo v0, "EGL: destroyContext: calling eglDestroyContext ()."

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->initialUpdateDone:Z

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->clearActiveRenderer(Ljava/lang/Object;)V

    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 11

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    if-nez v9, :cond_0

    return-void

    :cond_0
    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput v1, v0, v2

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/4 v1, 0x0

    const/4 v2, 0x1

    aput v1, v0, v2

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/4 v1, 0x2

    aput p2, v0, v1

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/4 v1, 0x3

    aput p3, v0, v1

    iget-boolean v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {v0, v1, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-boolean v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useFXAA:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->systemFramebuffer:[I

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput v1, v0, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->systemFramebuffer:[I

    const v1, 0x8ca6

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Framebuffers:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const v1, 0x8d40

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Renderbuffers:[I

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Renderbuffers:[I

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Renderbuffers:[I

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    array-length v0, v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Renderbuffers:[I

    if-nez v0, :cond_3

    const/4 v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Renderbuffers:[I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Renderbuffers:[I

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Renderbuffers:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const v1, 0x8d41

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    const v0, 0x8d41

    const v1, 0x81a5

    invoke-static {v0, v1, p2, p3}, Landroid/opengl/GLES20;->glRenderbufferStorage(IIII)V

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    if-nez v0, :cond_5

    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    array-length v0, v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    const/4 v0, 0x0

    move v10, v0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    array-length v0, v0

    if-ge v10, v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    aget v0, v0, v10

    const/16 v1, 0xde1

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    if-nez v10, :cond_4

    const/16 v0, 0xde1

    const/4 v1, 0x0

    const/16 v2, 0x1907

    const/4 v5, 0x0

    const/16 v6, 0x1907

    const v7, 0x8363

    const/4 v8, 0x0

    move v3, p2

    move v4, p3

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    :goto_1
    const/16 v0, 0xde1

    const/16 v1, 0x2802

    const v2, 0x812f

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0xde1

    const/16 v1, 0x2803

    const v2, 0x812f

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0xde1

    const/16 v1, 0x2800

    const/16 v2, 0x2601

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0xde1

    const/16 v1, 0x2801

    const/16 v2, 0x2601

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    add-int/lit8 v0, v10, 0x1

    move v10, v0

    goto :goto_0

    :cond_4
    const/16 v0, 0xde1

    const/4 v1, 0x0

    const/16 v2, 0x1908

    const/4 v5, 0x0

    const/16 v6, 0x1908

    const/16 v7, 0x1401

    const/4 v8, 0x0

    move v3, p2

    move v4, p3

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    goto :goto_1

    :cond_5
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {v0, v1, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Renderbuffers:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const v1, 0x8d41

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const/16 v1, 0xde1

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Renderbuffers:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const v1, 0x8d40

    const v2, 0x8d00

    const v3, 0x8d41

    invoke-static {v1, v2, v3, v0}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const v1, 0x8d40

    const v2, 0x8ce0

    const/16 v3, 0xde1

    const/4 v4, 0x0

    invoke-static {v1, v2, v3, v0, v4}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->textureSampler:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->noAAtextureSampler:I

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->texcoordOffset:I

    int-to-float v1, p2

    const/high16 v2, 0x3f800000    # 1.0f

    div-float v1, v2, v1

    int-to-float v2, p3

    const/high16 v3, 0x3f800000    # 1.0f

    div-float v2, v3, v2

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    const/16 v0, 0x10

    new-array v0, v0, [F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    const/4 v1, 0x0

    const/high16 v2, 0x40000000    # 2.0f

    const/high16 v3, 0x40000000    # 2.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->uMVPMatrix:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v1, v2, v3, v0, v4}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->systemFramebuffer:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const v1, 0x8d40

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    :cond_6
    :goto_2
    int-to-float v0, p2

    int-to-float v1, p3

    div-float/2addr v0, v1

    iput v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->aspectRatio:F

    const/high16 v0, 0x42700000    # 60.0f

    iput v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->FOVAngle:F

    iget v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->FOVAngle:F

    float-to-double v0, v0

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v0, v2

    const-wide v2, 0x4076800000000000L    # 360.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->tan(D)D

    move-result-wide v0

    double-to-float v0, v0

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v4, v0, v1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawDistance:I

    int-to-float v6, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Renderer: Using drawDistance = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawDistance:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->reset()V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    iget v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->aspectRatio:F

    neg-float v1, v1

    mul-float/2addr v1, v4

    iget v2, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->aspectRatio:F

    mul-float/2addr v2, v4

    neg-float v3, v4

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/high16 v5, 0x3f000000    # 0.5f

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glFrustumf(FFFFFF)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawDistance:I

    int-to-float v0, v0

    iput v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->drawDistance:F

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionHUDMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->reset()V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionHUDMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    iget v1, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->aspectRatio:F

    neg-float v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    mul-float/2addr v1, v2

    iget v2, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->aspectRatio:F

    const/high16 v3, 0x3f800000    # 1.0f

    mul-float/2addr v2, v3

    const/high16 v3, -0x40800000    # -1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, -0x40800000    # -1.0f

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glOrthof(FFFFFF)V

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightSky:Lcom/lumiyaviewer/lumiya/render/WindlightSky;

    if-eqz v0, :cond_7

    iget-object v0, v9, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightSky:Lcom/lumiyaviewer/lumiya/render/WindlightSky;

    invoke-virtual {v0, v9}, Lcom/lumiyaviewer/lumiya/render/WindlightSky;->updateMatrix(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->firstFrameTime:J

    return-void

    :cond_8
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {v0, v1, p2, p3}, Landroid/opengl/GLES10;->glViewport(IIII)V

    const/16 v0, 0x1701

    invoke-static {v0}, Landroid/opengl/GLES10;->glMatrixMode(I)V

    invoke-static {}, Landroid/opengl/GLES10;->glLoadIdentity()V

    goto/16 :goto_2
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;Z)V

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;Z)V
    .locals 13

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->setActiveRenderer(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->firstFrameCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->resume()V

    const/16 v0, 0x1f00

    invoke-static {v0}, Landroid/opengl/GLES10;->glGetString(I)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1f01

    invoke-static {v1}, Landroid/opengl/GLES10;->glGetString(I)Ljava/lang/String;

    move-result-object v2

    const/16 v1, 0x1f02

    invoke-static {v1}, Landroid/opengl/GLES10;->glGetString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v1, 0x1f03

    invoke-static {v1}, Landroid/opengl/GLES10;->glGetString(I)Ljava/lang/String;

    move-result-object v4

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->createdGL30:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    new-array v1, v1, [I

    const v5, 0x821b

    const/4 v6, 0x0

    invoke-static {v5, v1, v6}, Landroid/opengl/GLES30;->glGetIntegerv(I[II)V

    const-string/jumbo v5, "Renderer: Reported major version: %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aget v7, v1, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v5, 0x0

    aget v1, v1, v5

    const/4 v5, 0x3

    if-ge v1, v5, :cond_0

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->createdGL30:Z

    :cond_0
    const-string/jumbo v1, "Renderer: glVendor \'%s\', glRenderer \'%s\'"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v2, v5, v0

    invoke-static {v1, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Renderer: version = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\', extensions = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\', thread id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->createdGL30:Z

    iget-boolean v5, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->createdGL30:Z

    const-string/jumbo v0, " "

    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    const/4 v0, 0x0

    array-length v6, v4

    move v12, v0

    move v0, v1

    move v1, v12

    :goto_0
    if-ge v1, v6, :cond_2

    aget-object v7, v4, v1

    const-string/jumbo v8, "GL_ARB_vertex_buffer_object"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v0, 0x1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const-string/jumbo v1, "1.1"

    invoke-virtual {v3, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v5, 0x1

    const/4 v6, 0x1

    :goto_1
    const-string/jumbo v0, "Renderer: VBO support %s, GL11 %s, GL30 %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v1, v4

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->createdGL30:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v1, v4

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->createdGL30:Z

    iget-boolean v4, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->requestGL20:Z

    iget v7, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->avatarCountLimit:I

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getTerrainTextures()Z

    move-result v8

    iget v9, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->fontSize:I

    move-object v1, p2

    move/from16 v10, p3

    move-object v11, p0

    invoke-direct/range {v0 .. v11}, Lcom/lumiyaviewer/lumiya/render/RenderContext;-><init>(Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/String;ZZZZIZIZLjava/lang/Object;)V

    const-string/jumbo v1, "Renderer: created context, GL30 %b, GL20 %b"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-boolean v3, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL30:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-boolean v3, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->AlwaysPrintf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-boolean v1, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v1, :cond_7

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->getShaderCompileErrors()Z

    move-result v1

    if-eqz v1, :cond_4

    const-string/jumbo v1, "Renderer: Shaders did not compile well."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->stateHandler:Landroid/os/Handler;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->stateHandler:Landroid/os/Handler;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_4
    const-string/jumbo v1, "Renderer: Basic geometry program = %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->getHandle()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const v1, 0x3dcccccd    # 0.1f

    const v2, 0x3dcccccd    # 0.1f

    const/high16 v3, 0x3f000000    # 0.5f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v1, v2, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    iget-boolean v1, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useFXAA:Z

    if-eqz v1, :cond_6

    const/4 v1, 0x1

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Framebuffers:[I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Framebuffers:[I

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {v2, v1, v3}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    :goto_2
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Renderbuffers:[I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Colorbuffers:[I

    :goto_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getHoverTextEnableHUDs()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hoverTextEnableHUDs:Z

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getHoverTextEnableObjects()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hoverTextEnableObjects:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->stateHandler:Landroid/os/Handler;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->stateHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_5
    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->initSpatialIndexRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->firstFrameTime:J

    return-void

    :cond_6
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->Framebuffers:[I

    goto :goto_2

    :cond_7
    const v1, 0x8074

    invoke-static {v1}, Landroid/opengl/GLES10;->glEnableClientState(I)V

    const v1, 0x3dcccccd    # 0.1f

    const v2, 0x3dcccccd    # 0.1f

    const/high16 v3, 0x3f000000    # 0.5f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v1, v2, v3, v4}, Landroid/opengl/GLES10;->glClearColor(FFFF)V

    goto :goto_3

    :cond_8
    move v6, v0

    goto/16 :goto_1
.end method

.method public pickObject(FFLandroid/os/Handler;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->pickLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->needPickX:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->needPickY:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->needPickObject:Z

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->pickHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public requestScreenshot(Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->screenshotHandler:Landroid/os/Handler;

    return-void
.end method

.method public setAvatarCountLimit(I)V
    .locals 1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->avatarCountLimit:I

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getInstance()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->setAvatarCountLimit(I)V

    return-void
.end method

.method public setDisplayedHUDid(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->displayedHUDid:I

    return-void
.end method

.method public setDrawDistance(I)V
    .locals 2

    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawDistance:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    if-eqz v0, :cond_0

    int-to-float v1, p1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->drawDistance:F

    :cond_0
    return-void
.end method

.method public setDrawPickedObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawPickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    return-void
.end method

.method public setForcedTime(ZF)V
    .locals 1

    if-eqz p1, :cond_0

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->forcedTime:F

    :goto_0
    return-void

    :cond_0
    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->forcedTime:F

    goto :goto_0
.end method

.method public setHUDOffset(FF)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudOffsetX:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudOffsetY:F

    return-void
.end method

.method public setHUDScaleFactor(F)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->hudScaleFactor:F

    return-void
.end method

.method public setIsInteracting(Z)V
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->responsiveModeLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isInteracting:Z

    if-eq v2, p1, :cond_0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->isInteracting:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    :cond_0
    monitor-exit v1

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->updateResponsive()V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setOwnAvatarHidden(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->ownAvatarHidden:Z

    return-void
.end method

.method public touchHUD(FFLandroid/os/Handler;)V
    .locals 2

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->touchHandler:Landroid/os/Handler;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->displayedHUDid:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->touchHUDEvents:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/TouchHUDEvent;

    invoke-direct {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/render/TouchHUDEvent;-><init>(FF)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method
