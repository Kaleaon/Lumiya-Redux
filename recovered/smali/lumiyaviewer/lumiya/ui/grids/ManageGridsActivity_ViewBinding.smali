.class public Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;

.field private view2131755484:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;)V
    .locals 1
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;Landroid/view/View;)V
    .locals 3
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;

    const-string/jumbo v0, "field \'gridListView\'"

    const-class v1, Landroid/widget/ListView;

    const v2, 0x7f1001db

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridListView:Landroid/widget/ListView;

    const-string/jumbo v0, "method \'onAddNewGridButton\'"

    const v1, 0x7f1001dc

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity_ViewBinding;->view2131755484:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity_ViewBinding$1;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity_ViewBinding$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridListView:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity_ViewBinding;->view2131755484:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity_ViewBinding;->view2131755484:Landroid/view/View;

    return-void
.end method
