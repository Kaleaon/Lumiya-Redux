.class public Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;
.super Landroid/view/View;


# instance fields
.field private final paint:Landroid/graphics/Paint;

.field private final path:Landroid/graphics/Path;

.field private final pathEffect:Landroid/graphics/PathEffect;

.field private separatorColor:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v0, -0xbbbbbc

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->separatorColor:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->paint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->path:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/DashPathEffect;

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->pathEffect:Landroid/graphics/PathEffect;

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x41200000    # 10.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v3, 0x0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const v0, -0xbbbbbc

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->separatorColor:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->paint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->path:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/DashPathEffect;

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->pathEffect:Landroid/graphics/PathEffect;

    invoke-direct {p0, p1, p2, v3, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x41200000    # 10.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const v0, -0xbbbbbc

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->separatorColor:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->paint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->path:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/DashPathEffect;

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->pathEffect:Landroid/graphics/PathEffect;

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x41200000    # 10.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const v0, -0xbbbbbc

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->separatorColor:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->paint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->path:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/DashPathEffect;

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->pathEffect:Landroid/graphics/PathEffect;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x41200000    # 10.0f
    .end array-data
.end method

.method private applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/R$styleable;->DashedSeparatorView:[I

    invoke-virtual {v0, p2, v1, p3, p4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->separatorColor:I

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->separatorColor:I
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
    .locals 4

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->separatorColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    const/4 v2, 0x1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v2, v3, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->paint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->pathEffect:Landroid/graphics/PathEffect;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->path:Landroid/graphics/Path;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->path:Landroid/graphics/Path;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->path:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/DashedSeparatorView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method
