.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$1;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$2;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;
    }
.end annotation


# static fields
.field private static final FRESH_MESSAGES_NOTIFICATION_INTERVAL:J = 0xbb8L

.field private static final MASK_ENABLED_ALL:I = 0x7

.field private static final MASK_ENABLED_GROUP:I = 0x2

.field private static final MASK_ENABLED_IM:I = 0x4

.field private static final MASK_ENABLED_LOCAL:I = 0x1

.field private static final MAX_CHATTERS_PER_NOTIFICATION:I = 0x3

.field private static final MAX_MESSAGES_PER_NOTIFICATION:I = 0x3

.field public static final unreadNotificationKey:Ljava/lang/Boolean;


# instance fields
.field private final chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final chatterSources:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;",
            ">;"
        }
    .end annotation
.end field

.field private final emptyNotification:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

.field private final freshMessageCounts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final freshMessageCountsLock:Ljava/lang/Object;

.field private final lastFreshMessageNotification:Ljava/util/concurrent/atomic/AtomicLong;

.field private final maskEnabled:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mostImportantNotificationType:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            ">;"
        }
    .end annotation
.end field

.field private notifyCapture:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final notifyCaptureLock:Ljava/lang/Object;

.field private final totalSourcesCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final totalUnreadCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final unreadNotificationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Ljava/lang/Boolean;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;",
            ">;"
        }
    .end annotation
.end field

.field private final updateChatterDataRunnable:Ljava/lang/Runnable;

.field private final updateExecutor:Ljava/util/concurrent/Executor;

.field private final updateNotificationDataRunnable:Ljava/lang/Runnable;

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->unreadNotificationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateChatterDataRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)Ljava/util/concurrent/Executor;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateNotificationDataRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->getUnreadNotification()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadChatterData()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->unreadNotificationKey:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V
    .locals 8
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/dao/DaoSession;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/4 v3, 0x4

    const/high16 v4, 0x3f400000    # 0.75f

    const/4 v5, 0x2

    invoke-direct {v0, v3, v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatterSources:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v3, 0x7

    invoke-direct {v0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->maskEnabled:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->totalUnreadCount:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->totalSourcesCount:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->mostImportantNotificationType:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->freshMessageCounts:Ljava/util/Map;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->freshMessageCountsLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v4, 0x0

    invoke-direct {v0, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->lastFreshMessageNotification:Ljava/util/concurrent/atomic/AtomicLong;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->notifyCaptureLock:Ljava/lang/Object;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->notifyCapture:Ljava/lang/ref/WeakReference;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateChatterDataRunnable:Ljava/lang/Runnable;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateNotificationDataRunnable:Ljava/lang/Runnable;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->unreadNotificationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getChatterDao()Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getChatMessageDao()Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseRunOnceExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v1, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->create(IILcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v7

    move-object v3, v2

    move v4, v1

    move-object v5, v2

    move-object v6, v2

    invoke-static/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->create(Ljava/util/UUID;ILjava/util/List;Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;ILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->emptyNotification:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->unreadNotificationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$3;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getDefaultSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateTypesFromPreferences(Landroid/content/SharedPreferences;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;)V

    return-void
.end method

.method private getUnreadNotification()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;
    .locals 22
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->lastFreshMessageNotification:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    const-wide/16 v6, 0xbb8

    add-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-ltz v2, :cond_5

    const/4 v2, 0x1

    move v11, v2

    :goto_0
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v15

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->VALUES:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_0
    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    const/4 v7, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v14, 0x0

    const/4 v2, 0x0

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatterSources:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_19

    new-instance v17, Ljava/util/HashMap;

    invoke-direct/range {v17 .. v17}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatterSources:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v18

    move v8, v6

    move v9, v7

    move-object v6, v4

    move-object v7, v5

    move v4, v2

    move-object v5, v3

    :goto_2
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v0, v3, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v12

    invoke-virtual {v12}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->getNotificationType()Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    move-result-object v12

    if-ne v12, v10, :cond_18

    invoke-virtual/range {v19 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v13

    sget-object v20, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-object/from16 v0, v20

    if-eq v13, v0, :cond_1

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_6

    :cond_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v13, v2}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/dao/Chatter;

    if-eqz v2, :cond_18

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getUnreadCount()I

    move-result v20

    add-int v13, v9, v20

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v3

    const/4 v9, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v0, v3, v9, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->create(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;Ljava/util/List;I)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    move-result-object v3

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v9

    move-object/from16 v0, v17

    invoke-interface {v0, v9, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v7, :cond_2

    invoke-virtual {v12, v7}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-lez v3, :cond_7

    :cond_2
    move-object v9, v12

    :goto_3
    if-eqz v11, :cond_16

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->freshMessageCountsLock:Ljava/lang/Object;

    move-object/from16 v19, v0

    monitor-enter v19

    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->freshMessageCounts:Ljava/util/Map;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-eqz v3, :cond_17

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    :goto_4
    monitor-exit v19

    add-int/2addr v8, v3

    if-eqz v3, :cond_16

    if-nez v5, :cond_8

    xor-int/lit8 v3, v4, 0x1

    if-eqz v3, :cond_8

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v5

    :cond_3
    :goto_5
    if-eqz v6, :cond_4

    invoke-virtual {v12, v6}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->compareTo(Ljava/lang/Enum;)I

    move-result v2

    if-lez v2, :cond_9

    :cond_4
    move v2, v4

    move-object v3, v5

    move v6, v8

    move v7, v13

    move-object v4, v12

    move-object v5, v9

    :goto_6
    move v8, v6

    move v9, v7

    move-object v6, v4

    move-object v7, v5

    move v4, v2

    move-object v5, v3

    goto/16 :goto_2

    :cond_5
    const/4 v2, 0x0

    move v11, v2

    goto/16 :goto_0

    :cond_6
    move v2, v4

    move-object v3, v5

    move-object v4, v6

    move-object v5, v7

    move v6, v8

    move v7, v9

    goto :goto_6

    :cond_7
    move-object v9, v7

    goto :goto_3

    :catchall_0
    move-exception v2

    monitor-exit v19

    throw v2

    :cond_8
    if-eqz v5, :cond_3

    const/4 v5, 0x0

    const/4 v4, 0x1

    goto :goto_5

    :cond_9
    move v2, v4

    move-object v3, v5

    move v7, v13

    move-object v5, v9

    move-object v4, v6

    move v6, v8

    goto :goto_6

    :cond_a
    invoke-interface/range {v17 .. v17}, Ljava/util/Map;->size()I

    move-result v2

    const/4 v3, 0x1

    if-gt v2, v3, :cond_d

    const/4 v2, 0x3

    move v4, v2

    :goto_7
    new-instance v13, Ljava/util/ArrayList;

    invoke-interface/range {v17 .. v17}, Ljava/util/Map;->size()I

    move-result v2

    invoke-direct {v13, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface/range {v17 .. v17}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v17

    move-object v12, v14

    :goto_8
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    new-instance v14, Ljava/util/LinkedList;

    invoke-direct {v14}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessagesCount()I

    move-result v3

    if-le v3, v4, :cond_b

    move v3, v4

    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v18

    sget-object v19, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->ChatterID:Lde/greenrobot/dao/Property;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v19

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Lde/greenrobot/dao/query/WhereCondition;

    move-object/from16 v20, v0

    invoke-virtual/range {v18 .. v20}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Lde/greenrobot/dao/Property;

    move-object/from16 v19, v0

    sget-object v20, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Id:Lde/greenrobot/dao/Property;

    const/16 v21, 0x0

    aput-object v20, v19, v21

    invoke-virtual/range {v18 .. v19}, Lde/greenrobot/dao/query/QueryBuilder;->orderDesc([Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Lde/greenrobot/dao/query/QueryBuilder;->limit(I)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v3

    invoke-virtual {v3}, Lde/greenrobot/dao/query/QueryBuilder;->list()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_c
    :goto_9
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_e

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->loadFromDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v3

    if-eqz v3, :cond_c

    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-interface {v14, v0, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_9

    :cond_d
    const/4 v2, 0x1

    move v4, v2

    goto/16 :goto_7

    :cond_e
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    invoke-virtual {v3, v14}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->withMessages(Ljava/util/List;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    move-result-object v3

    if-eqz v5, :cond_15

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2, v5}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15

    move-object v2, v3

    :goto_a
    invoke-interface {v13, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v12, v2

    goto/16 :goto_8

    :cond_f
    move-object v4, v13

    move-object v5, v7

    move v3, v9

    move-object v7, v6

    move v6, v8

    move-object v8, v12

    :goto_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v2

    invoke-virtual {v2, v11}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->getNotification(Z)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v9

    if-eqz v11, :cond_11

    if-nez v6, :cond_10

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->freshObjectPopupsCount()I

    move-result v2

    if-eqz v2, :cond_11

    :cond_10
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->lastFreshMessageNotification:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-virtual {v2, v12, v13}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    :cond_11
    const/4 v2, 0x0

    if-eqz v4, :cond_12

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_12

    const/4 v2, 0x1

    :cond_12
    if-nez v3, :cond_13

    if-eqz v2, :cond_13

    if-nez v6, :cond_13

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->isEmpty()Z

    move-result v2

    :goto_c
    if-nez v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-static/range {v2 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->create(Ljava/util/UUID;ILjava/util/List;Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;ILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

    move-result-object v2

    invoke-virtual {v15, v10, v2}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    goto/16 :goto_1

    :cond_13
    const/4 v2, 0x0

    goto :goto_c

    :cond_14
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v15}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->create(Ljava/util/UUID;Lcom/google/common/collect/ImmutableMap;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;

    move-result-object v2

    return-object v2

    :cond_15
    move-object v2, v12

    goto :goto_a

    :cond_16
    move v2, v4

    move-object v3, v5

    move v7, v13

    move-object v5, v9

    move-object v4, v6

    move v6, v8

    goto/16 :goto_6

    :cond_17
    move v3, v7

    goto/16 :goto_4

    :cond_18
    move v2, v4

    move-object v3, v5

    move-object v4, v6

    move-object v5, v7

    move v6, v8

    move v7, v9

    goto/16 :goto_6

    :cond_19
    move v3, v7

    move-object v7, v4

    move-object v4, v8

    move-object v8, v14

    goto :goto_b
.end method

.method private setEnabledMask(I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->maskEnabled:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    move-result v0

    if-eq v0, p1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    :cond_0
    return-void
.end method

.method private updateTypesFromPreferences(Landroid/content/SharedPreferences;)V
    .locals 3

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getInstance()Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->areNotificationsSystemControlled()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v0, 0x7

    :cond_0
    :goto_0
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->setEnabledMask(I)V

    return-void

    :cond_1
    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getEnableKey()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_2

    move v0, v1

    :cond_2
    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getEnableKey()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_3

    or-int/lit8 v0, v0, 0x2

    :cond_3
    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getEnableKey()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    or-int/lit8 v0, v0, 0x4

    goto :goto_0
.end method

.method private updateUnreadChatterData()V
    .locals 12

    const/4 v11, 0x3

    const/4 v8, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->maskEnabled:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    if-nez v3, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->totalUnreadCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->totalSourcesCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatterSources:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->mostImportantNotificationType:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    :cond_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v4, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->UnreadCount:Lde/greenrobot/dao/Property;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Lde/greenrobot/dao/Property;->gt(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v4

    new-array v5, v8, [Lde/greenrobot/dao/query/WhereCondition;

    sget-object v6, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Muted:Lde/greenrobot/dao/Property;

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v6, v7}, Lde/greenrobot/dao/Property;->notEq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {v0, v4, v5}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    const/4 v4, 0x7

    if-eq v3, v4, :cond_6

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v11}, Ljava/util/ArrayList;-><init>(I)V

    and-int/lit8 v5, v3, 0x1

    if-eqz v5, :cond_3

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    and-int/lit8 v5, v3, 0x2

    if-eqz v5, :cond_4

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    and-int/lit8 v3, v3, 0x4

    if-eqz v3, :cond_5

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Type:Lde/greenrobot/dao/Property;

    invoke-virtual {v3, v4}, Lde/greenrobot/dao/Property;->in(Ljava/util/Collection;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    new-array v4, v1, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v0, v3, v4}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    :cond_6
    new-array v3, v8, [Lde/greenrobot/dao/Property;

    sget-object v4, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->LastMessageID:Lde/greenrobot/dao/Property;

    aput-object v4, v3, v1

    invoke-virtual {v0, v3}, Lde/greenrobot/dao/query/QueryBuilder;->orderDesc([Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->listLazy()Lde/greenrobot/dao/query/LazyList;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move-object v3, v2

    move v4, v1

    move v5, v1

    move-object v1, v2

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/Chatter;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v6

    invoke-static {v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->fromDatabaseObject(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/dao/Chatter;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v6

    if-eqz v6, :cond_e

    if-nez v3, :cond_7

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    :cond_7
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v8

    if-ge v8, v11, :cond_8

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v3, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatterSources:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_8

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatterSources:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v9

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-direct {v10, v6, p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    invoke-interface {v8, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v6

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->getNotificationType()Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    move-result-object v6

    if-eqz v1, :cond_9

    invoke-virtual {v6, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-lez v8, :cond_a

    :cond_9
    move-object v1, v6

    :cond_a
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getUnreadCount()I

    move-result v0

    add-int/2addr v5, v0

    add-int/lit8 v4, v4, 0x1

    move-object v0, v1

    move-object v1, v3

    move v3, v4

    move v4, v5

    :goto_2
    move v5, v4

    move v4, v3

    move-object v3, v1

    move-object v1, v0

    goto :goto_1

    :cond_b
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->totalUnreadCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->totalSourcesCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->mostImportantNotificationType:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->chatterSources:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_c
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    if-eqz v3, :cond_d

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_c

    :cond_d
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_3

    :cond_e
    move-object v0, v1

    move-object v1, v3

    move v3, v4

    move v4, v5

    goto :goto_2
.end method


# virtual methods
.method public addFreshMessage(Lcom/lumiyaviewer/lumiya/dao/Chatter;)V
    .locals 6
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/Chatter;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->maskEnabled:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    if-eqz v3, :cond_8

    const/4 v4, 0x7

    if-ne v3, v4, :cond_2

    :cond_0
    :goto_0
    if-eqz v0, :cond_7

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->freshMessageCountsLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->freshMessageCounts:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->freshMessageCounts:Ljava/util/Map;

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v3

    :cond_1
    :goto_2
    return-void

    :cond_2
    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getType()I

    move-result v5

    aget-object v4, v4, v5

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v4, v5, :cond_3

    and-int/lit8 v5, v3, 0x4

    if-nez v5, :cond_0

    :cond_3
    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v4, v5, :cond_4

    and-int/lit8 v5, v3, 0x2

    if-nez v5, :cond_0

    :cond_4
    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v4, v5, :cond_5

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_0

    :cond_5
    move v0, v1

    goto :goto_0

    :cond_6
    move v0, v1

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_7
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->freshMessageCountsLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->freshMessageCounts:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v1

    goto :goto_2

    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_8
    move v0, v1

    goto :goto_0
.end method

.method public captureNotify(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;Landroid/content/Intent;)Landroid/content/Intent;
    .locals 5
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->notifyCaptureLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->notifyCapture:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->notifyCapture:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v2

    const-string/jumbo v2, "NotifyCapture: capture = %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;->onGetNotifyCaptureIntent(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_0
    return-object v1

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public clearFreshMessages(Lcom/lumiyaviewer/lumiya/dao/Chatter;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/Chatter;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->freshMessageCountsLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->freshMessageCounts:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public clearNotifyCapture(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->notifyCaptureLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->notifyCapture:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->notifyCapture:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->notifyCapture:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public getUnreadNotifications()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/lang/Boolean;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->unreadNotificationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateExecutor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateNotificationDataRunnable:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onGlobalPreferencesChanged(Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;)V
    .locals 1
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;->preferences:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;->preferences:Landroid/content/SharedPreferences;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateTypesFromPreferences(Landroid/content/SharedPreferences;)V

    :cond_0
    return-void
.end method

.method public setNotifyCapture(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->notifyCaptureLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->notifyCapture:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method updateUnreadNotifications()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->unreadNotificationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->unreadNotificationKey:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method
