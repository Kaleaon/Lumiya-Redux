.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$1;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$OnMessageSourcesResolvedListener;
    }
.end annotation


# instance fields
.field private final dbExecutor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final listener:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$OnMessageSourcesResolvedListener;

.field private final lock:Ljava/lang/Object;

.field private final onUserName:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ">;"
        }
    .end annotation
.end field

.field private final requestEntryMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Ljava/util/concurrent/Executor;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->dbExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$OnMessageSourcesResolvedListener;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->listener:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$OnMessageSourcesResolvedListener;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->lock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->onUserName:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->requestEntryMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$OnMessageSourcesResolvedListener;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->lock:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->requestEntryMap:Ljava/util/Map;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->onUserName:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->listener:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$OnMessageSourcesResolvedListener;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->dbExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method public requestResolve(Ljava/util/UUID;Ljava/lang/Long;)V
    .locals 4

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->lock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->requestEntryMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;

    invoke-direct {v0, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;Ljava/util/UUID;Ljava/lang/Long;)V

    const/4 v1, 0x1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->requestEntryMap:Ljava/util/Map;

    invoke-interface {v3, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v2

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->subscribe()V

    :cond_0
    return-void

    :cond_1
    :try_start_1
    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->addMessageID(Ljava/lang/Long;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method
