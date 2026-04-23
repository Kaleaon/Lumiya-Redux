.class public Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;
.super Landroid/view/View;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;,
        Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;
    }
.end annotation


# static fields
.field private static final USER_MARK_TOUCH_SLACK:F = 50.0f


# instance fields
.field private activePointerId:I

.field private actualZoomFactor:F

.field private final bitmapDstRect:Landroid/graphics/Rect;

.field private final bitmapPaint:Landroid/graphics/Paint;

.field private final bitmapSrcRect:Landroid/graphics/Rect;

.field private final displaySize:Landroid/graphics/Point;

.field private lastDrawRect:Landroid/graphics/Rect;

.field private mapOffsetX:F

.field private mapOffsetY:F

.field private minimapBitmap:Landroid/graphics/Bitmap;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private onUserClickListener:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;

.field private prevTouchX:F

.field private prevTouchY:F

.field private final scaleGestureDetector:Landroid/view/ScaleGestureDetector;

.field private final scaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

.field private selectedUser:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private userLocations:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final userMarkPaint:Landroid/graphics/Paint;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->actualZoomFactor:F

    return v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;F)F
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->actualZoomFactor:F

    return p1
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->onUserClickListener:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->actualZoomFactor:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchX:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchY:F

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->activePointerId:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetX:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetY:F

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->selectedUser:Ljava/util/UUID;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->lastDrawRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->displaySize:Landroid/graphics/Point;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userMarkPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapDstRect:Landroid/graphics/Rect;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->scaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    new-instance v0, Landroid/view/ScaleGestureDetector;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->scaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-direct {v0, p1, v1}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->onUserClickListener:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->actualZoomFactor:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchX:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchY:F

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->activePointerId:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetX:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetY:F

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->selectedUser:Ljava/util/UUID;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->lastDrawRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->displaySize:Landroid/graphics/Point;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userMarkPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapDstRect:Landroid/graphics/Rect;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->scaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    new-instance v0, Landroid/view/ScaleGestureDetector;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->scaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-direct {v0, p1, v1}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->onUserClickListener:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->actualZoomFactor:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchX:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchY:F

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->activePointerId:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetX:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetY:F

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->selectedUser:Ljava/util/UUID;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->lastDrawRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->displaySize:Landroid/graphics/Point;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userMarkPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapDstRect:Landroid/graphics/Rect;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->scaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    new-instance v0, Landroid/view/ScaleGestureDetector;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->scaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-direct {v0, p1, v1}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    return-void
.end method

.method private drawUserMark(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Rect;ZFZ)V
    .locals 18

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->getX()F

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->getY()F

    move-result v4

    const/high16 v3, 0x43800000    # 256.0f

    div-float/2addr v2, v3

    invoke-virtual/range {p4 .. p4}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    move-object/from16 v0, p4

    iget v3, v0, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    add-float/2addr v3, v2

    const/high16 v2, 0x43800000    # 256.0f

    sub-float/2addr v2, v4

    const/high16 v4, 0x43800000    # 256.0f

    div-float/2addr v2, v4

    invoke-virtual/range {p4 .. p4}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v2, v4

    move-object/from16 v0, p4

    iget v4, v0, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    add-float/2addr v4, v2

    if-nez p5, :cond_2

    const/16 v2, 0xff

    const/4 v5, 0x0

    const/16 v6, 0xff

    const/4 v7, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v2, v5, v6, v7}, Landroid/graphics/Paint;->setARGB(IIII)V

    :goto_0
    const/4 v2, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v2, 0x40a00000    # 5.0f

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v0, v3, v4, v2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/16 v2, 0xff

    const/16 v5, 0x80

    const/16 v6, 0xff

    const/16 v7, 0x80

    move-object/from16 v0, p3

    invoke-virtual {v0, v2, v5, v6, v7}, Landroid/graphics/Paint;->setARGB(IIII)V

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v2, 0x40a00000    # 5.0f

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v0, v3, v4, v2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    if-eqz p5, :cond_0

    invoke-static/range {p6 .. p6}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    move/from16 v0, p6

    float-to-double v6, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    const-wide/high16 v8, 0x4034000000000000L    # 20.0

    mul-double/2addr v6, v8

    double-to-float v11, v6

    move/from16 v0, p6

    float-to-double v6, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    const-wide/high16 v8, 0x4034000000000000L    # 20.0

    mul-double/2addr v6, v8

    double-to-float v12, v6

    move/from16 v0, p6

    float-to-double v6, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    const-wide/high16 v8, 0x402e000000000000L    # 15.0

    mul-double/2addr v6, v8

    move/from16 v0, p6

    float-to-double v8, v0

    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    const-wide/high16 v14, -0x3fec000000000000L    # -5.0

    mul-double/2addr v8, v14

    sub-double/2addr v6, v8

    double-to-float v8, v6

    move/from16 v0, p6

    float-to-double v6, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    const-wide/high16 v14, -0x3fec000000000000L    # -5.0

    mul-double/2addr v6, v14

    move/from16 v0, p6

    float-to-double v14, v0

    invoke-static {v14, v15}, Ljava/lang/Math;->sin(D)D

    move-result-wide v14

    const-wide/high16 v16, 0x402e000000000000L    # 15.0

    mul-double v14, v14, v16

    add-double/2addr v6, v14

    double-to-float v9, v6

    move/from16 v0, p6

    float-to-double v6, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    const-wide/high16 v14, 0x402e000000000000L    # 15.0

    mul-double/2addr v6, v14

    move/from16 v0, p6

    float-to-double v14, v0

    invoke-static {v14, v15}, Ljava/lang/Math;->sin(D)D

    move-result-wide v14

    const-wide/high16 v16, 0x4014000000000000L    # 5.0

    mul-double v14, v14, v16

    sub-double/2addr v6, v14

    double-to-float v13, v6

    move/from16 v0, p6

    float-to-double v6, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    const-wide/high16 v14, 0x4014000000000000L    # 5.0

    mul-double/2addr v6, v14

    move/from16 v0, p6

    float-to-double v14, v0

    invoke-static {v14, v15}, Ljava/lang/Math;->sin(D)D

    move-result-wide v14

    const-wide/high16 v16, 0x402e000000000000L    # 15.0

    mul-double v14, v14, v16

    add-double/2addr v6, v14

    double-to-float v14, v6

    const/high16 v2, 0x40400000    # 3.0f

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    add-float v5, v3, v11

    sub-float v6, v4, v12

    move-object/from16 v2, p2

    move-object/from16 v7, p3

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-float v6, v3, v11

    sub-float v7, v4, v12

    add-float/2addr v8, v3

    sub-float v9, v4, v9

    move-object/from16 v5, p2

    move-object/from16 v10, p3

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-float v6, v3, v11

    sub-float v7, v4, v12

    add-float v8, v3, v13

    sub-float v9, v4, v14

    move-object/from16 v5, p2

    move-object/from16 v10, p3

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_0
    if-eqz p7, :cond_1

    const/high16 v2, 0x40000000    # 2.0f

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/16 v2, 0xff

    const/16 v5, 0xff

    const/16 v6, 0xff

    const/4 v7, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v2, v5, v6, v7}, Landroid/graphics/Paint;->setARGB(IIII)V

    const/high16 v2, 0x41200000    # 10.0f

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v0, v3, v4, v2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_1
    return-void

    :cond_2
    const/16 v2, 0xff

    const/16 v5, 0xff

    const/16 v6, 0xff

    const/4 v7, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v2, v5, v6, v7}, Landroid/graphics/Paint;->setARGB(IIII)V

    goto/16 :goto_0
.end method

.method private handleTouch(FF)V
    .locals 9

    const/high16 v8, 0x43800000    # 256.0f

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userLocations:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->lastDrawRect:Landroid/graphics/Rect;

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    const/4 v2, 0x1

    const/high16 v3, 0x42480000    # 50.0f

    invoke-static {v2, v3, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userLocations:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;->userPositions:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-object v2, v0

    move v3, v1

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->location:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->getX()F

    move-result v6

    div-float/2addr v6, v8

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->lastDrawRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v6, v7

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->lastDrawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->getY()F

    move-result v1

    sub-float v1, v8, v1

    div-float/2addr v1, v8

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->lastDrawRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v1, v7

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->lastDrawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    int-to-float v7, v7

    add-float/2addr v1, v7

    sub-float/2addr v6, p1

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    sub-float/2addr v1, p2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    mul-float/2addr v6, v6

    mul-float/2addr v1, v1

    add-float/2addr v1, v6

    float-to-double v6, v1

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    double-to-float v1, v6

    cmpg-float v6, v1, v4

    if-gez v6, :cond_3

    if-nez v2, :cond_0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    :goto_1
    move-object v2, v0

    move v3, v1

    goto :goto_0

    :cond_0
    cmpg-float v6, v1, v3

    if-gez v6, :cond_3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    goto :goto_1

    :cond_1
    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->setSelectedUser(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->onUserClickListener:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->onUserClickListener:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;

    invoke-interface {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;->onUserClick(Ljava/util/UUID;)V

    :cond_2
    return-void

    :cond_3
    move-object v0, v2

    move v1, v3

    goto :goto_1
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 14

    const/4 v7, 0x0

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->minimapBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->getHeight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->actualZoomFactor:F

    mul-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v3

    div-int/lit8 v4, v1, 0x2

    div-int/lit8 v6, v2, 0x2

    if-gt v3, v1, :cond_0

    iput v7, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetX:F

    :cond_0
    if-gt v3, v2, :cond_1

    iput v7, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetY:F

    :cond_1
    div-int/lit8 v0, v3, 0x2

    sub-int v0, v4, v0

    iget v7, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetX:F

    float-to-int v7, v7

    add-int/2addr v0, v7

    if-lez v0, :cond_2

    if-le v3, v1, :cond_2

    div-int/lit8 v0, v3, 0x2

    sub-int/2addr v0, v4

    int-to-float v0, v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetX:F

    div-int/lit8 v0, v3, 0x2

    sub-int v0, v4, v0

    iget v7, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetX:F

    float-to-int v7, v7

    add-int/2addr v0, v7

    :cond_2
    add-int v7, v0, v3

    if-gt v7, v1, :cond_3

    if-le v3, v1, :cond_3

    sub-int v0, v1, v3

    sub-int/2addr v0, v4

    div-int/lit8 v1, v3, 0x2

    add-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetX:F

    div-int/lit8 v0, v3, 0x2

    sub-int v0, v4, v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetX:F

    float-to-int v1, v1

    add-int/2addr v0, v1

    :cond_3
    div-int/lit8 v1, v3, 0x2

    sub-int v1, v6, v1

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetY:F

    float-to-int v4, v4

    add-int/2addr v1, v4

    if-lez v1, :cond_4

    if-le v3, v2, :cond_4

    div-int/lit8 v1, v3, 0x2

    sub-int/2addr v1, v6

    int-to-float v1, v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetY:F

    div-int/lit8 v1, v3, 0x2

    sub-int v1, v6, v1

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetY:F

    float-to-int v4, v4

    add-int/2addr v1, v4

    :cond_4
    add-int v4, v1, v3

    if-gt v4, v2, :cond_5

    if-le v3, v2, :cond_5

    sub-int v1, v2, v3

    sub-int/2addr v1, v6

    div-int/lit8 v2, v3, 0x2

    add-int/2addr v1, v2

    int-to-float v1, v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetY:F

    div-int/lit8 v1, v3, 0x2

    sub-int v1, v6, v1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetY:F

    float-to-int v2, v2

    add-int/2addr v1, v2

    :cond_5
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapDstRect:Landroid/graphics/Rect;

    add-int v4, v0, v3

    add-int/2addr v3, v1

    invoke-virtual {v2, v0, v1, v4, v3}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapSrcRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->minimapBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->minimapBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v0, v5, v5, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->minimapBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapSrcRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapDstRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userLocations:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userLocations:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;->userPositions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->location:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userMarkPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapDstRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->selectedUser:Ljava/util/UUID;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    const/high16 v6, 0x7fc00000    # Float.NaN

    move-object v0, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->drawUserMark(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Rect;ZFZ)V

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userLocations:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    if-eqz v7, :cond_7

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userMarkPaint:Landroid/graphics/Paint;

    iget-object v10, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapDstRect:Landroid/graphics/Rect;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userLocations:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;

    iget v12, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;->myAvatarHeading:F

    const/4 v11, 0x1

    move-object v6, p0

    move-object v8, p1

    move v13, v5

    invoke-direct/range {v6 .. v13}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->drawUserMark(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Rect;ZFZ)V

    :cond_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->lastDrawRect:Landroid/graphics/Rect;

    if-nez v0, :cond_9

    new-instance v0, Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapDstRect:Landroid/graphics/Rect;

    invoke-direct {v0, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->lastDrawRect:Landroid/graphics/Rect;

    :cond_8
    :goto_1
    return-void

    :cond_9
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->lastDrawRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->bitmapDstRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    goto :goto_1
.end method

.method protected onMeasure(II)V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xd

    if-lt v1, v2, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->displaySize:Landroid/graphics/Point;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->displaySize:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->displaySize:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->y:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_0
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_1
    invoke-virtual {p0, v0, v0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->setMeasuredDimension(II)V

    return-void

    :cond_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->displaySize:Landroid/graphics/Point;

    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Point;->set(II)V

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    const/4 v1, 0x1

    const/4 v3, -0x1

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v2, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return v1

    :pswitch_1
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->activePointerId:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchY:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchX:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchY:F

    invoke-direct {p0, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->handleTouch(FF)V

    goto :goto_0

    :pswitch_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->activePointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v3}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v3

    if-nez v3, :cond_1

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchX:F

    sub-float v3, v2, v3

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchY:F

    sub-float v4, v0, v4

    iget v5, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetX:F

    add-float/2addr v3, v5

    iput v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetX:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetY:F

    add-float/2addr v3, v4

    iput v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->mapOffsetY:F

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->invalidate()V

    :cond_1
    iput v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchX:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchY:F

    goto :goto_0

    :pswitch_3
    iput v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->activePointerId:I

    goto :goto_0

    :pswitch_4
    iput v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->activePointerId:I

    goto :goto_0

    :pswitch_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->activePointerId:I

    if-ne v3, v4, :cond_0

    if-nez v2, :cond_2

    move v0, v1

    :cond_2
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    iput v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchX:F

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    iput v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->prevTouchY:F

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->activePointerId:I

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method setMinimapBitmap(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x0

    if-nez p1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->minimapBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->minimapBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->minimapBitmap:Landroid/graphics/Bitmap;

    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->invalidate()V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->minimapBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->makeBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->minimapBitmap:Landroid/graphics/Bitmap;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->minimapBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->updateBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method setOnUserClickListener(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->onUserClickListener:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;

    return-void
.end method

.method setSelectedUser(Ljava/util/UUID;)V
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->selectedUser:Ljava/util/UUID;

    invoke-static {p1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->selectedUser:Ljava/util/UUID;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->invalidate()V

    :cond_0
    return-void
.end method

.method setUserLocations(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->userLocations:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->invalidate()V

    return-void
.end method
