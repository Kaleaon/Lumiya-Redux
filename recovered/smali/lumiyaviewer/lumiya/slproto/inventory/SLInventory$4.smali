.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/RequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;
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
        "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-get2(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-wrap2(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V

    return-void
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$4;->onRequest(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V

    return-void
.end method

.method public onRequestCancelled(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-get2(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-wrap4(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V

    return-void
.end method

.method public bridge synthetic onRequestCancelled(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$4;->onRequestCancelled(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V

    return-void
.end method
