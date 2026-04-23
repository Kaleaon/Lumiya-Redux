.class Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RunOnceExecutor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;-><init>(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)V

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
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get0(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get3(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get1(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get0(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;->this$0:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->-get0(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
