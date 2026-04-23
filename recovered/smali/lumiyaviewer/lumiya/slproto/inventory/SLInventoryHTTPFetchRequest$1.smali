.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    const/4 v14, 0x3

    const/4 v13, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-string/jumbo v0, "InventoryFetcher: Going to fetch folder: %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->folderUUID:Ljava/util/UUID;

    const/4 v5, 0x0

    aput-object v4, v1, v5

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDStreamingXMLRequest;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDStreamingXMLRequest;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;-><init>()V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    const/4 v4, 0x3

    new-array v4, v4, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v9, "folder_id"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    iget-object v11, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v11, v11, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->folderUUID:Ljava/util/UUID;

    invoke-direct {v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-direct {v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v9, 0x0

    aput-object v8, v4, v9

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v9, "fetch_folders"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;

    const/4 v11, 0x1

    invoke-direct {v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;-><init>(Z)V

    invoke-direct {v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v9, 0x1

    aput-object v8, v4, v9

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v9, "fetch_items"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;

    const/4 v11, 0x1

    invoke-direct {v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;-><init>(Z)V

    invoke-direct {v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v9, 0x2

    aput-object v8, v4, v9

    invoke-direct {v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->add(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v9, "folders"

    invoke-direct {v4, v9, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v0, 0x0

    aput-object v4, v1, v0

    invoke-direct {v8, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->-get2(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    move v4, v2

    move v1, v2

    :goto_0
    if-ge v4, v14, :cond_0

    :try_start_1
    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    const/4 v10, 0x0

    invoke-direct {v9, v0, v10}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :try_start_2
    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->start()V

    const-string/jumbo v0, "InventoryFetcher: Starting HTTP request for folder: %s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    iget-object v11, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v11, v11, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->folderUUID:Ljava/util/UUID;

    const/4 v12, 0x0

    aput-object v11, v10, v12

    invoke-static {v0, v10}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;)Ljava/lang/String;

    move-result-object v0

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;

    iget-object v11, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    const/4 v12, 0x0

    invoke-direct {v10, v11, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;)V

    invoke-virtual {v5, v0, v8, v10}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDStreamingXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V

    const-string/jumbo v0, "InvFetch: done parsing,  waiting for commit thread"

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-static {v0, v10}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x1

    invoke-virtual {v9, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->stopAndWait(Z)V

    const-string/jumbo v0, "InvFetch: commit thread finished"

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-static {v0, v10}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move v1, v3

    :goto_1
    if-eqz v1, :cond_1

    :cond_0
    :try_start_3
    const-string/jumbo v0, "InventoryFetcher: Fetched folder: %s (fetch time = %d)"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->folderUUID:Ljava/util/UUID;

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x0

    aput-object v5, v4, v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long v6, v8, v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->-get2(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :goto_2
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->-get1(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    :goto_3
    const-string/jumbo v4, "InventoryFetcher: done processing folder %s: success %s cancelled %b"

    new-array v5, v14, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->folderUUID:Ljava/util/UUID;

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    if-eqz v1, :cond_3

    const-string/jumbo v2, "true"

    :goto_4
    aput-object v2, v5, v3

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v5, v13

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    invoke-virtual {v2, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->completeFetch(ZZ)V

    return-void

    :catch_0
    move-exception v0

    :try_start_4
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    :goto_5
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_2

    :catch_2
    move-exception v0

    :try_start_5
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->printStackTrace()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    :try_start_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "InventoryFetcher: malformed xml after req = "

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    goto/16 :goto_1

    :catch_3
    move-exception v0

    goto/16 :goto_1

    :cond_1
    :try_start_7
    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;->interrupt()V

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;->-get1(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    move-result v0

    if-nez v0, :cond_0

    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto/16 :goto_0

    :cond_2
    move v0, v3

    goto :goto_3

    :cond_3
    const-string/jumbo v2, "false"

    goto :goto_4

    :catch_4
    move-exception v0

    move v1, v2

    goto :goto_5
.end method
