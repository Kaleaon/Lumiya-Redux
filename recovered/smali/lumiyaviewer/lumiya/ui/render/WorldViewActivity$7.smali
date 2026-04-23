.class Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 10

    const/4 v9, 0x1

    const/4 v3, 0x0

    const/high16 v8, 0x40000000    # 2.0f

    const/high16 v5, 0x3f000000    # 0.5f

    const-string/jumbo v0, "Gesture: scale factor: %f"

    new-array v1, v9, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get4(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get8(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F

    move-result v1

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v2

    mul-float/2addr v1, v2

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    const v2, 0x3dcccccd    # 0.1f

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set3(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get14(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get8(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setHUDScaleFactor(F)V

    :cond_0
    :goto_0
    return v9

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewTouchReceiver:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewTouchReceiver:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v3

    div-float v4, v2, v0

    sub-float/2addr v4, v5

    div-float v0, v1, v0

    mul-float v6, v4, v0

    div-float v0, v3, v1

    sub-float v7, v0, v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get17(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F

    move-result v0

    sub-float v0, v2, v0

    div-float v4, v0, v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get18(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F

    move-result v0

    sub-float v0, v3, v0

    div-float v5, v0, v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set7(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set8(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v1

    neg-float v2, v6

    mul-float/2addr v2, v8

    neg-float v3, v7

    mul-float/2addr v3, v8

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->processCameraZoom(FFFFF)V

    goto :goto_0
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set4(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set7(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set8(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F

    return v2
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set4(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z

    return-void
.end method
