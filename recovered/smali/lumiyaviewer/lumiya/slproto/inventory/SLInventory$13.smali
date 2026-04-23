.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$13;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DoUpdateInventoryItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

.field final synthetic val$callbackListener:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;

.field final synthetic val$entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$13;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$13;->val$callbackListener:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$13;->val$entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;->onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$13;->val$callbackListener:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$13;->val$entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;->onInventoryCallback(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return-void
.end method
