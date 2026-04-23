.class Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;

.field final synthetic val$target:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding$1;->val$target:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment_ViewBinding$1;->val$target:Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;

    invoke-virtual {v0, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->onSearchTextAction(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method
