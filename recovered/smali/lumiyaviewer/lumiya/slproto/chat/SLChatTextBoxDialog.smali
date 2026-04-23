.class public final Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;


# instance fields
.field private enteredValue:Ljava/lang/String;

.field private final textBoxButtonIndex:I


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 1
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->enteredValue:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getTextBoxButtonIndex()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->textBoxButtonIndex:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getDialogSelectedOption()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->enteredValue:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;Ljava/util/UUID;I)V
    .locals 1
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;Ljava/util/UUID;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->enteredValue:Ljava/lang/String;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->textBoxButtonIndex:I

    return-void
.end method


# virtual methods
.method public bindViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V
    .locals 6
    .param p3    # Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/16 v5, 0x8

    const/4 v4, 0x0

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->bindViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->enteredValue:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->ignored:Z

    if-eqz v0, :cond_3

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->ignored:Z

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    const v1, 0x7f0900fe

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    :goto_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogButtonsLayout:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    :goto_1
    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->setTextBoxEvent(Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;)V

    :cond_1
    return-void

    :cond_2
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->enteredValue:Ljava/lang/String;

    aput-object v3, v2, v4

    const v3, 0x7f090351

    invoke-virtual {v1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_3
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatTextBoxViewHolder;->dialogButtonsLayout:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1
.end method

.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->TextBoxDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    return-object v0
.end method

.method public getViewType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_TEXTBOX:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    return-object v0
.end method

.method public isObjectPopup()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_chat_SLChatTextBoxDialog_4223(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->onEnteredText(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_chat_SLChatTextBoxDialog_4314(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->onDialogIgnored(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return-void
.end method

.method public onDialogIgnored(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->onDialogIgnored(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->cancelObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void
.end method

.method public onEnteredText(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/lang/String;)V
    .locals 4

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->enteredValue:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->chatChannel:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->textBoxButtonIndex:I

    invoke-virtual {v1, v0, v2, v3, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendScriptDialogReply(Ljava/util/UUID;IILjava/lang/String;)V

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->cancelObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void
.end method

.method public serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->textBoxButtonIndex:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setTextBoxButtonIndex(Ljava/lang/Integer;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->enteredValue:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setDialogSelectedOption(Ljava/lang/String;)V

    return-void
.end method

.method public showDialog(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextBoxDialog;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setTitle(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI$1;

    invoke-direct {v1, p0, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setOnTextEnteredListener(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI;

    invoke-direct {v1, p0, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$Iyj6QpN-ZLoXueXenKuJvDVzcmI;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setOnTextCancelledListener(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextCancelledListener;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->show()V

    return-void
.end method
