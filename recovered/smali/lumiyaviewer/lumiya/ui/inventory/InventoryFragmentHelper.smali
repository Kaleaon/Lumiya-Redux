.class public Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;
.super Ljava/lang/Object;


# static fields
.field static final SORT_ORDER_ALPHA:I = 0x1

.field private static final SORT_ORDER_KEY:Ljava/lang/String; = "inventorySortOrder"

.field public static final SORT_ORDER_NEWEST_FIRST:I


# instance fields
.field private final fragment:Landroid/support/v4/app/Fragment;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/v4/app/Fragment;)V
    .locals 0
    .param p1    # Landroid/support/v4/app/Fragment;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->fragment:Landroid/support/v4/app/Fragment;

    return-void
.end method

.method private ViewTexture(Ljava/util/UUID;)V
    .locals 3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->fragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/TextureViewFragment;->makeArguments(Ljava/util/UUID;Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method private getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method private getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->fragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public static getSortOrder(Landroid/content/Context;)I
    .locals 3

    const/4 v2, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "inventorySortOrder"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0

    :cond_0
    return v2
.end method

.method private getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->fragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/os/Bundle;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->fragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    return-object v0

    :cond_1
    return-object v1
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_10110(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_12001(Landroid/app/Dialog;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    const v0, 0x7f1001b1

    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1, p2, v0, p3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DoCreateNewLandmark(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_12390(Landroid/app/Dialog;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_4506(Landroid/app/Dialog;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_6279(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_7522(Landroid/app/Dialog;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_8206(ZLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p4}, Landroid/content/DialogInterface;->dismiss()V

    if-eqz p0, :cond_1

    invoke-virtual {p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DeleteInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :goto_0
    if-eqz p3, :cond_0

    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->TrashInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_8645(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_9777(Ljava/lang/Runnable;Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Landroid/content/DialogInterface;I)V
    .locals 1

    invoke-interface {p4}, Landroid/content/DialogInterface;->dismiss()V

    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_0
    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p1, v0, p3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->OfferInventoryItem(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return-void
.end method

.method static setSortOrder(Landroid/content/Context;I)V
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "inventorySortOrder"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private showRezDialog(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 4

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0902a9

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "Yes"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$6;

    invoke-direct {v3, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$6;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$2;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$2;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private showTeleportDialog(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    const/4 v3, 0x1

    invoke-static {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->TeleportToLandmark(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/util/UUID;Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public ConfirmShareInventoryEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 7
    .param p4    # Ljava/lang/Runnable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v6, 0x1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-eqz v0, :cond_0

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090304

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    aput-object p3, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string/jumbo v3, "Yes"

    new-instance v4, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;

    invoke-direct {v4, p4, v0, p2, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg;-><init>()V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method

.method CreateNewFolder(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 4

    const v3, 0x7f1000b6

    new-instance v1, Landroid/app/Dialog;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const v0, 0x7f040050

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setContentView(I)V

    const v0, 0x7f0901d7

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setTitle(I)V

    invoke-virtual {v1, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v2, 0x7f0900d2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(I)V

    invoke-virtual {v1, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$7;

    invoke-direct {v2, p0, v1, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000b7

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$3;

    invoke-direct {v2, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$3;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method CreateNewLandmark(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 8

    const v7, 0x7f1000b6

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getInventory()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    move-result-object v4

    if-eqz v3, :cond_3

    if-eqz v2, :cond_3

    if-eqz v4, :cond_3

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getRegionName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "Simulator"

    :cond_0
    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v3

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentPosition()Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Z

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfoSnapshot()Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v1

    :cond_1
    invoke-static {v1}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string/jumbo v1, "Landmark"

    :cond_2
    const-string/jumbo v2, "%s, %s (%d, %d, %d)"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v3, v6

    const/4 v6, 0x1

    aput-object v0, v3, v6

    iget v0, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    float-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x2

    aput-object v0, v3, v6

    iget v0, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    float-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x3

    aput-object v0, v3, v6

    iget v0, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    float-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x4

    aput-object v0, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Landroid/app/Dialog;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const v0, 0x7f040050

    invoke-virtual {v3, v0}, Landroid/app/Dialog;->setContentView(I)V

    const v0, 0x7f0901d9

    invoke-virtual {v3, v0}, Landroid/app/Dialog;->setTitle(I)V

    invoke-virtual {v3, v7}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v5, 0x7f0900d2

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setText(I)V

    const v0, 0x7f1001b1

    invoke-virtual {v3, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v7}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$10;

    invoke-direct {v1, v3, v4, p1, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$10;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000b7

    invoke-virtual {v3, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$4;

    invoke-direct {v1, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$4;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v3}, Landroid/app/Dialog;->show()V

    :cond_3
    return-void
.end method

.method DeleteInventoryEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/Runnable;)V
    .locals 6
    .param p2    # Ljava/lang/Runnable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getInventory()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    move-result-object v3

    if-eqz v3, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {v3, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->canMoveToTrash(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isLink()Z

    move-result v0

    :goto_0
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v4, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v5

    if-eqz v0, :cond_2

    const v2, 0x7f0900df

    :goto_1
    invoke-virtual {v5, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "Yes"

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;

    invoke-direct {v5, v0, v3, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$1;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$1;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_0
    return-void

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    const v2, 0x7f09035f

    goto :goto_1
.end method

.method PerformInventoryAction(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;I)V
    .locals 7

    const/4 v5, 0x0

    const/4 v6, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "PerformInventoryAction: entry = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    packed-switch p2, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->showTeleportDialog(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->showRezDialog(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto :goto_0

    :pswitch_2
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    const/16 v4, 0xa

    if-ne v3, v4, :cond_1

    const/4 v4, 0x1

    :goto_1
    move-object v3, p1

    invoke-static/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->createIntent(Landroid/content/Context;Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;ZLjava/util/UUID;I)Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    move v4, v6

    goto :goto_1

    :pswitch_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Inventory: view action for asset type = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->ViewTexture(Ljava/util/UUID;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x7f09004d
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method RenameInventoryEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 3

    new-instance v1, Landroid/app/Dialog;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const v0, 0x7f040050

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setContentView(I)V

    const v0, 0x7f0902a4

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setTitle(I)V

    const v0, 0x7f1001b1

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1000b6

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$8;

    invoke-direct {v2, p0, v1, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$8;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000b7

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$5;

    invoke-direct {v2, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$5;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method ShareInventoryEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->fragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerForShare;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerForShare;->makeArguments(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method getInventory()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    return-object v0

    :cond_0
    return-object v1
.end method

.method isActionAllowed(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;I)Z
    .locals 4

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-nez v0, :cond_0

    return v3

    :cond_0
    const v1, 0x7f09004f

    if-ne p2, v1, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLandmark()Z

    move-result v0

    if-nez v0, :cond_2

    return v3

    :cond_1
    const v1, 0x7f09004d

    if-ne p2, v1, :cond_2

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    const/4 v2, 0x7

    if-ne v1, v2, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canViewNotecard()Z

    move-result v0

    if-nez v0, :cond_2

    return v3

    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_3806(Landroid/app/Dialog;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Landroid/view/View;)V
    .locals 4

    const/4 v3, 0x0

    const v0, 0x7f1001b1

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DoCreateNewFolder(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;ZLcom/google/common/base/Function;)Ljava/util/UUID;

    :cond_0
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_5882(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Landroid/content/DialogInterface;I)V
    .locals 1

    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->RezObject(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_7038(Landroid/app/Dialog;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Landroid/view/View;)V
    .locals 2

    const v0, 0x7f1001b1

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getInventory()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->RenameInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method
