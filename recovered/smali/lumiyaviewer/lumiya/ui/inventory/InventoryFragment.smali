.class public Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-ui-inventory-InventoryActivity$SelectActionSwitchesValues:[I = null

.field private static final FOLDER_ID_KEY:Ljava/lang/String; = "folderID"

.field private static final IS_MASTER_FRAGMENT:Ljava/lang/String; = "isMasterFragment"

.field private static final IS_SEARCHING_KEY:Ljava/lang/String; = "isSearching"

.field private static final SEARCH_STRING_KEY:Ljava/lang/String; = "searchString"

.field public static final SELECTED_INVENTORY_ENTRY:Ljava/lang/String; = "selectedInventoryEntry"

.field private static final folderActionIds:[I


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

.field private final clipboardEntry:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;",
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

.field private folderActionMenuItems:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/view/MenuItem;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
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

.field private final inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

.field private final itemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field private final saveAsClickListener:Landroid/view/View$OnClickListener;

.field private saveInfo:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

.field private final searchRunning:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
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
.method private static synthetic -getcom-lumiyaviewer-lumiya-ui-inventory-InventoryActivity$SelectActionSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->-com-lumiyaviewer-lumiya-ui-inventory-InventoryActivity$SelectActionSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->-com-lumiyaviewer-lumiya-ui-inventory-InventoryActivity$SelectActionSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->values()[Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyFirstLife:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyPickImage:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyUserProfile:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->-com-lumiyaviewer-lumiya-ui-inventory-InventoryActivity$SelectActionSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xd

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderActionIds:[I

    return-void

    :array_0
    .array-data 4
        0x7f100318
        0x7f100319
        0x7f10031a
        0x7f10031b
        0x7f10031c
        0x7f10031d
        0x7f10031e
        0x7f10031f
        0x7f100320
        0x7f100321
        0x7f100322
        0x7f100323
        0x7f100324
    .end array-data
.end method

.method public constructor <init>()V
    .locals 4

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;-><init>(Landroid/support/v4/app/Fragment;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveInfo:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderActionMenuItems:Lcom/google/common/collect/ImmutableMap;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$6;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$6;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$7;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$7;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->clipboardEntry:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$8;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$8;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$9;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$9;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderLoading:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$10;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$10;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->searchRunning:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$11;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$11;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$12;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$12;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$5;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$5;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->itemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$4;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$4;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveAsClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private applyPickImage(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;)V
    .locals 10

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PickID:Ljava/util/UUID;

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->CreatorID:Ljava/util/UUID;

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->ParcelID:Ljava/util/UUID;

    iget-object v4, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Name:[B

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Desc:[B

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    iget-object v7, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v7, v7, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-object v8, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget v8, v8, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SortOrder:I

    iget-object v9, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-boolean v9, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Enabled:Z

    invoke-virtual/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->UpdatePickInfo(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;IZ)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    :cond_0
    return-void
.end method

.method private applyProfilePic(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;ZLcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;)V
    .locals 9

    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    if-eqz p3, :cond_0

    iget-object v1, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->ImageID:Ljava/util/UUID;

    iget-object v2, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLImageID:Ljava/util/UUID;

    if-eqz p2, :cond_2

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    :goto_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v3, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->AboutText:[B

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLAboutText:[B

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->Flags:I

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_3

    move v5, v6

    :goto_1
    iget-object v8, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget v8, v8, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->Flags:I

    and-int/lit8 v8, v8, 0x2

    if-eqz v8, :cond_4

    :goto_2
    iget-object v7, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v7, v7, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->ProfileURL:[B

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->UpdateAvatarProperties(Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    :cond_1
    return-void

    :cond_2
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    goto :goto_0

    :cond_3
    move v5, v7

    goto :goto_1

    :cond_4
    move v6, v7

    goto :goto_2
.end method

.method private folderActionsVisible()Z
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isMasterFragment()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isSplitScreen()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private forTransferToUUID()Ljava/util/UUID;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "transferToID"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v2
.end method

.method private getFilterAssetType()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
    .locals 4
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "selectActionAssetType"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    if-eq v0, v1, :cond_0

    return-object v0

    :cond_0
    return-object v3
.end method

.method private getInventoryQuery()Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
    .locals 7

    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "folderID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v3

    const-string/jumbo v1, "isSearching"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, "searchString"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-static {v0}, Lcom/google/common/base/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->getSortOrder(Landroid/content/Context;)I

    move-result v6

    if-eqz v1, :cond_2

    move-object v0, v2

    :goto_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isMasterFragment()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isSplitScreen()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    :goto_2
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isMasterFragment()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isSplitScreen()Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    :goto_3
    if-nez v6, :cond_5

    :goto_4
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getFilterAssetType()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v5

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->create(Ljava/util/UUID;Ljava/lang/String;ZZZLcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    return-object v0

    :cond_1
    move-object v0, v2

    goto :goto_0

    :cond_2
    move-object v0, v3

    goto :goto_1

    :cond_3
    move v2, v4

    goto :goto_2

    :cond_4
    move v3, v4

    goto :goto_3

    :cond_5
    move v4, v5

    goto :goto_4
.end method

.method private getSelectAction()Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "selectAction"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    return-object v2

    :cond_0
    return-object v2
.end method

.method private getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method private isForSelectItem()Z
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "forSelectItem"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    return v0

    :cond_0
    return v2
.end method

.method private isMasterFragment()Z
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "isMasterFragment"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "isMasterFragment"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isSplitScreen()Z
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_29595(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_30202(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_38573(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_40073(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method public static makeDetailsArguments(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v1, "folderID"

    const-string/jumbo v2, "folderID"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v1, "searchString"

    const-string/jumbo v2, "searchString"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v1, "isSearching"

    const-string/jumbo v2, "isSearching"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method

.method public static makeSelection(Ljava/util/UUID;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 3
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    if-eqz p0, :cond_0

    const-string/jumbo v0, "folderID"

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string/jumbo v2, "isSearching"

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string/jumbo v0, "searchString"

    invoke-virtual {v1, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private navigateToFolder(Ljava/util/UUID;)V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "folderID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v1, "isSearching"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getInventoryQuery()Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->showInventoryList(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->clearSearchMode()V

    :cond_0
    return-void
.end method

.method public static newInstance(Landroid/os/Bundle;Z)Landroid/support/v4/app/Fragment;
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    if-eqz p0, :cond_0

    invoke-virtual {v1, p0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_0
    const-string/jumbo v2, "isMasterFragment"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->updateFolderActionItems()V

    return-void
.end method

.method private onClipboardEntry(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->updateFolderActionItems()V

    return-void
.end method

.method private onInventoryEntryList(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v5, 0x0

    const-string/jumbo v2, "InventoryFragment (%s): onInventoryEntryList: %d entries"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isForSelectItem()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getSelectAction()Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->getTitle()Ljava/lang/String;

    move-result-object v0

    iget v1, v2, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->subtitleResourceId:I

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setData(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->updateLoadingStatus()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->updateFolderActionItems()V

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->forTransferToUUID()Ljava/util/UUID;

    move-result-object v2

    if-eqz v2, :cond_2

    :goto_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->getTitle()Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_3

    const v0, 0x7f0902f6

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1

    :cond_3
    const v0, 0x7f0902f4

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_4
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private onLoadingStatusChanged(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->updateLoadingStatus()V

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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setWornAttachments(Lcom/google/common/collect/ImmutableMap;)V

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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setWornWearables(Lcom/google/common/collect/Table;)V

    :cond_0
    return-void
.end method

.method private performSelectAction(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;)V
    .locals 7

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    if-eqz v3, :cond_0

    const-string/jumbo v0, "selectActionParams"

    invoke-virtual {v3, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v4, "InventoryAction: actionParams %s, has params %b"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v2

    const-string/jumbo v6, "selectActionParams"

    invoke-virtual {v3, v6}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v5, v1

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    if-nez v0, :cond_1

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    :cond_1
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->-getcom-lumiyaviewer-lumiya-ui-inventory-InventoryActivity$SelectActionSwitchesValues()[I

    move-result-object v3

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    sget-object v3, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyFirstLife:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    if-ne p2, v3, :cond_2

    :goto_1
    const-string/jumbo v2, "oldProfileData"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    invoke-direct {p0, p1, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->applyProfilePic(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;ZLcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;)V

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    :pswitch_1
    const-string/jumbo v1, "oldPickData"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->applyPickImage(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private selectPictureForUpload()V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "Select Picture"

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private shareItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;)V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v0, 0x0

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    and-int/2addr v1, v2

    and-int/lit16 v1, v1, 0x2000

    if-nez v1, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f090180

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "Dismiss"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$2;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$2;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_1

    const-string/jumbo v0, "transferToName"

    invoke-virtual {v2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    aput-object v3, v2, v4

    if-eqz v0, :cond_3

    :goto_1
    aput-object v0, v2, v5

    const v0, 0x7f090304

    invoke-virtual {p0, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    and-int/2addr v2, v3

    const v3, 0x8000

    and-int/2addr v2, v3

    if-nez v2, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const v2, 0x7f0901dd

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_2
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v3, "Yes"

    new-instance v4, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$16;

    invoke-direct {v4, p0, p2, p1, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$16;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$3;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$3;-><init>()V

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    :cond_3
    const v0, 0x7f0901c8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method private showInventoryList(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v3, 0x0

    const-string/jumbo v0, "InventoryFragment (%s): showInventoryList \'%s\'"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->clipboardEntry:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderLoading:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz p1, :cond_3

    if-eqz v1, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornAttachmentsPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getWornWearablesPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->folderId()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderLoading:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getFolderLoading()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->searchRunning:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getSearchRunning()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->clipboardEntry:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getClipboard()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getInventoryEntries()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isMasterFragment()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isSplitScreen()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;

    if-eqz v2, :cond_1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->makeDetailsArguments(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->setCurrentDetailsArguments(Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setDatabase(Lcom/lumiyaviewer/lumiya/orm/InventoryDB;)V

    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->updateLoadingStatus()V

    return-void

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->searchRunning:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->wornAttachments:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->wornWearables:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->setDatabase(Lcom/lumiyaviewer/lumiya/orm/InventoryDB;)V

    goto :goto_0
.end method

.method private updateFolderActionItems()V
    .locals 9

    const/4 v3, 0x1

    const/4 v1, 0x0

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderActionMenuItems:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->getFolder()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    move-object v1, v0

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderActionsVisible()Z

    move-result v0

    if-eqz v0, :cond_9

    if-eqz v1, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->clipboardEntry:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->hasData()Z

    move-result v5

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    if-eqz v2, :cond_1

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    sget-object v6, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-static {v2, v6}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    :goto_0
    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    if-ltz v1, :cond_2

    move v7, v3

    :goto_1
    if-eqz v0, :cond_4

    iget-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->isCut:Z

    if-nez v1, :cond_3

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->inventoryEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isCopyable()Z

    move-result v1

    move v6, v1

    :goto_2
    if-eqz v0, :cond_5

    :goto_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderActionMenuItems:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    if-nez v2, :cond_8

    xor-int/lit8 v1, v7, 0x1

    if-eqz v1, :cond_8

    move v1, v5

    :goto_5
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_4

    :cond_1
    move v2, v3

    goto :goto_0

    :cond_2
    move v7, v4

    goto :goto_1

    :cond_3
    move v6, v3

    goto :goto_2

    :cond_4
    move v6, v4

    goto :goto_2

    :cond_5
    move v3, v4

    goto :goto_3

    :pswitch_1
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    xor-int/lit8 v1, v2, 0x1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_4

    :pswitch_2
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    if-eqz v6, :cond_6

    move v1, v5

    :goto_6
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_4

    :cond_6
    move v1, v4

    goto :goto_6

    :pswitch_3
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    if-eqz v3, :cond_7

    move v1, v5

    :goto_7
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_4

    :cond_7
    move v1, v4

    goto :goto_7

    :pswitch_4
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    invoke-interface {v0, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_4

    :cond_8
    move v1, v4

    goto :goto_5

    :cond_9
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderActionMenuItems:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->values()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_8

    :cond_a
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f100318
        :pswitch_1
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private updateLoadingStatus()V
    .locals 7

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    if-eqz v4, :cond_0

    const/4 v3, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v2, "isSearching"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderLoading:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->isSubscribed()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderLoading:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    move v2, v0

    :goto_1
    if-eqz v5, :cond_b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->searchRunning:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_2
    or-int/2addr v0, v2

    :goto_3
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->isEmpty()Z

    move-result v2

    :goto_4
    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    if-eqz v2, :cond_3

    move v3, v0

    :goto_5
    invoke-virtual {v6, v3}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setExtraLoading(Z)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    if-nez v2, :cond_4

    :goto_6
    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setButteryProgressBar(Z)V

    if-eqz v5, :cond_7

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isSplitScreen()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isMasterFragment()Z

    move-result v0

    if-eqz v0, :cond_5

    const v0, 0x7f0901e3

    invoke-virtual {v4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setEmptyMessage(ZLjava/lang/String;)V

    :cond_0
    return-void

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_2

    :cond_3
    move v3, v1

    goto :goto_5

    :cond_4
    move v0, v1

    goto :goto_6

    :cond_5
    const v0, 0x7f0901e4

    invoke-virtual {v4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_6
    const v0, 0x7f0901e2

    invoke-virtual {v4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_7
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isSplitScreen()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isMasterFragment()Z

    move-result v0

    if-eqz v0, :cond_8

    const v0, 0x7f0901e6

    invoke-virtual {v4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_8
    const v0, 0x7f0901e7

    invoke-virtual {v4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_9
    const v0, 0x7f0901e5

    invoke-virtual {v4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_a
    move v2, v3

    goto :goto_4

    :cond_b
    move v0, v2

    goto :goto_3

    :cond_c
    move v2, v1

    goto/16 :goto_1
.end method

.method private uploadImage(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 10

    const/4 v9, -0x1

    const/4 v4, 0x1

    const/4 v2, 0x0

    invoke-static {p1}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v9, :cond_0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :cond_0
    const-string/jumbo v5, "0123456789ABCDEFGHIJKLMNOPQRSTUWXYZabcdefghijklmnopqrstuwxyz "

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move v1, v2

    move v3, v2

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v1, v7, :cond_3

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    if-eq v8, v9, :cond_1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v3, v2

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    if-nez v3, :cond_2

    const/16 v3, 0x5f

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_2
    move v3, v4

    goto :goto_1

    :cond_3
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_4
    const-string/jumbo v0, "Picture"

    :cond_5
    const-string/jumbo v1, "Upload: uploading name \'%s\' bitmap %d x %d"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x2

    aput-object v5, v3, v6

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;

    invoke-direct {v1, v0, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;-><init>(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/UUID;Ljava/util/UUID;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3, p3}, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;-><init>(Landroid/content/Context;Ljava/util/UUID;)V

    new-array v3, v4, [Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;

    aput-object v1, v3, v2

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment-mthref-0(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->onInventoryEntryList(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->onClipboardEntry(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment-mthref-2(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment-mthref-3(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->onLoadingStatusChanged(Ljava/lang/Boolean;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment-mthref-4(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->onLoadingStatusChanged(Ljava/lang/Boolean;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment-mthref-5(Lcom/google/common/collect/ImmutableMap;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->onWornAttachmentsChanged(Lcom/google/common/collect/ImmutableMap;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment-mthref-6(Lcom/google/common/collect/Table;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->onWornWearablesChanged(Lcom/google/common/collect/Table;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_23670(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->navigateToFolder(Ljava/util/UUID;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_29313(Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/util/UUID;Landroid/content/DialogInterface;I)V
    .locals 1

    invoke-interface {p5}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0, p4}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->uploadImage(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/UUID;Ljava/util/UUID;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_32146(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v1, p3}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string/jumbo v2, "Inventory: Item click: item isFolder %b invType %d typeDefault %d assetType %d"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    iget-boolean v4, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget v4, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget v4, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    iget v4, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-boolean v2, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v2, :cond_2

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    if-eqz v2, :cond_2

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    :cond_0
    :goto_0
    if-eqz v0, :cond_3

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->navigateToFolder(Ljava/util/UUID;)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isLink()Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    const/16 v3, 0x8

    if-ne v2, v3, :cond_0

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isForSelectItem()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getSelectAction()Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->performSelectAction(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;)V

    goto :goto_1

    :cond_4
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->forTransferToUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->shareItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;)V

    goto :goto_1

    :cond_5
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v3, "selectedInventoryEntry"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 v1, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/FragmentActivity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_1

    :cond_6
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    if-eqz v2, :cond_7

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->clearSearchMode()V

    :cond_7
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->makeSelection(Ljava/util/UUID;Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_1
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_39597(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Landroid/support/v4/app/FragmentActivity;Landroid/content/DialogInterface;I)V
    .locals 1

    invoke-interface {p4}, Landroid/content/DialogInterface;->dismiss()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->OfferInventoryItem(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/support/v4/app/FragmentActivity;->finish()V

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_40227(Landroid/view/View;)V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveInfo:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveInfo:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveType:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->NotecardItem:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "folderID"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0901fc

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v4, v3, v5, v5}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveInfo:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->notecardUUID:Ljava/util/UUID;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveInfo:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveItemUUID:Ljava/util/UUID;

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$13;

    invoke-direct {v5, p0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$13;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v3, v4, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->CopyInventoryFromNotecard(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/Runnable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveInfo:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveType:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->InventoryOffer:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "folderID"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveInfo:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    iget-wide v4, v3, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->inventoryOfferMessageId:J

    invoke-virtual {v0, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatMessage(J)Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->loadFromDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v0

    instance-of v3, v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;

    if-eqz v3, :cond_2

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v3, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->onOfferAccepted(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/util/UUID;)V

    :cond_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_40889(Landroid/app/ProgressDialog;)V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$14;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$14;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_40936(Landroid/app/ProgressDialog;)V
    .locals 1

    invoke-virtual {p1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/app/ProgressDialog;->dismiss()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    :cond_0
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 4
    .param p1    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const v2, 0x7f1001b9

    const/4 v3, 0x0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "forSaveInfo"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveInfo:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveInfo:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    if-eqz v1, :cond_2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderActionsVisible()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    const v1, 0x7f1001ba

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveInfo:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;->saveItemName:Ljava/lang/String;

    aput-object v2, v1, v3

    const v2, 0x7f090177

    invoke-virtual {p0, v2, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 10

    const/4 v9, 0x1

    const/4 v0, 0x0

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v1, 0xa

    if-ne p1, v1, :cond_1

    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_1

    :try_start_0
    invoke-virtual {v1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-static {v3, v1}, Landroid/provider/MediaStore$Images$Media;->getBitmap(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v5, "folderID"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v5

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->financialInfo:Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->getUploadCost()I

    move-result v0

    if-eqz v0, :cond_2

    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v6, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v7, 0x0

    aput-object v0, v1, v7

    const v0, 0x7f090366

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const-string/jumbo v8, "Yes"

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v7, v8, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v2, v3, v0, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->uploadImage(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/UUID;Ljava/util/UUID;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f09011f

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v9}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "Dismiss"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$1;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$1;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 6

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderActionsVisible()Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f12000b

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    new-instance v1, Lcom/google/common/collect/ImmutableMap$Builder;

    invoke-direct {v1}, Lcom/google/common/collect/ImmutableMap$Builder;-><init>()V

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderActionIds:[I

    const/4 v0, 0x0

    array-length v3, v2

    :goto_0
    if-ge v0, v3, :cond_0

    aget v4, v2, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {p1, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-virtual {v1, v5, v4}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->folderActionMenuItems:Lcom/google/common/collect/ImmutableMap;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->updateFolderActionItems()V

    :cond_1
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7
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

    const v6, 0x7f1001b8

    const/4 v5, 0x0

    const-string/jumbo v0, "InventoryFragment: onCreateView"

    new-array v1, v5, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const v0, 0x7f040052

    invoke-virtual {p1, v0, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const v0, 0x7f1000bd

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f0901de

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f09016d

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-direct {v0, p1, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;-><init>(Landroid/view/LayoutInflater;Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->itemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    const v0, 0x7f1001bb

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->saveAsClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v1
.end method

.method public onInventorySortOrderChanged(Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySortOrderChangedEvent;)V
    .locals 1
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isFragmentStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getInventoryQuery()Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->showInventoryList(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)V

    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 9

    const v6, 0x7f0900cd

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v8, 0x1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->entryList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    if-eqz v0, :cond_0

    if-eqz v5, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->getFolder()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    :cond_0
    :pswitch_0
    return v4

    :pswitch_1
    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    if-eqz v0, :cond_1

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    sget-object v2, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    const-string/jumbo v0, "InventoryFragment: navigate up to %s (current is %s)"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    aput-object v3, v2, v4

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    aput-object v3, v2, v8

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->navigateToFolder(Ljava/util/UUID;)V

    :cond_1
    return v8

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->CreateNewFolder(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return v8

    :pswitch_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$15;

    invoke-direct {v2, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$15;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->DeleteInventoryEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/Runnable;)V

    return v8

    :pswitch_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->RenameInventoryEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return v8

    :pswitch_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->ShareInventoryEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return v8

    :pswitch_6
    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;

    invoke-direct {v2, v8, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;-><init>(ZLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->copyToClipboard(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v6, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return v8

    :pswitch_7
    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;

    invoke-direct {v2, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;-><init>(ZLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->copyToClipboard(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v6, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return v8

    :pswitch_8
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->clipboardEntry:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;

    if-eqz v2, :cond_2

    if-eqz v0, :cond_2

    iget-boolean v4, v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->isCut:Z

    if-eqz v4, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->inventoryEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->MoveInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->copyToClipboard(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;)V

    :cond_2
    :goto_0
    return v8

    :cond_3
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->inventoryEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->CopyInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto :goto_0

    :pswitch_9
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->clipboardEntry:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;

    if-eqz v6, :cond_4

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v2, v6, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->inventoryEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iget-object v3, v6, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->inventoryEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-boolean v3, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v3, :cond_5

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v3

    :goto_1
    iget-object v4, v6, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->inventoryEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-boolean v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    if-eqz v4, :cond_6

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v4

    :goto_2
    iget-object v5, v6, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->inventoryEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->inventoryEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->LinkInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;IILjava/lang/String;Ljava/lang/String;)V

    :cond_4
    return v8

    :cond_5
    iget-object v3, v6, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->inventoryEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    goto :goto_1

    :cond_6
    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v4

    goto :goto_2

    :pswitch_a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->CreateNewLandmark(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return v8

    :pswitch_b
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v5

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    move-object v1, v5

    move-object v5, v3

    move v6, v4

    invoke-static/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->createIntent(Landroid/content/Context;Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;ZLjava/util/UUID;I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/support/v4/app/FragmentActivity;->startActivity(Landroid/content/Intent;)V

    return v8

    :pswitch_c
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->selectPictureForUpload()V

    return v8

    nop

    :pswitch_data_0
    .packed-switch 0x7f100318
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->updateFolderActionItems()V

    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getInventoryQuery()Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->showInventoryList(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)V

    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->showInventoryList(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)V

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

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isFragmentStarted()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getInventoryQuery()Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->showInventoryList(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)V

    :cond_1
    return-void
.end method

.method setSearchString(Ljava/lang/String;)V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "isSearching"

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string/jumbo v0, "searchString"

    invoke-virtual {v1, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->isFragmentStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->getInventoryQuery()Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->showInventoryList(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)V

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
