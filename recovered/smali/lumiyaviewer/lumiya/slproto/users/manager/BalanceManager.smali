.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$2;
    }
.end annotation


# instance fields
.field private final balancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final balanceRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            ">;"
        }
    .end annotation
.end field

.field private final financialInfo:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

.field private final moneyTransactionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;",
            ">;>;"
        }
    .end annotation
.end field

.field private final requestBalanceRunnable:Ljava/lang/Runnable;

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->balancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->financialInfo:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->moneyTransactionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->requestBalanceRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->financialInfo:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->moneyTransactionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->balanceRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->requestBalanceRunnable:Ljava/lang/Runnable;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->balancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDaoSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getMoneyTransactionDao()Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->balancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->balanceRequestHandler:Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->moneyTransactionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$3;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)V

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->moneyTransactionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$xo_DO1h0hLJizWUYkWN5MuOY-xk;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$xo_DO1h0hLJizWUYkWN5MuOY-xk;-><init>()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->setDisposeHandler(Lcom/lumiyaviewer/lumiya/react/DisposeHandler;Ljava/util/concurrent/Executor;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_BalanceManager_1705(Lde/greenrobot/dao/query/LazyList;)V
    .locals 1

    invoke-virtual {p0}, Lde/greenrobot/dao/query/LazyList;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lde/greenrobot/dao/query/LazyList;->close()V

    :cond_0
    return-void
.end method


# virtual methods
.method public clearFinancialInfo(Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->financialInfo:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method

.method public clearMoneyTransactions()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$xo_DO1h0hLJizWUYkWN5MuOY-xk$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$xo_DO1h0hLJizWUYkWN5MuOY-xk$1;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getBalance()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->balancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_BalanceManager_4293()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;->deleteAll()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->updateMoneyTransactions()V

    return-void
.end method

.method public moneyTransactions()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->moneyTransactionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public setFinancialInfo(Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->financialInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void
.end method

.method public updateBalance(I)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->balancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public updateMoneyTransactions()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->moneyTransactionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method
