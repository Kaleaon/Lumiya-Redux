.class public final Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;


# instance fields
.field private final text:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 1
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getMessageText()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;->text:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;->text:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->SystemMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    return-object v0
.end method

.method protected getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .locals 1
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getViewType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_PLAIN:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    return-object v0
.end method

.method protected isActionMessage(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Z
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x1

    return v0
.end method

.method public serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setMessageText(Ljava/lang/String;)V

    return-void
.end method
