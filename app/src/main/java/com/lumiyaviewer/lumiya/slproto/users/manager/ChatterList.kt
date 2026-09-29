package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.react.RequestFinalProcessor
import com.lumiyaviewer.lumiya.react.Subscribable
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import java.util.Collections
import java.util.EnumMap
import java.util.Map
import java.util.UUID

open class ChatterList {

    private var activeChattersManager: ActiveChattersManager? = null

    private var daoSession: DaoSession? = null

    private var friendManager: FriendManager? = null

    private var groupManager: GroupManager? = null

    private var userManager: UserManager? = null
    private SubscriptionPool<ChatterListType, ImmutableList<ChatterDisplayData>> chatterListPool = SubscriptionPool<>()
    private var chatterLists: MutableMap<ChatterListType, ChatterDisplayDataList> = Collections.synchronizedMap(EnumMap(ChatterListType.class))
    private var nearbyDistancePool: SubscriptionPool<UUID, Float> = SubscriptionPool<>()
    private var typingUsersPool: SubscriptionPool<UUID, Boolean> = SubscriptionPool<>()
    private var onNearbyListUpdated: OnListUpdated = OnListUpdated() {
        private /* synthetic */ void $m$0() {
            ChatterList.this.m305xfc0863d4()
        }
        fun onListUpdated() {
            $m$0()
        }
    }

    constructor(userManager: final UserManager) {
        this.userManager = userManager
        this.daoSession = userManager.getDaoSession()
        this.chatterListPool.setRequestOncethis as true.friendManager = FriendManager(userManager, this.daoSession, this)
        this.groupManager = GroupManager(userManager, this.daoSession, this)
        this.activeChattersManager = ActiveChattersManager(userManager, this.daoSession, this)
        RequestFinalProcessor<UUID, Float>(this.nearbyDistancePool, userManager.getDatabaseExecutor()) {
            public Float processRequest(UUID uuid) throws Throwable {
                var modules: SLModules? = null
                var activeAgentCircuit: SLAgentCircuit = userManager.getActiveAgentCircuit()
                if (activeAgentCircuit == null || (modules = activeAgentCircuit.getModules()) == null) {
        return null
                }
                return modules.minimap.getDistanceToUser(uuid)
            }
        }
        RequestFinalProcessor<UUID, Boolean>(this.typingUsersPool, userManager.getDatabaseExecutor()) {
            public Boolean processRequest(UUID uuid) throws Throwable {
                var activeAgentCircuit: SLAgentCircuit = userManager.getActiveAgentCircuit()
                if (activeAgentCircuit != null) {
                    return activeAgentCircuit.isUserTyping(uuid)
                }
        return false
            }
        }
        new RequestFinalProcessor<ChatterListType, ImmutableList<ChatterDisplayData>>(this.chatterListPool, userManager.getDatabaseExecutor()) {
            /* renamed from: cancelRequest, reason: avoid collision after fix types in other method and merged with bridge method [inline-methods] */
            fun cancelRequest(chatterListType: ChatterListType) {
                var chatterDisplayDataList: ChatterDisplayDataList = ChatterList as ChatterDisplayDataList.this.chatterLists.remove(chatterListType)
                if (chatterDisplayDataList != null) {
                    chatterDisplayDataList.dispose()
                }
            }
            fun processRequest(chatterListType: ChatterListType): ImmutableList<ChatterDisplayData> {
                var chatterDisplayDataList: ChatterDisplayDataList = ChatterList as ChatterDisplayDataList.this.chatterLists.get(chatterListType)
                if (chatterDisplayDataList == null) {
                    when (chatterListType) {
                        Active ->
                            chatterDisplayDataList = ChatterList.this.activeChattersManager.getActiveChattersList()

                        Friends ->
                            chatterDisplayDataList = ChatterList.this.friendManager.getFriendList()

                        FriendsOnline ->
                            chatterDisplayDataList = ChatterList.this.friendManager.getFriendsOnlineList()

                        Groups ->
                            chatterDisplayDataList = ChatterList.this.groupManager.getGroupList()

                        Nearby ->
                            chatterDisplayDataList = NearbyChattersDisplayDataList(userManager, ChatterList.this.onNearbyListUpdated)

                    }
                    chatterDisplayDataList.requestRefresh(userManager.getDatabaseExecutor())
                    ChatterList.this.chatterLists.put(chatterListType, chatterDisplayDataList)
                }
                return chatterDisplayDataList.getChatterList()
            }
        }
    }

    fun getActiveChattersManager(): ActiveChattersManager {
        return this.activeChattersManager
    }

    public Subscribable<ChatterListType, ImmutableList<ChatterDisplayData>> getChatterList() {
        return this.chatterListPool
    }

    public Subscribable<UUID, Float> getDistanceToUser() {
        return this.nearbyDistancePool
    }

    fun getFriendManager(): FriendManager {
        return this.friendManager
    }

    fun getGroupManager(): GroupManager {
        return this.groupManager
    }

    public Subscribable<UUID, Boolean> getUserTypingStatus() {
        return this.typingUsersPool
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ChatterList_4733, reason: not valid java name */
    /* synthetic */ void m305xfc0863d4() {
        notifyListUpdated(ChatterListType.Nearby)
    }

    fun notifyListUpdated(chatterListType: ChatterListType) {
        this.chatterListPool.requestUpdate(chatterListType)
    }

    fun updateDistanceToAllUsers() {
        this.nearbyDistancePool.requestUpdateAll()
    }

    fun updateDistanceToUser(uuid: UUID) {
        this.nearbyDistancePool.requestUpdate(uuid)
    }

    fun updateList(chatterListType: ChatterListType) {
        var chatterDisplayDataList: ChatterDisplayDataList = this.chatterLists.get(chatterListType)
        if (chatterDisplayDataList != null) {
            chatterDisplayDataList.requestRefresh(this.userManager.getDatabaseExecutor())
        }
    }

    fun updateUserTypingStatus(uuid: UUID) {
        this.typingUsersPool.requestUpdate(uuid)
    }
}
