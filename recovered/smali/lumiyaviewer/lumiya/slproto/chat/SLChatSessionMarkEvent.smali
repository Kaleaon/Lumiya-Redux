.class public Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;
    }
.end annotation


# instance fields
.field private final description:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final sessionMarkType:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 2
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->values()[Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getChatChannel()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;->sessionMarkType:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getMessageText()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;->description:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;Ljava/lang/String;)V
    .locals 0
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;->sessionMarkType:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;->description:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->SessionMark:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    return-object v0
.end method

.method protected getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .locals 5
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v4, 0x3

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;->sessionMarkType:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->Teleport:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    if-ne v0, v1, :cond_0

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;->description:Ljava/lang/String;

    aput-object v1, v0, v3

    const v1, 0x7f09033b

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {v4, v4}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;->getTimestamp()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v3

    const v0, 0x7f0901dc

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViewType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_SESSION_MARK:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setMessageText(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent;->sessionMarkType:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSessionMarkEvent$SessionMarkType;->ordinal()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setChatChannel(Ljava/lang/Integer;)V

    return-void
.end method
