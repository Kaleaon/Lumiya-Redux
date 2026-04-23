.class public Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;
.super Landroid/support/v4/app/Fragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;,
        Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;
    }
.end annotation


# instance fields
.field private adapter:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;

.field private cardSelectedColor:I

.field private final chatterList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;>;"
        }
    .end annotation
.end field

.field emptyView:Landroid/view/View;
    .annotation build Lbutterknife/BindView;
        value = 0x1020004
    .end annotation
.end field

.field userListView:Landroid/support/v7/widget/RecyclerView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1001e2
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->cardSelectedColor:I

    return v0
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/minimap/-$Lambda$0SrW7eOJ5Pm_SVTDQOmxGjUXtco;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/-$Lambda$0SrW7eOJ5Pm_SVTDQOmxGjUXtco;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->chatterList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->cardSelectedColor:I

    return-void
.end method

.method static newInstance(Ljava/util/UUID;)Landroid/support/v4/app/Fragment;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;-><init>()V

    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->makeFragmentArguments(Ljava/util/UUID;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private onChatterList(Lcom/google/common/collect/ImmutableList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;)V"
        }
    .end annotation

    const/16 v2, 0x8

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->setChatters(Lcom/google/common/collect/ImmutableList;)V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->emptyView:Landroid/view/View;

    if-eqz v3, :cond_2

    move v0, v1

    :goto_0
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->userListView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v3, :cond_3

    :goto_1
    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    :cond_1
    return-void

    :cond_2
    move v0, v2

    goto :goto_0

    :cond_3
    move v2, v1

    goto :goto_1
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_minimap_NearbyPeopleMinimapFragment-mthref-0(Lcom/google/common/collect/ImmutableList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->onChatterList(Lcom/google/common/collect/ImmutableList;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p2    # Landroid/view/ViewGroup;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f040060

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x7f010002

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v1, v1, Landroid/util/TypedValue;->data:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->cardSelectedColor:I

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;-><init>(Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->userListView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-object v0
.end method

.method public onStart()V
    .locals 3

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->chatterList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getChatterList()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Nearby:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->chatterList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->chatterList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    return-void
.end method

.method public setSelectedUser(Ljava/util/UUID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->setSelected(Ljava/util/UUID;)V

    :cond_0
    return-void
.end method
