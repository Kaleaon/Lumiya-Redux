.class Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/RequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;
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
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const-string/jumbo v0, "Transfer: Requested asset download for %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->-get2(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->-get2(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    const v3, 0x461c4000    # 10000.0f

    invoke-direct {v0, v1, v2, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;-><init>(Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;F)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)Lcom/google/common/collect/BiMap;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;->getTransferUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Lcom/google/common/collect/BiMap;->forcePut(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;)V

    return-void
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;->onRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;)V

    return-void
.end method

.method public onRequestCancelled(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)Lcom/google/common/collect/BiMap;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/common/collect/BiMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->-get1(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;->-wrap1(Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransfer;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic onRequestCancelled(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager$1;->onRequestCancelled(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;)V

    return-void
.end method
