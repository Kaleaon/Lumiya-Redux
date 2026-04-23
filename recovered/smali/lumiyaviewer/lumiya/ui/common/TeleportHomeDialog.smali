.class public Lcom/lumiyaviewer/lumiya/ui/common/TeleportHomeDialog;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_TeleportHomeDialog_1348(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_TeleportHomeDialog_956(Landroid/app/Activity;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Landroid/content/DialogInterface;I)V
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;

    const v1, 0x7f090350

    invoke-direct {v0, p0, p1, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->show()V

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TeleportToLandmarkAsset(Ljava/util/UUID;)V

    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method public static show(Landroid/app/Activity;)V
    .locals 5

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLocation()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f09033e

    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const-string/jumbo v3, "Yes"

    new-instance v4, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8$1;

    invoke-direct {v4, p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$sKhJxooMqZpn4u0mFmtSpF7hGx8;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method
