.class Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;
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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    const/4 v5, 0x1

    const/4 v8, 0x0

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get15(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const-string/jumbo v0, "ChatView: processUpdate, reloadAccepted: %b"

    new-array v1, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get13(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get13(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get12(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set2(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set4(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set5(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0, v5}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set0(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0, v5}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set1(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get0(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get4(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;->onListReloaded()V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get12(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get5(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    move-result-object v3

    if-eqz v3, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    const/4 v4, 0x0

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set2(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    const/4 v4, 0x0

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_2
    monitor-exit v1

    if-eqz v3, :cond_e

    iget-object v0, v3, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    move-result-object v1

    iget-object v4, v3, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;->entries:Ljava/util/List;

    invoke-static {v4}, Lcom/google/common/collect/Lists;->reverse(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->addChunkAtStart(Ljava/util/List;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    iget-boolean v4, v3, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;->hasMore:Z

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set0(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z

    iget-wide v6, v3, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;->fromId:J

    const-wide v10, 0x7fffffffffffffffL

    cmp-long v1, v6, v10

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set1(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z

    :cond_3
    :goto_0
    if-eqz v0, :cond_4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get4(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;

    move-result-object v1

    invoke-interface {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;->onListItemsAdded(II)V

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->size()I

    move-result v9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get12(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get9(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    move-result-object v3

    if-eqz v3, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    const/4 v4, 0x0

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set4(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    const/4 v4, 0x0

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set5(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :cond_5
    monitor-exit v1

    if-eqz v3, :cond_d

    iget-object v0, v3, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    move-result-object v1

    iget-object v4, v3, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;->entries:Ljava/util/List;

    invoke-virtual {v1, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->addChunkAtEnd(Ljava/util/List;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    iget-boolean v4, v3, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;->hasMore:Z

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set1(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z

    iget-wide v6, v3, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;->fromId:J

    const-wide/16 v10, 0x0

    cmp-long v1, v6, v10

    if-nez v1, :cond_6

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-set0(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z

    :cond_6
    :goto_1
    move v3, v2

    move v4, v0

    :goto_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get0(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/utils/Identifiable;

    if-eqz v0, :cond_9

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->size()I

    move-result v1

    if-lez v1, :cond_7

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    move-result-object v1

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v6}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    move-result-object v6

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v1, v6}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/utils/Identifiable;

    invoke-interface {v1}, Lcom/lumiyaviewer/lumiya/utils/Identifiable;->getId()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    :goto_3
    const-string/jumbo v1, "ChatView: added element: id %d, lastId %d, hasBelow %b"

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/utils/Identifiable;->getId()Ljava/lang/Object;

    move-result-object v11

    aput-object v11, v10, v2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v10, v5

    iget-object v11, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v11}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get2(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Z

    move-result v11

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    const/4 v12, 0x2

    aput-object v11, v10, v12

    invoke-static {v1, v10}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get2(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Z

    move-result v1

    if-nez v1, :cond_8

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/utils/Identifiable;->getId()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    cmp-long v1, v10, v6

    if-lez v1, :cond_8

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    move-result-object v1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get17(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)I

    move-result v3

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-virtual {v1, v0, v3, v6}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->addElement(Ljava/lang/Object;ILcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList$ChunkFactory;)V

    add-int/lit8 v4, v4, 0x1

    move v0, v5

    move v1, v4

    :goto_4
    move v3, v0

    move v4, v1

    goto/16 :goto_2

    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0

    :catchall_2
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_7
    const-wide/16 v6, -0x1

    goto :goto_3

    :cond_8
    move v0, v3

    move v1, v4

    goto :goto_4

    :cond_9
    if-eqz v4, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get4(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;

    move-result-object v0

    invoke-interface {v0, v9, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;->onListItemsAdded(II)V

    :cond_a
    if-eqz v3, :cond_b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get4(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;->onListItemAddedAtEnd()V

    :cond_b
    :goto_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get12(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get16(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/utils/Identifiable;

    invoke-interface {v3}, Ljava/util/Iterator;->remove()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    :goto_6
    monitor-exit v1

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    move-result-object v1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get1(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/Comparator;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->replaceElement(Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v0

    const-string/jumbo v1, "ChunkedListLoader: replace: replacedIndex is %d"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-ltz v0, :cond_b

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;->this$0:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->-get4(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;->onListItemChanged(I)V

    goto :goto_5

    :catchall_3
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_c
    move-object v0, v8

    goto :goto_6

    :cond_d
    move v0, v2

    goto/16 :goto_1

    :cond_e
    move v0, v2

    goto/16 :goto_0
.end method
