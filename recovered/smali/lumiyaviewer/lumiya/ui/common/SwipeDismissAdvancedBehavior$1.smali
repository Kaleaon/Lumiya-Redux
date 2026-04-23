.class Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;
.super Landroid/support/v4/widget/ViewDragHelper$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mOriginalCapturedViewLeft:I

.field private mOriginalCapturedViewTop:I

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-direct {p0}, Landroid/support/v4/widget/ViewDragHelper$Callback;-><init>()V

    return-void
.end method

.method private shouldDismiss(Landroid/view/View;FF)Z
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v0

    int-to-float v0, v0

    neg-float v1, v0

    cmpg-float v1, p2, v1

    if-gez v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    return v4

    :cond_0
    cmpl-float v1, p2, v0

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v1

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_1

    return v4

    :cond_1
    neg-float v1, v0

    cmpg-float v1, p3, v1

    if-gez v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v1

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_2

    return v4

    :cond_2
    cmpl-float v0, p3, v0

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_3

    return v4

    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewLeft:I

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get2(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)F

    move-result v2

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    neg-int v2, v1

    if-ge v0, v2, :cond_4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v2

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_4

    return v4

    :cond_4
    if-le v0, v1, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_5

    return v4

    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewTop:I

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get2(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)F

    move-result v2

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    neg-int v2, v1

    if-ge v0, v2, :cond_6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v2

    and-int/lit8 v2, v2, 0x4

    if-eqz v2, :cond_6

    return v4

    :cond_6
    if-le v0, v1, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_7

    return v4

    :cond_7
    return v3
.end method


# virtual methods
.method public clampViewPositionHorizontal(Landroid/view/View;II)I
    .locals 4

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewTop:I

    if-ne v0, v2, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewLeft:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    :goto_0
    sub-int v0, v2, v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewLeft:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v3

    and-int/lit8 v3, v3, 0x2

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    :cond_0
    add-int/2addr v1, v2

    invoke-static {v0, p2, v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-wrap1(III)I

    move-result v0

    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewLeft:I

    return v0
.end method

.method public clampViewPositionVertical(Landroid/view/View;II)I
    .locals 4

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewLeft:I

    if-ne v0, v2, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewTop:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v0

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    :goto_0
    sub-int v0, v2, v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewTop:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v3

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    :cond_0
    add-int/2addr v1, v2

    invoke-static {v0, p2, v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-wrap1(III)I

    move-result v0

    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewTop:I

    return v0
.end method

.method public getViewHorizontalDragRange(Landroid/view/View;)I
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v0

    and-int/lit8 v0, v0, 0x3

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    return v0

    :cond_0
    return v1
.end method

.method public getViewVerticalDragRange(Landroid/view/View;)I
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v0

    and-int/lit8 v0, v0, 0xc

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    return v0

    :cond_0
    return v1
.end method

.method public onViewCaptured(Landroid/view/View;I)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewLeft:I

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewTop:I

    return-void
.end method

.method public onViewDragStateChanged(I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get3(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get3(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;->onDragStateChanged(I)V

    :cond_0
    return-void
.end method

.method public onViewPositionChanged(Landroid/view/View;IIII)V
    .locals 7

    const/4 v6, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v0

    and-int/lit8 v0, v0, 0x3

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewLeft:I

    sub-int v0, p2, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    :goto_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v2

    and-int/lit8 v2, v2, 0xc

    if-eqz v2, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewTop:I

    sub-int v1, p3, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    :cond_0
    if-nez v0, :cond_2

    if-nez v1, :cond_2

    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    :goto_1
    return-void

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get1(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)F

    move-result v3

    mul-float/2addr v2, v3

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get0(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)F

    move-result v4

    mul-float/2addr v3, v4

    int-to-float v0, v0

    invoke-static {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->fraction(FFF)F

    move-result v0

    invoke-static {v6, v0, v5}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-wrap0(FFF)F

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get1(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)F

    move-result v3

    mul-float/2addr v2, v3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get0(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)F

    move-result v4

    mul-float/2addr v3, v4

    int-to-float v1, v1

    invoke-static {v2, v3, v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->fraction(FFF)F

    move-result v1

    invoke-static {v6, v1, v5}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-wrap0(FFF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    sub-float v0, v5, v0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    goto :goto_1
.end method

.method public onViewReleased(Landroid/view/View;FF)V
    .locals 7

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->shouldDismiss(Landroid/view/View;FF)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v2

    int-to-float v2, v2

    neg-float v5, v2

    cmpg-float v5, p2, v5

    if-gez v5, :cond_2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v5

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewLeft:I

    sub-int/2addr v1, v3

    :cond_0
    :goto_0
    const/4 v2, 0x1

    move v6, v2

    move v2, v1

    move v1, v0

    move v0, v6

    :goto_1
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get5(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v3

    invoke-virtual {v3, v2, v1}, Landroid/support/v4/widget/ViewDragHelper;->settleCapturedViewAt(II)Z

    move-result v1

    if-eqz v1, :cond_6

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-direct {v1, v2, p1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;Landroid/view/View;Z)V

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_1
    :goto_2
    return-void

    :cond_2
    cmpl-float v5, p2, v2

    if-lez v5, :cond_3

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v5

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_3

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewLeft:I

    add-int/2addr v1, v3

    goto :goto_0

    :cond_3
    neg-float v3, v2

    cmpg-float v3, p3, v3

    if-gez v3, :cond_4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v3

    and-int/lit8 v3, v3, 0x4

    if-eqz v3, :cond_4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewTop:I

    sub-int/2addr v0, v4

    goto :goto_0

    :cond_4
    cmpl-float v2, p3, v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I

    move-result v2

    and-int/lit8 v2, v2, 0x8

    if-eqz v2, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewTop:I

    add-int/2addr v0, v4

    goto :goto_0

    :cond_5
    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewLeft:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->mOriginalCapturedViewTop:I

    move v6, v2

    move v2, v1

    move v1, v0

    move v0, v6

    goto :goto_1

    :cond_6
    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get3(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get3(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;->onDismiss(Landroid/view/View;)V

    goto :goto_2
.end method

.method public tryCaptureView(Landroid/view/View;I)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->canSwipeDismissView(Landroid/view/View;)Z

    move-result v0

    return v0
.end method
