.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;


# instance fields
.field private final existingChildren:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private receivedCount:I


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Ljava/util/UUID;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$NoInventoryItemException;
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryFetchRequest;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Ljava/util/UUID;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->receivedCount:I

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->existingChildren:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method HandleInventoryDescendents(Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;)Z
    .locals 10

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Inventory: UDP fetch: exp count "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;->Descendents:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", recv count "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->receivedCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " with this: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->receivedCount:I

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->FolderData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->ItemData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;->Descendents:I

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->beginTransaction()V

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->version:I

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;->Version:I

    if-eq v0, v3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;->Version:I

    iput v3, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->version:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->saveEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->FolderData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$FolderData;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$FolderData;->ParentID:Ljava/util/UUID;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v4, v5}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$FolderData;->FolderID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_1

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$FolderData;->FolderID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->getMostSignificantBits()J
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_3

    :cond_1
    :try_start_1
    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>()V

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$FolderData;->FolderID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v6

    iput-wide v6, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parent_id:J

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$FolderData;->Name:[B

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$FolderData;->Type:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->typeDefault:I

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$FolderData;->ParentID:Ljava/util/UUID;

    iput-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;->AgentID:Ljava/util/UUID;

    iput-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->agentUUID:Ljava/util/UUID;

    const/4 v0, 0x1

    iput-boolean v0, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->updateOrInsert(Landroid/database/sqlite/SQLiteDatabase;)V

    add-int/lit8 v1, v1, 0x1

    const/16 v0, 0x10

    if-le v1, v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->yieldIfContendedSafely()V

    const/4 v1, 0x0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->existingChildren:Ljava/util/Set;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_3
    :goto_1
    :try_start_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->receivedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->receivedCount:I
    :try_end_2
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_3
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->endTransaction()V

    :goto_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->receivedCount:I

    if-lt v0, v2, :cond_b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->existingChildren:Ljava/util/Set;

    invoke-virtual {v0, v2, v3, v1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->retainChildren(JLjava/util/Set;)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->completeFetch(ZZ)V

    const/4 v0, 0x1

    return v0

    :catch_1
    move-exception v0

    :try_start_4
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_4
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->endTransaction()V

    throw v0

    :cond_4
    :try_start_5
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->ItemData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->ItemID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_5

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->ItemID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->getMostSignificantBits()J
    :try_end_5
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_7

    :cond_5
    :try_start_6
    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;-><init>()V

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->ItemID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->Name:[B

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->Description:[B

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->FolderID:Ljava/util/UUID;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-virtual {v5, v6}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v6

    iput-wide v6, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parent_id:J

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->FolderID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;

    :goto_4
    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$AgentData;->AgentID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->agentUUID:Ljava/util/UUID;

    const/4 v5, 0x0

    iput-boolean v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isFolder:Z

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->Type:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->AssetID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->InvType:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->Flags:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->flags:I

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->CreationDate:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creationDate:I

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->CreatorID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->GroupID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupUUID:Ljava/util/UUID;

    new-instance v5, Ljava/util/UUID;

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    invoke-direct {v5, v6, v7, v8, v9}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->lastOwnerUUID:Ljava/util/UUID;

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->OwnerID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    iget-boolean v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->GroupOwned:Z

    iput-boolean v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isGroupOwned:Z

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->BaseMask:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->OwnerMask:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->GroupMask:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->EveryoneMask:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->NextOwnerMask:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->SalePrice:I

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->salePrice:I

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->SaleType:I

    iput v0, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->saleType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->updateOrInsert(Landroid/database/sqlite/SQLiteDatabase;)V

    add-int/lit8 v1, v1, 0x1

    const/16 v0, 0x10

    if-le v1, v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->yieldIfContendedSafely()V

    const/4 v1, 0x0

    :cond_6
    iget-wide v6, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parent_id:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v8

    cmp-long v0, v6, v8

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->existingChildren:Ljava/util/Set;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :cond_7
    :goto_5
    :try_start_7
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->receivedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->receivedCount:I
    :try_end_7
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_3

    :cond_8
    :try_start_8
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->FolderID:Ljava/util/UUID;

    invoke-virtual {v5, v6}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->findEntry(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v5

    if-eqz v5, :cond_9

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v6

    iput-wide v6, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parent_id:J

    :goto_6
    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents$ItemData;->FolderID:Ljava/util/UUID;

    iput-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parentUUID:Ljava/util/UUID;
    :try_end_8
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_4

    :catch_2
    move-exception v0

    :try_start_9
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_9
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_5

    :cond_9
    const-wide/16 v6, 0x0

    :try_start_a
    iput-wide v6, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->parent_id:J
    :try_end_a
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_6

    :cond_a
    :try_start_b
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->setTransactionSuccessful()V
    :try_end_b
    .catch Lcom/lumiyaviewer/lumiya/orm/DBObject$DatabaseBindingException; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->db:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->endTransaction()V

    goto/16 :goto_2

    :cond_b
    const/4 v0, 0x0

    return v0
.end method

.method public cancel()V
    .locals 0

    return-void
.end method

.method public start()V
    .locals 4

    const/4 v3, 0x1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Inventory: UDP fetching folder "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->folderUUID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->getCircuitInfo()Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->getCircuitInfo()Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->folderUUID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->FolderID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->getCircuitInfo()Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->OwnerID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    iput-boolean v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->FetchFolders:Z

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->InventoryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;

    iput-boolean v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents$InventoryData;->FetchItems:Z

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;->isReliable:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryUDPFetchRequest;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method
