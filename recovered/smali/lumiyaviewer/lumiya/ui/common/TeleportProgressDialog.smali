.class public Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;
.super Landroid/app/ProgressDialog;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field private final mHandler:Landroid/os/Handler;

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V
    .locals 2

    const/4 v1, 0x1

    invoke-direct {p0, p1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->mHandler:Landroid/os/Handler;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->setCancelable(Z)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->setIndeterminate(Z)V

    invoke-virtual {p0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    return-void
.end method

.method public static TeleportToLandmark(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/util/UUID;Z)V
    .locals 5

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLandmark()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;

    invoke-direct {v1, v0, p2, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz p3, :cond_1

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f09033c

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string/jumbo v3, "Yes"

    new-instance v4, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$1;

    invoke-direct {v4, v1}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$8gWLFwrhoxKapEC8iWggaUhFR1c;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_TeleportProgressDialog_1322(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Ljava/util/UUID;Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLandmark()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TeleportToLandmarkAsset(Ljava/util/UUID;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;

    const v1, 0x7f090350

    invoke-direct {v0, p2, p3, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->show()V

    :cond_0
    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_TeleportProgressDialog_2034(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_TeleportProgressDialog_2260(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method


# virtual methods
.method public handleTeleportResult(Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;)V
    .locals 3
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->isShowing()Z

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "TeleportResult: success = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;->success:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;->success:Z

    if-nez v1, :cond_1

    if-eqz v0, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f09033d

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_0
    :goto_1
    return-void

    :catch_0
    move-exception v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/content/Intent;Ljava/util/UUID;)V

    :cond_2
    const v1, 0x14008000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_1
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->worldMap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->CancelPendingTeleports()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onStart()V
    .locals 3

    const/4 v2, 0x0

    invoke-super {p0}, Landroid/app/ProgressDialog;->onStart()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getEventBus()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0, v2, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;Landroid/app/Activity;Landroid/os/Handler;)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getEventBus()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->unsubscribe(Ljava/lang/Object;)V

    :cond_0
    invoke-super {p0}, Landroid/app/ProgressDialog;->onStop()V

    return-void
.end method
