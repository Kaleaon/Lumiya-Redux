.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;
    }
.end annotation


# static fields
.field private static final MAX_POPUPS:I = 0x63


# instance fields
.field private displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final freshPopupsCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private lastEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final listenerLock:Ljava/lang/Object;

.field private objectPopupListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private objectPopupListenerExecutor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;",
            ">;"
        }
    .end annotation
.end field

.field private popupAnimated:Z

.field private final popupWatchers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final unreadPopupCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListenerExecutor:Ljava/util/concurrent/Executor;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->lastEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->popupAnimated:Z

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->freshPopupsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->unreadPopupCount:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->popupWatchers:Ljava/util/Set;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-void
.end method

.method private addObjectPopupInternal(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;->add(ILjava/lang/Object;)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;->size()I

    move-result v0

    const/16 v1, 0x63

    if-le v0, v1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectPopupsManager_3306(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;I)V
    .locals 0

    invoke-interface {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onObjectPopupCountChanged(I)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectPopupsManager_3571(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 0

    invoke-interface {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onNewObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectPopupsManager_6669(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;I)V
    .locals 0

    invoke-interface {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onObjectPopupCountChanged(I)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectPopupsManager_7628(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;)V
    .locals 1

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onNewObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectPopupsManager_8558(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;)V
    .locals 1

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onObjectPopupCountChanged(I)V

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onNewObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void
.end method

.method private notifyCountUpdated()V
    .locals 4

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListenerExecutor:Ljava/util/concurrent/Executor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v2

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;->size()I

    move-result v2

    if-eqz v1, :cond_2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$4;

    invoke-direct {v3, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$4;-><init>(ILjava/lang/Object;)V

    invoke-interface {v1, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    :goto_1
    return-void

    :cond_1
    move-object v1, v0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_2
    invoke-interface {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onObjectPopupCountChanged(I)V

    goto :goto_1
.end method


# virtual methods
.method addObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 5

    const/4 v1, 0x0

    const/4 v0, 0x0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListenerExecutor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    if-nez v4, :cond_0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->popupAnimated:Z

    const/4 v1, 0x1

    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->popupWatchers:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    if-nez v4, :cond_1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->freshPopupsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->unreadPopupCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->lastEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit v3

    if-nez v1, :cond_5

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->addObjectPopupInternal(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;->size()I

    move-result v1

    if-eqz v0, :cond_2

    if-eqz v2, :cond_4

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$3;

    invoke-direct {v3, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$3;-><init>(ILjava/lang/Object;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    return-void

    :cond_3
    move-object v2, v0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_4
    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onObjectPopupCountChanged(I)V

    goto :goto_1

    :cond_5
    if-eqz v2, :cond_6

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$2;

    invoke-direct {v1, v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$2;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v2, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    :cond_6
    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onNewObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    goto :goto_1
.end method

.method public addPopupWatcher(Ljava/lang/Object;)V
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->popupWatchers:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->freshPopupsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->unreadPopupCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public cancelObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 5

    const/4 v1, 0x0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v3

    if-eqz p1, :cond_4

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    if-ne p1, v0, :cond_4

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;

    :goto_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListenerExecutor:Ljava/util/concurrent/Executor;

    :goto_1
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->lastEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    if-ne p1, v4, :cond_0

    const/4 v4, 0x0

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->lastEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v3

    if-eqz v0, :cond_1

    if-eqz v2, :cond_5

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_1
    :goto_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->notifyCountUpdated()V

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    return-void

    :cond_3
    move-object v0, v1

    goto :goto_0

    :cond_4
    move-object v0, v1

    move-object v2, v1

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_5
    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onNewObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    goto :goto_2
.end method

.method clearObjectPopups()V
    .locals 7

    const/4 v6, 0x0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v2

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;

    :goto_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListenerExecutor:Ljava/util/concurrent/Executor;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->unreadPopupCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->freshPopupsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    const/4 v4, 0x0

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->lastEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;->clear()V

    if-eqz v0, :cond_0

    if-eqz v3, :cond_2

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$1;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$gJtxV6TiuzFNXMR7-6og75a4tFE$1;-><init>(Ljava/lang/Object;)V

    invoke-interface {v3, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    return-void

    :cond_1
    move-object v0, v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_2
    invoke-interface {v0, v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onObjectPopupCountChanged(I)V

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;->onNewObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    goto :goto_1
.end method

.method public dismissDisplayedObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    if-ne p1, v2, :cond_1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->freshPopupsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->unreadPopupCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    if-eqz p1, :cond_0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->addObjectPopupInternal(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->notifyCountUpdated()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->updateUnreadNotifications()V

    return-void

    :cond_1
    if-nez p1, :cond_2

    :try_start_1
    iget-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_2
    move-object p1, v0

    goto :goto_0
.end method

.method public getDisplayedObjectPopup()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method getNotification(Z)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;
    .locals 5
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->unreadPopupCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->freshPopupsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    move-result v0

    move v1, v0

    :goto_0
    const/4 v0, 0x0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->lastEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    instance-of v4, v4, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    if-eqz v4, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->lastEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getSource()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    move-result-object v0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceName(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;

    move-result-object v4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->lastEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;->getRawText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;

    move-result-object v0

    :cond_0
    invoke-static {v1, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->create(IILcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v2

    return-object v0

    :cond_1
    move v1, v0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method public getObjectPopupCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;->size()I

    move-result v0

    return v0
.end method

.method public getObjectPopups()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    return-object v0
.end method

.method public mustAnimatePopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)Z
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->displayedPopupEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    if-ne p1, v2, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->popupAnimated:Z

    xor-int/lit8 v0, v0, 0x1

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->popupAnimated:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public removeObjectPopupListener(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListenerExecutor:Ljava/util/concurrent/Executor;
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

.method public removePopupWatcher(Ljava/lang/Object;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->popupWatchers:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setObjectPopupListener(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->listenerLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListener:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->objectPopupListenerExecutor:Ljava/util/concurrent/Executor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
