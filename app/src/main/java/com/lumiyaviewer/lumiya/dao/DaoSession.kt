package com.lumiyaviewer.lumiya.dao

import android.database.sqlite.SQLiteDatabase
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.AbstractDaoSession
import de.greenrobot.dao.identityscope.IdentityScopeType
import de.greenrobot.dao.internal.DaoConfig

class DaoSession(
    sqLiteDatabase: SQLiteDatabase,
    identityScopeType: IdentityScopeType,
    map: Map<Class<out AbstractDao<*, *>>, DaoConfig>
) : AbstractDaoSession(sqLiteDatabase) {

    private val cachedAssetDaoConfig: DaoConfig
    private val cachedResponseDaoConfig: DaoConfig
    private val chatMessageDaoConfig: DaoConfig
    private val chatterDaoConfig: DaoConfig
    private val friendDaoConfig: DaoConfig
    private val groupMemberDaoConfig: DaoConfig
    private val groupMemberListDaoConfig: DaoConfig
    private val groupRoleMemberDaoConfig: DaoConfig
    private val groupRoleMemberListDaoConfig: DaoConfig
    private val moneyTransactionDaoConfig: DaoConfig
    private val muteListCachedDataDaoConfig: DaoConfig
    private val searchGridResultDaoConfig: DaoConfig
    private val userDaoConfig: DaoConfig
    private val userNameDaoConfig: DaoConfig
    private val userPicDaoConfig: DaoConfig

    val cachedAssetDao: CachedAssetDao
    val cachedResponseDao: CachedResponseDao
    val chatMessageDao: ChatMessageDao
    val chatterDao: ChatterDao
    val friendDao: FriendDao
    val groupMemberDao: GroupMemberDao
    val groupMemberListDao: GroupMemberListDao
    val groupRoleMemberDao: GroupRoleMemberDao
    val groupRoleMemberListDao: GroupRoleMemberListDao
    val moneyTransactionDao: MoneyTransactionDao
    val muteListCachedDataDao: MuteListCachedDataDao
    val searchGridResultDao: SearchGridResultDao
    val userDao: UserDao
    val userNameDao: UserNameDao
    val userPicDao: UserPicDao

    init {
        cachedResponseDaoConfig = map[CachedResponseDao::class.java]!!.clone()
        cachedResponseDaoConfig.initIdentityScope(identityScopeType)
        cachedAssetDaoConfig = map[CachedAssetDao::class.java]!!.clone()
        cachedAssetDaoConfig.initIdentityScope(identityScopeType)
        moneyTransactionDaoConfig = map[MoneyTransactionDao::class.java]!!.clone()
        moneyTransactionDaoConfig.initIdentityScope(identityScopeType)
        muteListCachedDataDaoConfig = map[MuteListCachedDataDao::class.java]!!.clone()
        muteListCachedDataDaoConfig.initIdentityScope(identityScopeType)
        searchGridResultDaoConfig = map[SearchGridResultDao::class.java]!!.clone()
        searchGridResultDaoConfig.initIdentityScope(identityScopeType)
        groupMemberDaoConfig = map[GroupMemberDao::class.java]!!.clone()
        groupMemberDaoConfig.initIdentityScope(identityScopeType)
        groupMemberListDaoConfig = map[GroupMemberListDao::class.java]!!.clone()
        groupMemberListDaoConfig.initIdentityScope(identityScopeType)
        groupRoleMemberDaoConfig = map[GroupRoleMemberDao::class.java]!!.clone()
        groupRoleMemberDaoConfig.initIdentityScope(identityScopeType)
        groupRoleMemberListDaoConfig = map[GroupRoleMemberListDao::class.java]!!.clone()
        groupRoleMemberListDaoConfig.initIdentityScope(identityScopeType)
        userDaoConfig = map[UserDao::class.java]!!.clone()
        userDaoConfig.initIdentityScope(identityScopeType)
        friendDaoConfig = map[FriendDao::class.java]!!.clone()
        friendDaoConfig.initIdentityScope(identityScopeType)
        userNameDaoConfig = map[UserNameDao::class.java]!!.clone()
        userNameDaoConfig.initIdentityScope(identityScopeType)
        userPicDaoConfig = map[UserPicDao::class.java]!!.clone()
        userPicDaoConfig.initIdentityScope(identityScopeType)
        chatMessageDaoConfig = map[ChatMessageDao::class.java]!!.clone()
        chatMessageDaoConfig.initIdentityScope(identityScopeType)
        chatterDaoConfig = map[ChatterDao::class.java]!!.clone()
        chatterDaoConfig.initIdentityScope(identityScopeType)

        cachedResponseDao = CachedResponseDao(cachedResponseDaoConfig, this)
        cachedAssetDao = CachedAssetDao(cachedAssetDaoConfig, this)
        moneyTransactionDao = MoneyTransactionDao(moneyTransactionDaoConfig, this)
        muteListCachedDataDao = MuteListCachedDataDao(muteListCachedDataDaoConfig, this)
        searchGridResultDao = SearchGridResultDao(searchGridResultDaoConfig, this)
        groupMemberDao = GroupMemberDao(groupMemberDaoConfig, this)
        groupMemberListDao = GroupMemberListDao(groupMemberListDaoConfig, this)
        groupRoleMemberDao = GroupRoleMemberDao(groupRoleMemberDaoConfig, this)
        groupRoleMemberListDao = GroupRoleMemberListDao(groupRoleMemberListDaoConfig, this)
        userDao = UserDao(userDaoConfig, this)
        friendDao = FriendDao(friendDaoConfig, this)
        userNameDao = UserNameDao(userNameDaoConfig, this)
        userPicDao = UserPicDao(userPicDaoConfig, this)
        chatMessageDao = ChatMessageDao(chatMessageDaoConfig, this)
        chatterDao = ChatterDao(chatterDaoConfig, this)

        registerDao(CachedResponse::class.java, cachedResponseDao)
        registerDao(CachedAsset::class.java, cachedAssetDao)
        registerDao(MoneyTransaction::class.java, moneyTransactionDao)
        registerDao(MuteListCachedData::class.java, muteListCachedDataDao)
        registerDao(SearchGridResult::class.java, searchGridResultDao)
        registerDao(GroupMember::class.java, groupMemberDao)
        registerDao(GroupMemberList::class.java, groupMemberListDao)
        registerDao(GroupRoleMember::class.java, groupRoleMemberDao)
        registerDao(GroupRoleMemberList::class.java, groupRoleMemberListDao)
        registerDao(User::class.java, userDao)
        registerDao(Friend::class.java, friendDao)
        registerDao(UserName::class.java, userNameDao)
        registerDao(UserPic::class.java, userPicDao)
        registerDao(ChatMessage::class.java, chatMessageDao)
        registerDao(Chatter::class.java, chatterDao)
    }

    fun clear() {
        cachedResponseDaoConfig.identityScope.clear()
        cachedAssetDaoConfig.identityScope.clear()
        moneyTransactionDaoConfig.identityScope.clear()
        muteListCachedDataDaoConfig.identityScope.clear()
        searchGridResultDaoConfig.identityScope.clear()
        groupMemberDaoConfig.identityScope.clear()
        groupMemberListDaoConfig.identityScope.clear()
        groupRoleMemberDaoConfig.identityScope.clear()
        groupRoleMemberListDaoConfig.identityScope.clear()
        userDaoConfig.identityScope.clear()
        friendDaoConfig.identityScope.clear()
        userNameDaoConfig.identityScope.clear()
        userPicDaoConfig.identityScope.clear()
        chatMessageDaoConfig.identityScope.clear()
        chatterDaoConfig.identityScope.clear()
    }
}
