.class Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 2
    .param p1    # Ljava/lang/Runnable;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->-get1(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->-get2(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->-get4(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->-get0(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->-get3(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->-get1(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;->this$0:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->-get1(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
