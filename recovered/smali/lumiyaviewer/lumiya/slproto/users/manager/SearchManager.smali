.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;
.super Ljava/lang/Object;


# instance fields
.field private final dbExecutor:Ljava/util/concurrent/Executor;

.field private final searchGridResultDao:Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

.field private final searchResults:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/dao/DaoSession;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->searchResults:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->dbExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getSearchGridResultDao()Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->searchGridResultDao:Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->searchResults:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bhNr-B7VMDi5fNhRKl1Wi5s6H9k;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bhNr-B7VMDi5fNhRKl1Wi5s6H9k;-><init>()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->dbExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->setDisposeHandler(Lcom/lumiyaviewer/lumiya/react/DisposeHandler;Ljava/util/concurrent/Executor;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SearchManager_1019(Lde/greenrobot/dao/query/LazyList;)V
    .locals 1

    invoke-virtual {p0}, Lde/greenrobot/dao/query/LazyList;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lde/greenrobot/dao/query/LazyList;->close()V

    :cond_0
    return-void
.end method


# virtual methods
.method public getSearchGridResultDao()Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->searchGridResultDao:Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    return-object v0
.end method

.method public searchResults()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;->searchResults:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method
