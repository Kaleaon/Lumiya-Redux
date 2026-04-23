.class Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ExecutorWithListener;
.super Ljava/util/concurrent/ThreadPoolExecutor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ExecutorWithListener"
.end annotation


# instance fields
.field private onExecutionCompleteListener:Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$OnExecutionCompleteListener;


# direct methods
.method public constructor <init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$OnExecutionCompleteListener;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IIJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$OnExecutionCompleteListener;",
            ")V"
        }
    .end annotation

    new-instance v10, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ExecutorWithListener$1;

    invoke-direct {v10, p1}, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ExecutorWithListener$1;-><init>(Ljava/lang/String;)V

    move-object v3, p0

    move v4, p2

    move v5, p3

    move-wide/from16 v6, p4

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    invoke-direct/range {v3 .. v10}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ExecutorWithListener;->onExecutionCompleteListener:Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$OnExecutionCompleteListener;

    move-object/from16 v0, p8

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ExecutorWithListener;->onExecutionCompleteListener:Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$OnExecutionCompleteListener;

    return-void
.end method


# virtual methods
.method protected afterExecute(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ExecutorWithListener;->onExecutionCompleteListener:Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$OnExecutionCompleteListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ExecutorWithListener;->onExecutionCompleteListener:Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$OnExecutionCompleteListener;

    invoke-interface {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$OnExecutionCompleteListener;->onExecutionComplete(Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method
