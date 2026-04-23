.class public abstract Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;


# instance fields
.field protected final chatChannel:I

.field protected ignored:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 1
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->ignored:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getChatChannel()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->chatChannel:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getDialogIgnored()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->ignored:Z

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;Ljava/util/UUID;)V
    .locals 3
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ObjectID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ObjectName:[B

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;-><init>(Ljava/util/UUID;Ljava/lang/String;)V

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->Message:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->sanitizeDialogText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, p2, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->ignored:Z

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog$Data;->ChatChannel:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->chatChannel:I

    return-void
.end method

.method private static sanitizeDialogText(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    :goto_0
    const-string/jumbo v0, "\n\n"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "\n\n"

    const-string/jumbo v1, "\n"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected onDialogIgnored(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->ignored:Z

    return-void
.end method

.method public serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->chatChannel:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setChatChannel(Ljava/lang/Integer;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatDialogEvent;->ignored:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setDialogIgnored(Ljava/lang/Boolean;)V

    return-void
.end method

.method public abstract showDialog(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
.end method
