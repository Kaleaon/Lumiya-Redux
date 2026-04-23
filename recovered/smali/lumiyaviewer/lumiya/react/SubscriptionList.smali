.class public Lcom/lumiyaviewer/lumiya/react/SubscriptionList;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private lastData:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private lastError:Ljava/lang/Throwable;

.field private final subscriptions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference",
            "<TK;TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->subscriptions:Ljava/util/Set;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->lastData:Ljava/lang/Object;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->lastError:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public final addSubscription(Lcom/lumiyaviewer/lumiya/react/Subscription;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->subscriptions:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/react/Subscription;->getReference()Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final getData()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->lastData:Ljava/lang/Object;

    return-object v0
.end method

.method public final getError()Ljava/lang/Throwable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->lastError:Ljava/lang/Throwable;

    return-object v0
.end method

.method public final getSubscriptions(Z)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->subscriptions:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_1

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->subscriptions:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    :cond_0
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v0, v1

    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    move-object v0, v1

    goto :goto_1

    :cond_2
    return-object v1

    :cond_3
    move-object v0, v1

    goto :goto_1
.end method

.method public final isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->subscriptions:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public final removeByReference(Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->subscriptions:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final removeSubscription(Lcom/lumiyaviewer/lumiya/react/Subscription;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->subscriptions:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/react/Subscription;->getReference()Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final setData(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->lastData:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->lastError:Ljava/lang/Throwable;

    return-void
.end method

.method public final setError(Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->lastData:Ljava/lang/Object;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->lastError:Ljava/lang/Throwable;

    return-void
.end method
