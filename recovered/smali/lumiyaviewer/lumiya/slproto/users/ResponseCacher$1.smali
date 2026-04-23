.class Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;
.super Lcom/lumiyaviewer/lumiya/react/RequestProcessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/RequestProcessor",
        "<TKeyType;TMessageType;TMessageType;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;

.field final synthetic val$keyPrefix:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->val$keyPrefix:Ljava/lang/String;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    return-void
.end method


# virtual methods
.method protected isRequestComplete(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TKeyType;TMessageType;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;)Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;

    invoke-static {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/CachedResponse;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/CachedResponse;->getMustRevalidate()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected processRequest(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TKeyType;)TMessageType;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;)Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;

    invoke-static {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/CachedResponse;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/CachedResponse;->getData()[B

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/CachedResponse;->getData()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->loadCached([B)Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "%s: returning cached response for key %s (%s)"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->val$keyPrefix:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const/4 v3, 0x2

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0

    :cond_0
    return-object v2
.end method

.method protected processResult(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TKeyType;TMessageType;)TMessageType;"
        }
    .end annotation

    const/4 v4, 0x0

    const-string/jumbo v0, "%s: saving cached data for key %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->val$keyPrefix:Ljava/lang/String;

    aput-object v2, v1, v4

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;)Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/dao/CachedResponse;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;

    invoke-static {v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;

    invoke-virtual {v3, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->storeCached(Ljava/lang/Object;)[B

    move-result-object v3

    invoke-direct {v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/dao/CachedResponse;-><init>(Ljava/lang/String;[BZ)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;->insertOrReplace(Ljava/lang/Object;)J

    :cond_0
    return-object p2
.end method
