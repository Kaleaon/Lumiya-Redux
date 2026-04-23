.class public Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;
.super Landroid/support/v4/app/Fragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;,
        Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;
    }
.end annotation


# instance fields
.field private currentLocationInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

.field private itemLocationDetails:Landroid/view/MenuItem;

.field private itemPlayMedia:Landroid/view/MenuItem;

.field private subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemLocationDetails:Landroid/view/MenuItem;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemPlayMedia:Landroid/view/MenuItem;

    return-void
.end method

.method public static newInstance(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;-><init>()V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private onCurrentLocation(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 2

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f100149

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->notifyDataSetChanged()V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->updateOptionsMenu()V

    return-void
.end method

.method private updateOptionsMenu()V
    .locals 4

    const/4 v2, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    if-eqz v0, :cond_7

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v3, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v3, :cond_7

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getCurrentDetailsFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    if-ne v0, p0, :cond_3

    :cond_0
    move v0, v2

    :goto_0
    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemLocationDetails:Landroid/view/MenuItem;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemLocationDetails:Landroid/view/MenuItem;

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getMediaURL()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemPlayMedia:Landroid/view/MenuItem;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemPlayMedia:Landroid/view/MenuItem;

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_2
    :goto_2
    return-void

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemLocationDetails:Landroid/view/MenuItem;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemLocationDetails:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemPlayMedia:Landroid/view/MenuItem;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemPlayMedia:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_2

    :cond_6
    move v0, v1

    goto :goto_1

    :cond_7
    move v0, v1

    goto :goto_0
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_chat_ContactsFragment-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->onCurrentLocation(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const v0, 0x7f120003

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const v0, 0x7f1002fc

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemLocationDetails:Landroid/view/MenuItem;

    const v0, 0x7f1002fd

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->itemPlayMedia:Landroid/view/MenuItem;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->updateOptionsMenu()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f04002d

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    const v0, 0x7f100149

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-direct {v1, p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;Landroid/support/v4/app/FragmentManager;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    const v1, 0x7f100148

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/astuetz/PagerSlidingTabStrip;

    invoke-virtual {v1, v0}, Lcom/astuetz/PagerSlidingTabStrip;->setViewPager(Landroid/support/v4/view/ViewPager;)V

    return-object v2
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5

    const/4 v4, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfoSnapshot()Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->makeSelection(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return v4

    :pswitch_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->startStreamingMediaService(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return v4

    nop

    :pswitch_data_0
    .packed-switch 0x7f1002fc
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->updateOptionsMenu()V

    return-void
.end method

.method public onStart()V
    .locals 4

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->getSingleDataKey()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$zIl8cGSTO94X3h9h2afeKA4NC_s;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$zIl8cGSTO94X3h9h2afeKA4NC_s;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_0
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    return-void
.end method
