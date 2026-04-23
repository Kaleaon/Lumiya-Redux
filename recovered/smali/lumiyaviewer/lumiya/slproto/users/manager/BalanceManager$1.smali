.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;
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
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->getBalanceKnown()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->getBalance()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->-get5(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->-get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;->onRequest(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V

    return-void
.end method
