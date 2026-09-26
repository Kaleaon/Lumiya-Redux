package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.dao.Friend
import com.lumiyaviewer.lumiya.dao.FriendDao
import com.lumiyaviewer.lumiya.react.RequestFinalProcessor
import com.lumiyaviewer.lumiya.react.Subscribable
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import java.util.HashSet
import java.util.List
import java.util.UUID

open class FriendManager {

    private var chatterList: ChatterList = null

    private var friendDao: FriendDao = null

    private var userManager: UserManager = null
    private var onlineStatus: SubscriptionPool<UUID, Boolean> = SubscriptionPool<>()
    private var onFriendListUpdated: OnListUpdated = OnListUpdated() {
        fun onListUpdated() {
            FriendManager.this.chatterList.notifyListUpdated(ChatterListType.Friends)
        }
    }
    private var onFriendsOnlineListUpdated: OnListUpdated = OnListUpdated() {
        fun onListUpdated() {
            FriendManager.this.chatterList.notifyListUpdated(ChatterListType.FriendsOnline)
        }
    }

    constructor(userManager: UserManager, daoSession: DaoSession, chatterList: ChatterList) {
        this.userManager = userManager
        this.friendDao = daoSession.getFriendDao()
        this.chatterList = chatterList
        RequestFinalProcessor<UUID, Boolean>(this.onlineStatus, userManager.getDatabaseExecutor()) {
            fun processRequest(uuid: UUID): Boolean {
                var load: Friend = FriendManager.this.friendDao.load(uuid)
                if (load != null) {
                    return load.isOnline
                }
        return false
            }
        }
    }

    fun addFriend(uuid: UUID) {
        if (this.friendDao.load(uuid) == null) {
            this.friendDao.insert(Friend(uuid, 1, 1, false))
        }
        this.chatterList.updateList(ChatterListType.Friends)
        this.chatterList.updateList(ChatterListType.FriendsOnline)
    }

    fun getFriend(uuid: UUID): Friend {
        if (uuid != null) {
            return this.friendDao.load(uuid)
        }
        return null
    }

    fun getFriendList(): ChatterDisplayDataList {
        return FriendDisplayDataList(this.userManager, this.onFriendListUpdated, false)
    }

    fun getFriendsOnlineList(): ChatterDisplayDataList {
        return FriendDisplayDataList(this.userManager, this.onFriendsOnlineListUpdated, true)
    }

    public Subscribable<UUID, Boolean> getOnlineStatus() {
        return this.onlineStatus
    }

    fun removeFriend(uuid: UUID) {
        this.friendDao.deleteByKeythis as uuid.chatterList.updateList(ChatterListType.Friends)
        this.chatterList.updateList(ChatterListType.FriendsOnline)
    }

    fun setUsersOnline(list: MutableList<UUID>, z: Boolean) {
        for (uuid in list) {
            var load: Friend = this.friendDao.load(uuid)
            if (load != null) {
                load.isOnline = z
                this.friendDao.update(load)
            }
            this.onlineStatus.requestUpdate(uuid)
        }
        this.chatterList.updateList(ChatterListType.FriendsOnline)
    }

    fun updateFriendList(immutableList: ImmutableList<SLAuthReply.Friend>) {
        var hashSet: HashSet = HashSet()
        for (friend in immutableList) {
            var uuid: UUID = friend.uuid
            var load: Friend = this.friendDao.load(uuid)
            if (load == null) {
                this.friendDao.insertOrReplace(Friend(uuid, friend.rightsGiven, friend.rightsHas, false))
            } else if (load.getRightsGiven() != friend.rightsGiven || load.getRightsHas() != friend.rightsHas || load.isOnline) {
                load.setRightsGiven(friend.rightsGiven)
                load.setRightsHas(friend.rightsHas)
                load.isOnline = false
                this.friendDao.update(load)
            }
            hashSet.add(uuid)
        }
        var loadAll: MutableList<Friend> = this.friendDao.loadAll()
        Debug.Printf("FriendList: update[1], got %d friends", loadAll.size())
        for (friend2 in loadAll) {
            if (!hashSet.contains(friend2.getUuid())) {
                this.friendDao.delete(friend2)
            }
        }
        this.chatterList.updateList(ChatterListType.Friends)
        this.chatterList.updateList(ChatterListType.FriendsOnline)
    }
}
