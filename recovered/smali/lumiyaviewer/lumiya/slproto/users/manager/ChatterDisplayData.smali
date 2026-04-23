.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
        ">;"
    }
.end annotation


# instance fields
.field public final chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

.field public final displayName:Ljava/lang/String;

.field final distanceToUser:F

.field final isOnline:Z

.field private final lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final unreadCount:I

.field private final voiceActive:Z


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;ZILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;FZ)V
    .locals 0
    .param p5    # Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->isOnline:Z

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->unreadCount:I

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    iput p6, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->distanceToUser:F

    iput-boolean p7, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->voiceActive:Z

    return-void
.end method


# virtual methods
.method public buildView(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setLabel(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    invoke-virtual {p2, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setThumbnailChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->isOnline:Z

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->isOnline:Z

    invoke-virtual {p2, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setOnlineStatusIcon(ZZ)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->unreadCount:I

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setUnreadCount(I)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->voiceActive:Z

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setVoiceActive(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p3, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Z)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setLastMessage(Ljava/lang/String;)V

    :goto_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->distanceToUser:F

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setDistance(F)V

    return-void

    :cond_0
    invoke-virtual {p2, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setLastMessage(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public compareTo(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)I
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/google/common/primitives/Booleans;->compare(ZZ)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    :goto_0
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_3

    return v0

    :cond_1
    const-string/jumbo v0, ""

    goto :goto_0

    :cond_2
    const-string/jumbo v1, ""

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->compareTo(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->compareTo(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)I

    move-result v0

    return v0
.end method

.method public getChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method withDisplayName(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;
    .locals 8
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->isOnline:Z

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->unreadCount:I

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->distanceToUser:F

    iget-boolean v7, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->voiceActive:Z

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;ZILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;FZ)V

    return-object v0
.end method

.method withDistanceToUser(F)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;
    .locals 8
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->isOnline:Z

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->unreadCount:I

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    iget-boolean v7, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->voiceActive:Z

    move v6, p1

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;ZILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;FZ)V

    return-object v0
.end method

.method withOnlineStatus(Z)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;
    .locals 8
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->unreadCount:I

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->distanceToUser:F

    iget-boolean v7, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->voiceActive:Z

    move v3, p1

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;ZILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;FZ)V

    return-object v0
.end method

.method withUnreadInfo(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;
    .locals 8
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->isOnline:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;->unreadCount()I

    move-result v4

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;->lastMessage()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v5

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->distanceToUser:F

    iget-boolean v7, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->voiceActive:Z

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;ZILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;FZ)V

    return-object v0
.end method

.method withVoiceActive(Z)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;
    .locals 8
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->isOnline:Z

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->unreadCount:I

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->lastMessage:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->distanceToUser:F

    move v7, p1

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;ZILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;FZ)V

    return-object v0
.end method
