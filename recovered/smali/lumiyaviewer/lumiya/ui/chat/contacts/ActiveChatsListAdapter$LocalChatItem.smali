.class Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LocalChatItem"
.end annotation


# instance fields
.field private final chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;

.field private unreadMessageInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private voiceChatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return-void
.end method


# virtual methods
.method public buildView(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 6

    const/4 v3, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    new-instance v4, Ljava/lang/StringBuilder;

    const v0, 0x7f090191

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, ": "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->inChatRangeUsers()I

    move-result v0

    if-eqz v0, :cond_2

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v1

    const v0, 0x7f090310

    invoke-virtual {p1, v0, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->unreadMessageInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->unreadMessageInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;->unreadCount()I

    move-result v0

    :goto_1
    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setUnreadCount(I)V

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setLabel(Ljava/lang/String;)V

    const v0, 0x7f01000b

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setThumbnailDefaultIcon(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p2, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setThumbnailChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->unreadMessageInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->unreadMessageInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;->lastMessage()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v0

    :goto_2
    if-eqz v0, :cond_5

    invoke-virtual {v0, p1, p3, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Z)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3
    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setLastMessage(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v2, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-eq v0, v2, :cond_1

    move v1, v3

    :cond_1
    invoke-virtual {p2, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setVoiceActive(Z)V

    return-void

    :cond_2
    const v0, 0x7f0901eb

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_1

    :cond_4
    move-object v0, v2

    goto :goto_2

    :cond_5
    move-object v0, v2

    goto :goto_3
.end method

.method public getChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f090191

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setUnreadInfo(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->unreadMessageInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;

    return-void
.end method

.method public setVoiceChatInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    return-void
.end method
