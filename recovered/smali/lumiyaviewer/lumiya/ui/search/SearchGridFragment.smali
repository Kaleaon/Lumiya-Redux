.class public Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;
.implements Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$OnSearchResultClickListener;


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues:[I


# instance fields
.field private adapter:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field radioGroupSearchType:Landroid/widget/RadioGroup;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100279
    .end annotation
.end field

.field private final searchResults:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;",
            ">;>;"
        }
    .end annotation
.end field

.field searchResultsList:Landroid/support/v7/widget/RecyclerView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10027d
    .end annotation
.end field

.field searchString:Landroid/widget/EditText;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100277
    .end annotation
.end field

.field private unbinder:Lbutterknife/Unbinder;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->-com-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->-com-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->values()[Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Groups:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->People:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Places:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->-com-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->searchResults:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->searchResults:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    return-void
.end method

.method private beginSearch()V
    .locals 4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->searchString:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->radioGroupSearchType:Landroid/widget/RadioGroup;

    invoke-virtual {v0}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->People:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    :goto_0
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v3, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->create(Ljava/util/UUID;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;)Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->searchResults:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSearchManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->searchResults()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v1

    invoke-virtual {v2, v1, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    return-void

    :pswitch_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->People:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    goto :goto_0

    :pswitch_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Groups:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    goto :goto_0

    :pswitch_2
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Places:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x7f10027a
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static newInstance(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-static {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/os/Bundle;Ljava/util/UUID;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f040098

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-static {p0, v1}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->unbinder:Lbutterknife/Unbinder;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/os/Bundle;)Ljava/util/UUID;

    move-result-object v3

    invoke-direct {v0, v2, v3, p0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;-><init>(Landroid/content/Context;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter$OnSearchResultClickListener;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->searchResultsList:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    const v0, 0x7f0902e8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const v0, 0x7f1000bd

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f090116

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f0902e9

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public onDestroyView()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->unbinder:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onDestroyView()V

    return-void
.end method

.method public onLoadableDataChanged()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->searchResults:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/query/LazyList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridAdapter;->setData(Lde/greenrobot/dao/query/LazyList;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lde/greenrobot/dao/query/LazyList;->isEmpty()Z

    move-result v0

    :goto_0
    const v2, 0x7f0901fe

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setEmptyMessage(ZLjava/lang/String;)V

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onSearchButtonClicked()V
    .locals 0
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100278
        }
    .end annotation

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->beginSearch()V

    return-void
.end method

.method public onSearchResultClicked(Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;)V
    .locals 4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/os/Bundle;)Ljava/util/UUID;

    move-result-object v0

    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->values()[Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemType()I

    move-result v2

    aget-object v1, v1, v2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->-getcom-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues()[I

    move-result-object v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v1

    aget v1, v2, v1

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    :pswitch_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->getItemUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->makeSelection(Ljava/util/UUID;Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onSearchTextAction(ILandroid/view/KeyEvent;)Z
    .locals 3
    .annotation build Lbutterknife/OnEditorAction;
        value = {
            0x7f100277
        }
    .end annotation

    const/4 v2, 0x0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x42

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->beginSearch()V

    const/4 v0, 0x1

    return v0

    :cond_1
    return v2
.end method
