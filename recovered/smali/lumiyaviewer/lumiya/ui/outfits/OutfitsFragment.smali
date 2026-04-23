.class public Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter$OnItemCheckboxClickListener;


# static fields
.field private static final FOLDER_ID_KEY:Ljava/lang/String; = "folderID"


# instance fields
.field private adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

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

.field private final entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;",
            ">;"
        }
    .end annotation
.end field

.field private final folderLoading:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final itemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private listHeader:Landroid/view/ViewGroup;

.field private final listHeaderData:Ljava/lang/Object;

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field private myOutfitsFolderUUID:Ljava/util/UUID;

.field private final rootFolderEntryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;",
            ">;"
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

.field private final wornOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/util/UUID;",
            ">;"
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
    .locals 4

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->myOutfitsFolderUUID:Ljava/util/UUID;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$1;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$2;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$2;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$3;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$3;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->folderLoading:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$4;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$4;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$5;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$5;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$6;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$6;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->rootFolderEntryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$7;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs$7;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->wornOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeaderData:Ljava/lang/Object;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/-$Lambda$oBJjjSxYBPvwKW_FzKQvdarEfUs;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->itemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method private changeOutfit(Z)V
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v3

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolderOrFolderLink()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v3, v2}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->getFolder()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {v1, v2, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->ChangeOutfit(Ljava/util/List;ZLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_2
    return-void
.end method

.method private getFolderUUID()Ljava/util/UUID;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string/jumbo v0, "folderID"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method private getInventoryQuery(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
    .locals 6
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getSortOrder(Landroid/content/Context;)I

    move-result v0

    if-nez v0, :cond_0

    move v4, v2

    :cond_0
    move-object v0, p1

    move v3, v2

    move-object v5, v1

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->create(Ljava/util/UUID;Ljava/lang/String;ZZZLcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    return-object v0
.end method

.method private getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    return-object v0
.end method

.method public static makeSelection(Ljava/util/UUID;Ljava/util/UUID;)Landroid/os/Bundle;
    .locals 3
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-static {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/os/Bundle;Ljava/util/UUID;)V

    if-eqz p1, :cond_0

    const-string/jumbo v1, "folderID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method

.method private navigateToFolder(Ljava/util/UUID;)V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "folderID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->showInventoryList(Ljava/util/UUID;)V

    return-void
.end method

.method private onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    :cond_0
    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;)V

    :cond_1
    return-void
.end method

.method private onInventoryEntryList(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 5

    const/4 v4, 0x0

    const-string/jumbo v0, "InventoryFragment (%s): onInventoryEntryList: %d entries"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v4}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setData(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->updateLoadingStatus()V

    return-void
.end method

.method private onLoadingStatusChanged(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->updateLoadingStatus()V

    return-void
.end method

.method private onRootFolderEntryList(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 4

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v2, :cond_0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    const/16 v3, 0x30

    if-ne v2, v3, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->myOutfitsFolderUUID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->rootFolderEntryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getFolderUUID()Ljava/util/UUID;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getFolderUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->showInventoryList(Ljava/util/UUID;)V

    :cond_1
    return-void
.end method

.method private onWornAttachmentsChanged(Lcom/google/common/collect/ImmutableMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setWornAttachments(Lcom/google/common/collect/ImmutableMap;)V

    :cond_0
    return-void
.end method

.method private onWornOutfitFolder(Ljava/util/UUID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setWornOutfitFolder(Ljava/util/UUID;)V

    :cond_0
    return-void
.end method

.method private onWornWearablesChanged(Lcom/google/common/collect/Table;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setWornWearables(Lcom/google/common/collect/Table;)V

    :cond_0
    return-void
.end method

.method private showInventoryList(Ljava/util/UUID;)V
    .locals 12
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const v11, 0x7f100246

    const/16 v10, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v0, 0x0

    const-string/jumbo v1, "OutfitsNewFragment (%s): showInventoryList \'%s\'"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v3

    aput-object p1, v4, v2

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getView()Landroid/view/View;

    move-result-object v6

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->folderLoading:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->rootFolderEntryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v7

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornAttachmentsPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v5

    sget-object v8, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v4, v5, v8}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornWearablesPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v5

    sget-object v8, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v4, v5, v8}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->wornOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornOutfitLink()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v5

    sget-object v8, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v4, v5, v8}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v5

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v4, v5, v8}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->myOutfitsFolderUUID:Ljava/util/UUID;

    :cond_0
    const-string/jumbo v4, "After checking myoutfits: %s"

    new-array v5, v2, [Ljava/lang/Object;

    aput-object p1, v5, v3

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-nez p1, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getRootFolder()Ljava/util/UUID;

    move-result-object v4

    if-eqz v4, :cond_1

    const/16 v5, 0x30

    invoke-virtual {v7, v4, v5}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findSpecialFolder(Ljava/util/UUID;I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v4

    if-eqz v4, :cond_4

    iget-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->myOutfitsFolderUUID:Ljava/util/UUID;

    iget-object p1, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    const-string/jumbo v4, "Found special folder: %s"

    new-array v5, v2, [Ljava/lang/Object;

    aput-object p1, v5, v3

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    :goto_0
    if-eqz p1, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->folderLoading:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getFolderLoading()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getInventoryEntries()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getInventoryQuery(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    if-eqz v6, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeader:Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->myOutfitsFolderUUID:Ljava/util/UUID;

    invoke-static {p1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeader:Landroid/view/ViewGroup;

    const v1, 0x7f1001bf

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0900d4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeader:Landroid/view/ViewGroup;

    const v1, 0x7f1001bd

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f0200c0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v6, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/view/View;->setVisibility(I)V

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeader:Landroid/view/ViewGroup;

    const v1, 0x7f1001be

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeader:Landroid/view/ViewGroup;

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    :cond_2
    :goto_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, v7}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setDatabase(Lcom/lumiyaviewer/lumiya/orm/InventoryDB;)V

    :cond_3
    :goto_3
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->updateLoadingStatus()V

    return-void

    :cond_4
    const-string/jumbo v4, "Special folder not found"

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeader:Landroid/view/ViewGroup;

    const v1, 0x7f1001bf

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f09016f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeader:Landroid/view/ViewGroup;

    const v1, 0x7f1001bd

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f0200cc

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v6, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_6
    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->rootFolderEntryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getInventoryEntries()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v9

    move-object v1, v0

    move v4, v3

    move-object v5, v0

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->create(Ljava/util/UUID;Ljava/lang/String;ZZZLcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    invoke-virtual {v8, v9, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeader:Landroid/view/ViewGroup;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeader:Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->setVisibility(I)V

    :cond_7
    if-eqz v6, :cond_2

    invoke-virtual {v6, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    :cond_8
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->rootFolderEntryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setDatabase(Lcom/lumiyaviewer/lumiya/orm/InventoryDB;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->wornOutfitFolder:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_3
.end method

.method private updateLoadingStatus()V
    .locals 6

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    if-eqz v4, :cond_1

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->folderLoading:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->isSubscribed()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->folderLoading:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v3, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->isEmpty()Z

    move-result v2

    :cond_0
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    if-eqz v2, :cond_3

    move v3, v0

    :goto_1
    invoke-virtual {v5, v3}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setExtraLoading(Z)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    if-nez v2, :cond_4

    :goto_2
    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setButteryProgressBar(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const v1, 0x7f0901e5

    invoke-virtual {v4, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setEmptyMessage(ZLjava/lang/String;)V

    :cond_1
    return-void

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    move v3, v1

    goto :goto_1

    :cond_4
    move v0, v1

    goto :goto_2

    :cond_5
    move v0, v1

    goto :goto_0
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_outfits_OutfitsFragment-mthref-0(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->onInventoryEntryList(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_outfits_OutfitsFragment-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_outfits_OutfitsFragment-mthref-2(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->onLoadingStatusChanged(Ljava/lang/Boolean;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_outfits_OutfitsFragment-mthref-3(Lcom/google/common/collect/ImmutableMap;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->onWornAttachmentsChanged(Lcom/google/common/collect/ImmutableMap;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_outfits_OutfitsFragment-mthref-4(Lcom/google/common/collect/Table;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->onWornWearablesChanged(Lcom/google/common/collect/Table;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_outfits_OutfitsFragment-mthref-5(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->onRootFolderEntryList(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_outfits_OutfitsFragment-mthref-6(Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->onWornOutfitFolder(Ljava/util/UUID;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_outfits_OutfitsFragment_13544(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeaderData:Ljava/lang/Object;

    if-ne v0, v3, :cond_3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getFolderUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->myOutfitsFolderUUID:Ljava/util/UUID;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitFragment;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitFragment;->makeSelection(Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->getFolder()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->navigateToFolder(Ljava/util/UUID;)V

    goto :goto_0

    :cond_3
    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v2, :cond_1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const-string/jumbo v2, "Inventory: Item click: item isFolder %b invType %d typeDefault %d assetType %d"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    iget-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v2, :cond_4

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    if-eqz v2, :cond_4

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    :goto_1
    if-eqz v0, :cond_1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->navigateToFolder(Ljava/util/UUID;)V

    goto :goto_0

    :cond_4
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isLink()Z

    move-result v2

    if-eqz v2, :cond_5

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    const/16 v3, 0x8

    if-ne v2, v3, :cond_5

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    goto :goto_1

    :cond_5
    move-object v0, v1

    goto :goto_1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->changeOutfit(Z)V

    goto :goto_0

    :pswitch_1
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->changeOutfit(Z)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x7f100247
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 8
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

    const/4 v7, 0x1

    const/4 v6, 0x0

    const v5, 0x7f1001b8

    const-string/jumbo v0, "InventoryFragment: onCreateView"

    new-array v1, v6, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const v0, 0x7f04007d

    invoke-virtual {p1, v0, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const v0, 0x7f1000bd

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f0901de

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f09016d

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    const v2, 0x7f040053

    invoke-virtual {p1, v2, v0, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeader:Landroid/view/ViewGroup;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-direct {v0, p1, v7}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;-><init>(Landroid/view/LayoutInflater;Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setOnItemCheckboxClickListener(Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter$OnItemCheckboxClickListener;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeader:Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->listHeaderData:Ljava/lang/Object;

    invoke-virtual {v0, v2, v3, v7}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->itemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    const v0, 0x7f100247

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f100248

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v1
.end method

.method public onInventorySortOrderChanged(Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySortOrderChangedEvent;)V
    .locals 1
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->isFragmentStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getFolderUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->showInventoryList(Ljava/util/UUID;)V

    :cond_0
    return-void
.end method

.method public onItemCheckboxClicked(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 4

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->resolveLink(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    move-object p1, v0

    :cond_0
    invoke-virtual {v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->isItemWorn(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isWearable()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->TakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-virtual {v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->DetachInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isWearable()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {v2, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->WearItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Z)V

    goto :goto_0

    :cond_4
    invoke-virtual {v2, p1, v3, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->AttachInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;IZ)V

    goto :goto_0
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getFolderUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->showInventoryList(Ljava/util/UUID;)V

    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->showInventoryList(Ljava/util/UUID;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->unsubscribe(Ljava/lang/Object;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStop()V

    return-void
.end method

.method public setFragmentArgs(Landroid/content/Intent;Landroid/os/Bundle;)V
    .locals 3

    const-string/jumbo v0, "InventoryFragment: setFragmentArgs \'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->isFragmentStarted()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->getFolderUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->showInventoryList(Ljava/util/UUID;)V

    :cond_1
    return-void
.end method
