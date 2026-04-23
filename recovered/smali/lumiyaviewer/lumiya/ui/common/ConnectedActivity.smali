.class public Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider$ObjectPopupsClickListener;
.implements Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;


# static fields
.field public static final OBJECT_POPUP_NOTIFICATION:Ljava/lang/String; = "objectPopupNotification"


# instance fields
.field private navDrawerHelper:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;

.field private objectPopupsActionProvider:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private objectPopupsDisplayed:Z

.field private final reconnectButtonListener:Landroid/view/View$OnClickListener;

.field private singleObjectPopupsDisplayed:Z

.field private wantedShowObjectPopups:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;-><init>()V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->singleObjectPopupsDisplayed:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->wantedShowObjectPopups:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$Zi2fvFRNZlQXFOmQ50cSiiV_3Qw;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$Zi2fvFRNZlQXFOmQ50cSiiV_3Qw;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->reconnectButtonListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private displayObjectPopups()V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->dismissDisplayedObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    :cond_0
    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->singleObjectPopupsDisplayed:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/view/View;->clearFocus()V

    const-string/jumbo v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v3}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    invoke-virtual {v0, v3, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    :cond_1
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const/16 v1, 0x1001

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->setTransition(I)Landroid/support/v4/app/FragmentTransaction;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->create(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;

    move-result-object v1

    const v2, 0x7f100287

    invoke-virtual {v0, v2, v1}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    :cond_2
    return-void
.end method

.method private hideSingleObjectPopup()V
    .locals 4

    const/4 v3, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->singleObjectPopupsDisplayed:Z

    if-eqz v0, :cond_0

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->singleObjectPopupsDisplayed:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f100287

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    instance-of v2, v1, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const v2, 0x7f050011

    invoke-virtual {v0, v3, v2}, Landroid/support/v4/app/FragmentTransaction;->setCustomAnimations(II)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    :cond_0
    return-void
.end method

.method private removeObjectPopupsFragment()Z
    .locals 3

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->singleObjectPopupsDisplayed:Z

    if-eqz v0, :cond_2

    :cond_0
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->singleObjectPopupsDisplayed:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f100287

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const/16 v2, 0x2002

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentTransaction;->setTransition(I)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    :cond_1
    const/4 v0, 0x1

    return v0

    :cond_2
    return v1
.end method

.method private updateConnectionStatus()V
    .locals 9

    const v8, 0x7f100245

    const v7, 0x7f100243

    const/16 v6, 0x8

    const v5, 0x7f100244

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->handleConnectionEvents()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const v0, 0x7f100242

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    instance-of v0, v1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v2, v3, :cond_1

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connecting:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v2, v3, :cond_3

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getIsReconnecting()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getReconnectAttempt()I

    move-result v2

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v3, v4

    const v2, 0x7f09029e

    invoke-virtual {p0, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_1
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v2, 0x7f0900a8

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(I)V

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f0900cb

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    :cond_3
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v2, v0, :cond_0

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f090102

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v2, 0x7f090250

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(I)V

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public dismissSingleObjectPopup()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->hideSingleObjectPopup()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->dismissDisplayedObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    :cond_0
    return-void
.end method

.method protected handleBackPressed()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected handleConnectionEvents()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public handleConnectionStateChangedEvent(Lcom/lumiyaviewer/lumiya/slproto/events/SLConnectionStateChangedEvent;)V
    .locals 0
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->updateConnectionStatus()V

    return-void
.end method

.method public handleDisconnectEvent(Lcom/lumiyaviewer/lumiya/slproto/events/SLDisconnectEvent;)V
    .locals 4
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->handleConnectionEvents()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "ConnectedActivity: disconnect event, normalDisconnect %b"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLDisconnectEvent;->normalDisconnect:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLDisconnectEvent;->normalDisconnect:Z

    if-eqz v0, :cond_1

    const-string/jumbo v0, "ConnectedActivity: starting login activity"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p0}, Landroid/support/v4/app/ActivityCompat;->finishAffinity(Landroid/app/Activity;)V

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v1, 0x14008000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->updateConnectionStatus()V

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_ConnectedActivity_3108(Landroid/view/View;)V
    .locals 4

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connecting:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v1, v2, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->Disconnect()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v1, v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLDisconnectEvent;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/events/SLDisconnectEvent;-><init>(ZLjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    invoke-static {p0}, Landroid/support/v4/app/ActivityCompat;->finishAffinity(Landroid/app/Activity;)V

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v1, 0x14008000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->navDrawerHelper:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->handleConnectionEvents()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->removeObjectPopupsFragment()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->handleBackPressed()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onBackPressed()V

    :cond_2
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->navDrawerHelper:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->handleConnectionEvents()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    const-string/jumbo v0, "objectPopupsDisplayed"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    const-string/jumbo v0, "singleObjectPopupsDisplayed"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->singleObjectPopupsDisplayed:Z

    const-string/jumbo v0, "wantedShowObjectPopups"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->wantedShowObjectPopups:Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "objectPopupNotification"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->wantedShowObjectPopups:Z

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3

    const/4 v2, 0x0

    const-string/jumbo v0, "ObjectPopup: createOptionsMenu"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->handleConnectionEvents()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f120016

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const v0, 0x7f100337

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/MenuItemCompat;->getActionProvider(Landroid/view/MenuItem;)Landroid/support/v4/view/ActionProvider;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsActionProvider:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsActionProvider:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->setObjectPopupsClickListener(Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider$ObjectPopupsClickListener;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsActionProvider:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->getObjectPopupCount()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->onObjectPopupCountChanged(I)V

    :cond_0
    :goto_0
    const/4 v0, 0x1

    return v0

    :cond_1
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsActionProvider:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;

    goto :goto_0

    :cond_2
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 3

    const/4 v2, 0x0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->handleConnectionEvents()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "objectPopupNotification"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->wantedShowObjectPopups:Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->dismissDisplayedObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    :cond_2
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->removeObjectPopupsFragment()Z

    goto :goto_0
.end method

.method public onNewObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 7

    const/4 v6, 0x0

    const v5, 0x7f100287

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    if-eqz v2, :cond_0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->dismissDisplayedObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void

    :cond_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->singleObjectPopupsDisplayed:Z

    if-eqz v2, :cond_1

    if-nez p1, :cond_1

    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->singleObjectPopupsDisplayed:Z

    invoke-virtual {v1, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    const/16 v4, 0x2002

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentTransaction;->setTransition(I)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v3, v2}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    :cond_1
    if-eqz p1, :cond_2

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->singleObjectPopupsDisplayed:Z

    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const/16 v2, 0x1001

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentTransaction;->setTransition(I)Landroid/support/v4/app/FragmentTransaction;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->create(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;

    move-result-object v0

    invoke-virtual {v1, v5, v0}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    :cond_2
    return-void
.end method

.method public onObjectPopupCountChanged(I)V
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsActionProvider:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsActionProvider:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;->setObjectPopupCount(I)V

    :cond_0
    if-nez p1, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    if-eqz v0, :cond_1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f100287

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    instance-of v2, v1, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;

    if-eqz v2, :cond_1

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const/16 v2, 0x2002

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentTransaction;->setTransition(I)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    :cond_1
    return-void
.end method

.method public onObjectPopupsClicked()V
    .locals 3

    const v2, 0x7f100287

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const/16 v2, 0x2002

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentTransaction;->setTransition(I)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->displayObjectPopups()V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->navDrawerHelper:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected onPause()V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->handleConnectionEvents()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->removeObjectPopupListener(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->removePopupWatcher(Ljava/lang/Object;)V

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onPause()V

    return-void
.end method

.method protected onPostCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onPostCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->handleConnectionEvents()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f100242

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    const v1, 0x7f100245

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->reconnectButtonListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->navDrawerHelper:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->navDrawerHelper:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->syncState()V

    return-void
.end method

.method protected onResume()V
    .locals 4

    const/4 v3, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onResume()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->handleConnectionEvents()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->getObjectPopupCount()I

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsActionProvider:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsActionProvider;

    if-eqz v2, :cond_0

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->onObjectPopupCountChanged(I)V

    :cond_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->addPopupWatcher(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-virtual {v0, p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->setObjectPopupListener(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;Ljava/util/concurrent/Executor;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->wantedShowObjectPopups:Z

    if-eqz v0, :cond_1

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->wantedShowObjectPopups:Z

    if-eqz v1, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->displayObjectPopups()V

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->updateConnectionStatus()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->handleConnectionEvents()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "objectPopupsDisplayed"

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->objectPopupsDisplayed:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string/jumbo v0, "singleObjectPopupsDisplayed"

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->singleObjectPopupsDisplayed:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string/jumbo v0, "wantedShowObjectPopups"

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->wantedShowObjectPopups:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method
