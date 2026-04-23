.class public Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;
.super Landroid/support/v4/app/Fragment;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;


# instance fields
.field private final minimapBitmap:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final userLocations:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/minimap/-$Lambda$XqnH7RvGuiq1TzRqXD2eGyM2ulM;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/-$Lambda$XqnH7RvGuiq1TzRqXD2eGyM2ulM;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->minimapBitmap:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/minimap/-$Lambda$XqnH7RvGuiq1TzRqXD2eGyM2ulM$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/-$Lambda$XqnH7RvGuiq1TzRqXD2eGyM2ulM$1;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->userLocations:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    return-void
.end method

.method static newInstance(Ljava/util/UUID;)Landroid/support/v4/app/Fragment;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;-><init>()V

    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->makeFragmentArguments(Ljava/util/UUID;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private onMinimapBitmap(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;)V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f1001dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->setMinimapBitmap(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;)V

    :cond_0
    return-void
.end method

.method private onUserLocations(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;)V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f1001dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->setUserLocations(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;)V

    :cond_0
    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_minimap_MinimapFragment-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->onMinimapBitmap(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_minimap_MinimapFragment-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->onUserLocations(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f04005e

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f1001dd

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->setOnUserClickListener(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;)V

    return-object v1
.end method

.method public onStart()V
    .locals 4

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->minimapBitmap:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getMinimapBitmapPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->userLocations:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserLocationsPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->minimapBitmap:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->userLocations:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->minimapBitmap:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->userLocations:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    return-void
.end method

.method public onUserClick(Ljava/util/UUID;)V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f100114

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->setSelectedUser(Ljava/util/UUID;)V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    const v1, 0x7f1001dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView;->setSelectedUser(Ljava/util/UUID;)V

    :cond_1
    return-void
.end method
