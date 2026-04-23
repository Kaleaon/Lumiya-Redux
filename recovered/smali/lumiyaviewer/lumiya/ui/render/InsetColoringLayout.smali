.class public Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;
.super Landroid/widget/FrameLayout;


# instance fields
.field private backgroundColor:I

.field private final backgroundPaint:Landroid/graphics/Paint;

.field private childPaddingBottom:I

.field private childPaddingLeft:I

.field private childPaddingRight:I

.field private childPaddingTop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v1, 0x0

    const/16 v0, 0x14

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundColor:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingLeft:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingTop:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingRight:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingBottom:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->setWillNotDraw(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const/16 v0, 0x14

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundColor:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingLeft:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingTop:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingRight:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingBottom:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundPaint:Landroid/graphics/Paint;

    invoke-direct {p0, p1, p2, v1, v1}, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->setWillNotDraw(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    const/4 v1, 0x0

    const/16 v0, 0x14

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundColor:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingLeft:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingTop:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingRight:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingBottom:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundPaint:Landroid/graphics/Paint;

    invoke-direct {p0, p1, p2, p3, v1}, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->setWillNotDraw(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    const/4 v1, 0x0

    const/16 v0, 0x14

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundColor:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingLeft:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingTop:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingRight:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingBottom:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundPaint:Landroid/graphics/Paint;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->setWillNotDraw(Z)V

    return-void
.end method

.method private applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/R$styleable;->InsetColoringLayout:[I

    invoke-virtual {v0, p2, v1, p3, p4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundColor:I

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundColor:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    throw v0
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->getWidth()I

    move-result v6

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->getHeight()I

    move-result v7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundColor:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingTop:I

    if-eqz v0, :cond_0

    int-to-float v3, v6

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingTop:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingBottom:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingBottom:I

    sub-int v0, v7, v0

    int-to-float v2, v0

    int-to-float v4, v7

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingLeft:I

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingLeft:I

    int-to-float v3, v0

    int-to-float v4, v7

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingRight:I

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingRight:I

    sub-int v0, v6, v0

    int-to-float v3, v0

    int-to-float v5, v6

    int-to-float v6, v7

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->backgroundPaint:Landroid/graphics/Paint;

    move-object v2, p1

    move v4, v1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_3
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 2

    const/4 v1, 0x0

    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingLeft:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingRight:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingTop:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/InsetColoringLayout;->childPaddingBottom:I

    :cond_0
    return-void
.end method
