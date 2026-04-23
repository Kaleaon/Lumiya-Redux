.class public Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;,
        Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;,
        Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$ICapsEventHandler;
    }
.end annotation


# instance fields
.field private capURL:Ljava/lang/String;

.field private done:Z

.field private eventHandler:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$ICapsEventHandler;

.field private lastEventID:I

.field private nextQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;",
            ">;"
        }
    .end annotation
.end field

.field private threadMustExit:Z

.field private willExitGracefully:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private workingThread:Ljava/lang/Thread;

.field private xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$ICapsEventHandler;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->eventHandler:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$ICapsEventHandler;

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->lastEventID:I

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->threadMustExit:Z

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->willExitGracefully:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->nextQueue:Ljava/util/List;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->done:Z

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->capURL:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->eventHandler:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$ICapsEventHandler;

    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->workingThread:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->workingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    const/4 v3, 0x1

    const/4 v1, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "CapEventQueue: working thread starting with capURL = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->capURL:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    move v0, v1

    :cond_0
    :goto_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->threadMustExit:Z

    if-nez v2, :cond_1

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    const/4 v2, 0x2

    new-array v5, v2, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v7, "ack"

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->lastEventID:I

    if-eqz v2, :cond_2

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;

    iget v8, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->lastEventID:I

    invoke-direct {v2, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;-><init>(I)V

    :goto_1
    invoke-direct {v6, v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    aput-object v6, v5, v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v6, "done"

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;

    iget-boolean v8, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->done:Z

    invoke-direct {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;-><init>(Z)V

    invoke-direct {v2, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    aput-object v2, v5, v3

    invoke-direct {v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->capURL:Ljava/lang/String;

    invoke-virtual {v2, v5, v4}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->done:Z

    if-eqz v2, :cond_3

    const-string/jumbo v2, "CapEventQueue: Done sent and confirmed, exiting gracefully."

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    :cond_1
    const-string/jumbo v0, "CapEventQueue: event queue thread exiting"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    return-void

    :cond_2
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;-><init>()V

    goto :goto_1

    :cond_3
    :try_start_1
    const-string/jumbo v2, "id"

    invoke-virtual {v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v2

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->lastEventID:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "CapEventQueue: new lastEventID = "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->lastEventID:I

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const-string/jumbo v2, "events"

    invoke-virtual {v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v5

    move v2, v1

    :goto_2
    if-ge v2, v5, :cond_5

    const-string/jumbo v6, "events"

    invoke-virtual {v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v6

    invoke-virtual {v6, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v6

    const-string/jumbo v7, "message"

    invoke-virtual {v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "body"

    invoke-virtual {v6, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "CapEventQueue: event name = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const-string/jumbo v8, "TeleportFinish"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->done:Z

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->willExitGracefully:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_4
    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->nextQueue:Ljava/util/List;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;

    invoke-direct {v9, v7, v6}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :catch_0
    move-exception v2

    :try_start_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "CapEventQueue: failed to extract id. event was: %s"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_1

    :cond_5
    :goto_3
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->threadMustExit:Z

    if-nez v2, :cond_0

    :goto_4
    move v2, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->nextQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->nextQueue:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;

    if-nez v2, :cond_9

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->eventHandler:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$ICapsEventHandler;

    if-eqz v4, :cond_9

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;->eventType:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->TeleportFinish:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;

    if-ne v4, v5, :cond_6

    move v2, v3

    :cond_6
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->eventHandler:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$ICapsEventHandler;

    invoke-interface {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$ICapsEventHandler;->OnCapsEvent(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEvent;)V

    move v0, v2

    goto :goto_4

    :catch_1
    move-exception v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_3

    :catch_2
    move-exception v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_3

    :catch_3
    move-exception v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_3

    :catch_4
    move-exception v2

    const-string/jumbo v2, "CapEventQueue: Got file not found expection, cap queue closed?"

    new-array v4, v1, [Ljava/lang/Object;

    invoke-static {v2, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_3

    :cond_7
    if-nez v2, :cond_8

    const-wide/16 v4, 0x9c4

    :try_start_3
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_5

    :cond_8
    move v0, v2

    goto/16 :goto_0

    :catch_5
    move-exception v0

    const-string/jumbo v4, "Interrupted"

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    move v0, v2

    goto/16 :goto_0

    :cond_9
    move v0, v2

    goto :goto_4
.end method

.method public declared-synchronized stopQueue()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->willExitGracefully:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->threadMustExit:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->workingThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->InterruptRequest()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->workingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue;->workingThread:Ljava/lang/Thread;
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
