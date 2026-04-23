.class public Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;
.super Landroid/view/View;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;
    }
.end annotation


# instance fields
.field private alignTop:Z

.field private assetID:Ljava/util/UUID;

.field private final bitmapDestRect:Landroid/graphics/Rect;

.field private final bitmapPaint:Landroid/graphics/Paint;

.field private final bitmapSrcRect:Landroid/graphics/Rect;

.field private imageBitmap:Landroid/graphics/Bitmap;

.field private loadTask:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;

.field private final textPaint:Landroid/graphics/Paint;

.field private verticalFit:Z


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->verticalFit:Z

    return v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->imageBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic -set1(Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;)Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->loadTask:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;

    return-object p1
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->textPaint:Landroid/graphics/Paint;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->alignTop:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->verticalFit:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->textPaint:Landroid/graphics/Paint;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->alignTop:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->verticalFit:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->textPaint:Landroid/graphics/Paint;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->alignTop:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->verticalFit:Z

    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 5

    const/4 v4, 0x1

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x7f01005c

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v1, v1, Landroid/util/TypedValue;->data:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->textPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->textPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->textPaint:Landroid/graphics/Paint;

    const/4 v2, 0x2

    const/high16 v3, 0x41600000    # 14.0f

    invoke-static {v2, v3, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    const/16 v5, 0xc0

    const/high16 v7, 0x40000000    # 2.0f

    const/4 v11, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->getHeight()I

    move-result v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapPaint:Landroid/graphics/Paint;

    const/16 v4, 0xff

    invoke-virtual {v0, v4, v5, v5, v5}, Landroid/graphics/Paint;->setARGB(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->imageBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_5

    if-eqz v2, :cond_5

    if-eqz v3, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->imageBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->imageBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v0, v4

    int-to-float v6, v2

    div-float/2addr v0, v6

    int-to-float v6, v5

    int-to-float v7, v3

    div-float/2addr v6, v7

    invoke-static {v0, v6}, Ljava/lang/Math;->max(FF)F

    move-result v0

    int-to-float v6, v4

    div-float/2addr v6, v0

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    int-to-float v7, v5

    div-float v0, v7, v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v7

    div-int/lit8 v0, v2, 0x2

    div-int/lit8 v8, v3, 0x2

    div-int/lit8 v9, v6, 0x2

    sub-int v9, v0, v9

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->alignTop:Z

    if-eqz v0, :cond_4

    move v0, v1

    :goto_0
    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    add-int/lit8 v10, v9, 0x1

    iput v10, v8, Landroid/graphics/Rect;->left:I

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    add-int/lit8 v10, v0, 0x1

    iput v10, v8, Landroid/graphics/Rect;->top:I

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    add-int/2addr v6, v9

    add-int/lit8 v6, v6, -0x1

    iput v6, v8, Landroid/graphics/Rect;->right:I

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    add-int/2addr v0, v7

    add-int/lit8 v0, v0, -0x1

    iput v0, v6, Landroid/graphics/Rect;->bottom:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    if-ge v0, v11, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    iput v11, v0, Landroid/graphics/Rect;->left:I

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    if-ge v0, v11, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    iput v11, v0, Landroid/graphics/Rect;->top:I

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    add-int/lit8 v6, v2, -0x1

    if-le v0, v6, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    add-int/lit8 v2, v2, -0x1

    iput v2, v0, Landroid/graphics/Rect;->right:I

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v2, v3, -0x1

    if-le v0, v2, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    add-int/lit8 v2, v3, -0x1

    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapSrcRect:Landroid/graphics/Rect;

    iput v1, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapSrcRect:Landroid/graphics/Rect;

    iput v1, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapSrcRect:Landroid/graphics/Rect;

    iput v4, v0, Landroid/graphics/Rect;->right:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapSrcRect:Landroid/graphics/Rect;

    iput v5, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->imageBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapSrcRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->top:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapDestRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :goto_1
    return-void

    :cond_4
    div-int/lit8 v0, v7, 0x2

    sub-int v0, v8, v0

    goto/16 :goto_0

    :cond_5
    const/16 v0, 0x32

    invoke-virtual {p1, v0, v1, v1, v1}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->assetID:Ljava/util/UUID;

    if-eqz v0, :cond_6

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->assetID:Ljava/util/UUID;

    invoke-virtual {v0, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_6
    const-string/jumbo v0, "No image"

    :goto_2
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapSrcRect:Landroid/graphics/Rect;

    invoke-virtual {v4, v0, v1, v5, v6}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    int-to-float v1, v2

    div-float/2addr v1, v7

    int-to-float v2, v3

    div-float/2addr v2, v7

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->bitmapSrcRect:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v7

    add-float/2addr v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_1

    :cond_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->loadTask:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;

    if-nez v0, :cond_8

    const-string/jumbo v0, "Failed to load"

    goto :goto_2

    :cond_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->loadTask:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v4, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-ne v0, v4, :cond_9

    const-string/jumbo v0, "Failed to load"

    goto :goto_2

    :cond_9
    const-string/jumbo v0, "Loading..."

    goto :goto_2
.end method

.method protected onMeasure(II)V
    .locals 5

    const/high16 v4, 0x40000000    # 2.0f

    const v1, 0x7fffffff

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    :goto_0
    return-void

    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    :goto_1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    if-eqz v2, :cond_4

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    :goto_2
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-ne v0, v4, :cond_5

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    :goto_3
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    if-ne v3, v4, :cond_1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    :cond_1
    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->verticalFit:Z

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->imageBitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_2

    if-eq v0, v1, :cond_2

    if-lez v0, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->imageBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int/2addr v1, v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->imageBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    div-int v2, v1, v2

    :cond_2
    invoke-virtual {p0, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setMeasuredDimension(II)V

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_1

    :cond_4
    move v2, v1

    goto :goto_2

    :cond_5
    move v0, v2

    goto :goto_3
.end method

.method public setAlignTop(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->alignTop:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->invalidate()V

    return-void
.end method

.method public setAssetID(Ljava/util/UUID;)V
    .locals 6

    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v1, 0x0

    const-string/jumbo v2, "new asset ID: %s"

    new-array v3, v4, [Ljava/lang/Object;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    aput-object v0, v3, v5

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object p1, v1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->assetID:Ljava/util/UUID;

    invoke-static {v0, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->loadTask:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->loadTask:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->cancel(Z)Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->loadTask:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;

    :cond_1
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->assetID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->imageBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->imageBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_2
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->imageBitmap:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->assetID:Ljava/util/UUID;

    if-eqz v0, :cond_3

    const-string/jumbo v0, "requested to view asset ID %s"

    new-array v2, v4, [Ljava/lang/Object;

    aput-object p1, v2, v5

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->loadTask:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->loadTask:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;

    new-array v1, v4, [Ljava/util/UUID;

    aput-object p1, v1, v5

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_3
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->invalidate()V

    :cond_4
    return-void

    :cond_5
    move-object v0, v1

    goto :goto_0
.end method

.method public setVerticalFit(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->verticalFit:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->requestLayout()V

    return-void
.end method
