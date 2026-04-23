.class Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get0(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get2(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    if-nez v0, :cond_3

    const/4 v0, 0x0

    :goto_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get3(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    const/4 v1, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get3(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get0(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_3
    :try_start_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get0(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move v0, v1

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_4
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v0

    :try_start_5
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get0(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception v0

    :try_start_6
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get0(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_1
    move v0, v1

    :cond_2
    if-nez v0, :cond_0

    :try_start_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get1(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_1

    :cond_3
    :try_start_8
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get0(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    goto/16 :goto_0
.end method
