.class public Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;
.super Landroid/support/v7/widget/LinearLayoutManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;
    }
.end annotation


# static fields
.field private static final SMOOTH_SCROLL_FAST_SPEED:F = 20.0f

.field private static final SMOOTH_SCROLL_SPEED:F = 1000.0f


# instance fields
.field private final fastSmoothScroller:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private isFast:Z

.field private final smoothScroller:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;IZ)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->isFast:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$1;

    invoke-direct {v0, p0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->smoothScroller:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$2;

    invoke-direct {v0, p0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->fastSmoothScroller:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;

    return-void
.end method


# virtual methods
.method public setScrollMode(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->isFast:Z

    return-void
.end method

.method public smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->isFast:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->fastSmoothScroller:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;

    :goto_0
    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;->setTargetPosition(I)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->startSmoothScroll(Landroid/support/v7/widget/RecyclerView$SmoothScroller;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->smoothScroller:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;

    goto :goto_0
.end method
