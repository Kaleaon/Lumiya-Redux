.class Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string/jumbo v0, "ChatView: processing loadMoreData(), reloadRequested %b"

    new-array v3, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get14(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get11(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get12(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get7(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get5(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    move-result-object v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get14(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get6(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v4

    monitor-exit v3

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get17(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)I

    move-result v3

    invoke-virtual {v0, v3, v4, v5, v2}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadInBackground(IJZ)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get12(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    :try_start_1
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v4, v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set2(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v3

    move v0, v1

    :goto_1
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get12(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4

    :try_start_2
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get10(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get9(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    move-result-object v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get14(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    :goto_2
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get8(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result-wide v6

    monitor-exit v4

    if-eqz v3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get17(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)I

    move-result v3

    invoke-virtual {v0, v3, v6, v7, v1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadInBackground(IJZ)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get12(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    :try_start_3
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v4, v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set4(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    monitor-exit v3

    move v0, v1

    :cond_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get14(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get13(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :goto_3
    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-wrap0(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)V

    :cond_1
    return-void

    :cond_2
    move v0, v2

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :catchall_1
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_3
    move v3, v2

    goto :goto_2

    :catchall_2
    move-exception v0

    monitor-exit v4

    throw v0

    :catchall_3
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_4
    move v1, v0

    goto :goto_3

    :cond_5
    move v0, v2

    goto :goto_1
.end method
