.class Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->-get2(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->-get1(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->-get1(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->-get1(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
.end method
