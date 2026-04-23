.class public Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/OnInterceptTouchEventListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xc
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$DismissCallbacks;
    }
.end annotation


# instance fields
.field private final canSwipeDown:Z

.field private final canSwipeLeft:Z

.field private final canSwipeRight:Z

.field private final canSwipeUp:Z

.field private final canSwipeX:Z

.field private final canSwipeY:Z

.field private mAnimationTime:J

.field private mCallbacks:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$DismissCallbacks;

.field private mDownX:F

.field private mDownY:F

.field private mMaxFlingVelocity:I

.field private mMinFlingVelocity:I

.field private mSlop:I

.field private mSwiping:Z

.field private mSwipingSlopX:I

.field private mSwipingSlopY:I

.field private mSwipingX:Z

.field private mSwipingY:Z

.field private mToken:Ljava/lang/Object;

.field private mTranslationX:F

.field private mTranslationY:F

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mView:Landroid/view/View;

.field private mViewHeight:I

.field private mViewWidth:I


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$DismissCallbacks;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mCallbacks:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$DismissCallbacks;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mToken:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->performDismiss()V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$DismissCallbacks;ZZZZ)V
    .locals 2

    const/4 v0, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewWidth:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewHeight:I

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeUp:Z

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeDown:Z

    iput-boolean p6, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeLeft:Z

    iput-boolean p7, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeRight:Z

    if-nez p6, :cond_1

    :goto_0
    iput-boolean p7, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeX:Z

    if-nez p4, :cond_0

    move v0, p5

    :cond_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeY:Z

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSlop:I

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mMinFlingVelocity:I

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mMaxFlingVelocity:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x10e0000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mAnimationTime:J

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mToken:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mCallbacks:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$DismissCallbacks;

    return-void

    :cond_1
    move p7, v0

    goto :goto_0
.end method

.method private performDismiss()V
    .locals 6

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    aput v1, v2, v3

    aput v4, v2, v4

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v2

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mAnimationTime:J

    invoke-virtual {v2, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;

    invoke-direct {v3, p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;Landroid/view/ViewGroup$LayoutParams;I)V

    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$3;

    invoke-direct {v1, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$3;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 13

    const/high16 v11, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    const/4 v7, 0x1

    const/4 v1, 0x0

    const/4 v5, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mTranslationX:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mTranslationY:F

    invoke-virtual {p1, v0, v2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewWidth:I

    const/4 v2, 0x2

    if-ge v0, v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewWidth:I

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewHeight:I

    const/4 v2, 0x2

    if-ge v0, v2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewHeight:I

    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_2
    :goto_0
    return v1

    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownY:F

    const-string/jumbo v0, "SwipeSwipe: action down x %f y %f"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownX:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v2, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownY:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    aput-object v1, v2, v7

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mCallbacks:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$DismissCallbacks;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mToken:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$DismissCallbacks;->canDismiss(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_3
    return v7

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownX:F

    sub-float v3, v0, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownY:F

    sub-float v4, v0, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v2, 0x3e8

    invoke-virtual {v0, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v8

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v9, :cond_5

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingX:Z

    if-eqz v9, :cond_5

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeRight:Z

    if-eqz v9, :cond_5

    iget v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewWidth:I

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    cmpl-float v9, v3, v9

    if-lez v9, :cond_5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewWidth:I

    int-to-float v0, v0

    move v2, v0

    move v0, v5

    :goto_1
    if-eqz v7, :cond_15

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mAnimationTime:J

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)V

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    :cond_4
    :goto_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v10, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    iput v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mTranslationX:F

    iput v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mTranslationY:F

    iput v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownX:F

    iput v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownY:F

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingX:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingY:Z

    goto/16 :goto_0

    :cond_5
    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v9, :cond_6

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingX:Z

    if-eqz v9, :cond_6

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeLeft:Z

    if-eqz v9, :cond_6

    iget v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewWidth:I

    div-int/lit8 v9, v9, 0x2

    neg-int v9, v9

    int-to-float v9, v9

    cmpg-float v9, v3, v9

    if-gez v9, :cond_6

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewWidth:I

    neg-int v0, v0

    int-to-float v0, v0

    move v2, v0

    move v0, v5

    goto :goto_1

    :cond_6
    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v9, :cond_7

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingY:Z

    if-eqz v9, :cond_7

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeDown:Z

    if-eqz v9, :cond_7

    iget v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewHeight:I

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    cmpl-float v9, v4, v9

    if-lez v9, :cond_7

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewHeight:I

    int-to-float v0, v0

    move v2, v5

    goto :goto_1

    :cond_7
    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v9, :cond_8

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingY:Z

    if-eqz v9, :cond_8

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeUp:Z

    if-eqz v9, :cond_8

    iget v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewHeight:I

    div-int/lit8 v9, v9, 0x2

    neg-int v9, v9

    int-to-float v9, v9

    cmpg-float v9, v4, v9

    if-gez v9, :cond_8

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewHeight:I

    neg-int v0, v0

    int-to-float v0, v0

    move v2, v5

    goto/16 :goto_1

    :cond_8
    iget v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mMinFlingVelocity:I

    int-to-float v9, v9

    cmpg-float v9, v9, v0

    if-gtz v9, :cond_e

    iget v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mMaxFlingVelocity:I

    int-to-float v9, v9

    cmpg-float v9, v0, v9

    if-gtz v9, :cond_e

    cmpg-float v9, v2, v0

    if-gez v9, :cond_e

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v9, :cond_e

    iget-boolean v9, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingX:Z

    if-eqz v9, :cond_e

    cmpg-float v0, v6, v5

    if-gez v0, :cond_9

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeLeft:Z

    :goto_3
    cmpg-float v2, v6, v5

    if-gez v2, :cond_a

    move v2, v7

    :goto_4
    cmpg-float v3, v3, v5

    if-gez v3, :cond_b

    :goto_5
    if-ne v2, v7, :cond_c

    move v7, v0

    :goto_6
    cmpg-float v0, v6, v5

    if-gez v0, :cond_d

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewWidth:I

    neg-int v0, v0

    :goto_7
    int-to-float v0, v0

    move v2, v0

    move v0, v5

    goto/16 :goto_1

    :cond_9
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeRight:Z

    goto :goto_3

    :cond_a
    move v2, v1

    goto :goto_4

    :cond_b
    move v7, v1

    goto :goto_5

    :cond_c
    move v7, v1

    goto :goto_6

    :cond_d
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewWidth:I

    goto :goto_7

    :cond_e
    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mMinFlingVelocity:I

    int-to-float v3, v3

    cmpg-float v3, v3, v2

    if-gtz v3, :cond_f

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mMaxFlingVelocity:I

    int-to-float v3, v3

    cmpg-float v3, v2, v3

    if-gtz v3, :cond_f

    cmpg-float v0, v0, v2

    if-gez v0, :cond_f

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v0, :cond_f

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingY:Z

    if-eqz v0, :cond_2b

    cmpg-float v0, v8, v5

    if-gez v0, :cond_10

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeUp:Z

    :goto_8
    cmpg-float v2, v8, v5

    if-gez v2, :cond_11

    move v2, v7

    :goto_9
    cmpg-float v3, v4, v5

    if-gez v3, :cond_12

    :goto_a
    if-ne v2, v7, :cond_13

    move v7, v0

    :goto_b
    cmpg-float v0, v8, v5

    if-gez v0, :cond_14

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewHeight:I

    neg-int v0, v0

    :goto_c
    int-to-float v0, v0

    move v2, v5

    goto/16 :goto_1

    :cond_f
    move v0, v5

    move v2, v5

    move v7, v1

    goto/16 :goto_1

    :cond_10
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeDown:Z

    goto :goto_8

    :cond_11
    move v2, v1

    goto :goto_9

    :cond_12
    move v7, v1

    goto :goto_a

    :cond_13
    move v7, v1

    goto :goto_b

    :cond_14
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewHeight:I

    goto :goto_c

    :cond_15
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v11}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mAnimationTime:J

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    goto/16 :goto_2

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v11}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mAnimationTime:J

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v10, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    iput v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mTranslationX:F

    iput v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mTranslationY:F

    iput v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownX:F

    iput v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownY:F

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingX:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingY:Z

    goto/16 :goto_0

    :pswitch_3
    const-string/jumbo v0, "SwipeSwipe: action move x %f y %f"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownX:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v2, v1

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownY:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownX:F

    sub-float v4, v0, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mDownY:F

    sub-float v6, v0, v2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    if-nez v0, :cond_17

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSlop:I

    neg-int v0, v0

    int-to-float v0, v0

    cmpg-float v0, v4, v0

    if-gez v0, :cond_19

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    cmpg-float v0, v0, v2

    if-gez v0, :cond_19

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeLeft:Z

    :goto_d
    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSlop:I

    int-to-float v2, v2

    cmpl-float v2, v4, v2

    if-lez v2, :cond_1a

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v3, v8

    cmpg-float v2, v2, v3

    if-gez v2, :cond_1a

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeRight:Z

    :goto_e
    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSlop:I

    neg-int v3, v3

    int-to-float v3, v3

    cmpg-float v3, v6, v3

    if-gez v3, :cond_1b

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v8

    const/high16 v9, 0x40000000    # 2.0f

    div-float/2addr v8, v9

    cmpg-float v3, v3, v8

    if-gez v3, :cond_1b

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeUp:Z

    :goto_f
    iget v8, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSlop:I

    int-to-float v8, v8

    cmpl-float v8, v6, v8

    if-lez v8, :cond_1c

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v8

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v9

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    cmpg-float v8, v8, v9

    if-gez v8, :cond_1c

    iget-boolean v8, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->canSwipeDown:Z

    :goto_10
    if-nez v0, :cond_1d

    :goto_11
    if-nez v3, :cond_1e

    move v0, v8

    :goto_12
    if-eqz v2, :cond_1f

    if-eqz v0, :cond_2a

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v8

    cmpl-float v3, v3, v8

    if-ltz v3, :cond_20

    move v0, v2

    move v2, v1

    :goto_13
    if-nez v0, :cond_16

    if-eqz v2, :cond_17

    :cond_16
    iput-boolean v7, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingX:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingY:Z

    if-eqz v0, :cond_22

    cmpl-float v0, v4, v5

    if-lez v0, :cond_21

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSlop:I

    :goto_14
    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingSlopX:I

    if-eqz v2, :cond_24

    cmpl-float v0, v6, v5

    if-lez v0, :cond_23

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSlop:I

    :goto_15
    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingSlopY:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v7}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    shl-int/lit8 v2, v2, 0x8

    or-int/lit8 v2, v2, 0x3

    invoke-virtual {v0, v2}, Landroid/view/MotionEvent;->setAction(I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    :cond_17
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingX:Z

    if-eqz v0, :cond_25

    move v0, v4

    :goto_16
    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mTranslationX:F

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingY:Z

    if-eqz v0, :cond_26

    move v0, v6

    :goto_17
    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mTranslationY:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingX:Z

    if-eqz v0, :cond_27

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingSlopX:I

    int-to-float v0, v0

    sub-float v0, v4, v0

    :goto_18
    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationX(F)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingY:Z

    if-eqz v0, :cond_28

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingSlopY:I

    int-to-float v0, v0

    sub-float v0, v6, v0

    :goto_19
    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingX:Z

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewWidth:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    sub-float v1, v11, v1

    invoke-static {v11, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v5, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    :cond_18
    :goto_1a
    return v7

    :cond_19
    move v0, v1

    goto/16 :goto_d

    :cond_1a
    move v2, v1

    goto/16 :goto_e

    :cond_1b
    move v3, v1

    goto/16 :goto_f

    :cond_1c
    move v8, v1

    goto/16 :goto_10

    :cond_1d
    move v2, v7

    goto/16 :goto_11

    :cond_1e
    move v0, v7

    goto/16 :goto_12

    :cond_1f
    move v12, v0

    move v0, v2

    move v2, v12

    goto/16 :goto_13

    :cond_20
    move v2, v0

    move v0, v1

    goto/16 :goto_13

    :cond_21
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSlop:I

    neg-int v0, v0

    goto/16 :goto_14

    :cond_22
    move v0, v1

    goto/16 :goto_14

    :cond_23
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSlop:I

    neg-int v0, v0

    goto/16 :goto_15

    :cond_24
    move v0, v1

    goto/16 :goto_15

    :cond_25
    move v0, v5

    goto :goto_16

    :cond_26
    move v0, v5

    goto :goto_17

    :cond_27
    move v0, v5

    goto :goto_18

    :cond_28
    move v0, v5

    goto :goto_19

    :cond_29
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mSwipingY:Z

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->mViewHeight:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    sub-float v1, v11, v1

    invoke-static {v11, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v5, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    goto :goto_1a

    :cond_2a
    move v12, v0

    move v0, v2

    move v2, v12

    goto/16 :goto_13

    :cond_2b
    move v0, v5

    move v2, v5

    move v7, v1

    goto/16 :goto_1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
