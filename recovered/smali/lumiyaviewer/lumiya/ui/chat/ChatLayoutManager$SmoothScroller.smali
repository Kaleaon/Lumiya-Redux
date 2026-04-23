.class abstract Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;
.super Landroid/support/v7/widget/LinearSmoothScroller;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "SmoothScroller"
.end annotation


# instance fields
.field private final scrollDp:F

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;Landroid/content/Context;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/LinearSmoothScroller;-><init>(Landroid/content/Context;)V

    const/high16 v0, 0x43480000    # 200.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;->scrollDp:F

    return-void
.end method


# virtual methods
.method protected calculateSpeedPerPixel(Landroid/util/DisplayMetrics;)F
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;->getScrollMs()F

    move-result v0

    const/4 v1, 0x1

    const/high16 v2, 0x43480000    # 200.0f

    invoke-static {v1, v2, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    div-float/2addr v0, v1

    return v0
.end method

.method public computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getScrollMs()F
.end method
