.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->AskForMoneyBalance()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
