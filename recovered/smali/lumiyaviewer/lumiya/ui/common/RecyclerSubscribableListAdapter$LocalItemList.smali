.class Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;
.super Ljava/util/AbstractList;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LocalItemList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractList",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final backingList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;Lcom/google/common/base/Optional;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList",
            "<TT;>;",
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/util/concurrent/Executor;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;

    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->backingList:Ljava/util/List;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->backingList:Ljava/util/List;

    invoke-virtual {p2, p0, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;->addSubscription(Ljava/util/List;Lcom/google/common/base/Optional;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->backingList:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->notifyItemInserted(I)V

    return-void
.end method

.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->backingList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->backingList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->backingList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->notifyItemRemoved(I)V

    return-object v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->backingList:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;->notifyItemChanged(I)V

    return-object v0
.end method

.method public size()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter$LocalItemList;->backingList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
