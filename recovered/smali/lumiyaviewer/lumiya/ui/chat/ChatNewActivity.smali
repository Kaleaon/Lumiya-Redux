.class public Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;


# instance fields
.field private currentLocationInfoSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final onCurrentLocation:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$NRCeOQv-yeRY8P8t9O3BV_sPyX4;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$NRCeOQv-yeRY8P8t9O3BV_sPyX4;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->onCurrentLocation:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    return-void
.end method


# virtual methods
.method protected getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;->getInstance()Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;

    move-result-object v0

    return-object v0
.end method

.method protected getNewDetailsFragmentArguments(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getNewDetailsFragmentArguments(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-super {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getNewDetailsFragmentArguments(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_ChatNewActivity_4384(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 2

    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_0

    :goto_1
    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->setDefaultTitle(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const v0, 0x7f0901c8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f090044

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->setDefaultTitle(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onCreateMasterFragment(Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 2
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->makeFragmentArguments(Ljava/util/UUID;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->newInstance(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;

    move-result-object v0

    return-object v0
.end method

.method public onGetNotifyCaptureIntent(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;Landroid/content/Intent;)Landroid/content/Intent;
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/high16 v0, 0x20000000

    invoke-virtual {p2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string/jumbo v0, "fromSameActivity"

    const/4 v1, 0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object p2
.end method

.method protected onPause()V
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->clearNotifyCapture(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;)V

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onResume()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->setNotifyCapture(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;)V

    :cond_0
    return-void
.end method

.method protected onStart()V
    .locals 5

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->getSingleDataKey()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    move-result-object v2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->onCurrentLocation:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    invoke-interface {v0, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->currentLocationInfoSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v0, "parcelData"

    invoke-virtual {v2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "parcelData"

    invoke-virtual {v2, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    const-string/jumbo v3, "parcelData"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    if-eqz v1, :cond_1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->makeSelection(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {p0, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_1
    return-void
.end method

.method protected onStop()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->currentLocationInfoSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->currentLocationInfoSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;->currentLocationInfoSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onStop()V

    return-void
.end method
