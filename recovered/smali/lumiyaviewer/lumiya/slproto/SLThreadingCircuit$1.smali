.class Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    const/4 v4, 0x0

    const-string/jumbo v0, "SLThreadingCircuit: working thread started."

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->-get1(Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;)Z

    move-result v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->-get0(Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    const-wide/16 v2, 0x3e8

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v2, v3, v1}, Ljava/util/concurrent/BlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLThreadingCircuit;->InvokeProcessIdle()V

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_1
    const-string/jumbo v0, "SLThreadingCircuit: working thread exiting."

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
