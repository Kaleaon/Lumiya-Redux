.class Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/vr/sdk/base/GvrView$StereoRenderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WorldStereoRenderer"
.end annotation


# static fields
.field private static final TURN_DEGREES:F = 35.0f

.field private static final TURN_DEGREES_PER_MS:F = 0.02f

.field private static final YAW_AVERAGE_FACTOR:F = 1.0E-4f


# instance fields
.field private agentHeadingAcquired:Z

.field private crosshairVisible:Z

.field private final extTextureMatrixUV:[F

.field private externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

.field private final eyeHitTests:[F

.field private final eyeOffset:[F

.field private final eyeOffsetMatrix:[F

.field private final eyeProjection:[F

.field private final eyeProjectionValid:[Z

.field private eyeSeparation:F

.field private final eyeViewport:[I

.field private final headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

.field private lastFrameTime:J

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

.field private viewportHeight:I

.field private viewportWidth:I


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V
    .locals 6

    const/16 v3, 0x10

    const/4 v2, 0x4

    const/4 v4, 0x0

    const/4 v1, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->viewportWidth:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->viewportHeight:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->agentHeadingAcquired:Z

    new-array v0, v2, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeHitTests:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->extTextureMatrixUV:[F

    iput v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeSeparation:F

    new-array v0, v2, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeOffset:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeOffsetMatrix:[F

    new-array v0, v2, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeViewport:[I

    const/16 v0, 0x20

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeProjection:[F

    const/4 v0, 0x2

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeProjectionValid:[Z

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->lastFrameTime:J

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->crosshairVisible:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeOffsetMatrix:[F

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeOffsetMatrix:[F

    const/high16 v2, -0x3d4c0000    # -90.0f

    const/high16 v3, 0x3f800000    # 1.0f

    move v5, v4

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity$WorldStereoRenderer-mthref-0()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap8(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$WorldStereoRenderer_58554()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    return-void
.end method

.method public onDrawEye(Lcom/google/vr/sdk/base/Eye;)V
    .locals 11

    const/high16 v2, 0x3f000000    # 0.5f

    const/4 v8, 0x1

    const/4 v1, 0x0

    const/4 v7, 0x0

    invoke-virtual {p1}, Lcom/google/vr/sdk/base/Eye;->getType()I

    move-result v9

    if-ne v9, v8, :cond_0

    const/high16 v0, -0x41000000    # -0.5f

    :goto_0
    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeSeparation:F

    mul-float v10, v0, v3

    move v0, v7

    :goto_1
    const/4 v3, 0x4

    if-ge v0, v3, :cond_1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeOffset:[F

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->rightVector:[F

    aget v4, v4, v0

    mul-float/2addr v4, v10

    aput v4, v3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/google/vr/sdk/base/Eye;->getViewport()Lcom/google/vr/sdk/base/Viewport;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeViewport:[I

    invoke-virtual {v0, v3, v7}, Lcom/google/vr/sdk/base/Viewport;->getAsArray([II)V

    invoke-virtual {p1}, Lcom/google/vr/sdk/base/Eye;->getEyeView()[F

    if-ne v9, v8, :cond_5

    move v0, v7

    :goto_2
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get24(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;

    move-result-object v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeProjectionValid:[Z

    aget-boolean v3, v3, v0

    if-eqz v3, :cond_2

    invoke-virtual {p1}, Lcom/google/vr/sdk/base/Eye;->getProjectionChanged()Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_2
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get24(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;

    move-result-object v3

    iget v3, v3, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;->drawDistance:I

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Lcom/google/vr/sdk/base/Eye;->getPerspective(FF)[F

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeProjection:[F

    mul-int/lit8 v0, v0, 0x10

    const/16 v4, 0x10

    invoke-static {v2, v7, v3, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeOffset:[F

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeViewport:[I

    move-object v5, v1

    move-object v6, v1

    invoke-virtual/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;[F[I[F[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    if-eqz v0, :cond_4

    if-ne v9, v8, :cond_6

    move v9, v7

    :goto_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->extTextureMatrixUV:[F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v4, v3, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->pitchDegrees:F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v5, v3, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->useButtonsYaw:F

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeHitTests:[F

    const/high16 v6, 0x3fc00000    # 1.5f

    const/high16 v7, 0x3f900000    # 1.125f

    move v3, v10

    invoke-virtual/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawExternalTexture(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;[FFFFFF[FI)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->crosshairVisible:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    move-result-object v0

    const v1, 0x3dcccccd    # 0.1f

    invoke-virtual {v0, v1, v10}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->drawCrosshair(FF)V

    :cond_4
    return-void

    :cond_5
    move v0, v8

    goto :goto_2

    :cond_6
    const/4 v9, 0x2

    goto :goto_3
.end method

.method public onFinishFrame(Lcom/google/vr/sdk/base/Viewport;)V
    .locals 7

    const/4 v6, 0x1

    const/high16 v5, 0x3f000000    # 0.5f

    const/high16 v4, 0x40000000    # 2.0f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onFinishFrame()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeHitTests:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeHitTests:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    add-float/2addr v0, v1

    div-float/2addr v0, v4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeHitTests:[F

    aget v1, v1, v6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeHitTests:[F

    const/4 v3, 0x3

    aget v2, v2, v3

    add-float/2addr v1, v2

    div-float/2addr v1, v4

    mul-float/2addr v0, v4

    mul-float/2addr v1, v4

    add-float/2addr v0, v5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v0, v2

    float-to-int v0, v0

    neg-float v1, v1

    add-float/2addr v1, v5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get10(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v3, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set6(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;I)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set7(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get11(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$22;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$22;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method public onNewFrame(Lcom/google/vr/sdk/base/HeadTransform;)V
    .locals 13

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get1(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->rotationQuat:[F

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/google/vr/sdk/base/HeadTransform;->getQuaternion([FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->translationVector:[F

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/google/vr/sdk/base/HeadTransform;->getTranslation([FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->headTransformMatrix:[F

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/google/vr/sdk/base/HeadTransform;->getHeadView([FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->eulerAngles:[F

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/google/vr/sdk/base/HeadTransform;->getEulerAngles([FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->rightVectorRaw:[F

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/google/vr/sdk/base/HeadTransform;->getRightVector([FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->rightVector:[F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeOffsetMatrix:[F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v4, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->rightVectorRaw:[F

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->eulerAngles:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    const v2, 0x3c8efa35

    div-float/2addr v1, v2

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->yawDegrees:F

    if-eqz v6, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->agentHeadingAcquired:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentHeading()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->agentHeadingAcquired:Z

    const-string/jumbo v0, "Cardboard: agent heading acquired: %.2f"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageTouchAim:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    const/4 v1, 0x0

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->pitchDegrees:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    const/4 v1, 0x0

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->useButtonsYaw:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->eulerAngles:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->lastYaw:F

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->neutralYawValid:Z

    if-nez v0, :cond_f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->neutralYawValid:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->yawDegrees:F

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->neutralYaw:F

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get20(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get20(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set5(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;F)F

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->yawDegrees:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    add-float/2addr v1, v2

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set1(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;F)F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get20(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz v6, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get16(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z

    move-result v0

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get9(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v0

    :goto_2
    invoke-virtual {v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setAgentHeading(F)V

    :cond_3
    iput-wide v8, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->lastFrameTime:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get21(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setOwnAvatarHidden(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onPrepareFrame(Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get28(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->viewportWidth:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->viewportHeight:I

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get8(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->pickObject(FFLandroid/os/Handler;)V

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get22(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    move-result-object v1

    if-eqz v0, :cond_1c

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    :goto_3
    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setDrawPickedObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDetails:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    if-ne v0, v1, :cond_1d

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get14(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z

    move-result v0

    :goto_4
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->crosshairVisible:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->extTextureMatrixUV:[F

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->update([F)V

    :cond_5
    return-void

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageObject:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    if-eq v0, v1, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageYesNo:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    if-ne v0, v1, :cond_8

    :cond_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    const/4 v1, 0x0

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->pitchDegrees:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->eulerAngles:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->lastYaw:F

    sub-float/2addr v1, v2

    const v2, 0x3c8efa35

    div-float/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->useButtonsYaw:F

    goto/16 :goto_0

    :cond_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->eulerAngles:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    const v2, 0x3c8efa35

    div-float/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->pitchDegrees:F

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageSpeech:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    if-ne v1, v2, :cond_a

    const/4 v0, 0x1

    :cond_9
    :goto_5
    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->eulerAngles:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->lastYaw:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    const/4 v1, 0x0

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->useButtonsYaw:F

    goto/16 :goto_0

    :cond_a
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    if-ne v1, v2, :cond_9

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get14(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z

    move-result v1

    if-eqz v1, :cond_b

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get12(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)I

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get23(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)I

    move-result v2

    if-ge v1, v2, :cond_c

    :cond_b
    const/4 v0, 0x0

    :cond_c
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get14(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z

    move-result v1

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get12(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)I

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get19(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)I

    move-result v2

    if-le v1, v2, :cond_9

    :cond_d
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get21(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/4 v0, 0x0

    goto :goto_5

    :cond_e
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->eulerAngles:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->lastYaw:F

    sub-float/2addr v1, v2

    const v2, 0x3c8efa35

    div-float/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->useButtonsYaw:F

    goto/16 :goto_0

    :cond_f
    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->lastFrameTime:J

    sub-long v4, v8, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->yawDegrees:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->neutralYaw:F

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->angleMinusAngle(FF)F

    move-result v7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get17(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_10

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get3(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_14

    :cond_10
    const/4 v0, 0x1

    move v3, v0

    :goto_6
    const/4 v2, 0x0

    const/4 v1, 0x0

    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz v3, :cond_11

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get18(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/common/util/concurrent/AtomicDouble;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/AtomicDouble;->get()D

    move-result-wide v10

    const-wide/16 v0, 0x0

    cmpg-double v0, v10, v0

    if-gez v0, :cond_15

    const/4 v2, 0x1

    :goto_7
    const-wide/16 v0, 0x0

    cmpl-double v0, v10, v0

    if-lez v0, :cond_16

    const/4 v0, 0x1

    :goto_8
    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v10

    double-to-float v1, v10

    move v12, v1

    move v1, v0

    move v0, v12

    :cond_11
    const/high16 v10, -0x3df40000    # -35.0f

    cmpg-float v10, v7, v10

    if-gez v10, :cond_12

    xor-int/lit8 v10, v3, 0x1

    if-nez v10, :cond_13

    :cond_12
    if-eqz v1, :cond_17

    :cond_13
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    long-to-float v3, v4

    const v4, 0x3ca3d70a    # 0.02f

    mul-float/2addr v3, v4

    mul-float/2addr v0, v3

    sub-float v0, v2, v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v0

    iput v0, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    goto/16 :goto_1

    :cond_14
    const/4 v0, 0x0

    move v3, v0

    goto :goto_6

    :cond_15
    const/4 v2, 0x0

    goto :goto_7

    :cond_16
    const/4 v0, 0x0

    goto :goto_8

    :cond_17
    const/high16 v1, 0x420c0000    # 35.0f

    cmpl-float v1, v7, v1

    if-lez v1, :cond_18

    xor-int/lit8 v1, v3, 0x1

    if-nez v1, :cond_19

    :cond_18
    if-eqz v2, :cond_1a

    :cond_19
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    long-to-float v3, v4

    const v4, 0x3ca3d70a    # 0.02f

    mul-float/2addr v3, v4

    mul-float/2addr v0, v3

    add-float/2addr v0, v2

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v0

    iput v0, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    goto/16 :goto_1

    :cond_1a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->neutralYaw:F

    const v2, 0x38d1b717    # 1.0E-4f

    mul-float/2addr v2, v7

    long-to-float v3, v4

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->neutralYaw:F

    goto/16 :goto_1

    :cond_1b
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get20(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v0

    goto/16 :goto_2

    :cond_1c
    const/4 v0, 0x0

    goto/16 :goto_3

    :cond_1d
    const/4 v0, 0x0

    goto/16 :goto_4
.end method

.method public onRendererShutdown()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onRendererShutdown()V

    return-void
.end method

.method public onSurfaceChanged(II)V
    .locals 4

    const/4 v1, 0x0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->viewportWidth:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->viewportHeight:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    move-result-object v0

    invoke-virtual {v0, v1, p1, p2}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->release()V

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    int-to-float v1, p1

    const/high16 v2, 0x3f800000    # 1.0f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    int-to-float v2, p2

    const/high16 v3, 0x3f400000    # 0.75f

    mul-float/2addr v2, v3

    float-to-int v2, v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get30(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)I

    move-result v3

    add-int/2addr v2, v3

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;-><init>(II)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->externalTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get7(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/base/GvrView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/vr/sdk/base/GvrView;->getInterpupillaryDistance()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->eyeSeparation:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->headTransformCompat:Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->neutralYawValid:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$23;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$23;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, v2}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;Z)V

    return-void
.end method
