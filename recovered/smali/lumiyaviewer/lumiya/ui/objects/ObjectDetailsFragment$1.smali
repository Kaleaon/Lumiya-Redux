.class Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;

.field final synthetic val$objectPayButton:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;Landroid/widget/Button;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment$1;->val$objectPayButton:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2

    :try_start_0
    invoke-interface {p1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment$1;->val$objectPayButton:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment$1;->val$objectPayButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
