.class public Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$OnTransactionClickListener;,
        Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final agentUUID:Ljava/util/UUID;

.field private final context:Landroid/content/Context;

.field private data:Lde/greenrobot/dao/query/LazyList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final inflater:Landroid/view/LayoutInflater;

.field private final onTransactionClickListener:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$OnTransactionClickListener;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;)Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->agentUUID:Ljava/util/UUID;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;)Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$OnTransactionClickListener;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->onTransactionClickListener:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$OnTransactionClickListener;

    return-object v0
.end method

.method constructor <init>(Landroid/content/Context;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$OnTransactionClickListener;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->agentUUID:Ljava/util/UUID;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->inflater:Landroid/view/LayoutInflater;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->onTransactionClickListener:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$OnTransactionClickListener;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->setHasStableIds(Z)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/LazyList;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/LazyList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v0, p1}, Lde/greenrobot/dao/query/LazyList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->getId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->onBindViewHolder(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    if-eqz v0, :cond_0

    if-ltz p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/LazyList;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/query/LazyList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->bindToData(Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->inflater:Landroid/view/LayoutInflater;

    const v1, 0x7f0400b0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;-><init>(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;Landroid/view/View;)V

    return-object v1
.end method

.method public bridge synthetic onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->onViewRecycled(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;)V

    return-void
.end method

.method public onViewRecycled(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;)V
    .locals 0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->onRecycled()V

    return-void
.end method

.method public setData(Lde/greenrobot/dao/query/LazyList;)V
    .locals 0
    .param p1    # Lde/greenrobot/dao/query/LazyList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->notifyDataSetChanged()V

    return-void
.end method
