.class public Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$1;,
        Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;
    }
.end annotation


# static fields
.field private static final INITIAL_FOLDER_ID_TAG:Ljava/lang/String; = "folderID"

.field private static final NAME_FILTER_TAG:Ljava/lang/String; = "nameFilter"

.field static final SAVE_INFO_INTENT_TAG:Ljava/lang/String; = "forSaveInfo"

.field private static final SEARCH_ACTIVE_TAG:Ljava/lang/String; = "searchActive"

.field static final SELECT_ACTION_ASSET_TYPE:Ljava/lang/String; = "selectActionAssetType"

.field static final SELECT_ACTION_INTENT_TAG:Ljava/lang/String; = "selectAction"

.field static final SELECT_ACTION_PARAMS_TAG:Ljava/lang/String; = "selectActionParams"

.field static final SELECT_ITEM_INTENT_TAG:Ljava/lang/String; = "forSelectItem"

.field static final TRANSFER_TO_INTENT_TAG:Ljava/lang/String; = "transferToID"

.field static final TRANSFER_TO_NAME_TAG:Ljava/lang/String; = "transferToName"


# instance fields
.field private final InventoryDetailsFragmentFactory:Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

.field private activityStarted:Z

.field private fragmentSearchString:Ljava/lang/String;

.field private nameFilter:Ljava/lang/String;

.field private searchActive:Z

.field private searchMenuItem:Landroid/view/MenuItem;

.field private final searchProcess:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->nameFilter:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic -set1(Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchActive:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->updateSearchAction()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchMenuItem:Landroid/view/MenuItem;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchActive:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->activityStarted:Z

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->nameFilter:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->fragmentSearchString:Ljava/lang/String;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchProcess:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->InventoryDetailsFragmentFactory:Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

    return-void
.end method

.method public static makeFolderIntent(Landroid/content/Context;Ljava/util/UUID;Ljava/util/UUID;)Landroid/content/Intent;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "folderID"

    invoke-virtual {p2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object v0
.end method

.method public static makeSaveItemIntent(Landroid/content/Context;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;)Landroid/content/Intent;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "forSaveInfo"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object v0
.end method

.method public static makeSelectActionIntent(Landroid/content/Context;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;Landroid/os/Bundle;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)Landroid/content/Intent;
    .locals 3
    .param p4    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "forSelectItem"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string/jumbo v1, "selectAction"

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "selectActionParams"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    if-eqz p4, :cond_0

    const-string/jumbo v1, "selectActionAssetType"

    invoke-virtual {p4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    :cond_0
    return-object v0
.end method

.method public static makeSelectIntent(Landroid/content/Context;Ljava/util/UUID;)Landroid/content/Intent;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "forSelectItem"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object v0
.end method

.method public static makeTransferIntent(Landroid/content/Context;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "forSelectItem"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string/jumbo v1, "transferToID"

    invoke-virtual {p2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p3, :cond_0

    const-string/jumbo v1, "transferToName"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    return-object v0
.end method

.method private selectSortOrder()V
    .locals 4

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/CharSequence;

    const-string/jumbo v1, "Newest first"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string/jumbo v1, "Alphabetical"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getSortOrder(Landroid/content/Context;)I

    move-result v1

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f090311

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$Tc22ivDU79Y83KauKGybv49CW7A;

    invoke-direct {v3, v1, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$Tc22ivDU79Y83KauKGybv49CW7A;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v2, v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private updateSearchAction()V
    .locals 3

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->activityStarted:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchActive:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchProcess:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getSearchProcess()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->nameFilter:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->fragmentSearchString:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->fragmentSearchString:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v2, 0x7f100286

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;

    if-eqz v2, :cond_1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;

    invoke-static {v1}, Lcom/google/common/base/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->setSearchString(Ljava/lang/String;)V

    :cond_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchProcess:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    const-string/jumbo v0, ""

    move-object v1, v0

    goto :goto_0
.end method


# virtual methods
.method clearSearchMode()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchActive:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchMenuItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Landroid/support/v4/view/MenuItemCompat;->collapseActionView(Landroid/view/MenuItem;)Z

    :cond_0
    return-void
.end method

.method protected getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->InventoryDetailsFragmentFactory:Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

    return-object v0
.end method

.method protected getNewDetailsFragmentArguments(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->makeDetailsArguments(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-super {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getNewDetailsFragmentArguments(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method protected isAlwaysImplicitFragment(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;)Z"
        }
    .end annotation

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryActivity_10944(ILandroid/content/DialogInterface;I)V
    .locals 2

    if-eq p1, p3, :cond_0

    invoke-static {p0, p3}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->setSortOrder(Landroid/content/Context;I)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySortOrderChangedEvent;

    invoke-direct {v1, p3}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySortOrderChangedEvent;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_0
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const-string/jumbo v0, "searchActive"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchActive:Z

    const-string/jumbo v0, "nameFilter"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->nameFilter:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method protected onCreateMasterFragment(Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 4
    .param p2    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v3, 0x0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/os/Bundle;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "folderID"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "folderID"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->makeSelection(Ljava/util/UUID;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p2

    :cond_1
    :goto_0
    const/4 v0, 0x1

    invoke-static {p2, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->newInstance(Landroid/os/Bundle;Z)Landroid/support/v4/app/Fragment;

    move-result-object v0

    return-object v0

    :cond_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "forSaveInfo"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "forSaveInfo"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    if-eqz v0, :cond_1

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    if-eq v1, v2, :cond_1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getSpecialFolderType()I

    move-result v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getRootFolder()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v2, v1, v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findSpecialFolder(Ljava/util/UUID;I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->makeSelection(Ljava/util/UUID;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p2

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f12000d

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const v0, 0x7f10032a

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchMenuItem:Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Landroid/support/v4/view/MenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/SearchView;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchActive:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v1}, Landroid/support/v4/view/MenuItemCompat;->expandActionView(Landroid/view/MenuItem;)Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->nameFilter:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    :cond_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$2;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView;->setOnQueryTextListener(Landroid/support/v7/widget/SearchView$OnQueryTextListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchMenuItem:Landroid/view/MenuItem;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$3;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$3;-><init>(Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;)V

    invoke-static {v0, v1}, Landroid/support/v4/view/MenuItemCompat;->setOnActionExpandListener(Landroid/view/MenuItem;Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;)Landroid/view/MenuItem;

    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->selectSortOrder()V

    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x7f100314
        :pswitch_0
    .end packed-switch
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const-string/jumbo v0, "searchActive"

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->searchActive:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string/jumbo v0, "nameFilter"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->nameFilter:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected onStart()V
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onStart()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->activityStarted:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->updateSearchAction()V

    return-void
.end method

.method protected onStop()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->activityStarted:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->updateSearchAction()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onStop()V

    return-void
.end method
