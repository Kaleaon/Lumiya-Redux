.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->MoveInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

.field final synthetic val$item:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

.field final synthetic val$newParent:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

.field final synthetic val$oldParentUUID:Ljava/util/UUID;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;->val$oldParentUUID:Ljava/util/UUID;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;->val$newParent:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;->val$item:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-get4(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;->val$oldParentUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-get4(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;->val$newParent:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-get4(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$10;->val$item:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    return-void
.end method
