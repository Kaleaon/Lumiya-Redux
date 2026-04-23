.class public Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;
.super Landroid/view/ViewGroup;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;
    }
.end annotation


# instance fields
.field private fixedHeight:I

.field private fixedWidth:I

.field private onViewInvalidateListener:Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedWidth:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedHeight:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->onViewInvalidateListener:Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedWidth:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedHeight:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->onViewInvalidateListener:Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedWidth:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedHeight:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->onViewInvalidateListener:Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedWidth:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedHeight:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->onViewInvalidateListener:Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;

    return-void
.end method


# virtual methods
.method public invalidateChildInParent([ILandroid/graphics/Rect;)Landroid/view/ViewParent;
    .locals 2

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->invalidateChildInParent([ILandroid/graphics/Rect;)Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->onViewInvalidateListener:Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->onViewInvalidateListener:Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;

    invoke-interface {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;->onViewInvalidated()V

    :cond_0
    return-object v0
.end method

.method protected onLayout(ZIIII)V
    .locals 6

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->getChildCount()I

    move-result v2

    move v0, v1

    :goto_0
    if-ge v0, v2, :cond_0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedWidth:I

    iget v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedHeight:I

    invoke-virtual {v3, v1, v1, v4, v5}, Landroid/view/View;->layout(IIII)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 7

    const/high16 v6, 0x40000000    # 2.0f

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->getChildCount()I

    move-result v2

    move v0, v1

    :goto_0
    if-ge v0, v2, :cond_1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_0

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedWidth:I

    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    iget v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedHeight:I

    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-virtual {p0, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->measureChild(Landroid/view/View;II)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v1, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->setMeasuredDimension(II)V

    return-void
.end method

.method public setFixedSize(II)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedWidth:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->fixedHeight:I

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->requestLayout()V

    return-void
.end method

.method public setOnViewInvalidateListener(Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->onViewInvalidateListener:Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;

    return-void
.end method
