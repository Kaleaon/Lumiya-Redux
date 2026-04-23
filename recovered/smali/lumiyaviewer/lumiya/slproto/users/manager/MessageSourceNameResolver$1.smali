.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
        "<",
        "Lcom/lumiyaviewer/lumiya/dao/UserName;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onData(Lcom/lumiyaviewer/lumiya/dao/UserName;)V
    .locals 5

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->-get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->-get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;

    if-eqz v0, :cond_3

    new-instance v2, Ljava/util/HashSet;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->getMessageIDs()Ljava/util/Set;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/UserName;->isComplete()Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->-get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getUuid()Ljava/util/UUID;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v1, v2

    :goto_0
    monitor-exit v3

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->unsubscribe()V

    :cond_0
    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$OnMessageSourcesResolvedListener;

    move-result-object v0

    invoke-interface {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$OnMessageSourcesResolvedListener;->onMessageSourcesResolved(Ljava/util/Set;Lcom/lumiyaviewer/lumiya/dao/UserName;)V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_2
    move-object v0, v1

    move-object v1, v2

    goto :goto_0

    :cond_3
    move-object v0, v1

    goto :goto_0
.end method

.method public bridge synthetic onData(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/dao/UserName;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$1;->onData(Lcom/lumiyaviewer/lumiya/dao/UserName;)V

    return-void
.end method
