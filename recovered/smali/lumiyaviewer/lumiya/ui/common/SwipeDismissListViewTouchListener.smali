.class public Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$DismissCallbacks;,
        Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;
    }
.end annotation


# instance fields
.field private mAnimationTime:J

.field private mCallbacks:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$DismissCallbacks;

.field private mDismissAnimationRefCount:I

.field private mDownPosition:I

.field private mDownView:Landroid/view/View;

.field private mDownX:F

.field private mDownY:F

.field private mListView:Landroid/widget/ListView;

.field private mMaxFlingVelocity:I

.field private mMinFlingVelocity:I

.field private mPaused:Z

.field private mPendingDismisses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;",
            ">;"
        }
    .end annotation
.end field

.field private mSlop:I

.field private mSwiping:Z

.field private mSwipingSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mViewWidth:I


# direct methods
.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;Landroid/view/View;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->performDismiss(Landroid/view/View;I)V

    return-void
.end method

.method public constructor <init>(Landroid/widget/ListView;Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$DismissCallbacks;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mViewWidth:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mPendingDismisses:Ljava/util/List;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDismissAnimationRefCount:I

    invoke-virtual {p1}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSlop:I

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mMinFlingVelocity:I

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mMaxFlingVelocity:I

    invoke-virtual {p1}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x10e0000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mAnimationTime:J

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mCallbacks:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$DismissCallbacks;

    return-void
.end method

.method private performDismiss(Landroid/view/View;I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mCallbacks:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$DismissCallbacks;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    invoke-interface {v0, v1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$DismissCallbacks;->onDismiss(Landroid/widget/ListView;I)V

    return-void
.end method

.method public static restoreViewState(Landroid/view/View;)V
    .locals 4

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    invoke-virtual {p0, v3}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setTranslationX(F)V

    :goto_0
    return-void

    :cond_0
    invoke-static {p0, v2}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    invoke-static {p0, v3}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    goto :goto_0
.end method


# virtual methods
.method public makeScrollListener()Landroid/widget/AbsListView$OnScrollListener;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;)V

    return-object v0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 11

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v1, 0x1

    const/4 v9, 0x0

    const/4 v2, 0x0

    const/4 v8, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mViewWidth:I

    const/4 v3, 0x2

    if-ge v0, v3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mViewWidth:I

    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_1
    :goto_0
    return v2

    :pswitch_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mPaused:Z

    if-eqz v0, :cond_2

    return v2

    :cond_2
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getChildCount()I

    move-result v4

    const/4 v0, 0x2

    new-array v0, v0, [I

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    invoke-virtual {v5, v0}, Landroid/widget/ListView;->getLocationOnScreen([I)V

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    float-to-int v5, v5

    aget v6, v0, v2

    sub-int/2addr v5, v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    float-to-int v6, v6

    aget v0, v0, v1

    sub-int v1, v6, v0

    move v0, v2

    :goto_1
    if-ge v0, v4, :cond_3

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    invoke-virtual {v6, v0}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6, v3}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    invoke-virtual {v3, v5, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v7

    if-eqz v7, :cond_5

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    if-eqz v0, :cond_4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownX:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownY:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->getPositionForView(Landroid/view/View;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownPosition:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mCallbacks:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$DismissCallbacks;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownPosition:I

    invoke-interface {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$DismissCallbacks;->canDismiss(Landroid/widget/ListView;I)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_4
    :goto_2
    return v2

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_6
    iput-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    goto :goto_2

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    if-eqz v0, :cond_7

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSwiping:Z

    if-eqz v0, :cond_7

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xc

    if-lt v0, v1, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mAnimationTime:J

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v9}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    :cond_7
    :goto_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    iput v8, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownX:F

    iput v8, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownY:F

    iput-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownPosition:I

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSwiping:Z

    goto/16 :goto_0

    :cond_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    invoke-static {v0}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->animate(Landroid/view/View;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v10}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->alpha(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mAnimationTime:J

    invoke-virtual {v0, v4, v5}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    goto :goto_3

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownX:F

    sub-float/2addr v0, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v4, 0x3e8

    invoke-virtual {v3, v4}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v5}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mViewWidth:I

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_b

    iget-boolean v6, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSwiping:Z

    if-eqz v6, :cond_b

    cmpl-float v0, v0, v8

    if-lez v0, :cond_a

    move v0, v1

    :cond_9
    :goto_4
    if-eqz v0, :cond_13

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownPosition:I

    const/4 v3, -0x1

    if-eq v0, v3, :cond_13

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownPosition:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDismissAnimationRefCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDismissAnimationRefCount:I

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xc

    if-lt v0, v5, :cond_11

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    if-eqz v1, :cond_10

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mViewWidth:I

    :goto_5
    int-to-float v0, v0

    invoke-virtual {v5, v0}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mAnimationTime:J

    invoke-virtual {v0, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$2;

    invoke-direct {v1, p0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;Landroid/view/View;I)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    :goto_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    iput v8, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownX:F

    iput v8, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownY:F

    iput-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownPosition:I

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSwiping:Z

    goto/16 :goto_0

    :cond_a
    move v0, v1

    move v1, v2

    goto :goto_4

    :cond_b
    iget v6, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mMinFlingVelocity:I

    int-to-float v6, v6

    cmpg-float v6, v6, v4

    if-gtz v6, :cond_c

    iget v6, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mMaxFlingVelocity:I

    int-to-float v6, v6

    cmpg-float v6, v4, v6

    if-gtz v6, :cond_c

    cmpg-float v4, v5, v4

    if-gez v4, :cond_c

    iget-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSwiping:Z

    if-eqz v4, :cond_18

    cmpg-float v3, v3, v8

    if-gez v3, :cond_d

    move v3, v1

    :goto_7
    cmpg-float v0, v0, v8

    if-gez v0, :cond_e

    move v0, v1

    :goto_8
    if-ne v3, v0, :cond_f

    move v0, v1

    :goto_9
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v3

    cmpl-float v3, v3, v8

    if-gtz v3, :cond_9

    move v1, v2

    goto :goto_4

    :cond_c
    move v1, v2

    move v0, v2

    goto :goto_4

    :cond_d
    move v3, v2

    goto :goto_7

    :cond_e
    move v0, v2

    goto :goto_8

    :cond_f
    move v0, v2

    goto :goto_9

    :cond_10
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mViewWidth:I

    neg-int v0, v0

    goto :goto_5

    :cond_11
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    invoke-static {v0}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->animate(Landroid/view/View;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v5

    if-eqz v1, :cond_12

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mViewWidth:I

    :goto_a
    int-to-float v0, v0

    invoke-virtual {v5, v0}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->alpha(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mAnimationTime:J

    invoke-virtual {v0, v6, v7}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$3;

    invoke-direct {v1, p0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$3;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;Landroid/view/View;I)V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    goto :goto_6

    :cond_12
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mViewWidth:I

    neg-int v0, v0

    goto :goto_a

    :cond_13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xc

    if-lt v0, v1, :cond_14

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mAnimationTime:J

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v9}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    goto/16 :goto_6

    :cond_14
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    invoke-static {v0}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->animate(Landroid/view/View;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v10}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->alpha(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mAnimationTime:J

    invoke-virtual {v0, v4, v5}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    goto/16 :goto_6

    :pswitch_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mPaused:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownX:F

    sub-float v3, v0, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownY:F

    sub-float/2addr v0, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSlop:I

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_15

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    cmpg-float v0, v0, v4

    if-gez v0, :cond_15

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSwiping:Z

    cmpl-float v0, v3, v8

    if-lez v0, :cond_16

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSlop:I

    :goto_b
    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSwipingSlop:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->requestDisallowInterceptTouchEvent(Z)V

    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v4

    shl-int/lit8 v4, v4, 0x8

    or-int/lit8 v4, v4, 0x3

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->setAction(I)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mListView:Landroid/widget/ListView;

    invoke-virtual {v4, v0}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    :cond_15
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSwiping:Z

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_17

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSwipingSlop:I

    int-to-float v2, v2

    sub-float v2, v3, v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationX(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mViewWidth:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    sub-float v2, v10, v2

    invoke-static {v10, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v8, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    :goto_c
    return v1

    :cond_16
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSlop:I

    neg-int v0, v0

    goto :goto_b

    :cond_17
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mSwipingSlop:I

    int-to-float v2, v2

    sub-float v2, v3, v2

    invoke-static {v0, v2}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mDownView:Landroid/view/View;

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mViewWidth:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    sub-float v2, v10, v2

    invoke-static {v10, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v0, v2}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    goto :goto_c

    :cond_18
    move v1, v2

    move v0, v2

    goto/16 :goto_4

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method public setEnabled(Z)V
    .locals 1

    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->mPaused:Z

    return-void
.end method
