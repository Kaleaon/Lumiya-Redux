.class public Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;
.super Landroid/support/v7/app/AppCompatActivity;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_login_TeleportSLURLActivity_4598(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->finish()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 8

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    const/4 v0, 0x0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    if-eqz v3, :cond_2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getActiveAgentUUID()Ljava/util/UUID;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    :cond_1
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v3

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->worldMap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLURL;->getLocationName()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/SLURL;->getLocationX()I

    move-result v5

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/SLURL;->getLocationY()I

    move-result v6

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/SLURL;->getLocationZ()I

    move-result v7

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->TeleportToRegionByName(Ljava/lang/String;III)Z

    move-result v3

    if-eqz v3, :cond_2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;

    const v3, 0x7f090350

    invoke-direct {v0, p0, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->show()V

    move v0, v1

    :cond_2
    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f09034e

    invoke-virtual {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "OK"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/login/-$Lambda$txy91ryZVkviKYu9VXLZHkYSvg0;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/login/-$Lambda$txy91ryZVkviKYu9VXLZHkYSvg0;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->finish()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7f100291
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f0400a8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->setContentView(I)V

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLURL;-><init>(Landroid/content/Intent;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v3

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v3, v4, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLocation()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->finish()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :cond_0
    move v0, v1

    :goto_1
    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    if-nez v0, :cond_2

    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->finish()V

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->finish()V

    return-void

    :cond_2
    const v0, 0x7f100291

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f100292

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f10028f

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLURL;->getLocationName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f100290

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v3, "(%d, %d, %d)"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/SLURL;->getLocationX()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLURL;->getLocationY()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/TeleportSLURLActivity;->slurl:Lcom/lumiyaviewer/lumiya/slproto/SLURL;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLURL;->getLocationZ()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v4, v2

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :catch_1
    move-exception v0

    goto/16 :goto_0

    :cond_3
    move v0, v2

    goto/16 :goto_1
.end method
