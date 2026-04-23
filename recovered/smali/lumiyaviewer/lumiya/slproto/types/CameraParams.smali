.class public Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;
.super Ljava/lang/Object;


# annotations
.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# static fields
.field private static final FLING_DECEL_PITCH:F = 100.0f

.field private static final FLING_DECEL_YAW:F = 50.0f

.field private static final MAX_PITCH:F = 85.0f

.field private static final MIN_PITCH:F = -85.0f


# instance fields
.field private flingStartTime:J

.field private heading:F

.field private headingFlingSpeed:F

.field private isFlinging:Z

.field private isManualControl:Z

.field private isValid:Z

.field private final lock:Ljava/lang/Object;

.field private manualControlStartTime:J

.field private manualFlySpeed:F

.field private manualMoveSpeed:F

.field private manualStrafeSpeed:F

.field private manualTurnSpeed:F

.field private final offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field private final offsetVR:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field private position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private tilt:F

.field private tiltFlingSpeed:F

.field private useOffset:Z


# direct methods
.method public constructor <init>()V
    .locals 8

    const-wide/16 v6, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v1, -0x40000000    # -2.0f

    invoke-direct {v0, v1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, v2, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->offsetVR:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isValid:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->useOffset:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isFlinging:Z

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    iput-wide v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->flingStartTime:J

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isManualControl:Z

    iput-wide v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualControlStartTime:J

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualTurnSpeed:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualMoveSpeed:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualFlySpeed:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualStrafeSpeed:F

    return-void
.end method

.method public static angleMinusAngle(FF)F
    .locals 2

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v0

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v0

    return v0
.end method

.method private processFling()V
    .locals 8

    const/high16 v7, 0x42c80000    # 100.0f

    const/high16 v6, 0x42480000    # 50.0f

    const/4 v5, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isFlinging:Z

    if-eqz v0, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->flingStartTime:J

    sub-long v2, v0, v2

    long-to-float v2, v2

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    mul-float/2addr v4, v2

    add-float/2addr v3, v4

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v3

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    mul-float/2addr v4, v2

    add-float/2addr v3, v4

    const/high16 v4, 0x42aa0000    # 85.0f

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    const/high16 v4, -0x3d560000    # -85.0f

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    cmpl-float v3, v3, v5

    if-lez v3, :cond_3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    mul-float v4, v7, v2

    sub-float/2addr v3, v4

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    cmpg-float v3, v3, v5

    if-gez v3, :cond_0

    iput v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    :cond_0
    :goto_0
    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    cmpl-float v3, v3, v5

    if-lez v3, :cond_4

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    mul-float/2addr v2, v6

    sub-float v2, v3, v2

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    cmpg-float v2, v2, v5

    if-gez v2, :cond_1

    iput v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    :cond_1
    :goto_1
    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->flingStartTime:J

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    cmpl-float v0, v0, v5

    if-nez v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    cmpl-float v0, v0, v5

    if-nez v0, :cond_2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isFlinging:Z

    :cond_2
    return-void

    :cond_3
    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    cmpg-float v3, v3, v5

    if-gez v3, :cond_0

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    mul-float v4, v7, v2

    add-float/2addr v3, v4

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    cmpl-float v3, v3, v5

    if-lez v3, :cond_0

    iput v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    goto :goto_0

    :cond_4
    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    cmpg-float v3, v3, v5

    if-gez v3, :cond_1

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    mul-float/2addr v2, v6

    add-float/2addr v2, v3

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    cmpl-float v2, v2, v5

    if-lez v2, :cond_1

    iput v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    goto :goto_1
.end method

.method private processManualControl(Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;)V
    .locals 9

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isManualControl:Z

    if-eqz v0, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualControlStartTime:J

    sub-long v0, v2, v0

    long-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float v4, v0, v1

    if-eqz p1, :cond_3

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->yawDegrees:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    add-float/2addr v0, v1

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v1

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->pitchDegrees:F

    :goto_0
    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualMoveSpeed:F

    cmpl-float v5, v5, v7

    if-nez v5, :cond_0

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualFlySpeed:F

    cmpl-float v5, v5, v7

    if-eqz v5, :cond_4

    :cond_0
    :goto_1
    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YZX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    invoke-static {v7, v0, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->mayaQ(FFFLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v1, v8, v7, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5, v7, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v6, v7, v8, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    invoke-virtual {v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualMoveSpeed:F

    mul-float/2addr v7, v4

    invoke-virtual {v0, v1, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualFlySpeed:F

    mul-float/2addr v1, v4

    invoke-virtual {v0, v5, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualStrafeSpeed:F

    mul-float/2addr v1, v4

    invoke-virtual {v0, v6, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V

    :cond_1
    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualControlStartTime:J

    :cond_2
    return-void

    :cond_3
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualTurnSpeed:F

    mul-float/2addr v1, v4

    add-float/2addr v0, v1

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    goto :goto_0

    :cond_4
    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualStrafeSpeed:F

    cmpl-float v5, v5, v7

    if-eqz v5, :cond_1

    goto :goto_1
.end method

.method public static wrapAngle(F)F
    .locals 4

    const/high16 v3, 0x43b40000    # 360.0f

    const/high16 v2, 0x43340000    # 180.0f

    add-float v0, p0, v2

    rem-float/2addr v0, v3

    const/4 v1, 0x0

    cmpg-float v1, v0, v1

    if-gez v1, :cond_0

    add-float/2addr v0, v3

    :cond_0
    sub-float/2addr v0, v2

    return v0
.end method


# virtual methods
.method public copyFrom(Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;)V
    .locals 10
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_1

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    invoke-direct {p1}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->processFling()V

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->processManualControl(Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    iget-boolean v6, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isValid:Z

    iget-boolean v7, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->useOffset:Z

    if-eqz v7, :cond_0

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YZX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const/4 v9, 0x0

    invoke-static {v9, v5, v4, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->mayaQ(FFFLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget v8, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v2, v8

    iget v8, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v1, v8

    iget v7, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-float/2addr v0, v7

    :cond_0
    monitor-exit v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_1
    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v7, v2, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    iput v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iput v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isValid:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v3

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :catchall_1
    move-exception v0

    monitor-exit v3

    throw v0
.end method

.method public fling(FF)V
    .locals 4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->headingFlingSpeed:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tiltFlingSpeed:F

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->flingStartTime:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isFlinging:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public getHeading()F
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public getPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 2
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public getTilt()F
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public getVRCamera(Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;)V
    .locals 10
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_1

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    invoke-direct {p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->processManualControl(Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    iget-boolean v6, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isValid:Z

    iget-boolean v7, p1, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->useOffset:Z

    if-eqz v7, :cond_0

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->offsetVR:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YZX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const/4 v9, 0x0

    invoke-static {v9, v5, v4, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->mayaQ(FFFLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget v8, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v2, v8

    iget v8, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v1, v8

    iget v7, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-float/2addr v0, v7

    :cond_0
    monitor-exit v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_1
    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v7, v2, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    iput v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iput v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isValid:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v3

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :catchall_1
    move-exception v0

    monitor-exit v3

    throw v0
.end method

.method public isFlinging()Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isFlinging:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public isValid()Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isValid:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public rotate(FF)V
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    add-float/2addr v0, p1

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->wrapAngle(F)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    add-float/2addr v0, p2

    const/high16 v2, 0x42aa0000    # 85.0f

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/high16 v2, -0x3d560000    # -85.0f

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isFlinging:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;FF)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v1

    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    :cond_0
    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isValid:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setHeading(F)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public setPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v1

    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->useOffset:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isValid:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v1

    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    :cond_0
    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isFlinging:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isValid:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->useOffset:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public startManualControl(FFFF)V
    .locals 6

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isManualControl:Z

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YZX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const/4 v5, 0x0

    invoke-static {v5, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->mayaQ(FFFLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v2

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->useOffset:Z

    if-nez v3, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->useOffset:Z

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isManualControl:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualControlStartTime:J

    :cond_1
    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualMoveSpeed:F

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualTurnSpeed:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualFlySpeed:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->manualStrafeSpeed:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public stopManualControl()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->isManualControl:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public zoom(FFFFF)V
    .locals 10

    const/high16 v0, 0x3f800000    # 1.0f

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->lock:Ljava/lang/Object;

    monitor-enter v1

    sub-float v0, p1, v0

    :try_start_0
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->tilt:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->heading:F

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YZX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    const/4 v6, 0x0

    invoke-static {v6, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->mayaQ(FFFLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v3

    iget-boolean v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->useOffset:Z

    if-nez v4, :cond_0

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    invoke-virtual {v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->useOffset:Z

    :cond_0
    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v5, v6, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    invoke-virtual {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    invoke-virtual {v5, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    mul-float v7, v0, p3

    add-float/2addr v7, p5

    invoke-virtual {v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    invoke-virtual {v6, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    mul-float/2addr v0, p2

    add-float/2addr v0, p4

    invoke-virtual {v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    invoke-virtual {v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/CameraParams;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
