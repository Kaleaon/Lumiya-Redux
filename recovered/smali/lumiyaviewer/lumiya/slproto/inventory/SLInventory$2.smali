.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$2;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


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
        "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-wrap4(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)V

    return-void
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$2;->onRequest(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V

    return-void
.end method
