.class public Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;
.super Landroid/widget/BaseAdapter;

# interfaces
.implements Ljava/io/Closeable;
.implements Lcom/lumiyaviewer/lumiya/ui/common/DismissableAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;,
        Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;
    }
.end annotation


# static fields
.field private static final VIEW_TYPE_COUNT:I = 0x2

.field private static final VIEW_TYPE_HEADER:I = 0x1

.field private static final VIEW_TYPE_ROW:I


# instance fields
.field private activeChatters:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<+",
            "Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final activeChattersSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;>;"
        }
    .end annotation
.end field

.field private final context:Landroid/content/Context;

.field private currentLocationInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final currentLocationInfoSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final inflater:Landroid/view/LayoutInflater;

.field private final localChatItem:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;

.field private final localChatUnreadCountSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final localVoiceChatSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;",
            ">;"
        }
    .end annotation
.end field

.field private onlineFriends:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<+",
            "Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final onlineFriendsHeader:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;

.field private final onlineFriendsSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;>;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

.field private final viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    return-object v0
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 4

    const/4 v2, 0x0

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->activeChatters:Lcom/google/common/collect/ImmutableList;

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->onlineFriends:Lcom/google/common/collect/ImmutableList;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->inflater:Landroid/view/LayoutInflater;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v1

    invoke-direct {v0, p0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->localChatItem:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->onlineFriendsHeader:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getChatterList()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Active:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/-$Lambda$6auIiCEAvthJH-C9LU_XlJZMtEQ;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/-$Lambda$6auIiCEAvthJH-C9LU_XlJZMtEQ;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->activeChattersSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getChatterList()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->FriendsOnline:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/-$Lambda$6auIiCEAvthJH-C9LU_XlJZMtEQ$1;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/-$Lambda$6auIiCEAvthJH-C9LU_XlJZMtEQ$1;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->onlineFriendsSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    const-string/jumbo v0, "currentLocationInfo subscribing"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->getSingleDataKey()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/-$Lambda$6auIiCEAvthJH-C9LU_XlJZMtEQ$2;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/-$Lambda$6auIiCEAvthJH-C9LU_XlJZMtEQ$2;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->currentLocationInfoSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getUnreadCounts()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->localChatItem:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;

    invoke-virtual {v1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->getChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/-$Lambda$6auIiCEAvthJH-C9LU_XlJZMtEQ$3;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/-$Lambda$6auIiCEAvthJH-C9LU_XlJZMtEQ$3;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->localChatUnreadCountSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceChatInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->localChatItem:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;

    invoke-virtual {v1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->getChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/-$Lambda$6auIiCEAvthJH-C9LU_XlJZMtEQ$4;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/-$Lambda$6auIiCEAvthJH-C9LU_XlJZMtEQ$4;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->localVoiceChatSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public canDismiss(I)Z
    .locals 2

    const/4 v0, 0x0

    if-lez p1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->activeChatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v1

    if-gt p1, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->activeChattersSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->onlineFriendsSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->currentLocationInfoSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->localChatUnreadCountSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->localVoiceChatSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    return-void
.end method

.method public getCount()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->activeChatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->onlineFriends:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->activeChatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->localChatItem:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;

    return-object v0

    :cond_0
    const/4 v1, 0x1

    if-lt p1, v1, :cond_1

    if-gt p1, v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->activeChatters:Lcom/google/common/collect/ImmutableList;

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_1
    add-int/lit8 v1, v0, 0x1

    if-ne p1, v1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->onlineFriendsHeader:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;

    return-object v0

    :cond_2
    add-int/lit8 v1, v0, 0x1

    if-le p1, v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->onlineFriends:Lcom/google/common/collect/ImmutableList;

    sub-int v0, p1, v0

    add-int/lit8 v0, v0, -0x2

    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->activeChatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    const/4 v2, 0x0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->onlineFriendsHeader:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->onlineFriendsHeader:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->inflater:Landroid/view/LayoutInflater;

    invoke-virtual {v0, v1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;->getView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0

    :cond_0
    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->reset()V

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;->buildView(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->inflater:Landroid/view/LayoutInflater;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p2, p3, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->getView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->restoreViewState(Landroid/view/View;)V

    :cond_1
    return-object v0

    :cond_2
    return-object v2
.end method

.method public getViewTypeCount()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isEnabled(I)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->activeChatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_contacts_ActiveChatsListAdapter_6525(Lcom/google/common/collect/ImmutableList;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->activeChatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_contacts_ActiveChatsListAdapter_6801(Lcom/google/common/collect/ImmutableList;)V
    .locals 2

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->onlineFriends:Lcom/google/common/collect/ImmutableList;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->onlineFriendsHeader:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;

    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$OnlineFriendsHeaderRow;->setAnyoneOnline(Z)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_contacts_ActiveChatsListAdapter_7223(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 4

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    const-string/jumbo v0, "currentLocationInfo updated: %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_contacts_ActiveChatsListAdapter_7649(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->localChatItem:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->setUnreadInfo(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_contacts_ActiveChatsListAdapter_7934(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->localChatItem:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter$LocalChatItem;->setVoiceChatInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public onDismiss(I)V
    .locals 3

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;->getChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->markChatterInactive(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V

    :cond_0
    return-void
.end method
