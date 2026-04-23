.class Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;
.super Lcom/google/common/cache/CacheLoader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/cache/CacheLoader",
        "<",
        "Ljava/lang/Integer;",
        "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;->this$0:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-direct {p0}, Lcom/google/common/cache/CacheLoader;-><init>()V

    return-void
.end method


# virtual methods
.method public load(Ljava/lang/Integer;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 4
    .param p1    # Ljava/lang/Integer;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;->this$0:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->-get0(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;->this$0:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->-get0(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;->this$0:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->-get1(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;->this$0:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->-get0(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)Landroid/database/Cursor;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->moveToPosition(I)Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;->this$0:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->-get0(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)Landroid/database/Cursor;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>(Landroid/database/Cursor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v2

    :goto_1
    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>()V

    :cond_0
    return-object v0

    :cond_1
    move-object v0, v1

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_2
    move-object v0, v1

    goto :goto_1
.end method

.method public bridge synthetic load(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList$1;->load(Ljava/lang/Integer;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    return-object v0
.end method
