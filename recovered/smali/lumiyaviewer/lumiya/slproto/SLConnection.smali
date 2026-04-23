.class public Lcom/lumiyaviewer/lumiya/slproto/SLConnection;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final DEFAULT_IDLE_INTERVAL:I = 0x3e8


# instance fields
.field private selector:Ljava/nio/channels/Selector;

.field private volatile timer:Ljava/util/Timer;

.field private workingThread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "java.net.preferIPv4Stack"

    const-string/jumbo v1, "true"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v0, "java.net.preferIPv6Addresses"

    const-string/jumbo v1, "false"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :try_start_0
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->selector:Ljava/nio/channels/Selector;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->workingThread:Ljava/lang/Thread;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->timer:Ljava/util/Timer;

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public AddCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->workingThread:Ljava/lang/Thread;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/Thread;

    const-string/jumbo v1, "SLConnection"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->workingThread:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->workingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSelector()Ljava/nio/channels/Selector;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->selector:Ljava/nio/channels/Selector;

    return-object v0
.end method

.method public getTimer()Ljava/util/Timer;
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->timer:Ljava/util/Timer;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/Timer;

    const-string/jumbo v1, "SLConnectionTimer"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/util/Timer;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->timer:Ljava/util/Timer;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->timer:Ljava/util/Timer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .locals 5

    const-string/jumbo v0, "working thread started"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_7

    const/16 v2, 0x3e8

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v3

    :goto_1
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->ProcessWakeup()V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->getIdleInterval()I
    :try_end_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/ConcurrentModificationException; {:try_start_1 .. :try_end_1} :catch_a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v0

    if-ge v0, v2, :cond_9

    :goto_2
    move v2, v0

    goto :goto_1

    :cond_0
    move v0, v2

    goto :goto_2

    :catch_0
    move-exception v0

    :cond_1
    :goto_3
    :try_start_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v3

    :cond_2
    :goto_4
    :try_start_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/channels/SelectionKey;

    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isReadable()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->ProcessReceive()Z

    :cond_3
    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isWritable()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->ProcessTransmit()Z

    :cond_4
    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->UpdateSelectorOps()V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->TryProcessIdle()V
    :try_end_3
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/nio/channels/ClosedSelectorException; {:try_start_3 .. :try_end_3} :catch_8
    .catch Ljava/util/ConcurrentModificationException; {:try_start_3 .. :try_end_3} :catch_9
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_4

    :catch_1
    move-exception v0

    :cond_5
    :goto_5
    :try_start_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->selector:Ljava/nio/channels/Selector;

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Ljava/nio/channels/Selector;->select(J)I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_0

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    :goto_6
    :try_start_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;

    if-eqz v1, :cond_6

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->ProcessNetworkError()V
    :try_end_5
    .catch Ljava/util/NoSuchElementException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/nio/channels/ClosedSelectorException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/util/ConcurrentModificationException; {:try_start_5 .. :try_end_5} :catch_6

    goto :goto_6

    :catch_3
    move-exception v0

    :cond_7
    :goto_7
    const-string/jumbo v0, "working thread exiting"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_6
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->workingThread:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->timer:Ljava/util/Timer;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLConnection;->timer:Ljava/util/Timer;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :cond_8
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :catch_4
    move-exception v0

    goto :goto_7

    :catch_5
    move-exception v0

    goto :goto_7

    :catch_6
    move-exception v0

    goto :goto_7

    :catch_7
    move-exception v0

    goto :goto_5

    :catch_8
    move-exception v0

    goto :goto_5

    :catch_9
    move-exception v0

    goto :goto_5

    :catch_a
    move-exception v0

    goto/16 :goto_3

    :cond_9
    move v0, v2

    goto/16 :goto_2
.end method
