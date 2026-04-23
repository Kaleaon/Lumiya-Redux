.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$2;
.super Lcom/lumiyaviewer/lumiya/react/RequestProcessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;-><init>(Ljava/util/UUID;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/RequestProcessor",
        "<",
        "Ljava/util/UUID;",
        "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
        "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

.field final synthetic val$inventoryDB:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/orm/InventoryDB;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$2;->val$inventoryDB:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic isRequestComplete(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/util/UUID;

    check-cast p2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$2;->isRequestComplete(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z

    move-result v0

    return v0
.end method

.method protected isRequestComplete(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z
    .locals 2
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    if-eqz p2, :cond_0

    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->sessionID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected processRequest(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$2;->val$inventoryDB:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic processRequest(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$2;->processRequest(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    return-object v0
.end method

.method protected processResult(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 4
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    if-eqz p2, :cond_0

    const-string/jumbo v0, "Inventory: entry subscription got name: %s with folderId = \'%s\'"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;)V

    return-object p2
.end method

.method protected bridge synthetic processResult(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/util/UUID;

    check-cast p2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$2;->processResult(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    return-object v0
.end method
