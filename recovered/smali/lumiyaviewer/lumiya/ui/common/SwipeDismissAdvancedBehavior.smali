.class public Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;
.super Landroid/support/design/widget/CoordinatorLayout$Behavior;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;,
        Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;,
        Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;,
        Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SwipeDirection;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Landroid/support/design/widget/CoordinatorLayout$Behavior",
        "<TV;>;"
    }
.end annotation


# static fields
.field private static final DEFAULT_ALPHA_END_DISTANCE:F = 1.0f

.field private static final DEFAULT_ALPHA_START_DISTANCE:F = 0.0f

.field private static final DEFAULT_DRAG_DISMISS_THRESHOLD:F = 1.0f

.field public static final STATE_DRAGGING:I = 0x1

.field public static final STATE_IDLE:I = 0x0

.field public static final STATE_SETTLING:I = 0x2

.field public static final SWIPE_DIRECTION_ANY:I = 0xf

.field public static final SWIPE_DIRECTION_DOWN:I = 0x8

.field public static final SWIPE_DIRECTION_LEFT:I = 0x1

.field public static final SWIPE_DIRECTION_RIGHT:I = 0x2

.field public static final SWIPE_DIRECTION_UP:I = 0x4

.field public static final SWIPE_DIRECTION_X:I = 0x3

.field public static final SWIPE_DIRECTION_Y:I = 0xc


# instance fields
.field private mAlphaEndSwipeDistance:F

.field private mAlphaStartSwipeDistance:F

.field private final mDragCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

.field private mDragDismissThreshold:F

.field private mIgnoreEvents:Z

.field private mListener:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

.field private mSensitivity:F

.field private mSensitivitySet:Z

.field private mSwipeDirection:I

.field private mViewDragHelper:Landroid/support/v4/widget/ViewDragHelper;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mAlphaEndSwipeDistance:F

    return v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mAlphaStartSwipeDistance:F

    return v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mDragDismissThreshold:F

    return v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mListener:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mSwipeDirection:I

    return v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)Landroid/support/v4/widget/ViewDragHelper;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mViewDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    return-object v0
.end method

.method static synthetic -wrap0(FFF)F
    .locals 1

    invoke-static {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->clamp(FFF)F

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(III)I
    .locals 1

    invoke-static {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->clamp(III)I

    move-result v0

    return v0
.end method

.method public constructor <init>()V
    .locals 3

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout$Behavior;-><init>()V

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mSensitivity:F

    const/16 v0, 0xf

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mSwipeDirection:I

    iput v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mDragDismissThreshold:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mAlphaStartSwipeDistance:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mAlphaEndSwipeDistance:F

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mDragCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    return-void
.end method

.method private static clamp(FFF)F
    .locals 1

    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method private static clamp(III)I
    .locals 1

    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method private ensureViewDragHelper(Landroid/view/ViewGroup;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mViewDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mSensitivitySet:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mSensitivity:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mDragCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-static {p1, v0, v1}, Landroid/support/v4/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;FLandroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mViewDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mDragCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-static {p1, v0}, Landroid/support/v4/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;Landroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    goto :goto_0
.end method

.method static fraction(FFF)F
    .locals 2

    sub-float v0, p2, p0

    sub-float v1, p1, p0

    div-float/2addr v0, v1

    return v0
.end method


# virtual methods
.method public canSwipeDismissView(Landroid/view/View;)Z
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x1

    return v0
.end method

.method public getDragState()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mViewDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mViewDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v0}, Landroid/support/v4/widget/ViewDragHelper;->getViewDragState()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onInterceptTouchEvent(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/MotionEvent;",
            ")Z"
        }
    .end annotation

    const/4 v2, 0x0

    invoke-static {p3}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1, p2, v0, v1}, Landroid/support/design/widget/CoordinatorLayout;->isPointInChildBounds(Landroid/view/View;II)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mIgnoreEvents:Z

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mIgnoreEvents:Z

    if-eqz v0, :cond_1

    return v2

    :pswitch_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mIgnoreEvents:Z

    if-eqz v0, :cond_0

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mIgnoreEvents:Z

    return v2

    :cond_1
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->ensureViewDragHelper(Landroid/view/ViewGroup;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mViewDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v0, p3}, Landroid/support/v4/widget/ViewDragHelper;->shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/MotionEvent;",
            ")Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mViewDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mViewDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v0, p3}, Landroid/support/v4/widget/ViewDragHelper;->processTouchEvent(Landroid/view/MotionEvent;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setDragDismissDistance(F)V
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->clamp(FFF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mDragDismissThreshold:F

    return-void
.end method

.method public setEndAlphaSwipeDistance(F)V
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->clamp(FFF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mAlphaEndSwipeDistance:F

    return-void
.end method

.method public setListener(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mListener:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

    return-void
.end method

.method public setSensitivity(F)V
    .locals 1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mSensitivity:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mSensitivitySet:Z

    return-void
.end method

.method public setStartAlphaSwipeDistance(F)V
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->clamp(FFF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mAlphaStartSwipeDistance:F

    return-void
.end method

.method public setSwipeDirection(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->mSwipeDirection:I

    return-void
.end method
