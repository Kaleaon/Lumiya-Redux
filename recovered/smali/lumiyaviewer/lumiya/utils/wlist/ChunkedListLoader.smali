.class public Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;
.super Ljava/util/AbstractList;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList$ChunkFactory;
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;,
        Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;,
        Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;,
        Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E::",
        "Lcom/lumiyaviewer/lumiya/utils/Identifiable",
        "<",
        "Ljava/lang/Long;",
        ">;>",
        "Ljava/util/AbstractList",
        "<TE;>;",
        "Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList$ChunkFactory",
        "<TE;>;",
        "Ljava/util/RandomAccess;"
    }
.end annotation


# instance fields
.field private final addedElements:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<TE;>;"
        }
    .end annotation
.end field

.field private final chatMessageComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<TE;>;"
        }
    .end annotation
.end field

.field private final executor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private hasAbove:Z

.field private hasBelow:Z

.field private items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList",
            "<TE;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final listener:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final listenerExecutor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private loadAboveResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult",
            "<TE;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private loadAboveTopmostId:J

.field private loadAboveWanted:Z

.field private loadBelowLastId:J

.field private loadBelowResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult",
            "<TE;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private loadBelowWanted:Z

.field private final loadMoreData:Ljava/lang/Runnable;

.field private final loadRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final lock:Ljava/lang/Object;

.field private final processUpdate:Ljava/lang/Runnable;

.field private final reloadAccepted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final reloadRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final startFromStart:Z

.field private final updatePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final updatedElements:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "TE;>;"
        }
    .end annotation
.end field

.field private final windowSize:I


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/Queue;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->addedElements:Ljava/util/Queue;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/Comparator;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->chatMessageComparator:Ljava/util/Comparator;

    return-object v0
.end method

.method static synthetic -get10(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowWanted:Z

    return v0
.end method

.method static synthetic -get11(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get12(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->lock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get13(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->reloadAccepted:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get14(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->reloadRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get15(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->updatePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get16(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->updatedElements:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic -get17(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->windowSize:I

    return v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasBelow:Z

    return v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->listener:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;

    return-object v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    return-object v0
.end method

.method static synthetic -get6(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)J
    .locals 2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveTopmostId:J

    return-wide v0
.end method

.method static synthetic -get7(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveWanted:Z

    return v0
.end method

.method static synthetic -get8(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)J
    .locals 2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowLastId:J

    return-wide v0
.end method

.method static synthetic -get9(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    return-object v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasAbove:Z

    return p1
.end method

.method static synthetic -set1(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasBelow:Z

    return p1
.end method

.method static synthetic -set2(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    return-object p1
.end method

.method static synthetic -set3(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveWanted:Z

    return p1
.end method

.method static synthetic -set4(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    return-object p1
.end method

.method static synthetic -set5(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowWanted:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->postUpdate()V

    return-void
.end method

.method public constructor <init>(ILjava/util/concurrent/Executor;ZLcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;)V
    .locals 4
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->addedElements:Ljava/util/Queue;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->updatePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->reloadRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->reloadAccepted:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->lock:Ljava/lang/Object;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveWanted:Z

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowWanted:Z

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->updatedElements:Ljava/util/Map;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$1;-><init>(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadMoreData:Ljava/lang/Runnable;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$2;-><init>(Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->processUpdate:Ljava/lang/Runnable;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/wlist/-$Lambda$QDlX9uefQr1Wq8gtt1O6M2wUNME;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/-$Lambda$QDlX9uefQr1Wq8gtt1O6M2wUNME;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->chatMessageComparator:Ljava/util/Comparator;

    iput p1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->windowSize:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->executor:Ljava/util/concurrent/Executor;

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->startFromStart:Z

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->listener:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;

    invoke-interface {p4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;->getListEventsExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->listenerExecutor:Ljava/util/concurrent/Executor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasAbove:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasBelow:Z

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_utils_wlist_ChunkedListLoader_13028(Lcom/lumiyaviewer/lumiya/utils/Identifiable;Lcom/lumiyaviewer/lumiya/utils/Identifiable;)I
    .locals 4

    invoke-interface {p0}, Lcom/lumiyaviewer/lumiya/utils/Identifiable;->getId()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/utils/Identifiable;->getId()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    sub-long v0, v2, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->signum(J)I

    move-result v0

    return v0
.end method

.method private postUpdate()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->updatePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "ChatView: requesting processUpdate ()"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->listenerExecutor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->processUpdate:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v0, "ChatView: processUpdate () already requested"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public addElement(Lcom/lumiyaviewer/lumiya/utils/Identifiable;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    const-string/jumbo v0, "ChatView: addElement: adding element with id %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/utils/Identifiable;->getId()Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->addedElements:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->postUpdate()V

    return-void
.end method

.method public createEmptyChunk()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TE;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->windowSize:I

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    return-object v0
.end method

.method public get(I)Lcom/lumiyaviewer/lumiya/utils/Identifiable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/utils/Identifiable;

    return-object v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->get(I)Lcom/lumiyaviewer/lumiya/utils/Identifiable;

    move-result-object v0

    return-object v0
.end method

.method public hasMoreItemsAtBottom()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasBelow:Z

    return v0
.end method

.method protected loadInBackground(IJZ)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJZ)",
            "Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult",
            "<TE;>;"
        }
    .end annotation

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-direct {v0, v1, v2, p2, p3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;-><init>(Ljava/util/List;ZJ)V

    return-object v0
.end method

.method public reload()V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->reloadRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->executor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadMoreData:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public setVisibleRange(II)V
    .locals 8

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    const-string/jumbo v4, "ChatView: new visible range %d, %d size %d above possible %s below possible %s"

    const/4 v0, 0x5

    new-array v5, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x0

    aput-object v0, v5, v6

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x1

    aput-object v0, v5, v6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x2

    aput-object v0, v5, v6

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveWanted:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    if-nez v0, :cond_3

    const-string/jumbo v0, "yes"

    :goto_0
    const/4 v6, 0x3

    aput-object v0, v5, v6

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowWanted:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    if-nez v0, :cond_4

    const-string/jumbo v0, "yes"

    :goto_1
    const/4 v6, 0x4

    aput-object v0, v5, v6

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->size()I

    move-result v0

    if-lez v0, :cond_a

    if-gtz p1, :cond_6

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasAbove:Z

    if-eqz v0, :cond_6

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveWanted:Z

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/utils/Identifiable;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/utils/Identifiable;->getId()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveTopmostId:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveWanted:Z

    const-string/jumbo v0, "ChatView: requesting load above id %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveTopmostId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move v0, v1

    :goto_2
    monitor-exit v3

    :goto_3
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-lt p2, v3, :cond_8

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasBelow:Z

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_2
    iget-boolean v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowWanted:Z

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    if-nez v4, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/utils/Identifiable;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/utils/Identifiable;->getId()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowLastId:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowWanted:Z

    const-string/jumbo v0, "ChatView: requesting load below id %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowLastId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    move v0, v1

    :cond_0
    :goto_4
    monitor-exit v3

    :cond_1
    :goto_5
    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string/jumbo v0, "ChatView: requesting loadMoreData ()"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->executor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadMoreData:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_2
    :goto_6
    return-void

    :cond_3
    :try_start_3
    const-string/jumbo v0, "no"

    goto/16 :goto_0

    :cond_4
    const-string/jumbo v0, "no"
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_5
    move v0, v2

    goto :goto_2

    :catchall_1
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_6
    if-lez p1, :cond_10

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_4
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveWanted:Z

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    if-nez v0, :cond_7

    move v0, v1

    :goto_7
    monitor-exit v3

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->removeElementsBefore(I)I

    move-result v0

    if-eqz v0, :cond_10

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasAbove:Z

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->listener:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;

    invoke-interface {v3, v2, v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;->onListItemsRemoved(II)V

    move v0, v2

    goto/16 :goto_3

    :cond_7
    move v0, v2

    goto :goto_7

    :catchall_2
    move-exception v0

    monitor-exit v3

    throw v0

    :catchall_3
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_8
    if-ltz p2, :cond_1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge p2, v3, :cond_1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->lock:Ljava/lang/Object;

    monitor-enter v4

    :try_start_5
    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowWanted:Z

    if-nez v3, :cond_9

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    if-nez v3, :cond_9

    move v3, v1

    :goto_8
    monitor-exit v4

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->size()I

    move-result v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    invoke-virtual {v4, p2}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->removeElementsAfter(I)I

    move-result v4

    if-eqz v4, :cond_1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasBelow:Z

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->listener:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;

    sub-int/2addr v3, v4

    invoke-interface {v5, v3, v4}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;->onListItemsRemoved(II)V

    goto/16 :goto_5

    :cond_9
    move v3, v2

    goto :goto_8

    :catchall_4
    move-exception v0

    monitor-exit v4

    throw v0

    :cond_a
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->startFromStart:Z

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasBelow:Z

    if-eqz v0, :cond_f

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_6
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowWanted:Z

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    if-nez v0, :cond_b

    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowLastId:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowWanted:Z

    const-string/jumbo v0, "ChatView: requesting load below id %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadBelowLastId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    move v0, v1

    goto/16 :goto_4

    :cond_b
    move v0, v2

    goto/16 :goto_4

    :catchall_5
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_c
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->hasAbove:Z

    if-eqz v0, :cond_f

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_7
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveWanted:Z

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveResult:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    if-nez v0, :cond_d

    const-wide v4, 0x7fffffffffffffffL

    iput-wide v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveTopmostId:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveWanted:Z

    const-string/jumbo v0, "ChatView: requesting load above id %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->loadAboveTopmostId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    move v0, v1

    goto/16 :goto_4

    :cond_d
    move v0, v2

    goto/16 :goto_4

    :catchall_6
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_e
    const-string/jumbo v0, "ChatView: loadMoreData() already requested"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_6

    :cond_f
    move v0, v2

    goto/16 :goto_5

    :cond_10
    move v0, v2

    goto/16 :goto_3
.end method

.method public size()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->items:Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->size()I

    move-result v0

    return v0
.end method

.method public updateElement(Lcom/lumiyaviewer/lumiya/utils/Identifiable;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    const-string/jumbo v0, "ChatView: addElement: updated element with id %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/utils/Identifiable;->getId()Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->updatedElements:Ljava/util/Map;

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/utils/Identifiable;->getId()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-interface {v2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;->postUpdate()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
