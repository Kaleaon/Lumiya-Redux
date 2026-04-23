.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/RequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
        "<",
        "Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;",
        ">;"
    }
.end annotation


# instance fields
.field private final folderQueries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;->folderQueries:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)V
    .locals 5
    .param p1    # Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v4, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->containsString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->-get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v1

    invoke-virtual {p1, v4, v1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->query(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/orm/InventoryDB;)Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;->folderId()Ljava/util/UUID;

    move-result-object v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->-get5(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    :cond_2
    const-string/jumbo v1, "Inventory: queryRequestHandler: folderId = \'%s\'"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-direct {v1, v2, p1, v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;->folderQueries:Ljava/util/Map;

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->unsubscribe()V

    goto :goto_0
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;->onRequest(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)V

    return-void
.end method

.method public onRequestCancelled(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;->folderQueries:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$FolderSubscription;->unsubscribe()V

    :cond_0
    return-void
.end method

.method public bridge synthetic onRequestCancelled(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$1;->onRequestCancelled(Lcom/lumiyaviewer/lumiya/orm/InventoryQuery;)V

    return-void
.end method
