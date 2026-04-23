.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;
.super Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;


# instance fields
.field aboutEditButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002ba
    .end annotation
.end field

.field private final avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;",
            ">;"
        }
    .end annotation
.end field

.field changePicButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002b2
    .end annotation
.end field

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000bd
    .end annotation
.end field

.field swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000bb
    .end annotation
.end field

.field private unbinder:Lbutterknife/Unbinder;

.field userPicView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002b6
    .end annotation
.end field

.field userProfileAboutText:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002b9
    .end annotation
.end field

.field userProfilePaymentInfo:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002b7
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    return-void
.end method


# virtual methods
.method protected onAboutEditClicked(Landroid/view/View;)V
    .locals 4
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002ba
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method protected onChangePicClicked(Landroid/view/View;)V
    .locals 5
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002b2
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v2, "oldProfileData"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    sget-object v3, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyFirstLife:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-static {v0, v2, v3, v1, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->makeSelectActionIntent(Landroid/content/Context;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;Landroid/os/Bundle;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
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

    const v0, 0x7f0400b6

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->unbinder:Lbutterknife/Unbinder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f0901f1

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f090374

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    return-object v0
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->unbinder:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->unbinder:Lbutterknife/Unbinder;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onDestroyView()V

    return-void
.end method

.method public onLoadableDataChanged()V
    .locals 5

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->Flags:I

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_1

    move v3, v1

    :goto_0
    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->Flags:I

    and-int/lit8 v4, v4, 0x4

    if-eqz v4, :cond_2

    :goto_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->userPicView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLImageID:Ljava/util/UUID;

    invoke-virtual {v2, v4}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setAssetID(Ljava/util/UUID;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->userProfileAboutText:Landroid/widget/TextView;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLAboutText:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->userProfilePaymentInfo:Landroid/widget/TextView;

    if-eqz v3, :cond_3

    const v0, 0x7f09026b

    :goto_2
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_3
    return-void

    :cond_1
    move v3, v2

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    :cond_3
    if-eqz v1, :cond_4

    const v0, 0x7f090268

    goto :goto_2

    :cond_4
    const v0, 0x7f090269

    goto :goto_2

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 5
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/16 v2, 0x8

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->unsubscribeAll()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarProperties()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->unbinder:Lbutterknife/Unbinder;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->aboutEditButton:Landroid/widget/Button;

    if-eqz v3, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {v4, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->changePicButton:Landroid/widget/Button;

    if-eqz v3, :cond_2

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :cond_0
    return-void

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1
.end method
