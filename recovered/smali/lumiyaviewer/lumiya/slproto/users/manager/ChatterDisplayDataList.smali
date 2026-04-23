.class abstract Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;
.super Ljava/lang/Object;


# instance fields
.field private final chatterSubscriptions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;",
            ">;"
        }
    .end annotation
.end field

.field private final chatters:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;

.field private final needsRefresh:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final refreshRunnable:Ljava/lang/Runnable;

.field protected final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;Ljava/util/Comparator;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/Comparator;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;",
            "Ljava/util/Comparator",
            "<-",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->chatterSubscriptions:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->needsRefresh:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$n0kmAon3UDOV6Jcsw0ejXq6u0xA;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$n0kmAon3UDOV6Jcsw0ejXq6u0xA;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->refreshRunnable:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;

    invoke-direct {v0, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->chatters:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;

    return-void
.end method

.method private refreshList()V
    .locals 8

    const/4 v7, 0x1

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->chatterSubscriptions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;

    iput-boolean v6, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->isValid:Z

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->getChatters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->chatterSubscriptions:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;

    if-nez v1, :cond_3

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v2, :cond_4

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->chatters:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;

    move-object v1, v0

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {v2, v4, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    move-object v1, v2

    :cond_2
    :goto_2
    if-eqz v1, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->chatterSubscriptions:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    if-eqz v1, :cond_1

    iput-boolean v7, v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->isValid:Z

    goto :goto_1

    :cond_4
    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v2, :cond_2

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterGroupSubscription;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->chatters:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;

    move-object v1, v0

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {v2, v4, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterGroupSubscription;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    move-object v1, v2

    goto :goto_2

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->chatterSubscriptions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->isValid:Z

    if-nez v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->dispose()V

    goto :goto_3

    :cond_7
    const-string/jumbo v0, "FriendList: refreshList: %d subscriptions"

    new-array v1, v7, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->chatterSubscriptions:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v6

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->chatterSubscriptions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->unsubscribe()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getChatterList()Lcom/google/common/collect/ImmutableList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->chatters:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->getChatterList()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getChatters()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            ">;"
        }
    .end annotation
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ChatterDisplayDataList_2957()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->needsRefresh:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->refreshList()V

    return-void
.end method

.method requestRefresh(Ljava/util/concurrent/Executor;)V
    .locals 5
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v4, 0x1

    const-string/jumbo v0, "FriendList: requestRefresh: needsRefresh = %s"

    new-array v1, v4, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->needsRefresh:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->needsRefresh:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->refreshRunnable:Ljava/lang/Runnable;

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->refreshRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method
