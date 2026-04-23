.class public Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;
.super Landroid/view/View;


# instance fields
.field private final innerRingPaint:Landroid/graphics/Paint;

.field private innerRingThickness:F

.field private onlineIndicatorColor:I

.field private outerRingGap:F

.field private final outerRingPaint:Landroid/graphics/Paint;

.field private outerRingThickness:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v0, -0xff0100

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->onlineIndicatorColor:I

    const/high16 v0, 0x40a00000    # 5.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingThickness:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingGap:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingThickness:F

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingPaint:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const v0, -0xff0100

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->onlineIndicatorColor:I

    const/high16 v0, 0x40a00000    # 5.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingThickness:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingGap:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingThickness:F

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingPaint:Landroid/graphics/Paint;

    invoke-direct {p0, p1, p2, v2, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const v0, -0xff0100

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->onlineIndicatorColor:I

    const/high16 v0, 0x40a00000    # 5.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingThickness:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingGap:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingThickness:F

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingPaint:Landroid/graphics/Paint;

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const v0, -0xff0100

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->onlineIndicatorColor:I

    const/high16 v0, 0x40a00000    # 5.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingThickness:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingGap:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingThickness:F

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingPaint:Landroid/graphics/Paint;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method private applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/R$styleable;->OnlineIndicatorView:[I

    invoke-virtual {v0, p2, v1, p3, p4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->onlineIndicatorColor:I

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->onlineIndicatorColor:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingThickness:F

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingThickness:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingGap:F

    const/4 v2, 0x2

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingGap:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingThickness:F

    const/4 v2, 0x3

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingThickness:F
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
.method protected onAttachedToWindow()V
    .locals 3

    const/4 v2, 0x1

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->onlineIndicatorColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->onlineIndicatorColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingThickness:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    const/high16 v6, 0x40000000    # 2.0f

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float v2, v0, v6

    div-float v3, v1, v6

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingThickness:F

    div-float/2addr v4, v6

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    div-float/2addr v0, v6

    div-float/2addr v1, v6

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->innerRingThickness:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingGap:F

    add-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingThickness:F

    div-float/2addr v3, v6

    add-float/2addr v2, v3

    div-float/2addr v2, v6

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/OnlineIndicatorView;->outerRingPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method
