.class Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->-get0(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;)F

    move-result v1

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v2

    mul-float/2addr v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->-set0(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;F)F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->invalidate()V

    const/4 v0, 0x1

    return v0
.end method
