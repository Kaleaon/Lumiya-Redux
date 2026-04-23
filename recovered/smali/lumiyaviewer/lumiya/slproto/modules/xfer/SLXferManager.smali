.class public Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# instance fields
.field private activeTransferIDs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private activeTransfers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;",
            ">;"
        }
    .end annotation
.end field

.field private nextID:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 4

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->activeTransfers:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->activeTransferIDs:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x1

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->nextID:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method


# virtual methods
.method public declared-synchronized HandleSendXferPacket(Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;)V
    .locals 3
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;->XferID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket$XferID;->ID:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->activeTransfers:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->HandleDataPacket(Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->isCompleted()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->activeTransfers:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->activeTransferIDs:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->getFilename()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->invokeListeners()V
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

.method public declared-synchronized RequestXfer(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;ZLcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;Ljava/lang/Object;)V
    .locals 7

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->activeTransferIDs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->activeTransfers:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p4, p5}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->addListener(Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->nextID:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->activeTransferIDs:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;-><init>(JLjava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/ELLPath;Z)V

    invoke-virtual {v1, p4, p5}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->addListener(Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer$SLXferCompletionListener;Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;->activeTransfers:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer;->StartTransfer(Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
