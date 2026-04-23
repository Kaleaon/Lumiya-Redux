.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$3;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
        "<",
        "Ljava/util/UUID;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectsManager$3_4319(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Ljava/util/UUID;)V
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getUserTouchableObjects(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Ljava/util/UUID;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get6(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get6(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;

    invoke-direct {v1, p2, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;-><init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;)V

    invoke-virtual {v0, p2, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$3;->onRequest(Ljava/util/UUID;)V

    return-void
.end method

.method public onRequest(Ljava/util/UUID;)V
    .locals 2
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get8(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$n3FxEEuksYOCADj00lseQFiZ3z4$2;

    invoke-direct {v1, p0, v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$n3FxEEuksYOCADj00lseQFiZ3z4$2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get6(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;-><init>()V

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
