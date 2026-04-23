.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager$1;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager$2;
    }
.end annotation


# instance fields
.field private final chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final onFriendListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

.field private final onFriendsOnlineListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

.field private final onlineStatus:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
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
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;)Lcom/lumiyaviewer/lumiya/dao/FriendDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    return-object v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/dao/DaoSession;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->onlineStatus:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->onFriendListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->onFriendsOnlineListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getFriendDao()Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager$3;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->onlineStatus:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager$3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    return-void
.end method


# virtual methods
.method public addFriend(Ljava/util/UUID;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/Friend;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/Friend;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v2, v2, v1}, Lcom/lumiyaviewer/lumiya/dao/Friend;-><init>(Ljava/util/UUID;IIZ)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->insert(Ljava/lang/Object;)J

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Friends:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateList(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->FriendsOnline:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateList(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    return-void
.end method

.method public getFriend(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/dao/Friend;
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/Friend;

    return-object v0

    :cond_0
    return-object v0
.end method

.method public getFriendList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;
    .locals 4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendDisplayDataList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->onFriendListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendDisplayDataList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;Z)V

    return-object v0
.end method

.method public getFriendsOnlineList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;
    .locals 4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendDisplayDataList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->onFriendsOnlineListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendDisplayDataList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;Z)V

    return-object v0
.end method

.method public getOnlineStatus()Lcom/lumiyaviewer/lumiya/react/Subscribable;
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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->onlineStatus:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public removeFriend(Ljava/util/UUID;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->deleteByKey(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Friends:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateList(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->FriendsOnline:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateList(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    return-void
.end method

.method public setUsersOnline(Ljava/util/List;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/UUID;",
            ">;Z)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/dao/Friend;

    if-eqz v1, :cond_0

    invoke-virtual {v1, p2}, Lcom/lumiyaviewer/lumiya/dao/Friend;->setIsOnline(Z)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {v3, v1}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->update(Ljava/lang/Object;)V

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->onlineStatus:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->FriendsOnline:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateList(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    return-void
.end method

.method public updateFriendList(Lcom/google/common/collect/ImmutableList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;",
            ">;)V"
        }
    .end annotation

    const/4 v7, 0x0

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;->uuid:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {v1, v4}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/dao/Friend;

    if-nez v1, :cond_1

    new-instance v1, Lcom/lumiyaviewer/lumiya/dao/Friend;

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;->rightsGiven:I

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;->rightsHas:I

    invoke-direct {v1, v4, v5, v0, v7}, Lcom/lumiyaviewer/lumiya/dao/Friend;-><init>(Ljava/util/UUID;IIZ)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->insertOrReplace(Ljava/lang/Object;)J

    :cond_0
    :goto_1
    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/Friend;->getRightsGiven()I

    move-result v5

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;->rightsGiven:I

    if-ne v5, v6, :cond_2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/Friend;->getRightsHas()I

    move-result v5

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;->rightsHas:I

    if-eq v5, v6, :cond_3

    :cond_2
    :goto_2
    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;->rightsGiven:I

    invoke-virtual {v1, v5}, Lcom/lumiyaviewer/lumiya/dao/Friend;->setRightsGiven(I)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;->rightsHas:I

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/Friend;->setRightsHas(I)V

    invoke-virtual {v1, v7}, Lcom/lumiyaviewer/lumiya/dao/Friend;->setIsOnline(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->update(Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/Friend;->getIsOnline()Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->loadAll()Ljava/util/List;

    move-result-object v0

    const-string/jumbo v1, "FriendList: update[1], got %d friends"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/Friend;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Friend;->getUuid()Ljava/util/UUID;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->delete(Ljava/lang/Object;)V

    goto :goto_3

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Friends:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateList(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->FriendsOnline:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateList(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    return-void
.end method
