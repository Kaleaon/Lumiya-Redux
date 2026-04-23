.class Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->-set0(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->-get3(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;)Lbutterknife/Unbinder;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->transactionLogView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->hasPendingAdapterUpdates()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;)Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;)Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->getItemCount()I

    move-result v1

    if-lez v1, :cond_0

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->-set0(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->-get1(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->-get2(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
