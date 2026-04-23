.class public Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;
.super Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool",
        "<TK;TT;>;"
    }
.end annotation


# instance fields
.field private final entries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionList",
            "<TK;TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;->entries:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method protected getExistingSubscriptions(Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionList",
            "<TK;TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;->entries:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    return-object v0
.end method

.method protected getSubscriptions(Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionList",
            "<TK;TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;->entries:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;->entries:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public setCanContainNulls(Z)Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool",
            "<TK;TT;>;"
        }
    .end annotation

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->setCanContainNulls(Z)Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;

    return-object p0
.end method

.method public bridge synthetic setCanContainNulls(Z)Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;->setCanContainNulls(Z)Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    move-result-object v0

    return-object v0
.end method
