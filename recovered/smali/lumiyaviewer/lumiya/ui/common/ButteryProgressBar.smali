.class public Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;
.super Landroid/view/View;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar$ExponentialInterpolator;
    }
.end annotation


# static fields
.field private static final BASE_DURATION_MS:I = 0x1f4

.field private static final BASE_SEGMENT_COUNT:I = 0x5

.field private static final BASE_WIDTH_DP:I = 0x12c

.field private static final DEFAULT_BAR_HEIGHT_DP:I = 0x4

.field private static final DEFAULT_DETENT_WIDTH_DP:I = 0x3


# instance fields
.field private final mAnimator:Landroid/animation/ValueAnimator;

.field private final mBarColor:I

.field private final mDensity:F

.field private final mPaint:Landroid/graphics/Paint;

.field private mSegmentCount:I

.field private final mShadow:Landroid/graphics/drawable/GradientDrawable;

.field private final mSolidBarDetentWidth:I

.field private final mSolidBarHeight:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7

    const/4 v6, 0x1

    const/4 v3, 0x2

    const/4 v5, 0x0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mDensity:F

    sget-object v0, Lcom/lumiyaviewer/lumiya/R$styleable;->ButteryProgressBar:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x1060012

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mBarColor:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mDensity:F

    const/high16 v2, 0x40800000    # 4.0f

    mul-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mSolidBarHeight:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mDensity:F

    const/high16 v2, 0x40400000    # 3.0f

    mul-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    const/4 v2, 0x2

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mSolidBarDetentWidth:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    new-array v1, v3, [F

    fill-array-data v1, :array_0

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar$ExponentialInterpolator;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar$ExponentialInterpolator;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar$ExponentialInterpolator;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mBarColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    new-array v2, v3, [I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mBarColor:I

    const v4, 0xffffff

    and-int/2addr v3, v4

    const/high16 v4, 0x22000000

    or-int/2addr v3, v4

    aput v3, v2, v5

    aput v5, v2, v6

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mShadow:Landroid/graphics/drawable/GradientDrawable;

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    throw v0

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
    .end array-data
.end method

.method private start()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method private stop()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mShadow:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->getWidth()I

    move-result v8

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mSegmentCount:I

    add-int/lit8 v0, v0, -0x1

    shr-int v9, v8, v0

    move v6, v1

    :goto_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mSegmentCount:I

    if-ge v6, v0, :cond_2

    add-int/lit8 v0, v6, 0x1

    shr-int v0, v8, v0

    int-to-float v0, v0

    mul-float v1, v7, v0

    if-nez v6, :cond_1

    add-int v0, v8, v9

    int-to-float v0, v0

    :goto_1
    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mSolidBarDetentWidth:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    int-to-float v2, v9

    sub-float/2addr v1, v2

    const/4 v2, 0x0

    int-to-float v3, v9

    sub-float v3, v0, v3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mSolidBarHeight:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_0

    :cond_1
    const/high16 v0, 0x40000000    # 2.0f

    mul-float/2addr v0, v1

    goto :goto_1

    :cond_2
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 6

    const/high16 v5, 0x3f800000    # 1.0f

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mShadow:Landroid/graphics/drawable/GradientDrawable;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mSolidBarHeight:I

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->getHeight()I

    move-result v3

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mSolidBarHeight:I

    sub-int/2addr v3, v4

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2, v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    int-to-float v0, v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mDensity:F

    div-float/2addr v0, v1

    const/high16 v1, 0x43960000    # 300.0f

    div-float/2addr v0, v1

    sub-float v1, v0, v5

    const v2, 0x3e99999a    # 0.3f

    mul-float/2addr v1, v2

    add-float/2addr v1, v5

    sub-float/2addr v0, v5

    const v2, 0x3dcccccd    # 0.1f

    mul-float/2addr v0, v2

    add-float/2addr v0, v5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mAnimator:Landroid/animation/ValueAnimator;

    const/high16 v3, 0x43fa0000    # 500.0f

    mul-float/2addr v1, v3

    float-to-int v1, v1

    int-to-long v4, v1

    invoke-virtual {v2, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    const/high16 v1, 0x40a00000    # 5.0f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->mSegmentCount:I

    :cond_0
    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    if-nez p2, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->start()V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->stop()V

    goto :goto_0
.end method
