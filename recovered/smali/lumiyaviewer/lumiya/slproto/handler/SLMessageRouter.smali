.class public Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerInfo;,
        Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;
    }
.end annotation


# instance fields
.field private eventQueueMessageHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;",
            "Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;",
            ">;"
        }
    .end annotation
.end field

.field private messageHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->messageHandlers:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->eventQueueMessageHandlers:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public declared-synchronized handleEventQueueMessage(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->eventQueueMessageHandlers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;->invokeAll(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized handleMessage(Ljava/lang/Object;)Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->messageHandlers:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;->invokeAll(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized registerHandler(Ljava/lang/Object;)V
    .locals 9

    const/4 v8, 0x1

    const/4 v0, 0x0

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v2

    array-length v3, v2

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_6

    aget-object v4, v2, v1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;

    if-eqz v0, :cond_2

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    array-length v5, v0

    if-eq v5, v8, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "SLMessageHandler methods must specify a single SLMessage paramter."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    const/4 v5, 0x0

    :try_start_1
    aget-object v5, v0, v5

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerInfo;

    invoke-direct {v6, v4, p1}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerInfo;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->messageHandlers:Ljava/util/Map;

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;

    const/4 v7, 0x0

    invoke-direct {v0, v7}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;)V

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->messageHandlers:Ljava/util/Map;

    invoke-interface {v7, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-virtual {v0, v6}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;->add(Ljava/lang/Object;)Z

    :cond_2
    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLEventQueueMessageHandler;

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLEventQueueMessageHandler;

    if-eqz v0, :cond_5

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    array-length v5, v5

    if-eq v5, v8, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "SLMessageHandler methods must specify a single LLSDNode paramter."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLEventQueueMessageHandler;->eventName()Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    move-result-object v5

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerInfo;

    invoke-direct {v6, v4, p1}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerInfo;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->eventQueueMessageHandlers:Ljava/util/Map;

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;

    if-nez v0, :cond_4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;

    const/4 v4, 0x0

    invoke-direct {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->eventQueueMessageHandlers:Ljava/util/Map;

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    invoke-virtual {v0, v6}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_5
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_6
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized unregisterHandler(Ljava/lang/Object;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->messageHandlers:Ljava/util/Map;

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

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;->deleteAll(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->eventQueueMessageHandlers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;->deleteAll(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :cond_1
    monitor-exit p0

    return-void
.end method
