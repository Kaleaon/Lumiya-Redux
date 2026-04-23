.class public Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;Landroid/view/View;)V
    .locals 3
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;

    const-string/jumbo v0, "field \'userName\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f10029e

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->userName:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'userPicView\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const v2, 0x7f10013f

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const-string/jumbo v0, "field \'timestampTextView\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f10029d

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->timestampTextView:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'amountTextView\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f10029f

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->amountTextView:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'finalBalanceTextView\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002a0

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->finalBalanceTextView:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->userName:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->timestampTextView:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->amountTextView:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$TransactionViewHolder;->finalBalanceTextView:Landroid/widget/TextView;

    return-void
.end method
