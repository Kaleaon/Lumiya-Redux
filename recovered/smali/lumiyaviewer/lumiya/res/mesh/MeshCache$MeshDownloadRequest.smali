.class Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MeshDownloadRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<",
        "Ljava/util/UUID;",
        "Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;",
        ">;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field private volatile downloadTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private final outputFile:Ljava/io/File;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->outputFile:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public cancelRequest()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->downloadTask:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void
.end method

.method public execute()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->downloadTask:Ljava/util/concurrent/Future;

    return-void
.end method

.method public run()V
    .locals 10

    const/4 v9, 0x2

    const/4 v6, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->-get1(Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    move-object v0, v2

    :cond_0
    :goto_0
    if-nez v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->-get0(Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    if-nez v0, :cond_0

    :try_start_1
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->-get1(Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v4

    :cond_1
    monitor-exit v3

    if-nez v0, :cond_2

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->completeRequest(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_2
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->outputFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ".tmp"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, "/?mesh_id="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v0, "Fetching mesh: %s"

    new-array v5, v6, [Ljava/lang/Object;

    aput-object v4, v5, v1

    invoke-static {v0, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    move v0, v1

    :goto_1
    if-ge v0, v9, :cond_3

    :try_start_2
    new-instance v1, Lokhttp3/Request$Builder;

    invoke-direct {v1}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v1, v4}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    const-string/jumbo v5, "Accept"

    const-string/jumbo v6, "application/octet-stream"

    invoke-virtual {v1, v5, v6}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->getOkHttpClient()Lokhttp3/OkHttpClient;

    move-result-object v5

    invoke-virtual {v5, v1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    invoke-interface {v1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1

    if-nez v1, :cond_5

    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Null response"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->downloadTask:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->completeRequest(Ljava/lang/Object;)V

    :cond_4
    return-void

    :cond_5
    :try_start_3
    invoke-virtual {v1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v5

    if-nez v5, :cond_6

    new-instance v0, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Error response code "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lokhttp3/Response;->code()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {v1}, Lokhttp3/Response;->close()V

    throw v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    :cond_6
    :try_start_5
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    if-eqz v5, :cond_7

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    :cond_7
    new-instance v5, Ljava/io/BufferedOutputStream;

    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-static {v6, v5}, Lcom/google/common/io/ByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    move-result-wide v6

    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->flush()V

    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->close()V

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->outputFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    if-eqz v5, :cond_8

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    :cond_8
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->outputFile:Ljava/io/File;

    invoke-virtual {v3, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    const-string/jumbo v5, "MeshFetch: Saved %d bytes to %s"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v8, v7

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->outputFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v8, v7

    invoke-static {v5, v8}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->outputFile:Ljava/io/File;

    invoke-direct {v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;->completeRequest(Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    invoke-virtual {v1}, Lokhttp3/Response;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1
.end method
