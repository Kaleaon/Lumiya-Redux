.class Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-set3(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    move-result-object v1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    const v1, 0x7f100118

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    const-string/jumbo v1, "UpdateVisibleRange: pending %b, first %d, last %d"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->hasPendingAdapterUpdates()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->findFirstVisibleItemPosition()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->findLastVisibleItemPosition()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->hasPendingAdapterUpdates()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-wrap1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->findFirstVisibleItemPosition()I

    move-result v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-get4(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->setVisibleRange(II)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v0, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-set3(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-get2(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-get6(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
