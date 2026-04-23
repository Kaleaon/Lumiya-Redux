.class public Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;

.field private view2131755622:Landroid/view/View;

.field private view2131755626:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;Landroid/view/View;)V
    .locals 3
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;

    const-string/jumbo v0, "field \'paymentDetailsBalance\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f100267

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->paymentDetailsBalance:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'receivingUserName\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f100264

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->receivingUserName:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'payMessage\'"

    const-class v1, Landroid/widget/EditText;

    const v2, 0x7f100269

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->payMessage:Landroid/widget/EditText;

    const-string/jumbo v0, "field \'payAmount\'"

    const-class v1, Landroid/widget/EditText;

    const v2, 0x7f100268

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->payAmount:Landroid/widget/EditText;

    const-string/jumbo v0, "field \'receivingUserPic\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const v2, 0x7f100265

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->receivingUserPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const-string/jumbo v0, "method \'onUserPayButton\'"

    const v1, 0x7f10026a

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;->view2131755626:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding$1;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "method \'onReceivingUserViewProfileClick\'"

    const v1, 0x7f100266

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;->view2131755622:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding$2;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->paymentDetailsBalance:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->receivingUserName:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->payMessage:Landroid/widget/EditText;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->payAmount:Landroid/widget/EditText;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->receivingUserPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;->view2131755626:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;->view2131755626:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;->view2131755622:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment_ViewBinding;->view2131755622:Landroid/view/View;

    return-void
.end method
