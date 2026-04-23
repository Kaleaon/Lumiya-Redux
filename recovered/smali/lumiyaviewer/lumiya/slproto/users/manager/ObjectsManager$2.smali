.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$2;
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
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectsManager$2_3438(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Ljava/lang/Integer;)V
    .locals 4

    const/4 v3, 0x0

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getObjectProfile(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;-><init>(ILcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;)V

    invoke-virtual {v0, p2, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onRequest(Ljava/lang/Integer;)V
    .locals 2
    .param p1    # Ljava/lang/Integer;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get8(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$n3FxEEuksYOCADj00lseQFiZ3z4$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$n3FxEEuksYOCADj00lseQFiZ3z4$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;-><init>()V

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$2;->onRequest(Ljava/lang/Integer;)V

    return-void
.end method
