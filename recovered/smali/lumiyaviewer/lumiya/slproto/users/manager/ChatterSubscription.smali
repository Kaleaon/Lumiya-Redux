.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;
.super Ljava/lang/Object;


# instance fields
.field private final chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field isValid:Z

.field private final onUnreadCount:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final onVoiceStatusChanged:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<",
            "Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final unreadCountSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final voiceChatInfoSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 8
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$x6PlkRNg0xExeA_EUn8oEJWcOq8;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$x6PlkRNg0xExeA_EUn8oEJWcOq8;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->onVoiceStatusChanged:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$x6PlkRNg0xExeA_EUn8oEJWcOq8$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$x6PlkRNg0xExeA_EUn8oEJWcOq8$1;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->onUnreadCount:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    const/high16 v6, 0x7fc00000    # Float.NaN

    move-object v1, p2

    move v4, v3

    move-object v5, v2

    move v7, v3

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;ZILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;FZ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getUnreadCounts()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->onUnreadCount:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    invoke-virtual {v0, p2, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->unreadCountSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceChatInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->onVoiceStatusChanged:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    invoke-interface {v0, p2, v1}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->voiceChatInfoSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->isValid:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->addChatter(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V

    return-void
.end method

.method private onUnreadCountChanged(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->withUnreadInfo(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->setChatterDisplayData(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V

    :cond_0
    return-void
.end method

.method private onVoiceChatInfoChanged(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    if-eqz p1, :cond_0

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v3, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-eq v2, v3, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->withVoiceActive(Z)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->setChatterDisplayData(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V

    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_ChatterSubscription-mthref-0(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->onVoiceChatInfoChanged(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_ChatterSubscription-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->onUnreadCountChanged(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;)V

    return-void
.end method

.method public dispose()V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->removeChatter(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V

    return-void
.end method

.method setChatterDisplayData(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;->replaceChatter(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V

    return-void
.end method

.method public unsubscribe()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->unreadCountSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->voiceChatInfoSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    return-void
.end method
