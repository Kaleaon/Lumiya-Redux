.class final Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;


# instance fields
.field private final lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

.field private final unreadCount:I


# direct methods
.method constructor <init>(ILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 0
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->unreadCount:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;

    if-eqz v2, :cond_4

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->unreadCount:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;->unreadCount()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;->lastMessage()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v2

    if-nez v2, :cond_1

    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;->lastMessage()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    return v1
.end method

.method public hashCode()I
    .locals 2

    const v1, 0xf4243

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->unreadCount:I

    xor-int/2addr v0, v1

    mul-int/2addr v1, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    xor-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public lastMessage()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "UnreadMessageInfo{unreadCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->unreadCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "lastMessage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unreadCount()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;->unreadCount:I

    return v0
.end method
