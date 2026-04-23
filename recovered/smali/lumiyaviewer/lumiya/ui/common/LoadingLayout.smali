.class public Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;
.super Landroid/widget/FrameLayout;


# instance fields
.field private butteryBarVisible:Z

.field private butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final progressBar:Landroid/widget/ProgressBar;

.field private swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final textView:Landroid/widget/TextView;

.field private withButteryProgressBar:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->withButteryProgressBar:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryBarVisible:Z

    new-instance v0, Landroid/widget/ProgressBar;

    invoke-direct {v0, p1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->progressBar:Landroid/widget/ProgressBar;

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->textView:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->prepareViews(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->withButteryProgressBar:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryBarVisible:Z

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Landroid/widget/ProgressBar;

    invoke-direct {v0, p1, p2}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->progressBar:Landroid/widget/ProgressBar;

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->textView:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->prepareViews(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->withButteryProgressBar:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryBarVisible:Z

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Landroid/widget/ProgressBar;

    invoke-direct {v0, p1, p2, p3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->progressBar:Landroid/widget/ProgressBar;

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->textView:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->prepareViews(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->withButteryProgressBar:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryBarVisible:Z

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Landroid/widget/ProgressBar;

    invoke-direct {v0, p1, p2, p3, p4}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->progressBar:Landroid/widget/ProgressBar;

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1, p2, p3, p4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->textView:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->prepareViews(Landroid/content/Context;)V

    return-void
.end method

.method private applyAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/R$styleable;->LoadingLayout:[I

    invoke-virtual {v0, p2, v1, v2, v2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->withButteryProgressBar:Z

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->withButteryProgressBar:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    throw v0
.end method

.method private prepareViews(Landroid/content/Context;)V
    .locals 7

    const/16 v6, 0x11

    const/16 v5, 0x8

    const/4 v4, -0x2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->withButteryProgressBar:Z

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    const v1, 0x7f100013

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->setId(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    const/16 v3, 0x30

    invoke-direct {v1, v2, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->progressBar:Landroid/widget/ProgressBar;

    const v1, 0x7f100015

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setId(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v5}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->progressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->progressBar:Landroid/widget/ProgressBar;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v4, v4, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->textView:Landroid/widget/TextView;

    const v1, 0x7f100014

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->textView:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->textView:Landroid/widget/TextView;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v4, v4, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private setMode(ZZZ)V
    .locals 6

    const/16 v2, 0x8

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->getChildCount()I

    move-result v4

    move v3, v1

    :goto_0
    if-ge v3, v4, :cond_7

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->progressBar:Landroid/widget/ProgressBar;

    if-ne v5, v0, :cond_1

    if-eqz p1, :cond_0

    move v0, v1

    :goto_1
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_2
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_0

    :cond_0
    move v0, v2

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->textView:Landroid/widget/TextView;

    if-ne v5, v0, :cond_3

    if-eqz p2, :cond_2

    move v0, v1

    :goto_3
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    :cond_2
    move v0, v2

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    if-ne v5, v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryBarVisible:Z

    if-eqz v0, :cond_4

    move v0, v1

    :goto_4
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    :cond_4
    move v0, v2

    goto :goto_4

    :cond_5
    if-eqz p3, :cond_6

    move v0, v1

    :goto_5
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    :cond_6
    move v0, v2

    goto :goto_5

    :cond_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0, p3}, Landroid/support/v4/widget/SwipeRefreshLayout;->setEnabled(Z)V

    if-nez p3, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    :cond_8
    return-void
.end method


# virtual methods
.method public setButteryProgressBar(Z)V
    .locals 2

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryBarVisible:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->butteryProgressBar:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->setVisibility(I)V

    :cond_0
    return-void

    :cond_1
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V
    .locals 0
    .param p1    # Landroid/support/v4/widget/SwipeRefreshLayout;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    return-void
.end method

.method public showContent(Ljava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_1

    move v0, v1

    :goto_0
    invoke-direct {p0, v2, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->setMode(ZZZ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->textView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    :cond_0
    return-void

    :cond_1
    move v0, v2

    goto :goto_0
.end method

.method public showLoading()V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x1

    invoke-direct {p0, v0, v1, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->setMode(ZZZ)V

    return-void
.end method

.method public showMessage(Ljava/lang/String;)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x1

    invoke-direct {p0, v1, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->setMode(ZZZ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->textView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
