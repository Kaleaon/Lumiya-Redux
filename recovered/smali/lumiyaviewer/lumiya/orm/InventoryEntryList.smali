.class public Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;
.super Ljava/util/AbstractList;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
        ">;"
    }
.end annotation


# instance fields
.field private final cursor:Landroid/database/Cursor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final entryCache:Lcom/google/common/cache/LoadingCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LoadingCache",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final folder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final lock:Ljava/lang/Object;

.field private final size:I

.field private final title:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)Landroid/database/Cursor;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->cursor:Landroid/database/Cursor;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->lock:Ljava/lang/Object;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 5

    const/4 v4, 0x0

    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->lock:Ljava/lang/Object;

    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v2, v3}, Lcom/google/common/cache/CacheBuilder;->maximumSize(J)Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakValues()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;-><init>(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V

    invoke-virtual {v0, v1}, Lcom/google/common/cache/CacheBuilder;->build(Lcom/google/common/cache/CacheLoader;)Lcom/google/common/cache/LoadingCache;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->entryCache:Lcom/google/common/cache/LoadingCache;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->title:Ljava/lang/String;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->cursor:Landroid/database/Cursor;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->folder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->size:I

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Landroid/database/Cursor;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/database/Cursor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->lock:Ljava/lang/Object;

    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v2, v3}, Lcom/google/common/cache/CacheBuilder;->maximumSize(J)Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakValues()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;-><init>(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V

    invoke-virtual {v0, v1}, Lcom/google/common/cache/CacheBuilder;->build(Lcom/google/common/cache/CacheLoader;)Lcom/google/common/cache/LoadingCache;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->entryCache:Lcom/google/common/cache/LoadingCache;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->title:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->folder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->cursor:Landroid/database/Cursor;

    if-eqz p3, :cond_0

    invoke-interface {p3}, Landroid/database/Cursor;->getCount()I

    move-result v0

    :goto_0
    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->size:I

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->cursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public get(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->cursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->entryCache:Lcom/google/common/cache/LoadingCache;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/cache/LoadingCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    return-object v4

    :cond_0
    const-string/jumbo v1, "InventoryEntryList: returning null for %d because cursor is %s"

    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v3, 0x0

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->cursor:Landroid/database/Cursor;

    if-nez v0, :cond_1

    const-string/jumbo v0, "null"

    :goto_0
    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v4

    :cond_1
    const-string/jumbo v0, "closed"

    goto :goto_0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->get(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    return-object v0
.end method

.method public getFolder()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->folder:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->title:Ljava/lang/String;

    return-object v0
.end method

.method public size()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->size:I

    return v0
.end method
