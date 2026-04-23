.class public Lcom/lumiyaviewer/lumiya/dao/DaoSession;
.super Lde/greenrobot/dao/AbstractDaoSession;


# instance fields
.field private final cachedAssetDao:Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

.field private final cachedAssetDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final cachedResponseDao:Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

.field private final cachedResponseDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

.field private final chatMessageDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

.field private final chatterDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

.field private final friendDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

.field private final groupMemberDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final groupMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;

.field private final groupMemberListDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

.field private final groupRoleMemberDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final groupRoleMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

.field private final groupRoleMemberListDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

.field private final moneyTransactionDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

.field private final muteListCachedDataDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final searchGridResultDao:Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

.field private final searchGridResultDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

.field private final userDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final userNameDao:Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

.field private final userNameDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

.field private final userPicDao:Lcom/lumiyaviewer/lumiya/dao/UserPicDao;

.field private final userPicDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;Lde/greenrobot/dao/identityscope/IdentityScopeType;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lde/greenrobot/dao/identityscope/IdentityScopeType;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lde/greenrobot/dao/AbstractDao",
            "<**>;>;",
            "Lde/greenrobot/dao/internal/DaoConfig;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lde/greenrobot/dao/AbstractDaoSession;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedResponseDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedResponseDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedAssetDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedAssetDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->moneyTransactionDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->moneyTransactionDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->muteListCachedDataDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->muteListCachedDataDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->searchGridResultDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->searchGridResultDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberListDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberListDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberListDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberListDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/UserDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->friendDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->friendDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userNameDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userNameDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/UserPicDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userPicDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userPicDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatMessageDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatMessageDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatterDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatterDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/internal/DaoConfig;->initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedResponseDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedResponseDao:Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedAssetDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedAssetDao:Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->moneyTransactionDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->muteListCachedDataDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->searchGridResultDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->searchGridResultDao:Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberListDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberListDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/UserDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/UserDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->friendDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userNameDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/UserNameDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userNameDao:Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/UserPicDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userPicDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/UserPicDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userPicDao:Lcom/lumiyaviewer/lumiya/dao/UserPicDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatMessageDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatterDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/CachedResponse;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedResponseDao:Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedAssetDao:Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->searchGridResultDao:Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupMemberList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/User;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/Friend;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/UserName;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userNameDao:Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/UserPic;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userPicDao:Lcom/lumiyaviewer/lumiya/dao/UserPicDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/Chatter;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedResponseDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedAssetDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->moneyTransactionDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->muteListCachedDataDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->searchGridResultDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberListDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberListDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->friendDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userNameDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userPicDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatMessageDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatterDaoConfig:Lde/greenrobot/dao/internal/DaoConfig;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    return-void
.end method

.method public getCachedAssetDao()Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedAssetDao:Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    return-object v0
.end method

.method public getCachedResponseDao()Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->cachedResponseDao:Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    return-object v0
.end method

.method public getChatMessageDao()Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    return-object v0
.end method

.method public getChatterDao()Lcom/lumiyaviewer/lumiya/dao/ChatterDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    return-object v0
.end method

.method public getFriendDao()Lcom/lumiyaviewer/lumiya/dao/FriendDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->friendDao:Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    return-object v0
.end method

.method public getGroupMemberDao()Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    return-object v0
.end method

.method public getGroupMemberListDao()Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;

    return-object v0
.end method

.method public getGroupRoleMemberDao()Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    return-object v0
.end method

.method public getGroupRoleMemberListDao()Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->groupRoleMemberListDao:Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    return-object v0
.end method

.method public getMoneyTransactionDao()Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    return-object v0
.end method

.method public getMuteListCachedDataDao()Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->muteListCachedDataDao:Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    return-object v0
.end method

.method public getSearchGridResultDao()Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->searchGridResultDao:Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    return-object v0
.end method

.method public getUserDao()Lcom/lumiyaviewer/lumiya/dao/UserDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

    return-object v0
.end method

.method public getUserNameDao()Lcom/lumiyaviewer/lumiya/dao/UserNameDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userNameDao:Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

    return-object v0
.end method

.method public getUserPicDao()Lcom/lumiyaviewer/lumiya/dao/UserPicDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->userPicDao:Lcom/lumiyaviewer/lumiya/dao/UserPicDao;

    return-object v0
.end method
