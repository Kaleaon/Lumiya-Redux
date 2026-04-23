.class public Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;
.super Ljava/lang/Object;


# instance fields
.field public inAnimationTime:F

.field public inFactor:F

.field public outFactor:F

.field public runningTime:F


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->runningTime:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->inAnimationTime:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->inFactor:F

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->outFactor:F

    return-void
.end method


# virtual methods
.method public hasStopped()Z
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->outFactor:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
