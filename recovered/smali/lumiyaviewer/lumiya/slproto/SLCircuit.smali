.class public Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;
.super Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;


# static fields
.field private static final DEFAULT_IDLE_INTERVAL:I = 0x3e8

.field private static final FAST_IDLE_INTERVAL:I = 0x64

.field private static final MESSAGE_MAX_RETRIES:I = 0x3

.field private static final MESSAGE_TIMEOUT_MILLIS:I = 0x1388

.field private static final NEED_PING_TIMEOUT:J = 0x2710L

.field private static final PING_INTERVAL:J = 0x1388L

.field private static final TRACK_HANDLED_PACKETS:I = 0x400

.field private static final UNANSWERED_PINGS:I = 0x3


# instance fields
.field authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

.field public circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

.field private datagramChannel:Ljava/nio/channels/DatagramChannel;

.field protected final eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

.field protected gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

.field private handledPackets:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private idleHandlers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLIdleHandler;",
            ">;"
        }
    .end annotation
.end field

.field private lastPingID:B

.field private lastPingSent:J

.field private lastReceivedPacketMillis:J

.field private lastReceivedSeqnum:I

.field private lastSeqNum:Ljava/util/concurrent/atomic/AtomicInteger;

.field private messageRouter:Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;

.field private outgoingQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/SLMessage;",
            ">;"
        }
    .end annotation
.end field

.field private pendingAcks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private pingSentCount:I

.field private receivedAcks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private rxBuffer:Ljava/nio/ByteBuffer;

.field private selectionKey:Ljava/nio/channels/SelectionKey;

.field selector:Ljava/nio/channels/Selector;

.field private tempBuffer:Ljava/nio/ByteBuffer;

.field private timedOut:Z

.field private txBuffer:Ljava/nio/ByteBuffer;

.field private unackedQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/SLMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v4, 0x0

    const/high16 v3, 0x10000

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;-><init>()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    iput-wide v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastReceivedPacketMillis:J

    iput-wide v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastPingSent:J

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pingSentCount:I

    iput-byte v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastPingID:B

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->timedOut:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->messageRouter:Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->idleHandlers:Ljava/util/List;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getSelector()Ljava/nio/channels/Selector;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selector:Ljava/nio/channels/Selector;

    if-eqz p4, :cond_0

    iget-wide v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastReceivedPacketMillis:J

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastReceivedPacketMillis:J

    iget-object v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastSeqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastSeqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->outgoingQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->outgoingQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    iget-object v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->unackedQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->unackedQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    iget-object v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    iget-object v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->handledPackets:Ljava/util/Queue;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->handledPackets:Ljava/util/Queue;

    iget v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastReceivedSeqnum:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastReceivedSeqnum:I

    iget-object v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->receivedAcks:Ljava/util/List;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->receivedAcks:Ljava/util/List;

    iget-object v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->txBuffer:Ljava/nio/ByteBuffer;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->txBuffer:Ljava/nio/ByteBuffer;

    iget-object v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->tempBuffer:Ljava/nio/ByteBuffer;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->tempBuffer:Ljava/nio/ByteBuffer;

    iget-object v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->rxBuffer:Ljava/nio/ByteBuffer;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->rxBuffer:Ljava/nio/ByteBuffer;

    iget-object v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->datagramChannel:Ljava/nio/channels/DatagramChannel;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->datagramChannel:Ljava/nio/channels/DatagramChannel;

    iget-object v0, p4, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selectionKey:Ljava/nio/channels/SelectionKey;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selectionKey:Ljava/nio/channels/SelectionKey;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selectionKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0, p0}, Ljava/nio/channels/SelectionKey;->attach(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastReceivedPacketMillis:J

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastSeqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->outgoingQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->unackedQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->handledPackets:Ljava/util/Queue;

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastReceivedSeqnum:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->receivedAcks:Ljava/util/List;

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->txBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->tempBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->rxBuffer:Ljava/nio/ByteBuffer;

    invoke-static {}, Ljava/nio/channels/DatagramChannel;->open()Ljava/nio/channels/DatagramChannel;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->datagramChannel:Ljava/nio/channels/DatagramChannel;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->datagramChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v0, v2}, Ljava/nio/channels/DatagramChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->datagramChannel:Ljava/nio/channels/DatagramChannel;

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->socketAddress:Ljava/net/SocketAddress;

    invoke-virtual {v0, v1}, Ljava/nio/channels/DatagramChannel;->connect(Ljava/net/SocketAddress;)Ljava/nio/channels/DatagramChannel;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->datagramChannel:Ljava/nio/channels/DatagramChannel;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selector:Ljava/nio/channels/Selector;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/nio/channels/DatagramChannel;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selectionKey:Ljava/nio/channels/SelectionKey;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selectionKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0, p0}, Ljava/nio/channels/SelectionKey;->attach(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private DumpDebugBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
    .locals 3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, ": "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    if-ge v0, v2, :cond_0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    return-void
.end method

.method private ProcessResends()V
    .locals 10

    const/4 v2, 0x1

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->unackedQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->sentTimeMillis:J

    const-wide/16 v8, 0x1388

    add-long/2addr v6, v8

    cmp-long v4, v4, v6

    if-ltz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->retries:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->retries:I

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->retries:I

    const/4 v5, 0x3

    if-le v4, v5, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->handleMessageTimeout()V

    move v0, v1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_0
    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->isResent:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->sentTimeMillis:J

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->outgoingQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    move v0, v2

    goto :goto_1

    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->UpdateSelectorOps()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    :cond_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->TryProcessIdle()V

    return-void

    :cond_3
    move v0, v1

    goto :goto_1
.end method


# virtual methods
.method public CloseCircuit()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selectionKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->cancel()V

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->datagramChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v0}, Ljava/nio/channels/DatagramChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->ProcessCloseCircuit()V

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public DefaultEventQueueHandler(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->messageRouter:Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->handleEventQueueMessage(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Unhandled event queue msg: type = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public DefaultMessageHandler(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->messageRouter:Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->handleMessage(Ljava/lang/Object;)Z

    move-result v0

    return-void
.end method

.method public HandleMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V

    return-void
.end method

.method public HandlePacketAck(Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;)V
    .locals 2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;->Packets_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck$Packets;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck$Packets;->ID:I

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->ProcessReceivedAck(I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public HandleStartPingCheck(Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck$PingID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;->PingID:I

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck$PingID;->PingID:I

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method protected InvokeProcessIdle()V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->ProcessIdle()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->idleHandlers:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLIdleHandler;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLIdleHandler;->ProcessIdle()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public ProcessCloseCircuit()V
    .locals 0

    return-void
.end method

.method public ProcessIdle()V
    .locals 0

    return-void
.end method

.method public ProcessNetworkError()V
    .locals 0

    return-void
.end method

.method public ProcessReceive()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->rxBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->rxBuffer:Ljava/nio/ByteBuffer;

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->datagramChannel:Ljava/nio/channels/DatagramChannel;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->rxBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/nio/channels/DatagramChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v1

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->rxBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->receivedAcks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->rxBuffer:Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->tempBuffer:Ljava/nio/ByteBuffer;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->receivedAcks:Ljava/util/List;

    invoke-static {v1, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->Unpack(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/util/List;)Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastReceivedPacketMillis:J

    iput v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pingSentCount:I

    iget v1, v2, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastReceivedSeqnum:I

    sub-int/2addr v1, v5

    if-gtz v1, :cond_d

    const-string/jumbo v1, "Detected incoming out of order: seqNum = %d"

    new-array v5, v3, [Ljava/lang/Object;

    iget v6, v2, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v4

    invoke-static {v1, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    instance-of v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;

    if-nez v1, :cond_3

    instance-of v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_3

    instance-of v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->handledPackets:Ljava/util/Queue;

    iget v5, v2, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Queue;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    const-string/jumbo v1, "Detected incoming duplicate: seqNum = %d"

    new-array v5, v3, [Ljava/lang/Object;

    iget v6, v2, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v4

    invoke-static {v1, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    move v1, v3

    :goto_0
    if-nez v1, :cond_c

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->handledPackets:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v1

    const/16 v5, 0x400

    if-lt v1, v5, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->handledPackets:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->handledPackets:Ljava/util/Queue;

    iget v5, v2, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget v1, v2, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastReceivedSeqnum:I

    instance-of v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;

    if-nez v1, :cond_2

    instance-of v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;

    if-eqz v1, :cond_4

    :cond_2
    invoke-virtual {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V

    move-object v1, v0

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->receivedAcks:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->ProcessReceivedAck(I)V

    goto :goto_2

    :cond_3
    move v1, v4

    goto :goto_0

    :cond_4
    move-object v1, v2

    goto :goto_1

    :cond_5
    const-string/jumbo v1, "message discarded!"

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    move-object v1, v0

    goto :goto_1

    :cond_6
    if-eqz v2, :cond_8

    iget-boolean v0, v2, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->isReliable:Z

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v6, v2, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    if-ne v0, v6, :cond_7

    move v0, v3

    :goto_3
    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_8
    if-eqz v1, :cond_9

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->HandleMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :cond_9
    return v3

    :cond_a
    return v4

    :cond_b
    move v0, v4

    goto :goto_3

    :cond_c
    move-object v1, v0

    goto :goto_1

    :cond_d
    move v1, v4

    goto/16 :goto_0
.end method

.method public ProcessReceivedAck(I)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->unackedQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    if-ne v2, p1, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->handleMessageAcknowledged()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->outgoingQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    if-ne v2, p1, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->handleMessageAcknowledged()V

    goto :goto_1

    :cond_3
    return-void
.end method

.method public ProcessTimeout()V
    .locals 0

    return-void
.end method

.method public ProcessTransmit()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v6, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->outgoingQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->txBuffer:Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->tempBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->Pack(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->txBuffer:Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    invoke-virtual {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->AppendPendingAcks(Ljava/nio/ByteBuffer;Ljava/util/List;)I

    move-result v3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->txBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->datagramChannel:Ljava/nio/channels/DatagramChannel;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->txBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v4}, Ljava/nio/channels/DatagramChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->outgoingQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v3, v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    :cond_0
    iget-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->isReliable:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->unackedQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    :cond_1
    return v6

    :cond_2
    move v1, v2

    :goto_0
    if-ge v1, v3, :cond_0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_7

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastSeqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    iput v0, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;->seqNum:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v2

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;->CalcPayloadSize()I

    move-result v0

    const/16 v5, 0x3fa

    if-ge v0, v5, :cond_4

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck$Packets;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck$Packets;-><init>()V

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck$Packets;->ID:I

    iget-object v0, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;->Packets_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->txBuffer:Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->tempBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;->Pack(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->txBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->datagramChannel:Ljava/nio/channels/DatagramChannel;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->txBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v3}, Ljava/nio/channels/DatagramChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt v1, v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_5
    return v6

    :cond_6
    move v0, v2

    :goto_2
    if-ge v0, v1, :cond_5

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_7
    return v2
.end method

.method public ProcessWakeup()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->ProcessResends()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->TryProcessIdle()V

    return-void
.end method

.method public declared-synchronized RegisterMessageHandler(Ljava/lang/Object;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->messageRouter:Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->registerHandler(Ljava/lang/Object;)V

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLIdleHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->idleHandlers:Ljava/util/List;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLIdleHandler;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
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

.method public SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastSeqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->sentTimeMillis:J

    const/4 v0, 0x0

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->retries:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->outgoingQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->UpdateSelectorOps()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    return-void
.end method

.method public TryProcessIdle()V
    .locals 7

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastReceivedPacketMillis:J

    const-wide/16 v4, 0x2710

    add-long/2addr v0, v4

    cmp-long v0, v2, v0

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastPingSent:J

    const-wide/16 v4, 0x1388

    add-long/2addr v0, v4

    cmp-long v0, v2, v0

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pingSentCount:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->timedOut:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->timedOut:Z

    const-string/jumbo v0, "SLCircuit: Total timeout."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->ProcessTimeout()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SLCircuit: Sending ping ID "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-byte v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastPingID:B

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastSeqNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->unackedQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    if-eqz v0, :cond_2

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    :goto_1
    iget-object v1, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;

    iget-byte v5, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastPingID:B

    add-int/lit8 v6, v5, 0x1

    int-to-byte v6, v6

    iput-byte v6, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastPingID:B

    iput v5, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;->PingID:I

    iget-object v1, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;->PingID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;

    iput v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck$PingID;->OldestUnacked:I

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pingSentCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pingSentCount:I

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->lastPingSent:J

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1
.end method

.method public declared-synchronized UnregisterMessageHandler(Ljava/lang/Object;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->messageRouter:Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;->unregisterHandler(Ljava/lang/Object;)V

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLIdleHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->idleHandlers:Ljava/util/List;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLIdleHandler;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
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

.method public UpdateSelectorOps()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selectionKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->outgoingQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->pendingAcks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selectionKey:Ljava/nio/channels/SelectionKey;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->selectionKey:Ljava/nio/channels/SelectionKey;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;
    :try_end_0
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getAuthReply()Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    return-object v0
.end method

.method public getEventBus()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    return-object v0
.end method

.method public getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    return-object v0
.end method

.method public declared-synchronized getIdleInterval()I
    .locals 1

    monitor-enter p0

    const/16 v0, 0x3e8

    monitor-exit p0

    return v0
.end method
