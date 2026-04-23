.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;
.super Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FolderDataContentHandler"
.end annotation


# instance fields
.field private final commitThread:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;

.field private gotUUID:Ljava/util/UUID;

.field private gotVersion:I

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->commitThread:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;

    return-object v0
.end method

.method private constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;-><init>()V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->commitThread:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;)V

    return-void
.end method


# virtual methods
.method public onArrayBegin(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;
        }
    .end annotation

    const-string/jumbo v0, "categories"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;)V

    return-object v0

    :cond_0
    const-string/jumbo v0, "items"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;)V

    return-object v0

    :cond_1
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;->onArrayBegin(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;

    move-result-object v0

    return-object v0
.end method

.method public onMapEnd(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->gotUUID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->gotUUID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->folderUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->gotVersion:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->version:I

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->gotVersion:I

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->version:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->commitThread:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->folderEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->addEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_0
    return-void
.end method

.method public onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;,
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    const-string/jumbo v0, "InvFetch: FolderDataContentHandler: key \'%s\' value \'%s\'"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, "version"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->gotVersion:I

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string/jumbo v0, "folder_id"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;->gotUUID:Ljava/util/UUID;

    goto :goto_0
.end method
