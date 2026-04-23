.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NameRequestEntry"
.end annotation


# instance fields
.field private final messageDatabaseIDs:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

.field private final userUUID:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;Ljava/util/UUID;Ljava/lang/Long;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->userUUID:Ljava/util/UUID;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->messageDatabaseIDs:Ljava/util/Set;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->messageDatabaseIDs:Ljava/util/Set;

    invoke-interface {v0, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public addMessageID(Ljava/lang/Long;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->messageDatabaseIDs:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getMessageIDs()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->messageDatabaseIDs:Ljava/util/Set;

    return-object v0
.end method

.method public subscribe()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->-get5(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserNames()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->userUUID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Ljava/util/concurrent/Executor;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;->-get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;)Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method

.method public unsubscribe()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$NameRequestEntry;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method
