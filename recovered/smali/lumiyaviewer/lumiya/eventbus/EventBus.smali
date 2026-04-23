.class public Lcom/lumiyaviewer/lumiya/eventbus/EventBus;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;,
        Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;,
        Lcom/lumiyaviewer/lumiya/eventbus/EventBus$InstanceHolder;
    }
.end annotation


# instance fields
.field private final handlers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->handlers:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/eventbus/EventBus;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public declared-synchronized publish(Ljava/lang/Object;)V
    .locals 9

    monitor-enter p0

    :try_start_0
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->handlers:Ljava/util/List;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;

    move-object v2, v0

    invoke-virtual {v2, p1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;->matchesEvent(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;->getSubscriber()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;->getActivity()Landroid/app/Activity;

    move-result-object v3

    if-nez v4, :cond_1

    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    :cond_1
    :try_start_1
    new-instance v1, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;->getHandler()Landroid/os/Handler;

    move-result-object v6

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;-><init>(Ljava/lang/Object;Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/reflect/Method;Landroid/os/Handler;)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->runOnUIThread()V

    goto :goto_0

    :cond_2
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->handlers:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :cond_3
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized subscribe(Landroid/app/Activity;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1, p1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;Landroid/app/Activity;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized subscribe(Ljava/lang/Object;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    instance-of v1, p1, Landroid/app/Activity;

    if-eqz v1, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    move-object v1, v0

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;Landroid/app/Activity;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_0
    const/4 v1, 0x0

    :try_start_1
    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;Landroid/app/Activity;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized subscribe(Ljava/lang/Object;Landroid/app/Activity;)V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;Landroid/app/Activity;Landroid/os/Handler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized subscribe(Ljava/lang/Object;Landroid/app/Activity;Landroid/os/Handler;)V
    .locals 9

    const/4 v1, 0x0

    monitor-enter p0

    :try_start_0
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->handlers:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;->getSubscriber()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    if-ne v4, p1, :cond_1

    monitor-exit p0

    return-void

    :cond_1
    if-nez v4, :cond_0

    :try_start_1
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_2
    :try_start_2
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->handlers:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v7

    array-length v8, v7

    move v6, v1

    :goto_2
    if-ge v6, v8, :cond_6

    aget-object v2, v7, v6

    const-class v0, Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;

    if-nez v0, :cond_4

    :goto_3
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_2

    :cond_4
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    array-length v0, v1

    const/4 v3, 0x1

    if-eq v0, v3, :cond_5

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "EventHandler methods must specify a single Object paramter."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    new-instance v0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;

    const/4 v3, 0x0

    aget-object v1, v1, v3

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/Object;Landroid/app/Activity;Landroid/os/Handler;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->handlers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    :cond_6
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized unsubscribe(Ljava/lang/Object;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->handlers:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;->getSubscriber()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    if-ne v3, p1, :cond_0

    :cond_1
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_2
    :try_start_1
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->handlers:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :cond_3
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized unsubscribeActivity(Landroid/app/Activity;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->handlers:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;->getActivity()Landroid/app/Activity;

    move-result-object v3

    if-ne v3, p1, :cond_0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    :try_start_1
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$HandlerInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->handlers:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :cond_2
    monitor-exit p0

    return-void
.end method
