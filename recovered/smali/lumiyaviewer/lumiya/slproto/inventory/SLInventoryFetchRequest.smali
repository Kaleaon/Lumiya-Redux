.class public abstract Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;
.super Ljava/lang/Object;


# instance fields
.field protected final db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

.field protected final folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final folderId:J

.field protected final folderUUID:Ljava/util/UUID;

.field protected final inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Ljava/util/UUID;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$NoInventoryItemException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->getDatabase()Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;->folderUUID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$NoInventoryItemException;

    invoke-direct {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$NoInventoryItemException;-><init>(Ljava/util/UUID;)V

    throw v0

    :cond_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;->folderId:J

    return-void
.end method


# virtual methods
.method public abstract cancel()V
.end method

.method protected completeFetch(ZZ)V
    .locals 8

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;->folderUUID:Ljava/util/UUID;

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;->folderId:J

    move-object v2, p0

    move v6, p1

    move v7, p2

    invoke-virtual/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->onFetchComplete(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;Ljava/util/UUID;JZZ)V

    return-void
.end method

.method public abstract start()V
.end method
