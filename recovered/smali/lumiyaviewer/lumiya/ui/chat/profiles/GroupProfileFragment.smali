.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;,
        Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;
    }
.end annotation


# instance fields
.field private final activeFragments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;>;"
        }
    .end annotation
.end field

.field private adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final generalGroupTabs:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;",
            ">;"
        }
    .end annotation
.end field

.field private lastSelectedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private lastSelectedTab:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field private final myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;",
            ">;"
        }
    .end annotation
.end field

.field private final myGroupTabs:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->activeFragments:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    return-object v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    return-object p1
.end method

.method static synthetic -set1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedTab:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    return-object p1
.end method

.method public constructor <init>()V
    .locals 5

    const/4 v4, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;-><init>()V

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->activeFragments:Ljava/util/Map;

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->MainProfile:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->Members:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    invoke-static {v0, v1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->generalGroupTabs:Lcom/google/common/collect/ImmutableList;

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->MainProfile:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->Roles:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->Members:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    invoke-static {v0, v1, v2}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->myGroupTabs:Lcom/google/common/collect/ImmutableList;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedTab:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    if-eqz p3, :cond_1

    const-string/jumbo v0, "lastSelectedTab"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->values()[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    move-result-object v0

    const-string/jumbo v1, "lastSelectedTab"

    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedTab:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    :cond_0
    const-string/jumbo v0, "lastSelectedChatterID"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "lastSelectedChatterID"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    :cond_1
    const v0, 0x7f040046

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    const v0, 0x7f10017b

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-direct {v1, p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;Landroid/support/v4/app/FragmentManager;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    const v1, 0x7f10017a

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/astuetz/PagerSlidingTabStrip;

    invoke-virtual {v1, v0}, Lcom/astuetz/PagerSlidingTabStrip;->setViewPager(Landroid/support/v4/view/ViewPager;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const v0, 0x7f1000bd

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f0901e0

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f090151

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method

.method public onLoadableDataChanged()V
    .locals 7

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v0, 0x0

    :try_start_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v3, v3, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->Groups:Lcom/google/common/collect/ImmutableMap;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    :cond_0
    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->myGroupTabs:Lcom/google/common/collect/ImmutableList;

    move-object v3, v0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->setTabs(Lcom/google/common/collect/ImmutableList;)V

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->getView()Landroid/view/View;

    move-result-object v4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v0, v5}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedTab:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    if-eqz v0, :cond_2

    if-eqz v4, :cond_2

    :goto_1
    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-ge v1, v0, :cond_5

    invoke-virtual {v3, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedTab:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :goto_2
    const-string/jumbo v0, "GroupProfile tabs: new tabIndex %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v3, v6

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eq v1, v2, :cond_2

    const v0, 0x7f10017b

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    :cond_2
    :goto_3
    return-void

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->generalGroupTabs:Lcom/google/common/collect/ImmutableList;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, v0

    goto :goto_0

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_5
    move v1, v2

    goto :goto_2
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string/jumbo v0, "GroupProfile tabs: saving lastSelectedTab %s, lastSelectedChatterID %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedTab:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedTab:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "lastSelectedTab"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedTab:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->ordinal()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_1

    const-string/jumbo v0, "lastSelectedChatterID"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->lastSelectedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_1
    return-void
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 5
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_2

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarGroupLists()Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->activeFragments:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    :goto_2
    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;

    invoke-interface {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;->setFragmentArgs(Landroid/content/Intent;Landroid/os/Bundle;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->setTabs(Lcom/google/common/collect/ImmutableList;)V

    goto :goto_0

    :cond_3
    move-object v1, v2

    goto :goto_2

    :cond_4
    return-void
.end method
