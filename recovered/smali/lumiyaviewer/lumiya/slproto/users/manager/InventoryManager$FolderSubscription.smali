.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;
.implements Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FolderSubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
        ">;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;",
        "Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;"
    }
.end annotation


# instance fields
.field private final query:Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

.field private final subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;Ljava/util/UUID;)V
    .locals 3
    .param p3    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->query:Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    const-string/jumbo v0, "Inventory: folder subscription: folderId = \'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p3, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->-get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->-get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    move-result-object v1

    invoke-virtual {v0, p3, v1, p0, p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;Ljava/util/UUID;)V

    return-void
.end method


# virtual methods
.method public onData(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 4

    if-eqz p1, :cond_0

    const-string/jumbo v0, "Inventory: folder subscription got name: %s with folderId = \'%s\'"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->query:Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->query:Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->-get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->query(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/orm/InventoryDB;)Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic onData(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->onData(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3

    const-string/jumbo v0, "Inventory: subscription error: %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->query:Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public unsubscribe()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    return-void
.end method
