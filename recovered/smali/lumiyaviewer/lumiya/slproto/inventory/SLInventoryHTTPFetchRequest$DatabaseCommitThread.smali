.class final Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;
.super Ljava/lang/Thread;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DatabaseCommitThread"
.end annotation


# instance fields
.field private volatile aborted:Z

.field private final commitEntryQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final stopEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;)V
    .locals 2

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->commitEntryQueue:Ljava/util/concurrent/BlockingQueue;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->stopEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->aborted:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;)V

    return-void
.end method


# virtual methods
.method addEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->commitEntryQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V

    return-void
.end method

.method public run()V
    .locals 11

    const/4 v3, 0x1

    const/4 v1, 0x0

    const/4 v4, 0x0

    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    move-object v2, v1

    move v5, v4

    move v6, v4

    :goto_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->commitEntryQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-nez v0, :cond_e

    if-eqz v5, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->setTransactionSuccessful()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->endTransaction()V

    move v5, v4

    move v6, v4

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->commitEntryQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-object v7, v0

    move v0, v6

    :goto_1
    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->stopEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-ne v7, v6, :cond_6

    :cond_1
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-nez v0, :cond_b

    move v0, v3

    :goto_2
    move v6, v0

    :goto_3
    if-eqz v5, :cond_2

    const-string/jumbo v5, "InvFetch: commit thread ending transaction (success: %s, count %d)."

    const/4 v0, 0x2

    new-array v7, v0, [Ljava/lang/Object;

    if-eqz v6, :cond_a

    const-string/jumbo v0, "true"

    :goto_4
    aput-object v0, v7, v4

    invoke-interface {v8}, Ljava/util/Set;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v7, v3

    invoke-static {v5, v7}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->setTransactionSuccessful()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->endTransaction()V

    :cond_2
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_3
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_4
    if-eqz v6, :cond_5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->aborted:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_5

    const-string/jumbo v0, "InvFetch: commit thread successful, calling retainChildren."

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-wide v2, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->folderId:J

    invoke-virtual {v0, v2, v3, v8}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->retainChildren(JLjava/util/Set;)V

    :cond_5
    return-void

    :cond_6
    if-nez v5, :cond_7

    :try_start_1
    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->beginTransaction()V

    move v5, v3

    :cond_7
    add-int/lit8 v0, v0, 0x1

    const/16 v6, 0x10

    if-lt v0, v6, :cond_d

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->yieldIfContendedSafely()V

    move v6, v4

    :goto_5
    iget-object v0, v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-interface {v8, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0xb

    if-lt v0, v9, :cond_9

    if-nez v2, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getInsertStatement(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v2

    :cond_8
    if-nez v1, :cond_c

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getUpdateStatement(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    :goto_6
    :try_start_2
    invoke-virtual {v7, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->updateOrInsert(Landroid/database/sqlite/SQLiteStatement;Landroid/database/sqlite/SQLiteStatement;)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_2 .. :try_end_2} :catch_3

    move-object v1, v2

    :goto_7
    move-object v2, v1

    move-object v1, v0

    goto/16 :goto_0

    :cond_9
    :try_start_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v7, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->updateOrInsert(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_3 .. :try_end_3} :catch_0

    move-object v0, v1

    move-object v1, v2

    goto :goto_7

    :catch_0
    move-exception v0

    :goto_8
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move v6, v4

    goto/16 :goto_3

    :catch_1
    move-exception v0

    :goto_9
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move v6, v4

    goto/16 :goto_3

    :cond_a
    const-string/jumbo v0, "false"

    goto/16 :goto_4

    :catch_2
    move-exception v1

    move-object v10, v1

    move-object v1, v0

    move-object v0, v10

    goto :goto_9

    :catch_3
    move-exception v1

    move-object v10, v1

    move-object v1, v0

    move-object v0, v10

    goto :goto_8

    :cond_b
    move v0, v4

    goto/16 :goto_2

    :cond_c
    move-object v0, v1

    goto :goto_6

    :cond_d
    move v6, v0

    goto :goto_5

    :cond_e
    move-object v7, v0

    move v0, v6

    goto/16 :goto_1
.end method

.method stopAndWait(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->aborted:Z

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->commitEntryQueue:Ljava/util/concurrent/BlockingQueue;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->stopEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-interface {v0, v1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->join()V

    return-void
.end method
