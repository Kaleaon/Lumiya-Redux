.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;
.super Ljava/lang/Object;


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I = null

.field private static final MAX_MESSAGES_PER_BATCH:I = 0x64


# instance fields
.field private final chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private final context:Landroid/content/Context;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final dateFormat:Ljava/text/DateFormat;

.field private final dbExecutor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final flushChatterNames:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final flushChatters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;",
            ">;"
        }
    .end annotation
.end field

.field private lastConfirmedMessageID:J

.field private final localChatName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final messagesQuery:Lde/greenrobot/dao/query/Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/Query",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/ChatMessage;",
            ">;"
        }
    .end annotation
.end field

.field private myNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private final needsStopSyncing:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final syncMessageSent:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final syncServiceConnection:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;",
            ">;"
        }
    .end annotation
.end field

.field private final syncingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->values()[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 7
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SimpleDateFormat"
        }
    .end annotation

    const/4 v6, 0x1

    const/4 v2, 0x0

    const/4 v5, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncServiceConnection:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMessageSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->needsStopSyncing:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->flushChatters:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->flushChatterNames:Ljava/util/Set;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->lastConfirmedMessageID:J

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->myNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDaoSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getChatMessageDao()Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getChatterDao()Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->context:Landroid/content/Context;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->context:Landroid/content/Context;

    const v1, 0x7f090192

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->localChatName:Ljava/lang/String;

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dateFormat:Ljava/text/DateFormat;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Id:Lde/greenrobot/dao/Property;

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/Property;->gt(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v1

    new-array v2, v6, [Lde/greenrobot/dao/query/WhereCondition;

    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->SyncedToGoogleDrive:Lde/greenrobot/dao/Property;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    new-array v1, v6, [Lde/greenrobot/dao/Property;

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Id:Lde/greenrobot/dao/Property;

    aput-object v2, v1, v5

    invoke-virtual {v0, v1}, Lde/greenrobot/dao/query/QueryBuilder;->orderAsc([Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lde/greenrobot/dao/query/QueryBuilder;->limit(I)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->messagesQuery:Lde/greenrobot/dao/query/Query;

    return-void
.end method

.method private onChatterNameRetrieved(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$3;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$3;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private onFlushChatterNameRetrieved(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->flushChatters:Ljava/util/Map;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->flushChatterNames:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMoreMessages()V

    :cond_0
    return-void
.end method

.method private onMyNameRetrieved(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$4;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$4;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private processMessagesFlushed(Lcom/google/common/collect/ImmutableList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
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

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getSyncedToGoogleDrive()Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setSyncedToGoogleDrive(Z)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->update(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private resolveChatterName(Lcom/lumiyaviewer/lumiya/dao/Chatter;)Ljava/lang/String;
    .locals 5
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/Chatter;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getType()I

    move-result v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getType()I

    move-result v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    if-ne v0, v1, :cond_4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->fromDatabaseObject(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/dao/Chatter;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_3

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    :cond_2
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$1;-><init>(Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    const/4 v4, 0x1

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;Z)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->localChatName:Ljava/lang/String;

    return-object v0
.end method

.method private syncMoreMessages()V
    .locals 18

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMessageSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-nez v2, :cond_3

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->myNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-nez v2, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v3

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$2;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$2;-><init>(Ljava/lang/Object;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    const/4 v6, 0x1

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;Z)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->myNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->myNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->messagesQuery:Lde/greenrobot/dao/query/Query;

    invoke-virtual {v2}, Lde/greenrobot/dao/query/Query;->forCurrentThread()Lde/greenrobot/dao/query/Query;

    move-result-object v2

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->lastConfirmedMessageID:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    invoke-virtual {v2}, Lde/greenrobot/dao/query/Query;->listLazy()Lde/greenrobot/dao/query/LazyList;

    move-result-object v13

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v14

    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    move-wide v6, v2

    move v10, v4

    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->loadFromDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v4

    if-eqz v4, :cond_5

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getChatterID()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Lcom/lumiyaviewer/lumiya/dao/Chatter;

    if-eqz v5, :cond_5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->resolveChatterName(Lcom/lumiyaviewer/lumiya/dao/Chatter;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->context:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    const/4 v7, 0x0

    invoke-virtual {v4, v3, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Z)Ljava/lang/CharSequence;

    move-result-object v9

    new-instance v3, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getType()I

    move-result v4

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getUuid()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getId()Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "["

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dateFormat:Ljava/text/DateFormat;

    move-object/from16 v17, v0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getTimestamp()Ljava/util/Date;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v16, "] "

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct/range {v3 .. v9}, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;-><init>(ILjava/util/UUID;JLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v14, v3}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    iget-wide v6, v3, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->messageID:J

    add-int/lit8 v10, v10, 0x1

    const/16 v2, 0x64

    if-lt v10, v2, :cond_5

    :cond_1
    invoke-virtual {v13}, Lde/greenrobot/dao/query/LazyList;->close()V

    if-eqz v10, :cond_6

    new-instance v2, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v14}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v5

    move-object v4, v12

    invoke-direct/range {v2 .. v7}, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/util/List;J)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncServiceConnection:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    if-eqz v3, :cond_6

    sget-object v4, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogMessageBatch:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    invoke-virtual {v3, v4, v2}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;)Z

    move-result v2

    move v4, v2

    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->flushChatterNames:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncServiceConnection:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    if-eqz v2, :cond_2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->flushChatterNames:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    sget-object v5, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogFlushMessages:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    new-instance v6, Lcom/lumiyaviewer/lumiya/cloud/common/LogFlushMessages;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v7

    invoke-direct {v6, v7, v12, v3}, Lcom/lumiyaviewer/lumiya/cloud/common/LogFlushMessages;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v5, v6}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;)Z

    :cond_2
    :goto_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMessageSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->needsStopSyncing:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncServiceConnection:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMessageSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    if-eqz v2, :cond_4

    sget-object v3, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogFlushMessages:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    new-instance v4, Lcom/lumiyaviewer/lumiya/cloud/common/LogFlushMessages;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/lumiyaviewer/lumiya/cloud/common/LogFlushMessages;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;)Z

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->disconnect()V

    :cond_4
    return-void

    :cond_5
    move-wide v2, v6

    move v4, v10

    move-wide v6, v2

    move v10, v4

    goto/16 :goto_0

    :cond_6
    move v4, v11

    goto/16 :goto_1

    :cond_7
    move v4, v11

    goto :goto_2
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager-mthref-0()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMoreMessages()V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->onMyNameRetrieved(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager-mthref-2()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMoreMessages()V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager-mthref-3()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMoreMessages()V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager-mthref-4()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMoreMessages()V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager-mthref-5(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->onChatterNameRetrieved(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager-mthref-6(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->onFlushChatterNameRetrieved(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    return-void
.end method

.method flushChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$8;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_10038()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->needsStopSyncing:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMoreMessages()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_10254(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 4

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->-getcom-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->flushChatterNames:Ljava/util/Set;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->localChatName:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMoreMessages()V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->flushChatters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8;-><init>(Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    const/4 v3, 0x0

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;Z)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscribe()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_9602(J)V
    .locals 3

    iput-wide p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->lastConfirmedMessageID:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMessageSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncMoreMessages()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_9859(Lcom/google/common/collect/ImmutableList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->processMessagesFlushed(Lcom/google/common/collect/ImmutableList;)V

    return-void
.end method

.method public onMessagesFlushed(Lcom/google/common/collect/ImmutableList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$9;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$9;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onMessagesWritten(J)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$10;

    invoke-direct {v1, p1, p2, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$10;-><init>(JLjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public startSyncing(Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncServiceConnection:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->needsStopSyncing:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$5;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$5;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public stopSyncing()V
    .locals 2

    const-string/jumbo v0, "SyncManager: requested to stop syncing"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$6;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$6;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method syncNewMessages()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->syncingEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->dbExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$7;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$AZwop9CtlZWAAgrWZJSwnA0FdZ8$7;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
