.class public Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$LoadableStatusListener;
.implements Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-ui-common-loadmon-Loadable$StatusSwitchesValues:[I


# instance fields
.field private emptyMessage:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private isExtraLoading:Z

.field private final loadables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;",
            ">;"
        }
    .end annotation
.end field

.field private loadingErrorMessage:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private loadingIdleMessage:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private onLoadableDataChangedListener:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final optionalLoadables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;",
            ">;"
        }
    .end annotation
.end field

.field private status:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-ui-common-loadmon-Loadable$StatusSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->-com-lumiyaviewer-lumiya-ui-common-loadmon-Loadable$StatusSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->-com-lumiyaviewer-lumiya-ui-common-loadmon-Loadable$StatusSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->values()[Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Error:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Idle:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loaded:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loading:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_3
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->-com-lumiyaviewer-lumiya-ui-common-loadmon-Loadable$StatusSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1

    :catch_3
    move-exception v1

    goto :goto_0
.end method

.method public varargs constructor <init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadables:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->optionalLoadables:Ljava/util/List;

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Idle:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->status:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->onLoadableDataChangedListener:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingIdleMessage:Ljava/lang/String;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingErrorMessage:Ljava/lang/String;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->emptyMessage:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->isExtraLoading:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadables:Ljava/util/List;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadables:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    invoke-interface {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;->addLoadableStatusListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$LoadableStatusListener;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private updateLoadingIndicator()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->-getcom-lumiyaviewer-lumiya-ui-common-loadmon-Loadable$StatusSwitchesValues()[I

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->status:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingIdleMessage:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->showMessage(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->showLoading()V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->emptyMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->showContent(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingErrorMessage:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->showMessage(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public onLoadableStatusChange(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;)V
    .locals 9

    const/4 v5, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadables:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v1, v2

    move v3, v2

    move v4, v2

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;->getLoadableStatus()Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->-getcom-lumiyaviewer-lumiya-ui-common-loadmon-Loadable$StatusSwitchesValues()[I

    move-result-object v7

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    :goto_1
    :pswitch_0
    sget-object v7, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loaded:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    if-eq v0, v7, :cond_8

    move v0, v5

    :goto_2
    move v1, v0

    goto :goto_0

    :pswitch_1
    move v4, v5

    goto :goto_1

    :pswitch_2
    move v3, v5

    goto :goto_1

    :cond_0
    if-nez v4, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->isExtraLoading:Z

    if-eqz v0, :cond_5

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loading:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    :goto_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->status:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    if-eq v0, v1, :cond_2

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->status:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->updateLoadingIndicator()V

    :cond_2
    if-nez v4, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->status:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loaded:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->onLoadableDataChangedListener:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->onLoadableDataChangedListener:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;->onLoadableDataChanged()V

    :cond_4
    return-void

    :cond_5
    if-eqz v3, :cond_6

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Error:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    goto :goto_3

    :cond_6
    if-nez v1, :cond_7

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loaded:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    goto :goto_3

    :cond_7
    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Idle:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    goto :goto_3

    :cond_8
    move v0, v1

    goto :goto_2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onRefresh()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadables:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/react/RefreshableOne;

    if-eqz v2, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/RefreshableOne;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/react/RefreshableOne;->requestRefresh()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->optionalLoadables:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/react/RefreshableOne;

    if-eqz v2, :cond_2

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/RefreshableOne;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/react/RefreshableOne;->requestRefresh()V

    goto :goto_1

    :cond_3
    return-void
.end method

.method public setButteryProgressBar(Z)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->setButteryProgressBar(Z)V

    :cond_0
    return-void
.end method

.method public setEmptyMessage(ZLjava/lang/String;)V
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_0

    :goto_0
    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->emptyMessage:Ljava/lang/String;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->updateLoadingIndicator()V

    return-void

    :cond_0
    const/4 p2, 0x0

    goto :goto_0
.end method

.method public setExtraLoading(Z)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->isExtraLoading:Z

    invoke-virtual {p0, v0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->onLoadableStatusChange(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;)V

    return-void
.end method

.method public setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingIdleMessage:Ljava/lang/String;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadingErrorMessage:Ljava/lang/String;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->updateLoadingIndicator()V

    return-void
.end method

.method public setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V
    .locals 0
    .param p1    # Landroid/support/v4/widget/SwipeRefreshLayout;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    :cond_0
    return-void
.end method

.method public unsubscribeAll()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->loadables:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;

    if-eqz v2, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;->unsubscribe()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->optionalLoadables:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;

    if-eqz v2, :cond_2

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;->unsubscribe()V

    goto :goto_1

    :cond_3
    return-void
.end method

.method public withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->onLoadableDataChangedListener:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;

    return-object p0
.end method

.method public varargs withOptionalLoadables([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->optionalLoadables:Ljava/util/List;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    const/4 v0, 0x0

    array-length v1, p1

    :goto_0
    if-ge v0, v1, :cond_0

    aget-object v2, p1, v0

    invoke-interface {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;->addLoadableStatusListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$LoadableStatusListener;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method
