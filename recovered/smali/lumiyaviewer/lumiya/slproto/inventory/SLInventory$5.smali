.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$5;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 3

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryUpdatedEvent;

    const/4 v1, 0x1

    invoke-direct {v0, v2, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryUpdatedEvent;-><init>(Ljava/util/Set;Ljava/util/Set;Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$5;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    return-void
.end method

.method public onMessageTimeout(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 0

    return-void
.end method
