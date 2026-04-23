.class public abstract Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter;"
    }
.end annotation


# instance fields
.field private final localItemList:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter",
            "<TT;>.",
            "LocalItemList",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList",
            "<TT;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;Lcom/google/common/base/Optional;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->localItemList:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;

    return-void
.end method


# virtual methods
.method protected abstract bindObjectViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            "TT;)V"
        }
    .end annotation
.end method

.method protected abstract createObjectViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->localItemList:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->localItemList:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->getObjectViewType(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getObject(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->localItemList:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->localItemList:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected abstract getObjectViewType(Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->localItemList:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->bindObjectViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Ljava/lang/Object;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->createObjectViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method
