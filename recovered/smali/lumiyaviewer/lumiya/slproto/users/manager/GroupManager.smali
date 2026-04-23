.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$1;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMemberRolesQuery;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMembersQuery;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;
    }
.end annotation


# instance fields
.field private final avatarGroupListRef:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;",
            ">;"
        }
    .end annotation
.end field

.field private final chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

.field private final groupMemberDataSetHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler",
            "<",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final groupMemberDataSetPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final groupMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;

.field private final groupMemberRolesSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMemberRolesQuery;",
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;>;"
        }
    .end annotation
.end field

.field private final groupMembersSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMembersQuery;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/GroupMember;",
            ">;>;"
        }
    .end annotation
.end field

.field private final groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

.field private final groupRoleMemberDataSetHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler",
            "<",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final groupRoleMemberDataSetPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final groupRoleMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

.field private final groupRoleMemberSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;",
            ">;>;"
        }
    .end annotation
.end field

.field private final onGroupListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

.field private final subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;",
            ">;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method static synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_GroupManager-mthref-1(Lde/greenrobot/dao/query/LazyList;)V
    .locals 0

    invoke-virtual {p0}, Lde/greenrobot/dao/query/LazyList;->close()V

    return-void
.end method

.method static synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_GroupManager-mthref-2(Lde/greenrobot/dao/query/LazyList;)V
    .locals 0

    invoke-virtual {p0}, Lde/greenrobot/dao/query/LazyList;->close()V

    return-void
.end method

.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberRolesSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMembersSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    return-object v0
.end method

.method static synthetic -get6(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    return-object v0
.end method

.method static synthetic -get7(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)V
    .locals 4
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

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->avatarGroupListRef:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberDataSetPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberDataSetPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMembersSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberRolesSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->onGroupListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getGroupMemberDao()Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getGroupMemberListDao()Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getGroupRoleMemberDao()Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getGroupRoleMemberListDao()Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarGroupLists()Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$u_XXTkSOKCgaVXhhU-plrxzPP28$2;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$u_XXTkSOKCgaVXhhU-plrxzPP28$2;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$2;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberDataSetPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberDataSetHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$3;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberDataSetPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberDataSetHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$4;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$4;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)V

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$u_XXTkSOKCgaVXhhU-plrxzPP28;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$u_XXTkSOKCgaVXhhU-plrxzPP28;-><init>()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->setDisposeHandler(Lcom/lumiyaviewer/lumiya/react/DisposeHandler;Ljava/util/concurrent/Executor;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMembersSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$5;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$5;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)V

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMembersSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$u_XXTkSOKCgaVXhhU-plrxzPP28$1;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$u_XXTkSOKCgaVXhhU-plrxzPP28$1;-><init>()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->setDisposeHandler(Lcom/lumiyaviewer/lumiya/react/DisposeHandler;Ljava/util/concurrent/Executor;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberRolesSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$6;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$6;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)V

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/AsyncRequestHandler;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    return-void
.end method

.method private onAvatarGroupListsReply(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->avatarGroupListRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Groups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->notifyListUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_GroupManager-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->onAvatarGroupListsReply(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;)V

    return-void
.end method

.method public getAvatarGroupList()Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->avatarGroupListRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    return-object v0
.end method

.method getGroupList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupDisplayDataList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->onGroupListUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupDisplayDataList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;)V

    return-object v0
.end method

.method public getGroupMemberDataSetRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/RequestSource",
            "<",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberDataSetHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    return-object v0
.end method

.method public getGroupMemberRoleList()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMemberRolesQuery;",
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberRolesSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getGroupMembers()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberDataSetPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getGroupMembersList()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMembersQuery;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/GroupMember;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMembersSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getGroupRoleMemberDataSetRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/RequestSource",
            "<",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberDataSetHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    return-object v0
.end method

.method public getGroupRoleMemberList()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberSubscriptionPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getGroupRoleMembers()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberDataSetPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_GroupManager_10304(Ljava/util/UUID;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->setMustRevalidate(Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;->update(Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupRoleMemberDataSetPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public requestGroupRoleMembersRefresh(Ljava/util/UUID;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$u_XXTkSOKCgaVXhhU-plrxzPP28$3;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$u_XXTkSOKCgaVXhhU-plrxzPP28$3;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public requestRefreshMemberList(Ljava/util/UUID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->groupMemberDataSetPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method
