.class public Lcom/lumiyaviewer/lumiya/react/Subscription;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/RefreshableOne;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;,
        Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;,
        Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/RefreshableOne;"
    }
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final onData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final onError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final reference:Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference",
            "<TK;TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final subscriptionPool:Lcom/lumiyaviewer/lumiya/react/Unsubscribable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Unsubscribable",
            "<TK;TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Unsubscribable;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;Ljava/lang/ref/ReferenceQueue;)V
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/Unsubscribable;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/ref/ReferenceQueue;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lcom/lumiyaviewer/lumiya/react/Unsubscribable",
            "<TK;TT;>;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;",
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->key:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->subscriptionPool:Lcom/lumiyaviewer/lumiya/react/Unsubscribable;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->onData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->onError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->executor:Ljava/util/concurrent/Executor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;

    invoke-direct {v0, p0, p6}, Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;-><init>(Lcom/lumiyaviewer/lumiya/react/Subscription;Ljava/lang/ref/ReferenceQueue;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->reference:Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;

    return-void
.end method


# virtual methods
.method public final getKey()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->key:Ljava/lang/Object;

    return-object v0
.end method

.method getReference()Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference",
            "<TK;TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->reference:Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_Subscription_1719(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->onData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;->onData(Ljava/lang/Object;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_Subscription_1938(Ljava/lang/Throwable;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->onError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;->onError(Ljava/lang/Throwable;)V

    return-void
.end method

.method onData(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->executor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$CF5cnl0on0-506QrOcvyL8_AER8;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$CF5cnl0on0-506QrOcvyL8_AER8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->onData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;->onData(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method onError(Ljava/lang/Throwable;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->onError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->executor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$CF5cnl0on0-506QrOcvyL8_AER8$1;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$CF5cnl0on0-506QrOcvyL8_AER8$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->onError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public requestRefresh()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->subscriptionPool:Lcom/lumiyaviewer/lumiya/react/Unsubscribable;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/react/Refreshable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->subscriptionPool:Lcom/lumiyaviewer/lumiya/react/Unsubscribable;

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/Refreshable;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->key:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/react/Refreshable;->requestUpdate(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public unsubscribe()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/Subscription;->subscriptionPool:Lcom/lumiyaviewer/lumiya/react/Unsubscribable;

    invoke-interface {v0, p0}, Lcom/lumiyaviewer/lumiya/react/Unsubscribable;->unsubscribe(Lcom/lumiyaviewer/lumiya/react/Subscription;)V

    return-void
.end method
