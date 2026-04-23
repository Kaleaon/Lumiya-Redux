.class Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$1;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;


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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 2

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-set1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;Z)Z

    :cond_1
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-wrap2(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)V

    return-void
.end method
