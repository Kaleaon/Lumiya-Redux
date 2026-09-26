package com.lumiyaviewer.lumiya.slproto.users.manager

import android.database.Cursor
import androidx.preference.PreferenceManager
import com.google.common.collect.ImmutableList
import com.google.common.collect.ImmutableMap
import com.google.common.collect.Table
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.dao.ChatMessageDao
import com.lumiyaviewer.lumiya.dao.Chatter
import com.lumiyaviewer.lumiya.dao.ChatterDao
import com.lumiyaviewer.lumiya.dao.DaoManager
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.dao.User
import com.lumiyaviewer.lumiya.dao.UserDao
import com.lumiyaviewer.lumiya.dao.UserName
import com.lumiyaviewer.lumiya.dao.UserPic
import com.lumiyaviewer.lumiya.dao.UserPicDao
import com.lumiyaviewer.lumiya.data.repository.UserPicRepositoryAdapter
import com.lumiyaviewer.lumiya.data.room.LumiyaRoomDatabase
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.react.OpportunisticExecutor
import com.lumiyaviewer.lumiya.react.RateLimitRequestHandler
import com.lumiyaviewer.lumiya.react.RequestProcessor
import com.lumiyaviewer.lumiya.react.RequestQueue
import com.lumiyaviewer.lumiya.react.Subscribable
import com.lumiyaviewer.lumiya.react.SubscriptionDataPool
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.messages.AgentDataUpdate
import com.lumiyaviewer.lumiya.slproto.messages.AvatarNotesReply
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPicksReply
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleDataReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupTitlesReply
import com.lumiyaviewer.lumiya.slproto.messages.ParcelInfoReply
import com.lumiyaviewer.lumiya.slproto.messages.PickInfoReply
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance
import com.lumiyaviewer.lumiya.slproto.modules.SLMinimap
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteListEntry
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.SLMessageResponseCacher
import com.lumiyaviewer.lumiya.slproto.users.SerializableResponseCacher
import com.lumiyaviewer.lumiya.slproto.users.events.EventUserInfoChanged
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetResponseCacher
import com.lumiyaviewer.lumiya.utils.StringUtils
import com.lumiyaviewer.lumiya.utils.reqset.WeakPriorityRequestSet
import com.lumiyaviewer.lumiya.voice.common.messages.VoiceAudioProperties
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo
import de.greenrobot.dao.query.Query
import de.greenrobot.dao.query.WhereCondition
import java.io.File
import java.util.Map
import java.util.UUID
import java.util.WeakHashMap
import java.util.concurrent.Executor
import java.util.concurrent.atomic.AtomicReference

open class UserManager {

    private var activeChattersQuery: Query<Chatter> = null
    private var agentDataUpdates: SLMessageResponseCacher<UUID, AgentDataUpdate> = null
    private var assetResponseCacher: AssetResponseCacher = null
    private var avatarGroupLists: SerializableResponseCacher<UUID, AvatarGroupList> = null
    private var avatarNotes: SLMessageResponseCacher<UUID, AvatarNotesReply> = null
    private var avatarPickInfos: SLMessageResponseCacher<AvatarPickKey, PickInfoReply> = null
    private var avatarPicks: SLMessageResponseCacher<UUID, AvatarPicksReply> = null
    private var avatarProperties: SLMessageResponseCacher<UUID, AvatarPropertiesReply> = null

    private var balanceManager: BalanceManager = null

    private var chatMessageDao: ChatMessageDao = null

    private var chatterDao: ChatterDao = null

    private var chatterList: ChatterList = null

    private var daoSession: DaoSession = null

    private var findChatterQuery: Query<Chatter> = null

    private var findUserPicQuery: Query<UserPic> = null

    private var findUserQuery: Query<User> = null

    private var friendsQuery: Query<User> = null
    private var groupProfiles: SLMessageResponseCacher<UUID, GroupProfileReply> = null
    private var groupRoles: SLMessageResponseCacher<UUID, GroupRoleDataReply> = null
    private var groupTitles: SLMessageResponseCacher<UUID, GroupTitlesReply> = null

    private var inventoryManager: InventoryManager = null

    private var loadMessageQuery: Query<ChatMessage> = null

    private var notificationManager: UnreadNotificationManager = null

    private var objectPopupsManager: ObjectPopupsManager = null

    private var objectsManager: ObjectsManager = null
    private var parcelInfoData: SLMessageResponseCacher<UUID, ParcelInfoReply> = null

    private var searchManager: SearchManager = null

    private var syncManager: SyncManager = null

    private var userDao: UserDao = null

    private var userID: UUID = null
    private var userPicBitmapCache: UserPicBitmapCache = null

    private var userPicDao: UserPicDao = null
    private var userPicRepository: UserPicRepositoryAdapter = null
    @JvmStatic private var lock: Any = Object()
    @JvmStatic private var userManagers: MutableMap<UUID, UserManager> = WeakHashMap()
    @JvmStatic private var activeAgentCircuitsPool: SubscriptionDataPool<UUID, SLAgentCircuit> = SubscriptionDataPool().setCanContainNulls(true)
    private var eventBus: EventBus = EventBus.getInstance()
    private var dbExecutor: OpportunisticExecutor = OpportunisticExecutor("Database")
    private var userUpdateLock: Any = Object()
    private var userPicUpdateLock: Any = Object()
    private var chatterUpdateLock: Any = Object()
    private var userNameRequests: WeakPriorityRequestSet<UUID> = WeakPriorityRequestSet<>()
    private var activeAgentCircuit: AtomicReference<SLAgentCircuit> = AtomicReference<>()
    private var minimapBitmapPool: SubscriptionSingleDataPool<SLMinimap.MinimapBitmap> = SubscriptionSingleDataPool<>()
    private var userLocationsPool: SubscriptionPool<SubscriptionSingleKey, SLMinimap.UserLocations> = SubscriptionPool<>()
    private SubscriptionSingleDataPool<ImmutableMap<UUID, String>> wornAttachmentsPool = SubscriptionSingleDataPool<>()
    private SubscriptionSingleDataPool<Table<SLWearableType, UUID, SLWearable>> wornWearablesPool = SubscriptionSingleDataPool<>()
    private SubscriptionPool<SubscriptionSingleKey, ImmutableList<SLAvatarAppearance.WornItem>> wornItemsPool = SubscriptionPool<>()
    private var wornOutfitLinkPool: SubscriptionSingleDataPool<UUID> = SubscriptionSingleDataPool<>()
    private SubscriptionPool<SubscriptionSingleKey, ImmutableList<MuteListEntry>> muteListPool = SubscriptionPool<>()
    private var currentLocationInfoPool: SubscriptionSingleDataPool<CurrentLocationInfo> = SubscriptionSingleDataPool<>()
    private var voiceLoggedInPool: SubscriptionSingleDataPool<Boolean> = SubscriptionSingleDataPool<>()
    private var voiceChatInfoPool: SubscriptionDataPool<ChatterID, VoiceChatInfo> = SubscriptionDataPool().setCanContainNulls(true)
    private var voiceActiveChatterPool: SubscriptionSingleDataPool<ChatterID> = SubscriptionSingleDataPool<>()
    private var voiceAudioPropertiesPool: SubscriptionSingleDataPool<VoiceAudioProperties> = SubscriptionSingleDataPool<>()
    private var userNamesPool: SubscriptionPool<UUID, UserName> = SubscriptionPool<>()
    private var userNamesHandler: RateLimitRequestHandler<UUID, UserName> = RateLimitRequestHandler<>(RequestProcessor<UUID, UserName, UserName>(this.userNamesPool, this.dbExecutor) {
        fun isRequestComplete(uuid: UUID, userName: UserName): Boolean {
            if (userName != null) {
                if (userName.isBadUUID) {
        return true
                }
                if (userName.getDisplayName() != null && userName.getUserName() != null) {
        return true
                }
            }
        return false
        }
        fun processRequest(uuid: UUID): UserName {
            return UserManager.this.daoSession.getUserNameDao().load(uuid)
        }
        fun processResult(uuid: UUID, userName: UserName): UserName {
            var load: UserName = UserManager.this.daoSession.getUserNameDao().load(uuid)
            if (load == null) {
                UserManager.this.daoSession.getUserNameDao().insertOrReplace(userName)
        return userName
            }
            if (load.mergeWith(userName)) {
                UserManager.this.daoSession.getUserNameDao().update(load)
            }
        return load
        }
    })

    private UserManager(UUID uuid) throws IllegalArgumentException {
        this.userID = uuid
        var userDaoSession: DaoSession = DaoManager.getUserDaoSession(uuid)
        if (userDaoSession == null) {
            throw IllegalArgumentException("Null DAO session")
        }
        this.daoSession = userDaoSession
        this.userDao = userDaoSession.getUserDao()
        this.userPicDao = userDaoSession.getUserPicDao()
        this.chatMessageDao = userDaoSession.getChatMessageDao()
        var roomDb: LumiyaRoomDatabase = DaoManager.getRoomDatabasethis as userDaoSession.userPicRepository = UserPicRepositoryAdapter(this.userPicDao, if (roomDb != null) roomDb.userPicDao() else null)
        this.chatterDao = userDaoSession.getChatterDao()
        this.avatarPicks = SLMessageResponseCacher<>(userDaoSession, this.dbExecutor, "AvatarPicks")
        this.avatarPickInfos = SLMessageResponseCacher<>(userDaoSession, this.dbExecutor, "AvatarPickInfos")
        this.avatarGroupLists = SerializableResponseCacher<>(userDaoSession, this.dbExecutor, "AvatarGroupLists")
        this.groupProfiles = SLMessageResponseCacher<>(userDaoSession, this.dbExecutor, "GroupProfiles")
        this.groupTitles = SLMessageResponseCacher<>(userDaoSession, this.dbExecutor, "GroupTitles")
        this.agentDataUpdates = SLMessageResponseCacher<>(userDaoSession, this.dbExecutor, "AgentDataUpdates")
        this.groupRoles = SLMessageResponseCacher<>(userDaoSession, this.dbExecutor, "GroupRoles")
        this.avatarNotes = SLMessageResponseCacher<>(userDaoSession, this.dbExecutor, "AvatarNotes")
        this.avatarProperties = SLMessageResponseCacher<>(userDaoSession, this.dbExecutor, "AvatarProperties")
        this.parcelInfoData = SLMessageResponseCacher<>(userDaoSession, this.dbExecutor, "ParcelInfoReply")
        this.assetResponseCacher = AssetResponseCacher(userDaoSession, this.dbExecutor)
        this.findUserQuery = this.userDao.queryBuilder().where(UserDao.Properties.Uuid.eq(""), arrayOfNulls<WhereCondition>(0)).build()
        this.friendsQuery = this.userDao.queryBuilder().where(UserDao.Properties.IsFriend.eq(Boolean.TRUE), arrayOfNulls<WhereCondition>(0)).build()
        this.findUserPicQuery = this.userPicDao.queryBuilder().where(UserPicDao.Properties.Uuid.eq(""), arrayOfNulls<WhereCondition>(0)).build()
        this.loadMessageQuery = this.chatMessageDao.queryBuilder().where(ChatMessageDao.Properties.Id.eq(""), arrayOfNulls<WhereCondition>(0)).build()
        this.findChatterQuery = this.chatterDao.queryBuilder().where(ChatterDao.Properties.Type.eq(null), ChatterDao.Properties.Uuid.eq("")).build()
        this.activeChattersQuery = this.chatterDao.queryBuilder().where(ChatterDao.Properties.Active.eq(true), arrayOfNulls<WhereCondition>(0)).build()
        this.inventoryManager = InventoryManagerthis as uuid.notificationManager = UnreadNotificationManager(this, userDaoSession)
        this.objectPopupsManager = ObjectPopupsManagerthis as this.objectsManager = ObjectsManagerthis as this.balanceManager = BalanceManagerthis as this.searchManager = SearchManager(this, userDaoSession)
        this.chatterList = ChatterListthis as this.userPicBitmapCache = UserPicBitmapCachethis as this.syncManager = SyncManager(this)
    }

    Subscribable<UUID, SLAgentCircuit> agentCircuits() {
        return activeAgentCircuitsPool
    }

    fun getActiveAgentCircuit(uuid: UUID): SLAgentCircuit {
        var userManager: UserManager = null
        if (uuid == null || (userManager = getUserManager(uuid)) == null) {
        return null
        }
        return userManager.getActiveAgentCircuit()
    }

    SLAgentCircuit getConnectedAgentCircuit(UUID uuid) throws SLGridConnection.NotConnectedException {
        var activeAgentCircuit: SLAgentCircuit = getActiveAgentCircuit(uuid)
        if (activeAgentCircuit != null) {
        return activeAgentCircuit
        }
        throw SLGridConnection.NotConnectedException()
    }

    private fun getInventoryDatabasePath(str: String): File {
        if (PreferenceManager.getDefaultSharedPreferences(LumiyaApp.getContext()).getString("db_location", "internal").equals("sd")) {
            var file: File = File(LumiyaApp.getContext().getExternalFilesDir(null), "cache/database")
            file.mkdirs()
            return File(file, str)
        }
        var databasePath: File = LumiyaApp.getContext().getDatabasePath(str)
        var parentFile: File = databasePath.getParentFile()
        if (parentFile != null) {
            parentFile.mkdirs()
        }
        return databasePath
    }

    fun getUserManager(uuid: UUID): UserManager {
        var userManager: UserManager = null
        if (uuid == null) {
        return null
        }
        synchronized(lock) {
            userManager = userManagers.get(uuid)
            if (userManager == null) {
                try {
                    userManager = UserManageruserManagers as uuid.put(uuid, userManager)
                } catch (e: IllegalArgumentException) {
                    Debug.Warning(e)
        return null
                }
            }
        }
        return userManager
    }

    fun addChatMessage(chatMessage: ChatMessage) {
        this.chatMessageDao.insert(chatMessage)
    }

    fun clearActiveAgentCircuit(agentCircuit: SLAgentCircuit) {
        if (this.activeAgentCircuit.compareAndSet(agentCircuit, null)) {
            Debug.Printf("Active agent circuit cleared.", arrayOfNulls<Object>(0))
            this.objectPopupsManager.clearObjectPopups()
            this.objectsManager.requestObjectListUpdate()
            activeAgentCircuitsPool.setData(this.userID, null)
        }
    }

    fun getActiveAgentCircuit(): SLAgentCircuit {
        return this.activeAgentCircuit.get()
    }

    public SLMessageResponseCacher<UUID, AgentDataUpdate> getAgentDataUpdates() {
        return this.agentDataUpdates
    }

    fun getAssetResponseCacher(): AssetResponseCacher {
        return this.assetResponseCacher
    }

    public SerializableResponseCacher<UUID, AvatarGroupList> getAvatarGroupLists() {
        return this.avatarGroupLists
    }

    public SLMessageResponseCacher<UUID, AvatarNotesReply> getAvatarNotes() {
        return this.avatarNotes
    }

    public SLMessageResponseCacher<AvatarPickKey, PickInfoReply> getAvatarPickInfos() {
        return this.avatarPickInfos
    }

    public SLMessageResponseCacher<UUID, AvatarPicksReply> getAvatarPicks() {
        return this.avatarPicks
    }

    public SLMessageResponseCacher<UUID, AvatarPropertiesReply> getAvatarProperties() {
        return this.avatarProperties
    }

    fun getBalanceManager(): BalanceManager {
        return this.balanceManager
    }

    public SLMessageResponseCacher<UUID, GroupProfileReply> getCachedGroupProfiles() {
        return this.groupProfiles
    }

    fun getChatMessage(j: Long): ChatMessage {
        var forCurrentThread: Query<ChatMessage> = this.loadMessageQuery.forCurrentThread()
        forCurrentThread.setParameter(0, j)
        return forCurrentThread.unique()
    }

    fun getChatMessageDao(): ChatMessageDao {
        return this.chatMessageDao
    }

    fun getChatter(cursor: Cursor): Chatter {
        return this.chatterDao.readEntity(cursor, 0)
    }

    fun getChatterDao(): ChatterDao {
        return this.chatterDao
    }

    fun getChatterList(): ChatterList {
        return this.chatterList
    }

    public Subscribable<SubscriptionSingleKey, CurrentLocationInfo> getCurrentLocationInfo() {
        return this.currentLocationInfoPool
    }

    fun getCurrentLocationInfoSnapshot(): CurrentLocationInfo {
        return this.currentLocationInfoPool.getData()
    }

    fun getDaoSession(): DaoSession {
        return this.daoSession
    }

    fun getDatabaseExecutor(): Executor {
        return this.dbExecutor
    }

    fun getDatabaseRunOnceExecutor(): Executor {
        return this.dbExecutor.getRunOnceExecutor()
    }

    fun getEventBus(): EventBus {
        return this.eventBus
    }

    public SLMessageResponseCacher<UUID, GroupRoleDataReply> getGroupRoles() {
        return this.groupRoles
    }

    public SLMessageResponseCacher<UUID, GroupTitlesReply> getGroupTitles() {
        return this.groupTitles
    }

    fun getInventoryManager(): InventoryManager {
        return this.inventoryManager
    }

    fun getMinimapBitmapPool(): SubscriptionSingleDataPool<SLMinimap.MinimapBitmap> {
        return this.minimapBitmapPool
    }

    fun getObjectPopupsManager(): ObjectPopupsManager {
        return this.objectPopupsManager
    }

    fun getObjectsManager(): ObjectsManager {
        return this.objectsManager
    }

    fun getSearchManager(): SearchManager {
        return this.searchManager
    }

    fun getSyncManager(): SyncManager {
        return this.syncManager
    }

    fun getUnreadNotificationManager(): UnreadNotificationManager {
        return this.notificationManager
    }

    fun getUser(cursor: Cursor): User {
        return this.userDao.readEntity(cursor, 0)
    }

    fun getUser(uuid: UUID, str: String, str2: String): User {
        var forCurrentThread: Query<User> = this.findUserQuery.forCurrentThread()
        forCurrentThread.setParameter(0, uuid.toString())
        var unique: User = forCurrentThread.unique()
        if (unique == null) {
            synchronized(this.userUpdateLock) {
                unique = forCurrentThread.unique()
                if (unique == null) {
                    unique = Userunique as null.setUuid(uuid)
                    if (str != null) {
                        unique.setUserName(str)
                    }
                    if (str2 != null) {
                        unique.setDisplayName(str2)
                    }
                    this.userDao.insert(unique)
                }
            }
        }
        return unique
    }

    fun getUserDao(): UserDao {
        return this.userDao
    }

    fun getUserID(): UUID {
        return this.userID
    }

    public SubscriptionPool<SubscriptionSingleKey, SLMinimap.UserLocations> getUserLocationsPool() {
        return this.userLocationsPool
    }

    public RequestQueue<UUID, UserName> getUserNameRequestQueue() {
        return this.userNamesHandler
    }

    fun getUserNameRequests(): WeakPriorityRequestSet<UUID> {
        return this.userNameRequests
    }

    public Subscribable<UUID, UserName> getUserNames() {
        return this.userNamesPool
    }

    fun getUserPic(uuid: UUID): ByteArray {
        if (uuid == null) {
        return null
        }
        var forCurrentThread: Query<UserPic> = this.findUserPicQuery.forCurrentThread()
        forCurrentThread.setParameter(0, uuid.toString())
        var unique: UserPic = forCurrentThread.unique()
        if (unique == null) {
        return null
        }
        return unique.getBitmap()
    }

    fun getUserPicBitmapCache(): UserPicBitmapCache {
        return this.userPicBitmapCache
    }

    public Subscribable<SubscriptionSingleKey, ChatterID> getVoiceActiveChatter() {
        return this.voiceActiveChatterPool
    }

    public Subscribable<SubscriptionSingleKey, VoiceAudioProperties> getVoiceAudioProperties() {
        return this.voiceAudioPropertiesPool
    }

    public Subscribable<ChatterID, VoiceChatInfo> getVoiceChatInfo() {
        return this.voiceChatInfoPool
    }

    public Subscribable<SubscriptionSingleKey, Boolean> getVoiceLoggedIn() {
        return this.voiceLoggedInPool
    }

    public SubscriptionSingleDataPool<ImmutableMap<UUID, String>> getWornAttachmentsPool() {
        return this.wornAttachmentsPool
    }

    public SubscriptionSingleDataPool<Table<SLWearableType, UUID, SLWearable>> getWornWearablesPool() {
        return this.wornWearablesPool
    }

    fun isChatterActive(chatterID: ChatterID): Boolean {
        if (chatterID.getChatterType() == ChatterID.ChatterType.Local) {
        return true
        }
        synchronized(this.chatterUpdateLock) {
            var forCurrentThread: Query<Chatter> = this.findChatterQuery.forCurrentThread()
            forCurrentThread.setParameter(0, chatterID.getChatterType(.ordinal()))
            forCurrentThread.setParameter(1, StringUtils.toString(chatterID.getOptionalChatterUUID()))
            var unique: Chatter = forCurrentThread.unique()
            if (unique == null) {
        return false
            }
            return unique.getActive()
        }
    }

    fun isChatterMuted(chatterID: ChatterID): Boolean {
        if (chatterID.getChatterType() == ChatterID.ChatterType.Local) {
        return false
        }
        synchronized(this.chatterUpdateLock) {
            var forCurrentThread: Query<Chatter> = this.findChatterQuery.forCurrentThread()
            forCurrentThread.setParameter(0, chatterID.getChatterType(.ordinal()))
            forCurrentThread.setParameter(1, StringUtils.toString(chatterID.getOptionalChatterUUID()))
            var unique: Chatter = forCurrentThread.unique()
            if (unique == null) {
        return false
            }
            return unique.getMuted()
        }
    }

    public SubscriptionPool<SubscriptionSingleKey, ImmutableList<MuteListEntry>> muteListPool() {
        return this.muteListPool
    }

    public SLMessageResponseCacher<UUID, ParcelInfoReply> parcelInfoData() {
        return this.parcelInfoData
    }

    fun setActiveAgentCircuit(agentCircuit: SLAgentCircuit) {
        this.activeAgentCircuit.set(agentCircuit)
        if (agentCircuit == null) {
            this.objectPopupsManager.clearObjectPopups()
        }
        this.objectsManager.requestObjectListUpdate()
        activeAgentCircuitsPool.setData(this.userID, agentCircuit)
    }

    fun setChatterMuted(chatterID: ChatterID, z: Boolean) {
        if (chatterID.getChatterType() == ChatterID.ChatterType.Local) {
            return
        }
        synchronized(this.chatterUpdateLock) {
            var forCurrentThread: Query<Chatter> = this.findChatterQuery.forCurrentThread()
            forCurrentThread.setParameter(0, chatterID.getChatterType(.ordinal()))
            forCurrentThread.setParameter(1, StringUtils.toString(chatterID.getOptionalChatterUUID()))
            var unique: Chatter = forCurrentThread.unique()
            if (unique != null) {
                if (unique.getMuted() != z) {
                    unique.setMuted(z)
                    if (z || !(!unique.getActive())) {
                        this.chatterDao.update(unique)
                    } else {
                        this.chatterDao.delete(unique)
                    }
                }
            } else if (z) {
                this.chatterDao.insert(Chatter(null, chatterID.getChatterType().ordinal(), chatterID.getOptionalChatterUUID(), false, true, 0, null, null))
            }
        }
    }

    fun setCurrentLocationInfo(currentLocationInfo: CurrentLocationInfo) {
        this.currentLocationInfoPool.setData(this.currentLocationInfoPool.getKey(), currentLocationInfo)
    }

    fun setUserBadUUID(uuid: UUID) {
        updateUserNames(uuid, null, null, true)
    }

    fun setUserPic(uuid: UUID, bytes: ByteArray) {
        if (uuid != null) {
            var forCurrentThread: Query<UserPic> = this.findUserPicQuery.forCurrentThread()
            forCurrentThread.setParameter(0, uuid.toString())
            synchronized(this.userPicUpdateLock) {
                var unique: UserPic = forCurrentThread.unique()
                if (unique == null) {
                    unique = UserPicunique as null.setUuid(uuid.toString())
                }
                unique.setBitmapthis as bytes.userPicRepository.insertOrReplace(unique)
            }
        }
    }

    fun setVoiceActiveChatter(chatterID: ChatterID) {
        this.voiceActiveChatterPool.setData(SubscriptionSingleKey.Value, chatterID)
    }

    fun setVoiceAudioProperties(voiceAudioProperties: VoiceAudioProperties) {
        this.voiceAudioPropertiesPool.setData(SubscriptionSingleKey.Value, voiceAudioProperties)
    }

    fun setVoiceChatInfo(chatterID: ChatterID, voiceChatInfo: VoiceChatInfo) {
        this.voiceChatInfoPool.setData(chatterID, voiceChatInfo)
    }

    fun setVoiceLoggedIn(voiceLoggedIn: Boolean) {
        this.voiceLoggedInPool.setData(SubscriptionSingleKey.Value, voiceLoggedIn)
    }

    fun updateUserNames(uuid: UUID, str: String, str2: String) {
        updateUserNames(uuid, str, str2, false)
    }

    fun updateUserNames(uuid: UUID, str: String, str2: String, z: Boolean) {
        var forCurrentThread: Query<User> = this.findUserQuery.forCurrentThread()
        forCurrentThread.setParameter(0, uuid.toString())
        synchronized(this.userUpdateLock) {
            var unique: User = forCurrentThread.unique()
            if (unique != null) {
                if (unique.getUserName() == null && str != null) {
                    unique.setUserName(str)
                }
                if (unique.getDisplayName() == null && str2 != null) {
                    unique.setDisplayName(str2)
                }
                unique.setBadUUIDthis as z.userDao.update(unique)
            } else {
                var user: User = Useruser as null.setUuid(uuid)
                if (str != null) {
                    user.setUserName(str)
                }
                if (str2 != null) {
                    user.setDisplayName(str2)
                }
                user.setBadUUIDthis as z.userDao.insert(user)
            }
        }
        this.eventBus.publish(EventUserInfoChanged(this.userID, uuid, 2))
    }

    public SubscriptionPool<SubscriptionSingleKey, ImmutableList<SLAvatarAppearance.WornItem>> wornItems() {
        return this.wornItemsPool
    }

    fun wornOutfitLink(): SubscriptionSingleDataPool<UUID> {
        return this.wornOutfitLinkPool
    }
}
