.class public Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;
.super Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
        "<",
        "Lcom/google/common/collect/ImmutableList",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
        ">;>;",
        "Ljava/io/Closeable;"
    }
.end annotation


# instance fields
.field private final predicate:Lcom/google/common/base/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Predicate",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;"
        }
    .end annotation
.end field

.field private final subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V
    .locals 2

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;->predicate:Lcom/google/common/base/Predicate;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getChatterList()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-interface {v0, p3, v1, p0}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;Lcom/google/common/base/Predicate;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;",
            "Lcom/google/common/base/Predicate",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;->predicate:Lcom/google/common/base/Predicate;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getChatterList()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-interface {v0, p3, v1, p0}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method


# virtual methods
.method public bridge synthetic areAllItemsEnabled()Z
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->areAllItemsEnabled()Z

    move-result v0

    return v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    return-void
.end method

.method public bridge synthetic getCount()I
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getItemId(I)J
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public bridge synthetic getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasStableIds()Z
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->hasStableIds()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isEmpty()Z
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isEnabled(I)Z
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->isEnabled(I)Z

    move-result v0

    return v0
.end method

.method public onData(Lcom/google/common/collect/ImmutableList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;->predicate:Lcom/google/common/base/Predicate;

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;->setData(Lcom/google/common/collect/ImmutableList;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;->predicate:Lcom/google/common/base/Predicate;

    invoke-static {p1, v0}, Lcom/google/common/collect/Iterables;->filter(Ljava/lang/Iterable;Lcom/google/common/base/Predicate;)Ljava/lang/Iterable;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;->setData(Lcom/google/common/collect/ImmutableList;)V

    goto :goto_0
.end method

.method public bridge synthetic onData(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;->onData(Lcom/google/common/collect/ImmutableList;)V

    return-void
.end method
