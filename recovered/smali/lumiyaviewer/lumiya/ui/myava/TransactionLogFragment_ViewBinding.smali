.class public Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;Landroid/view/View;)V
    .locals 3
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    const-string/jumbo v0, "field \'transactionLogView\'"

    const-class v1, Landroid/support/v7/widget/RecyclerView;

    const v2, 0x7f10029c

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->transactionLogView:Landroid/support/v7/widget/RecyclerView;

    const-string/jumbo v0, "field \'loadingLayout\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v2, 0x7f1000bd

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->transactionLogView:Landroid/support/v7/widget/RecyclerView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    return-void
.end method
