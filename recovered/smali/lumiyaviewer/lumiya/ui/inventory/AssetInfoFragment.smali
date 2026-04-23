.class public Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;


# static fields
.field private static final ITEM_UUID_KEY:Ljava/lang/String; = "itemUUID"


# instance fields
.field private final agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;",
            ">;"
        }
    .end annotation
.end field

.field private creatorNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private final entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

.field private lastOwnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field private menuItemCopy:Landroid/view/MenuItem;

.field private menuItemCut:Landroid/view/MenuItem;

.field private menuItemDelete:Landroid/view/MenuItem;

.field private menuItemRename:Landroid/view/MenuItem;

.field private menuItemShare:Landroid/view/MenuItem;

.field private final onNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

.field private ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private final runningAnimations:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Ljava/util/UUID;",
            ">;>;"
        }
    .end annotation
.end field

.field private final wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 6

    const/4 v5, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;-><init>(Landroid/support/v4/app/Fragment;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->runningAnimations:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    new-array v1, v5, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    const/4 v1, 0x4

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x2

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->runningAnimations:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withOptionalLoadables([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->creatorNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->lastOwnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$1;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->onNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    return-void
.end method

.method private applyEditedPermissions(Landroid/app/Dialog;)V
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getInventory()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    move-result-object v1

    if-eqz v1, :cond_0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    const v3, 0x7f1000e9

    const v4, 0x7f1000ea

    const v5, 0x7f1000eb

    invoke-direct {p0, p1, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getCheckboxes(Landroid/app/Dialog;III)I

    move-result v3

    and-int/2addr v2, v3

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    const v3, 0x7f1000ec

    const v4, 0x7f1000ed

    const v5, 0x7f1000ee

    invoke-direct {p0, p1, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getCheckboxes(Landroid/app/Dialog;III)I

    move-result v3

    and-int/2addr v2, v3

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    const v3, 0x7f1000ef

    const v4, 0x7f1000f0

    const v5, 0x7f1000f1

    invoke-direct {p0, p1, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getCheckboxes(Landroid/app/Dialog;III)I

    move-result v3

    and-int/2addr v2, v3

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->UpdateStoreInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showEntryInfo(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_0
    return-void
.end method

.method private attachObject(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->AttachInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;IZ)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private detachObject(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->DetachInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private getCheckboxes(Landroid/app/Dialog;III)I
    .locals 2

    const/4 v1, 0x0

    invoke-virtual {p1, p2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x8000

    move v1, v0

    :cond_0
    invoke-virtual {p1, p3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1

    or-int/lit16 v1, v1, 0x4000

    :cond_1
    invoke-virtual {p1, p4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    or-int/lit16 v1, v1, 0x2000

    :cond_2
    return v1
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_AssetInfoFragment_26901(Landroid/app/Dialog;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method public static makeSelection(Ljava/util/UUID;Ljava/util/UUID;)Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    if-eqz p0, :cond_0

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p1, :cond_1

    const-string/jumbo v1, "itemUUID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-object v0
.end method

.method private playAnimation(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Z)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->playAnimation(Ljava/util/UUID;Z)V

    :cond_0
    return-void
.end method

.method private setCheckboxes(Landroid/app/Dialog;IIIIIZ)V
    .locals 5

    const v4, 0x8000

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p1, p4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    and-int v1, p2, v4

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {p1, p5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    and-int/lit16 v1, p2, 0x4000

    if-eqz v1, :cond_2

    move v1, v2

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {p1, p6}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    and-int/lit16 v1, p2, 0x2000

    if-eqz v1, :cond_3

    move v1, v2

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {p1, p4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz p7, :cond_4

    and-int v0, p3, v4

    if-eqz v0, :cond_4

    move v0, v2

    :goto_3
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p1, p5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz p7, :cond_5

    and-int/lit16 v0, p3, 0x4000

    if-eqz v0, :cond_5

    move v0, v2

    :goto_4
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p1, p6}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz p7, :cond_0

    and-int/lit16 v1, p3, 0x2000

    if-eqz v1, :cond_0

    move v3, v2

    :cond_0
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :cond_1
    move v1, v3

    goto :goto_0

    :cond_2
    move v1, v3

    goto :goto_1

    :cond_3
    move v1, v3

    goto :goto_2

    :cond_4
    move v0, v3

    goto :goto_3

    :cond_5
    move v0, v3

    goto :goto_4
.end method

.method private showEditPermissionsDialog()V
    .locals 9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v8, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Landroid/app/Dialog;

    invoke-direct {v1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const v0, 0x7f04001e

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setContentView(I)V

    const v0, 0x7f09010a

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setTitle(I)V

    iget v2, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    iget v3, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    const v4, 0x7f1000e6

    const v5, 0x7f1000e7

    const v6, 0x7f1000e8

    const/4 v7, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->setCheckboxes(Landroid/app/Dialog;IIIIIZ)V

    iget v2, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    iget v3, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    const v4, 0x7f1000e9

    const v5, 0x7f1000ea

    const v6, 0x7f1000eb

    const/4 v7, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->setCheckboxes(Landroid/app/Dialog;IIIIIZ)V

    iget v2, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    iget v3, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    const v4, 0x7f1000ec

    const v5, 0x7f1000ed

    const v6, 0x7f1000ee

    const/4 v7, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->setCheckboxes(Landroid/app/Dialog;IIIIIZ)V

    iget v2, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    iget v3, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    const v4, 0x7f1000ef

    const v5, 0x7f1000f0

    const v6, 0x7f1000f1

    const/4 v7, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->setCheckboxes(Landroid/app/Dialog;IIIIIZ)V

    const v0, 0x7f1000f0

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    const v0, 0x7f1000f0

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    const v0, 0x7f1000b6

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$3;

    invoke-direct {v2, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$3;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000b7

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ;

    invoke-direct {v2, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    :cond_0
    return-void
.end method

.method private showEntry(Ljava/util/UUID;)V
    .locals 4
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->unsubscribeAll()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz p1, :cond_1

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getFolderEntryPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-virtual {v1, v2, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornAttachmentsPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornWearablesPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->runningAnimations:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->runningAnimations()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->creatorNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->creatorNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->lastOwnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->lastOwnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    goto :goto_0
.end method

.method private showEntryInfo(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 9
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const v7, 0x7f1000c2

    const v8, 0x7f1000c6

    const/4 v5, 0x0

    const/4 v3, 0x0

    const/16 v4, 0x8

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getView()Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_1

    const v0, 0x7f1000c0

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1000cb

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1000bf

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getTypeDescriptionResId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getDrawableResource()I

    move-result v1

    if-ltz v1, :cond_3

    const v0, 0x7f1000c1

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    :goto_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getActionDescriptionResId()I

    move-result v1

    if-ltz v1, :cond_4

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-virtual {v2, p1, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->isActionAllowed(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;I)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    :goto_2
    const v0, 0x7f1000d9

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    and-int/lit16 v0, v0, 0x4000

    if-eqz v0, :cond_5

    move v0, v3

    :goto_3
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    const v1, 0x7f1000cd

    const v2, 0x7f1000ce

    const v5, 0x7f1000cf

    invoke-direct {p0, v0, v1, v2, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showPermissions(IIII)V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    const v1, 0x7f1000d3

    const v2, 0x7f1000d4

    const v5, 0x7f1000d5

    invoke-direct {p0, v0, v1, v2, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showPermissions(IIII)V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    const v1, 0x7f1000d6

    const v2, 0x7f1000d7

    const v5, 0x7f1000d8

    invoke-direct {p0, v0, v1, v2, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showPermissions(IIII)V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    const v1, 0x7f1000d0

    const v2, 0x7f1000d1

    const v5, 0x7f1000d2

    invoke-direct {p0, v0, v1, v2, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showPermissions(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_6

    const/4 v1, 0x1

    move v5, v1

    :goto_4
    if-eqz v5, :cond_b

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v2

    if-eq v1, v2, :cond_0

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v2

    if-ne v1, v2, :cond_b

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v2

    if-ne v1, v2, :cond_b

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/collect/ImmutableMap;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/collect/Table;

    invoke-virtual {p1, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->whatIsItemWornOn(Lcom/google/common/collect/ImmutableMap;Lcom/google/common/collect/Table;Z)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_7

    const/4 v1, 0x1

    move v2, v1

    :goto_5
    if-eqz v2, :cond_8

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canDetachItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z

    move-result v1

    :goto_6
    const v7, 0x7f1000c3

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    if-eqz v2, :cond_9

    move v2, v4

    :goto_7
    invoke-virtual {v7, v2}, Landroid/view/View;->setVisibility(I)V

    const v2, 0x7f1000c4

    invoke-virtual {v6, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v1, :cond_a

    move v1, v3

    :goto_8
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_9
    if-eqz v5, :cond_e

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isAnimation()Z

    move-result v1

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->runningAnimations:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/collect/ImmutableSet;

    const v2, 0x7f1000c7

    invoke-virtual {v6, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    if-eqz v1, :cond_c

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Lcom/google/common/collect/ImmutableSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_c

    move v2, v3

    :goto_a
    invoke-virtual {v7, v2}, Landroid/view/View;->setVisibility(I)V

    const v2, 0x7f1000c8

    invoke-virtual {v6, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v1, :cond_d

    iget-object v7, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    invoke-virtual {v1, v7}, Lcom/google/common/collect/ImmutableSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    move v1, v3

    :goto_b
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_c
    if-eqz v5, :cond_14

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isWearable()Z

    move-result v1

    if-eqz v1, :cond_14

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/collect/ImmutableMap;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/collect/Table;

    invoke-virtual {p1, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->whatIsItemWornOn(Lcom/google/common/collect/ImmutableMap;Lcom/google/common/collect/Table;Z)Ljava/lang/Object;

    move-result-object v2

    instance-of v1, v2, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    if-eqz v1, :cond_12

    const v1, 0x7f1000c5

    invoke-virtual {v6, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    move-object v1, v2

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isBodyPart()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    :goto_d
    const v0, 0x7f1000c9

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_11

    :goto_e
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_f
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->updateMenuItems()V

    return-void

    :cond_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f09005b

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    :cond_3
    const v0, 0x7f1000c1

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_1

    :cond_4
    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_2

    :cond_5
    move v0, v4

    goto/16 :goto_3

    :cond_6
    move v5, v3

    goto/16 :goto_4

    :cond_7
    move v2, v3

    goto/16 :goto_5

    :cond_8
    move v1, v3

    goto/16 :goto_6

    :cond_9
    move v2, v3

    goto/16 :goto_7

    :cond_a
    move v1, v4

    goto/16 :goto_8

    :cond_b
    const v1, 0x7f1000c3

    invoke-virtual {v6, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    const v1, 0x7f1000c4

    invoke-virtual {v6, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_9

    :cond_c
    move v2, v4

    goto/16 :goto_a

    :cond_d
    move v1, v4

    goto/16 :goto_b

    :cond_e
    const v1, 0x7f1000c7

    invoke-virtual {v6, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    const v1, 0x7f1000c8

    invoke-virtual {v6, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_c

    :cond_f
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v0

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v0, :cond_10

    move v0, v3

    :goto_10
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_d

    :cond_10
    move v0, v4

    goto :goto_10

    :cond_11
    move v4, v3

    goto/16 :goto_e

    :cond_12
    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canWearItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z

    move-result v0

    const v1, 0x7f1000c5

    invoke-virtual {v6, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v0, :cond_13

    :goto_11
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1000c9

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_f

    :cond_13
    move v3, v4

    goto :goto_11

    :cond_14
    const v0, 0x7f1000c5

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1000c9

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_f
.end method

.method private showPermissions(IIII)V
    .locals 4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getView()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v2, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const v3, 0x8000

    and-int/2addr v3, p1

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaintFlags()I

    move-result v3

    and-int/lit8 v3, v3, -0x11

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setPaintFlags(I)V

    :goto_0
    and-int/lit16 v0, p1, 0x4000

    if-eqz v0, :cond_2

    invoke-virtual {v1}, Landroid/widget/TextView;->getPaintFlags()I

    move-result v0

    and-int/lit8 v0, v0, -0x11

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setPaintFlags(I)V

    :goto_1
    and-int/lit16 v0, p1, 0x2000

    if-eqz v0, :cond_3

    invoke-virtual {v2}, Landroid/widget/TextView;->getPaintFlags()I

    move-result v0

    and-int/lit8 v0, v0, -0x11

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setPaintFlags(I)V

    :cond_0
    :goto_2
    return-void

    :cond_1
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaintFlags()I

    move-result v3

    or-int/lit8 v3, v3, 0x10

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setPaintFlags(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaintFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x10

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setPaintFlags(I)V

    goto :goto_1

    :cond_3
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaintFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x10

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setPaintFlags(I)V

    goto :goto_2
.end method

.method private showProfile(Ljava/util/UUID;)V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz p1, :cond_0

    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-static {p1, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method private showUserInfo(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;III)V
    .locals 4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getView()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1

    if-eqz p1, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-static {p1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    if-nez p2, :cond_2

    :cond_0
    invoke-virtual {v3, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-virtual {v3, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v2, :cond_3

    move-object v1, v2

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, p5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const v1, 0x7f0901c8

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method private takeOffObject(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->TakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private updateMenuItems()V
    .locals 6

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemCopy:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemCut:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemShare:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemRename:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemDelete:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->assertHasData()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemDelete:Landroid/view/MenuItem;

    const/4 v4, 0x1

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemRename:Landroid/view/MenuItem;

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    and-int/2addr v3, v5

    and-int/lit16 v3, v3, 0x4000

    if-eqz v3, :cond_1

    move v3, v1

    :goto_0
    invoke-interface {v4, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemShare:Landroid/view/MenuItem;

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    and-int/2addr v0, v4

    and-int/lit16 v0, v0, 0x2000

    if-eqz v0, :cond_2

    move v0, v1

    :goto_1
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemCut:Landroid/view/MenuItem;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemCopy:Landroid/view/MenuItem;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_2
    return-void

    :cond_1
    move v3, v2

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemDelete:Landroid/view/MenuItem;

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemRename:Landroid/view/MenuItem;

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemShare:Landroid/view/MenuItem;

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemCut:Landroid/view/MenuItem;

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemCopy:Landroid/view/MenuItem;

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_2
.end method

.method private wearObject(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->WearItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Z)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_AssetInfoFragment_10987(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v6, :cond_0

    iget-object v1, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    const v3, 0x7f1000da

    const v4, 0x7f1000db

    const v5, 0x7f1000dc

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showUserInfo(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;III)V

    iget-object v1, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->creatorNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    const v3, 0x7f1000de

    const v4, 0x7f1000df

    const v5, 0x7f1000e0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showUserInfo(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;III)V

    iget-object v1, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->lastOwnerUUID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->lastOwnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    const v3, 0x7f1000e2

    const v4, 0x7f1000e3

    const v5, 0x7f1000e4

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showUserInfo(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;III)V

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_AssetInfoFragment_20027()V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->closeDetailsFragment(Landroid/support/v4/app/Fragment;)Z

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_AssetInfoFragment_26713(Landroid/app/Dialog;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->applyEditedPermissions(Landroid/app/Dialog;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    :cond_0
    :goto_0
    return-void

    :sswitch_0
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showProfile(Ljava/util/UUID;)V

    goto :goto_0

    :sswitch_1
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showProfile(Ljava/util/UUID;)V

    goto :goto_0

    :sswitch_2
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->lastOwnerUUID:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showProfile(Ljava/util/UUID;)V

    goto :goto_0

    :sswitch_3
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getActionDescriptionResId()I

    move-result v1

    if-ltz v1, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-virtual {v2, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->isActionAllowed(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;I)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-virtual {v2, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->PerformInventoryAction(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;I)V

    goto :goto_0

    :sswitch_4
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->attachObject(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto :goto_0

    :sswitch_5
    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->playAnimation(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Z)V

    goto :goto_0

    :sswitch_6
    invoke-direct {p0, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->playAnimation(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Z)V

    goto :goto_0

    :sswitch_7
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->detachObject(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto :goto_0

    :sswitch_8
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->wearObject(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto :goto_0

    :sswitch_9
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->takeOffObject(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto :goto_0

    :sswitch_a
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showEditPermissionsDialog()V

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x7f1000c2 -> :sswitch_3
        0x7f1000c3 -> :sswitch_4
        0x7f1000c4 -> :sswitch_7
        0x7f1000c5 -> :sswitch_8
        0x7f1000c6 -> :sswitch_9
        0x7f1000c7 -> :sswitch_5
        0x7f1000c8 -> :sswitch_6
        0x7f1000d9 -> :sswitch_a
        0x7f1000dd -> :sswitch_0
        0x7f1000e1 -> :sswitch_1
        0x7f1000e5 -> :sswitch_2
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    const v0, 0x7f12000c

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const v0, 0x7f100325

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemDelete:Landroid/view/MenuItem;

    const v0, 0x7f100326

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemRename:Landroid/view/MenuItem;

    const v0, 0x7f100327

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemShare:Landroid/view/MenuItem;

    const v0, 0x7f100328

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemCut:Landroid/view/MenuItem;

    const v0, 0x7f100329

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->menuItemCopy:Landroid/view/MenuItem;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->updateMenuItems()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7

    const v6, 0x7f1000d9

    const v3, 0x7f1000bd

    const v5, 0x7f1000bb

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f04001d

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f0901e8

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f090164

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    const v0, 0x7f1000e1

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000dd

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000e5

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000c2

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1000c3

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000c4

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000c5

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000c6

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000c7

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000c8

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v2
.end method

.method public onLoadableDataChanged()V
    .locals 5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showEntryInfo(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    if-eqz v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    invoke-static {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->onNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v4

    invoke-direct {v2, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->creatorNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    invoke-static {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->onNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v4

    invoke-direct {v2, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->lastOwnerUUID:Ljava/util/UUID;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->onNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-direct {v2, v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->lastOwnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5

    const/4 v4, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->entrySubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    packed-switch v2, :pswitch_data_0

    :cond_0
    :goto_0
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    :try_start_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$2;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$2;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->DeleteInventoryEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/Runnable;)V

    return v4

    :pswitch_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->RenameInventoryEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return v4

    :pswitch_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->ShareInventoryEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return v4

    :pswitch_3
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;

    const/4 v3, 0x1

    invoke-direct {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;-><init>(ZLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->copyToClipboard(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900cd

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return v4

    :pswitch_4
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;-><init>(ZLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->copyToClipboard(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900cd

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_1 .. :try_end_1} :catch_0

    return v4

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7f100325
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->updateMenuItems()V

    return-void
.end method

.method public onStart()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "itemUUID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showEntry(Ljava/util/UUID;)V

    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showEntry(Ljava/util/UUID;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStop()V

    return-void
.end method

.method public setFragmentArgs(Landroid/content/Intent;Landroid/os/Bundle;)V
    .locals 3

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "activeAgentUUID"

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->isFragmentStarted()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "itemUUID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->showEntry(Ljava/util/UUID;)V

    :cond_2
    return-void
.end method
