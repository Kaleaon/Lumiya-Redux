.class public final Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatOnlineOfflineEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;


# instance fields
.field private final wentOnline:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;Z)V
    .locals 0
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatOnlineOfflineEvent;->wentOnline:Z

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Z)V
    .locals 0
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;)V

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatOnlineOfflineEvent;->wentOnline:Z

    return-void
.end method


# virtual methods
.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatOnlineOfflineEvent;->wentOnline:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->WentOnline:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->WentOffline:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    goto :goto_0
.end method

.method protected getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .locals 1
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatOnlineOfflineEvent;->wentOnline:Z

    if-eqz v0, :cond_0

    const v0, 0x7f090389

    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const v0, 0x7f090388

    goto :goto_0
.end method

.method public getViewType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_NORMAL:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

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
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    return-void
.end method
