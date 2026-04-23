.class Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->-get2(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserNameRequestQueue()Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    move-result-object v1

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->-get1(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {v2}, Ljava/util/Set;->clear()V

    :try_start_0
    invoke-interface {v1}, Lcom/lumiyaviewer/lumiya/react/RequestQueue;->waitForRequest()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :goto_1
    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v0

    const/4 v3, 0x4

    if-ge v0, v3, :cond_1

    invoke-interface {v1}, Lcom/lumiyaviewer/lumiya/react/RequestQueue;->getNextRequest()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    if-eqz v0, :cond_1

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_0
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-interface {v1, v0}, Lcom/lumiyaviewer/lumiya/react/RequestQueue;->returnRequest(Ljava/lang/Object;)V

    goto :goto_2

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;

    invoke-static {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;Ljava/util/Set;Lcom/lumiyaviewer/lumiya/react/RequestQueue;)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-interface {v1, v0}, Lcom/lumiyaviewer/lumiya/react/RequestQueue;->returnRequest(Ljava/lang/Object;)V

    goto :goto_3

    :cond_2
    invoke-interface {v2}, Ljava/util/Set;->clear()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :cond_3
    return-void
.end method
