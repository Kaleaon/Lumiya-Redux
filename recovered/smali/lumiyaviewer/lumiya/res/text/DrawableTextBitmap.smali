.class public Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;
.super Ljava/lang/Object;


# instance fields
.field private final baselineOffset:F

.field private final bitmap:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;I)V
    .locals 13

    const/16 v12, 0xff

    const/4 v4, 0x1

    const/4 v6, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    int-to-float v0, p2

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;->text()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    array-length v7, v8

    move v2, v6

    move v1, v4

    :goto_0
    if-ge v2, v7, :cond_0

    aget-object v0, v8, v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v5, v0, v6, v9, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-le v0, v1, :cond_8

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v0

    :goto_1
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {v5}, Landroid/graphics/Paint;->descent()F

    move-result v0

    invoke-virtual {v5}, Landroid/graphics/Paint;->ascent()F

    move-result v2

    sub-float v9, v0, v2

    array-length v0, v8

    int-to-float v0, v0

    mul-float/2addr v0, v9

    const/high16 v2, 0x3f800000    # 1.0f

    add-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v10

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;->backgroundColor()I

    move-result v0

    if-eqz v0, :cond_1

    move v2, p2

    :goto_2
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;->backgroundColor()I

    move-result v0

    if-eqz v0, :cond_2

    div-int/lit8 v0, p2, 0x2

    move v3, v0

    :goto_3
    move v7, v4

    :goto_4
    add-int v0, v1, v2

    if-ge v7, v0, :cond_3

    const/16 v0, 0x200

    if-ge v7, v0, :cond_3

    shl-int/lit8 v0, v7, 0x1

    move v7, v0

    goto :goto_4

    :cond_1
    move v2, v6

    goto :goto_2

    :cond_2
    move v3, v6

    goto :goto_3

    :cond_3
    move v0, v4

    :goto_5
    add-int v4, v10, v3

    if-ge v0, v4, :cond_4

    const/16 v4, 0x100

    if-ge v0, v4, :cond_4

    shl-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_4
    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;->backgroundColor()I

    move-result v0

    if-nez v0, :cond_6

    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    :goto_6
    invoke-static {v7, v7, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;->bitmap:Landroid/graphics/Bitmap;

    new-instance v0, Landroid/graphics/Canvas;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;->backgroundColor()I

    move-result v4

    if-eqz v4, :cond_5

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;->backgroundColor()I

    move-result v4

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setColor(I)V

    add-int v4, v1, v2

    add-int v11, v10, v3

    sub-int v1, v7, v4

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sub-int v2, v7, v11

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    sub-int v3, v7, v4

    div-int/lit8 v3, v3, 0x2

    sub-int v3, v7, v3

    int-to-float v3, v3

    sub-int v4, v7, v11

    div-int/lit8 v4, v4, 0x2

    sub-int v4, v7, v4

    int-to-float v4, v4

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_5
    invoke-virtual {v5, v12, v12, v12, v12}, Landroid/graphics/Paint;->setARGB(IIII)V

    sub-int v1, v7, v10

    div-int/lit8 v1, v1, 0x2

    array-length v2, v8

    :goto_7
    if-ge v6, v2, :cond_7

    aget-object v3, v8, v6

    div-int/lit8 v4, v7, 0x2

    int-to-float v4, v4

    int-to-float v11, v1

    invoke-virtual {v5}, Landroid/graphics/Paint;->ascent()F

    move-result v12

    sub-float/2addr v11, v12

    invoke-virtual {v0, v3, v4, v11, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    int-to-float v1, v1

    invoke-virtual {v5}, Landroid/graphics/Paint;->descent()F

    move-result v3

    invoke-virtual {v5}, Landroid/graphics/Paint;->ascent()F

    move-result v4

    sub-float/2addr v3, v4

    add-float/2addr v1, v3

    float-to-int v1, v1

    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    :cond_6
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    goto :goto_6

    :cond_7
    int-to-float v0, v10

    add-float/2addr v0, v9

    int-to-float v1, v7

    div-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;->baselineOffset:F

    return-void

    :cond_8
    move v0, v1

    goto/16 :goto_1
.end method


# virtual methods
.method public getBaselineOffset()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;->baselineOffset:F

    return v0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method
