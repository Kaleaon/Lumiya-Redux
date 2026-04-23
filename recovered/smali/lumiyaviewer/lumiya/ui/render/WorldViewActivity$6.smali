.class Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;


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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 4

    const/high16 v2, 0x42700000    # 60.0f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get10(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get21(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get9(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    mul-float v0, p3, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    neg-float v1, p4

    mul-float/2addr v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    move-result-object v2

    const/high16 v3, 0x3fc00000    # 1.5f

    div-float/2addr v0, v3

    const/high16 v3, 0x40200000    # 2.5f

    div-float/2addr v1, v3

    invoke-virtual {v2, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->processCameraFling(FF)V

    :cond_0
    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get9(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    float-to-int v0, v0

    float-to-int v1, v1

    invoke-static {v2, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-wrap1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;II)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get10(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get21(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    const/4 v2, 0x2

    new-array v2, v2, [I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get14(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    move-result-object v3

    const/4 v4, 0x0

    aget v4, v2, v4

    int-to-float v4, v4

    sub-float/2addr v0, v4

    const/4 v4, 0x1

    aget v2, v2, v4

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-virtual {v3, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->pickObjectHover(FF)V

    goto :goto_0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 6

    const/4 v5, 0x1

    const/high16 v2, 0x42700000    # 60.0f

    const/high16 v3, 0x40000000    # 2.0f

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get9(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/AbsoluteLayout$LayoutParams;

    if-eqz v0, :cond_0

    iget v1, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->x:I

    int-to-float v1, v1

    sub-float/2addr v1, p3

    float-to-int v1, v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointerLayout:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->x:I

    iget v1, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->y:I

    int-to-float v1, v1

    sub-float/2addr v1, p4

    float-to-int v1, v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointerLayout:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->y:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget v2, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->x:I

    iget v0, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->y:I

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-wrap2(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;II)V

    :cond_0
    return v5

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get10(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get21(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get4(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)I

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get6(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float v2, p3, v2

    div-float/2addr v2, v3

    add-float/2addr v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get7(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float v2, p4, v2

    div-float/2addr v2, v3

    add-float/2addr v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set2(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get14(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get6(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get7(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setHUDOffset(FF)V

    :cond_2
    :goto_0
    return v5

    :cond_3
    neg-float v0, p3

    mul-float/2addr v0, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    mul-float v1, p4, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->processCameraRotate(FF)V

    goto :goto_0

    :cond_4
    return v4
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get9(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    float-to-int v2, v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-wrap1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;II)V

    :goto_0
    return v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get4(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get14(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    aget v3, v0, v3

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    aget v0, v0, v4

    int-to-float v0, v0

    sub-float v0, v3, v0

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->touchHUD(FF)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    goto :goto_0
.end method
