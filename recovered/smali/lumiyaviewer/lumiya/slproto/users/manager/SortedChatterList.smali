.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;
.super Ljava/lang/Object;


# annotations
.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# instance fields
.field private final chatters:Ljava/util/SortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedSet",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;"
        }
    .end annotation
.end field

.field private final lock:Ljava/lang/Object;

.field private final onListUpdatedListener:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

.field private sortedList:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;Ljava/util/Comparator;)V
    .locals 1
    .param p2    # Ljava/util/Comparator;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;",
            "Ljava/util/Comparator",
            "<-",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->lock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->sortedList:Lcom/google/common/collect/ImmutableList;

    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0, p2}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->chatters:Ljava/util/SortedSet;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->onListUpdatedListener:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    return-void
.end method


# virtual methods
.method addChatter(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V
    .locals 6

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->chatters:Ljava/util/SortedSet;

    invoke-interface {v0, p1}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    move-result v0

    const-string/jumbo v2, "FriendList: added chatter data %s, needUpdate %s, count %d"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->chatters:Ljava/util/SortedSet;

    invoke-interface {v4}, Ljava/util/SortedSet;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->sortedList:Lcom/google/common/collect/ImmutableList;

    if-eqz v2, :cond_0

    const-string/jumbo v2, "FriendList: dropping instance because of addChatter"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->sortedList:Lcom/google/common/collect/ImmutableList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->onListUpdatedListener:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->onListUpdatedListener:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;->onListUpdated()V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public getChatterList()Lcom/google/common/collect/ImmutableList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;"
        }
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->sortedList:Lcom/google/common/collect/ImmutableList;

    if-nez v0, :cond_0

    const-string/jumbo v0, "FriendList: creating new list instance"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->chatters:Ljava/util/SortedSet;

    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->sortedList:Lcom/google/common/collect/ImmutableList;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->sortedList:Lcom/google/common/collect/ImmutableList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method removeChatter(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V
    .locals 4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->chatters:Ljava/util/SortedSet;

    invoke-interface {v0, p1}, Ljava/util/SortedSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->sortedList:Lcom/google/common/collect/ImmutableList;

    if-eqz v2, :cond_0

    const-string/jumbo v2, "FriendList: dropping instance because of removeChatter"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->sortedList:Lcom/google/common/collect/ImmutableList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->onListUpdatedListener:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->onListUpdatedListener:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;->onListUpdated()V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method replaceChatter(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->chatters:Ljava/util/SortedSet;

    invoke-interface {v2, p1}, Ljava/util/SortedSet;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->chatters:Ljava/util/SortedSet;

    invoke-interface {v2, p2}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->sortedList:Lcom/google/common/collect/ImmutableList;

    if-eqz v2, :cond_1

    const-string/jumbo v2, "FriendList: dropping instance because of replaceChatter"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->sortedList:Lcom/google/common/collect/ImmutableList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->onListUpdatedListener:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->onListUpdatedListener:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;->onListUpdated()V

    :cond_2
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
