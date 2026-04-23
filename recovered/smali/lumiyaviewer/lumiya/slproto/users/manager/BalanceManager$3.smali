.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$3;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->-get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Lde/greenrobot/dao/Property;

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao$Properties;->Timestamp:Lde/greenrobot/dao/Property;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lde/greenrobot/dao/query/QueryBuilder;->orderAsc([Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->listLazy()Lde/greenrobot/dao/query/LazyList;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->-get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager$3;->onRequest(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V

    return-void
.end method
