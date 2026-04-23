.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$OnMessageSourcesResolvedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$1;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;
    }
.end annotation


# static fields
.field private static final CHAT_LOG_CHUNK_SIZE:I = 0x64


# instance fields
.field private final chatEventBus:Lcom/google/common/eventbus/EventBus;

.field private final chatEventLock:Ljava/lang/Object;

.field private final chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final displayedChatters:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            ">;"
        }
    .end annotation
.end field

.field private final findChatterQuery:Lde/greenrobot/dao/query/Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/Query",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/Chatter;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final findChatterQueryNullUUID:Lde/greenrobot/dao/query/Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/Query",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/Chatter;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final messageLoaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private final messageLoadersLock:Ljava/lang/Object;

.field private final messageSourceNameResolver:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

.field private final objectMessageListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;",
            "Ljava/util/concurrent/Executor;",
            ">;"
        }
    .end annotation
.end field

.field private final objectMessageListenersLock:Ljava/lang/Object;

.field private final onListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

.field private final unreadCountsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;)Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    return-object v0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)V
    .locals 8
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/dao/DaoSession;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v7, 0x0

    const/4 v6, 0x1

    const/4 v5, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->messageLoadersLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->messageLoaders:Ljava/util/Map;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->displayedChatters:Ljava/util/Set;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->objectMessageListenersLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->objectMessageListeners:Ljava/util/Map;

    new-instance v0, Lcom/google/common/eventbus/EventBus;

    invoke-direct {v0}, Lcom/google/common/eventbus/EventBus;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventBus:Lcom/google/common/eventbus/EventBus;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->unreadCountsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->onListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getChatterDao()Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getChatMessageDao()Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Type:Lde/greenrobot/dao/Property;

    invoke-virtual {v1, v7}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v1

    new-array v2, v6, [Lde/greenrobot/dao/query/WhereCondition;

    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Uuid:Lde/greenrobot/dao/Property;

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->findChatterQuery:Lde/greenrobot/dao/query/Query;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Type:Lde/greenrobot/dao/Property;

    invoke-virtual {v1, v7}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v1

    new-array v2, v6, [Lde/greenrobot/dao/query/WhereCondition;

    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Uuid:Lde/greenrobot/dao/Property;

    invoke-virtual {v3}, Lde/greenrobot/dao/Property;->isNull()Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->findChatterQueryNullUUID:Lde/greenrobot/dao/query/Query;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    invoke-direct {v0, p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$OnMessageSourcesResolvedListener;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->messageSourceNameResolver:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$2;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->unreadCountsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return-void
.end method

.method private clearChatHistoryInternal(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 5
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->ChatterID:Lde/greenrobot/dao/Property;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    const/4 v4, 0x0

    new-array v4, v4, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v2, v3, v4}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lde/greenrobot/dao/query/QueryBuilder;->buildDelete()Lde/greenrobot/dao/query/DeleteQuery;

    move-result-object v2

    invoke-virtual {v2}, Lde/greenrobot/dao/query/DeleteQuery;->executeDeleteWithoutDetachingEntities()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->clearFreshMessages(Lcom/lumiyaviewer/lumiya/dao/Chatter;)V

    :cond_1
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getLoaders(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->reload()V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    return-void
.end method

.method private clearUnreadCount(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->displayedChatters:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getUnreadCount()I

    move-result v3

    if-eqz v3, :cond_0

    const/4 v1, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setUnreadCount(I)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->update(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v2

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->clearFreshMessages(Lcom/lumiyaviewer/lumiya/dao/Chatter;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->unreadCountsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method private getLoaders(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Ljava/util/List;
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->messageLoadersLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->messageLoaders:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-nez v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    move-object v0, v1

    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_0
    if-nez v1, :cond_1

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    :cond_1
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v1

    goto :goto_1

    :cond_2
    monitor-exit v2

    return-object v1

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method private handleChatEventInternal(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V
    .locals 11

    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v5, 0x0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->isObjectPopup()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->addObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSyncManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncNewMessages()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    return-void

    :cond_1
    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getSource()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Object:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    if-ne v2, v3, :cond_4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->objectMessageListenersLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->objectMessageListeners:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->objectMessageListeners:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    :goto_0
    monitor-exit v3

    if-eqz v2, :cond_4

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Executor;

    if-eqz v2, :cond_3

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$2;

    invoke-direct {v9, v3, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$2;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v2, v9}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    :cond_2
    move-object v2, v5

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    :cond_3
    invoke-interface {v3, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;->onChatEvent(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    goto :goto_1

    :cond_4
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v2

    if-eqz v2, :cond_c

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getSessionID()Ljava/util/UUID;

    move-result-object v2

    move-object v6, v2

    :goto_2
    iget-object v10, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventLock:Ljava/lang/Object;

    monitor-enter v10

    :try_start_1
    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    if-ne v2, v3, :cond_d

    instance-of v2, v4, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    if-eqz v2, :cond_16

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDaoSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getUserNameDao()Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

    move-result-object v2

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/dao/UserNameDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/dao/UserName;

    if-eqz v2, :cond_17

    move-object v0, v4

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    move-object v3, v0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getDisplayName()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_5

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getDisplayName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;->setDisplayName(Ljava/lang/String;)V

    :cond_5
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getUserName()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_6

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getUserName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;->setLegacyName(Ljava/lang/String;)V

    :cond_6
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/UserName;->isComplete()Z

    move-result v2

    if-eqz v2, :cond_17

    move v2, v7

    :goto_3
    if-nez v2, :cond_16

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v2

    move-object v9, v2

    :goto_4
    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->opensNewChatter()Z

    move-result v2

    if-nez v2, :cond_15

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-eq v2, v3, :cond_15

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v2

    if-eqz v2, :cond_14

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getActive()Z

    move-result v3

    if-nez v3, :cond_14

    :goto_5
    if-nez v5, :cond_13

    iget-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-object v2, v5

    :goto_6
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->displayedChatters:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v2, :cond_12

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v2

    if-nez v2, :cond_12

    new-instance v2, Lcom/lumiyaviewer/lumiya/dao/Chatter;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/dao/Chatter;-><init>(Ljava/lang/Long;)V

    invoke-virtual {p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->toDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/Chatter;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->insert(Ljava/lang/Object;)J

    move-object v4, v2

    :goto_7
    if-eqz v6, :cond_8

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getLastSessionID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v6, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_8

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getLastSessionID()Ljava/util/UUID;

    move-result-object v2

    if-eqz v2, :cond_7

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-direct {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->makeSessionMark(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;J)V

    :cond_7
    invoke-virtual {v4, v6}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setLastSessionID(Ljava/util/UUID;)V

    :cond_8
    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getDatabaseObject()Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    move-result-object v6

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v6, v2, v3}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setChatterID(J)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v2, v6}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->insert(Ljava/lang/Object;)J

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getActive()Z

    move-result v2

    if-nez v2, :cond_e

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getMuted()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_11

    const/4 v2, 0x1

    invoke-virtual {v4, v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setActive(Z)V

    move v3, v7

    :goto_8
    if-eqz p3, :cond_10

    if-nez v5, :cond_10

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getUnreadCount()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v4, v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setUnreadCount(I)V

    move v2, v7

    :goto_9
    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getId()Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setLastMessageID(Ljava/lang/Long;)V

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v5, v4}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->update(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v10

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getMuted()Z

    move-result v5

    if-nez v5, :cond_9

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->addFreshMessage(Lcom/lumiyaviewer/lumiya/dao/Chatter;)V

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventBus:Lcom/google/common/eventbus/EventBus;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getType()I

    move-result v2

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v4

    if-ne v2, v4, :cond_f

    move v2, v7

    :goto_a
    invoke-direct {v10, v6, v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;ZZ)V

    invoke-virtual {v5, v10}, Lcom/google/common/eventbus/EventBus;->post(Ljava/lang/Object;)V

    :cond_9
    if-eqz v9, :cond_a

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->messageSourceNameResolver:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getId()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v9, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->requestResolve(Ljava/util/UUID;Ljava/lang/Long;)V

    :cond_a
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->unreadCountsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v2, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    if-eqz v3, :cond_b

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Active:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateList(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    :cond_b
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getLoaders(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->addElement(Lcom/lumiyaviewer/lumiya/utils/Identifiable;)V

    goto :goto_b

    :cond_c
    move-object v6, v5

    goto/16 :goto_2

    :cond_d
    move-object v9, v5

    goto/16 :goto_4

    :cond_e
    move v3, v8

    goto :goto_8

    :catchall_1
    move-exception v2

    monitor-exit v10

    throw v2

    :cond_f
    move v2, v8

    goto :goto_a

    :cond_10
    move v2, v8

    goto :goto_9

    :cond_11
    move v3, v8

    goto/16 :goto_8

    :cond_12
    move-object v4, v2

    goto/16 :goto_7

    :cond_13
    move-object v2, v5

    goto/16 :goto_6

    :cond_14
    move-object v5, v2

    goto/16 :goto_5

    :cond_15
    move-object v2, v5

    goto/16 :goto_6

    :cond_16
    move-object v9, v5

    goto/16 :goto_4

    :cond_17
    move v2, v8

    goto/16 :goto_3
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_16177(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 0

    invoke-interface {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;->onChatEvent(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void
.end method

.method private makeSessionMark(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;J)V
    .locals 8
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v1, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventLock:Ljava/lang/Object;

    monitor-enter v4

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v5, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->ChatterID:Lde/greenrobot/dao/Property;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v6}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v5

    const/4 v6, 0x0

    new-array v6, v6, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v0, v5, v6}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    const/4 v5, 0x1

    new-array v5, v5, [Lde/greenrobot/dao/Property;

    sget-object v6, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Id:Lde/greenrobot/dao/Property;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-virtual {v0, v5}, Lde/greenrobot/dao/query/QueryBuilder;->orderDesc([Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Lde/greenrobot/dao/query/QueryBuilder;->limit(I)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->list()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_0

    const/4 v5, 0x0

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getMessageType()I

    move-result v5

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->SessionMark:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->ordinal()I

    move-result v6

    if-ne v5, v6, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getChatChannel()Ljava/lang/Integer;

    move-result-object v5

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->NewSession:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->ordinal()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setTimestamp(Ljava/util/Date;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->update(Ljava/lang/Object;)V

    move v2, v1

    :goto_0
    if-nez v0, :cond_4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->NewSession:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    const/4 v6, 0x0

    invoke-direct {v0, v1, v3, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;->getDatabaseObject()Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setChatterID(J)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->insert(Ljava/lang/Object;)J

    move-object v1, v0

    :goto_1
    const-string/jumbo v0, "markNewSession: added session mark, chatterDbID %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v3, v6

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v4

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getLoaders(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v2, :cond_2

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->updateElement(Lcom/lumiyaviewer/lumiya/utils/Identifiable;)V

    goto :goto_2

    :cond_0
    move-object v0, v3

    goto :goto_0

    :cond_1
    move-object v0, v3

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v4

    throw v0

    :cond_2
    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->addElement(Lcom/lumiyaviewer/lumiya/utils/Identifiable;)V

    goto :goto_2

    :cond_3
    return-void

    :cond_4
    move-object v1, v0

    goto :goto_1

    :cond_5
    move-object v0, v3

    goto :goto_0
.end method

.method private markChatterInactiveInternal(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-eq v2, v3, :cond_5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v3

    if-eqz v3, :cond_7

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getActive()Z

    move-result v4

    if-eqz v4, :cond_6

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setActive(Z)V

    if-eqz p2, :cond_0

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getMuted()Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setMuted(Z)V

    :cond_0
    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getLastMessageID()Ljava/lang/Long;

    move-result-object v4

    if-eqz v4, :cond_1

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setLastMessageID(Ljava/lang/Long;)V

    move v0, v1

    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v4, v3}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->update(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    :goto_1
    monitor-exit v2

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Active:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateList(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    :cond_3
    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->unreadCountsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSyncManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->flushChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_5
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_6
    move v1, v0

    goto :goto_0

    :cond_7
    move v1, v0

    goto :goto_1
.end method

.method private notifyChatEventUpdatedInternal(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getDatabaseObject()Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->update(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->onMessageUpdated(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private notifyTeleportCompleteInternal(Ljava/lang/String;)V
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->Teleport:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    invoke-direct {v1, v2, v3, v4, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;->getDatabaseObject()Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setChatterID(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->insert(Ljava/lang/Object;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->localChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getLoaders(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->addElement(Lcom/lumiyaviewer/lumiya/utils/Identifiable;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_0
    return-void
.end method

.method private onMessageUpdated(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 6

    const/4 v2, 0x0

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getChatterID()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/Chatter;

    if-eqz v0, :cond_4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->fromDatabaseObject(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/dao/Chatter;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v1

    move-object v3, v1

    :goto_0
    if-eqz v3, :cond_2

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getLoaders(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->updateElement(Lcom/lumiyaviewer/lumiya/utils/Identifiable;)V

    goto :goto_1

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getLastMessageID()Ljava/lang/Long;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->unreadCountsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventBus:Lcom/google/common/eventbus/EventBus;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v0

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v0, v3, :cond_3

    const/4 v0, 0x1

    :goto_2
    invoke-direct {v4, p1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;ZZ)V

    invoke-virtual {v1, v4}, Lcom/google/common/eventbus/EventBus;->post(Ljava/lang/Object;)V

    :cond_2
    return-void

    :cond_3
    move v0, v2

    goto :goto_2

    :cond_4
    move-object v3, v1

    goto :goto_0
.end method


# virtual methods
.method public HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;

    invoke-direct {v1, p3, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$8;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public addDisplayedChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->displayedChatters:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public addObjectMessageListener(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->objectMessageListenersLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->objectMessageListeners:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public clearChatHistory(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$1;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method getActiveChattersList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersDisplayDataList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->onListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersDisplayDataList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;)V

    return-object v0
.end method

.method public getChatEventBus()Lcom/google/common/eventbus/EventBus;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventBus:Lcom/google/common/eventbus/EventBus;

    return-object v0
.end method

.method public getChatMessage(J)Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/dao/Chatter;
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v0

    return-object v0
.end method

.method getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)Lcom/lumiyaviewer/lumiya/dao/Chatter;
    .locals 10
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getSessionID()Ljava/util/UUID;

    move-result-object v0

    move-object v1, v0

    :goto_0
    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventLock:Ljava/lang/Object;

    monitor-enter v6

    :try_start_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v5

    if-eqz v5, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->findChatterQuery:Lde/greenrobot/dao/query/Query;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->forCurrentThread()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v0, v8, v7}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x1

    invoke-virtual {v0, v7, v5}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    :goto_1
    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/Chatter;

    if-eqz p2, :cond_1

    const-string/jumbo v7, "markNewSession: result has %b, cur %s, last %s"

    const/4 v5, 0x3

    new-array v8, v5, [Ljava/lang/Object;

    if-eqz v0, :cond_5

    move v5, v4

    :goto_2
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const/4 v9, 0x0

    aput-object v5, v8, v9

    const/4 v5, 0x1

    aput-object v1, v8, v5

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getLastSessionID()Ljava/util/UUID;

    move-result-object v2

    :cond_0
    const/4 v5, 0x2

    aput-object v2, v8, v5

    invoke-static {v7, v8}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    if-eqz p2, :cond_6

    if-eqz v0, :cond_6

    if-eqz v1, :cond_6

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getLastSessionID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_8

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getLastSessionID()Ljava/util/UUID;

    move-result-object v2

    if-eqz v2, :cond_7

    move v2, v4

    :goto_3
    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setLastSessionID(Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->update(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v1, v2

    :goto_4
    monitor-exit v6

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$6;

    invoke-direct {v2, p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_2
    return-object v0

    :cond_3
    move-object v1, v2

    goto/16 :goto_0

    :cond_4
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->findChatterQueryNullUUID:Lde/greenrobot/dao/query/Query;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->forCurrentThread()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v7, 0x0

    invoke-virtual {v0, v7, v5}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v6

    throw v0

    :cond_5
    move v5, v3

    goto :goto_2

    :cond_6
    move v1, v3

    goto :goto_4

    :cond_7
    move v2, v3

    goto :goto_3

    :cond_8
    move v1, v3

    goto :goto_4
.end method

.method public getMessageLoader(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;
    .locals 7
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v4

    const/16 v3, 0x64

    const/4 v5, 0x0

    move-object v2, p1

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;ILjava/util/concurrent/Executor;ZLcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->messageLoadersLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->messageLoaders:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_2

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->messageLoaders:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v1

    :goto_0
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v3

    return-object v0

    :cond_2
    move-object v2, v1

    goto :goto_0
.end method

.method public getMessages(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lde/greenrobot/dao/query/LazyList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            ")",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/ChatMessage;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->ChatterID:Lde/greenrobot/dao/Property;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v0}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v0

    new-array v2, v3, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v1, v0, v2}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Lde/greenrobot/dao/Property;

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Id:Lde/greenrobot/dao/Property;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lde/greenrobot/dao/query/QueryBuilder;->orderAsc([Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->listLazy()Lde/greenrobot/dao/query/LazyList;

    move-result-object v0

    return-object v0
.end method

.method public getUnreadCounts()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->unreadCountsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_10179(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/dao/Chatter;)V
    .locals 2

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->makeSessionMark(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;J)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_13379(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->handleChatEventInternal(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_23064(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->clearChatHistoryInternal(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_25047(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->markChatterInactiveInternal(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_25217(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-eq v1, v2, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatEventLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getMuted()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setMuted(Z)V

    const/4 v0, 0x1

    :cond_0
    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->update(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit v1

    :cond_2
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_26357(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->notifyChatEventUpdatedInternal(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_26532(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->notifyTeleportCompleteInternal(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_5516(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->clearUnreadCount(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return-void
.end method

.method public markChatterInactive(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$7;

    invoke-direct {v1, p2, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$7;-><init>(ZLjava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public notifyChatEventUpdated(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$3;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$3;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public notifyTeleportComplete(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$4;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$4;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onMessageSourcesResolved(Ljava/util/Set;Lcom/lumiyaviewer/lumiya/dao/UserName;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ")V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setSenderName(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setSenderLegacyName(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->update(Ljava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->onMessageUpdated(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public releaseMessageLoader(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;)V
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->messageLoadersLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->messageLoaders:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_1

    if-ne v0, p2, :cond_0

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_2
    monitor-exit v1

    return-void
.end method

.method public removeDisplayedChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->displayedChatters:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public removeObjectMessageListener(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->objectMessageListenersLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->objectMessageListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public unmuteChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$5;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI$5;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
