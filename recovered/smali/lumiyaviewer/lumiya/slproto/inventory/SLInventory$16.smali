.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DoCreateNewFolder(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;ZLcom/google/common/base/Function;)Ljava/util/UUID;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

.field final synthetic val$newFolderUUID:Ljava/util/UUID;

.field final synthetic val$onFolderCreated:Lcom/google/common/base/Function;

.field final synthetic val$parentEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/google/common/base/Function;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->val$newFolderUUID:Ljava/util/UUID;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->val$parentEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->val$onFolderCreated:Lcom/google/common/base/Function;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 4

    const-string/jumbo v0, "Inventory: new folder created with uuid = %s, parent %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->val$newFolderUUID:Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->val$parentEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-get4(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-get4(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->val$parentEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->val$onFolderCreated:Lcom/google/common/base/Function;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->val$onFolderCreated:Lcom/google/common/base/Function;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$16;->val$newFolderUUID:Ljava/util/UUID;

    invoke-interface {v0, v1}, Lcom/google/common/base/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method
