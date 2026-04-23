.class public Lcom/lumiyaviewer/lumiya/dao/DaoMaster;
.super Lde/greenrobot/dao/AbstractDaoMaster;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/dao/DaoMaster$DevOpenHelper;,
        Lcom/lumiyaviewer/lumiya/dao/DaoMaster$OpenHelper;
    }
.end annotation


# static fields
.field public static final SCHEMA_VERSION:I = 0x47


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const/16 v0, 0x47

    invoke-direct {p0, p1, v0}, Lde/greenrobot/dao/AbstractDaoMaster;-><init>(Landroid/database/sqlite/SQLiteDatabase;I)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/UserDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/FriendDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/UserPicDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    const-class v0, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    return-void
.end method

.method public static createAllTables(Landroid/database/sqlite/SQLiteDatabase;Z)V
    .locals 0

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/UserDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/UserNameDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/UserPicDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->createTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    return-void
.end method

.method public static dropAllTables(Landroid/database/sqlite/SQLiteDatabase;Z)V
    .locals 0

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedDataDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/GroupMemberListDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/UserDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/FriendDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/UserNameDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/UserPicDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    invoke-static {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Z)V

    return-void
.end method


# virtual methods
.method public newSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;
    .locals 4

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->db:Landroid/database/sqlite/SQLiteDatabase;

    sget-object v2, Lde/greenrobot/dao/identityscope/IdentityScopeType;->Session:Lde/greenrobot/dao/identityscope/IdentityScopeType;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->daoConfigMap:Ljava/util/Map;

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;-><init>(Landroid/database/sqlite/SQLiteDatabase;Lde/greenrobot/dao/identityscope/IdentityScopeType;Ljava/util/Map;)V

    return-object v0
.end method

.method public newSession(Lde/greenrobot/dao/identityscope/IdentityScopeType;)Lcom/lumiyaviewer/lumiya/dao/DaoSession;
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->daoConfigMap:Ljava/util/Map;

    invoke-direct {v0, v1, p1, v2}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;-><init>(Landroid/database/sqlite/SQLiteDatabase;Lde/greenrobot/dao/identityscope/IdentityScopeType;Ljava/util/Map;)V

    return-object v0
.end method

.method public bridge synthetic newSession()Lde/greenrobot/dao/AbstractDaoSession;
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->newSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newSession(Lde/greenrobot/dao/identityscope/IdentityScopeType;)Lde/greenrobot/dao/AbstractDaoSession;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/dao/DaoMaster;->newSession(Lde/greenrobot/dao/identityscope/IdentityScopeType;)Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    return-object v0
.end method
