.class public Lcom/lumiyaviewer/lumiya/react/SubscriptionPoolUncached;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscribable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/Subscribable",
        "<TK;TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;)",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPoolUncached;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;",
            ")",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPoolUncached;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;)",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPoolUncached;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;",
            ")",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method
