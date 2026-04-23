.class public Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field private final dialogButtonIgnore:Landroid/widget/Button;

.field public final dialogButtonsLayout:Landroid/view/View;

.field public final dialogResultTextView:Landroid/widget/TextView;

.field private final textBox:Landroid/widget/EditText;

.field private textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final textBoxSend:Landroid/widget/Button;


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;-><init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    const v0, 0x7f10012a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    const v0, 0x7f10012b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogButtonsLayout:Landroid/view/View;

    const v0, 0x7f100139

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxSend:Landroid/widget/Button;

    const v0, 0x7f100129

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogButtonIgnore:Landroid/widget/Button;

    const v0, 0x7f100138

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxSend:Landroid/widget/Button;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxSend:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogButtonIgnore:Landroid/widget/Button;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogButtonIgnore:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    :goto_0
    return-void

    :sswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->getAgentUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->onDialogIgnored(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->requestAdapterUpdate()V

    goto :goto_0

    :sswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->getAgentUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->onEnteredText(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->requestAdapterUpdate()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxSend:Landroid/widget/Button;

    const v1, 0x7f090354

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x7f100129 -> :sswitch_0
        0x7f100139 -> :sswitch_1
    .end sparse-switch
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxSend:Landroid/widget/Button;

    const v1, 0x7f090353

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    :cond_0
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x42

    if-ne p2, v0, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f100138

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->getAgentUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->onEnteredText(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->requestAdapterUpdate()V

    :cond_0
    const/4 v0, 0x1

    return v0

    :cond_1
    return v2
.end method

.method public setTextBoxEvent(Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBoxSend:Landroid/widget/Button;

    const v1, 0x7f090353

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->textBox:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
