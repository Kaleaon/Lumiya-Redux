.class public Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;

.field private view2131755639:Landroid/view/View;

.field private view2131755640:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;Landroid/view/View;)V
    .locals 4
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    const v3, 0x7f100277

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;

    const-string/jumbo v0, "field \'searchString\' and method \'onSearchTextAction\'"

    invoke-static {p2, v3, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'searchString\'"

    const-class v2, Landroid/widget/EditText;

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->searchString:Landroid/widget/EditText;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;->view2131755639:Landroid/view/View;

    move-object v0, v1

    check-cast v0, Landroid/widget/TextView;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding$1;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    const-string/jumbo v0, "field \'searchResultsList\'"

    const-class v1, Landroid/support/v7/widget/RecyclerView;

    const v2, 0x7f10027d

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->searchResultsList:Landroid/support/v7/widget/RecyclerView;

    const-string/jumbo v0, "field \'radioGroupSearchType\'"

    const-class v1, Landroid/widget/RadioGroup;

    const v2, 0x7f100279

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->radioGroupSearchType:Landroid/widget/RadioGroup;

    const-string/jumbo v0, "method \'onSearchButtonClicked\'"

    const v1, 0x7f100278

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;->view2131755640:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding$2;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->searchString:Landroid/widget/EditText;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->searchResultsList:Landroid/support/v7/widget/RecyclerView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->radioGroupSearchType:Landroid/widget/RadioGroup;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;->view2131755639:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;->view2131755639:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;->view2131755640:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;->view2131755640:Landroid/view/View;

    return-void
.end method
