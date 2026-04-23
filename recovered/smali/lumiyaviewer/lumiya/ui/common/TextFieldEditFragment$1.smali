.class Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;

.field final synthetic val$fieldEditText:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;Landroid/widget/TextView;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment$1;->val$fieldEditText:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment$1;->val$fieldEditText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;->-get1(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;)Z

    move-result v1

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;->-set0(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;->-get2(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;)Landroid/view/MenuItem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;->-get2(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;)Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_0
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
