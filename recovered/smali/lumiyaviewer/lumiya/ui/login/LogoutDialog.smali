.class public Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;
.super Landroid/app/ProgressDialog;


# static fields
.field private static final DISCONNECT_TIMEOUT:J = 0x1388L


# instance fields
.field private agentUUID:Ljava/util/UUID;

.field private final eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

.field private final handler:Landroid/os/Handler;

.field private final onDisconnectTimeout:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->handler:Landroid/os/Handler;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/login/-$Lambda$Ido4EAnXE9yUsM2nDeFKnyTfU7w;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/login/-$Lambda$Ido4EAnXE9yUsM2nDeFKnyTfU7w;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->onDisconnectTimeout:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->handler:Landroid/os/Handler;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/login/-$Lambda$Ido4EAnXE9yUsM2nDeFKnyTfU7w$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/login/-$Lambda$Ido4EAnXE9yUsM2nDeFKnyTfU7w$1;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->onDisconnectTimeout:Ljava/lang/Runnable;

    return-void
.end method

.method private getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->agentUUID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->agentUUID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method public static show(Landroid/app/Activity;)V
    .locals 2

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->setAgentUUID(Ljava/util/UUID;)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->show()V

    :cond_0
    return-void
.end method


# virtual methods
.method public handleDisconnectEvent(Lcom/lumiyaviewer/lumiya/slproto/events/SLDisconnectEvent;)V
    .locals 2
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    const-string/jumbo v0, "LogoutDialog: disconnect event"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->dismiss()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_login_LogoutDialog_3137()V
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->forceDisconnect(Z)V

    :goto_0
    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->dismiss()V

    :cond_0
    return-void

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/ProgressDialog;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->setProgressStyle(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f090193

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->setMessage(Ljava/lang/CharSequence;)V

    if-eqz p1, :cond_0

    const-string/jumbo v0, "agentUUID"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->agentUUID:Ljava/util/UUID;

    :cond_0
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .locals 3

    invoke-super {p0}, Landroid/app/ProgressDialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->agentUUID:Ljava/util/UUID;

    if-eqz v1, :cond_1

    const-string/jumbo v1, "agentUUID"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-object v0
.end method

.method public onStart()V
    .locals 6

    const/4 v1, 0x1

    const/4 v0, 0x0

    const/4 v4, 0x0

    invoke-super {p0}, Landroid/app/ProgressDialog;->onStart()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->handler:Landroid/os/Handler;

    invoke-virtual {v2, p0, v4, v3}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;Landroid/app/Activity;Landroid/os/Handler;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string/jumbo v3, "LogoutDialog: connection is not null"

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v3, v0}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->onDisconnectTimeout:Ljava/lang/Runnable;

    const-wide/16 v4, 0x1388

    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->Disconnect()V

    move v0, v1

    :cond_0
    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->dismiss()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/events/SLDisconnectEvent;

    const-string/jumbo v3, "Disconnected"

    invoke-direct {v2, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/events/SLDisconnectEvent;-><init>(ZLjava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method protected onStop()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->onDisconnectTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->unsubscribe(Ljava/lang/Object;)V

    invoke-super {p0}, Landroid/app/ProgressDialog;->onStop()V

    return-void
.end method

.method public setAgentUUID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LogoutDialog;->agentUUID:Ljava/util/UUID;

    return-void
.end method
