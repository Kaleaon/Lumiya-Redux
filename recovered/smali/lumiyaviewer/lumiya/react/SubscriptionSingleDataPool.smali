.class public Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
.super Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool",
        "<",
        "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final entry:Lcom/lumiyaviewer/lumiya/react/SubscriptionList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionList",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->entry:Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    return-void
.end method

.method public static getSingleDataKey()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    return-object v0
.end method


# virtual methods
.method public getData()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->entry:Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->getData()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected getExistingSubscriptions(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            ")",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionList",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->entry:Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    return-object v0
.end method

.method protected bridge synthetic getExistingSubscriptions(Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    check-cast p1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->getExistingSubscriptions(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    return-object v0
.end method

.method protected getSubscriptions(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            ")",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionList",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->entry:Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    return-object v0
.end method

.method protected bridge synthetic getSubscriptions(Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    check-cast p1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->getSubscriptions(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    move-result-object v0

    return-object v0
.end method
