.class public Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;
.super Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit$1;
    }
.end annotation


# static fields
.field private static final DEFAULT_IDLE_INTERVAL:I = 0x3e8


# instance fields
.field private final queue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private volatile workEnabled:Z

.field private final workingRunnable:Ljava/lang/Runnable;

.field private final workingThread:Ljava/lang/Thread;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;)Ljava/util/concurrent/BlockingQueue;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->queue:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->workEnabled:Z

    return v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;Lcom/lumiyaviewer/lumiya/slproto/SLCircuit;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->workingRunnable:Ljava/lang/Runnable;

    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->workingRunnable:Ljava/lang/Runnable;

    const-string/jumbo v2, "SLCircuit"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->workingThread:Ljava/lang/Thread;

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->queue:Ljava/util/concurrent/BlockingQueue;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->workEnabled:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->workingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private stopThread()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->workEnabled:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->workingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    return-void
.end method


# virtual methods
.method public HandleMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->queue:Ljava/util/concurrent/BlockingQueue;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$YxYPv04qlnFzJCNumOXxffqwZwU;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/-$Lambda$YxYPv04qlnFzJCNumOXxffqwZwU;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    return-void
.end method

.method public ProcessCloseCircuit()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->stopThread()V

    return-void
.end method

.method public ProcessNetworkError()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->stopThread()V

    return-void
.end method

.method public ProcessTimeout()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->stopThread()V

    return-void
.end method

.method public execute(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_SLThreadingCircuit_1833(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V

    return-void
.end method
