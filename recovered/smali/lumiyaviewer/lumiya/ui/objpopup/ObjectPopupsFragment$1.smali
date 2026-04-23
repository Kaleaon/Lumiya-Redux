.class Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment$1;
.super Landroid/support/v7/widget/helper/ItemTouchHelper$SimpleCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;II)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;

    invoke-direct {p0, p2, p3}, Landroid/support/v7/widget/helper/ItemTouchHelper$SimpleCallback;-><init>(II)V

    return-void
.end method


# virtual methods
.method public onMove(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onSwiped(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    const v2, 0x7f10023f

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v2

    instance-of v3, v0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;

    if-eqz v3, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;->getObject(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->cancelObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    :cond_0
    return-void
.end method
