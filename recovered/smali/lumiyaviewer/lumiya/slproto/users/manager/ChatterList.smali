.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;
.super Ljava/lang/Object;


# instance fields
.field private final activeChattersManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final chatterListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;>;"
        }
    .end annotation
.end field

.field private final chatterLists:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;",
            ">;"
        }
    .end annotation
.end field

.field private final daoSession:Lcom/lumiyaviewer/lumiya/dao/DaoSession;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final friendManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final groupManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final nearbyDistancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final onNearbyListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

.field private final typingUsersPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->activeChattersManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->chatterLists:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->friendManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->groupManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->onNearbyListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    return-object v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->chatterListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->chatterLists:Ljava/util/Map;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->nearbyDistancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->typingUsersPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$vvo1Hidt87pwA0OrMywwrJjt1rU;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$vvo1Hidt87pwA0OrMywwrJjt1rU;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->onNearbyListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDaoSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->daoSession:Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->chatterListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->setRequestOnce(Z)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->daoSession:Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    invoke-direct {v0, p1, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->friendManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->daoSession:Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    invoke-direct {v0, p1, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->groupManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->daoSession:Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    invoke-direct {v0, p1, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->activeChattersManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$1;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->nearbyDistancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$2;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->typingUsersPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->chatterListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return-void
.end method


# virtual methods
.method public getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->activeChattersManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    return-object v0
.end method

.method public getChatterList()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->chatterListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getDistanceToUser()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->nearbyDistancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getFriendManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->friendManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    return-object v0
.end method

.method public getGroupManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->groupManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    return-object v0
.end method

.method public getUserTypingStatus()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->typingUsersPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ChatterList_4733()V
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Nearby:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->notifyListUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    return-void
.end method

.method notifyListUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->chatterListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public updateDistanceToAllUsers()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->nearbyDistancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdateAll()V

    return-void
.end method

.method public updateDistanceToUser(Ljava/util/UUID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->nearbyDistancePool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public updateList(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->chatterLists:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->requestRefresh(Ljava/util/concurrent/Executor;)V

    :cond_0
    return-void
.end method

.method public updateUserTypingStatus(Ljava/util/UUID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->typingUsersPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method
