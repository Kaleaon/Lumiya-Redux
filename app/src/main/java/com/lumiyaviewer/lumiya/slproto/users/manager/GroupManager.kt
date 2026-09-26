package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.collect.ImmutableSet
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.dao.GroupMember
import com.lumiyaviewer.lumiya.dao.GroupMemberDao
import com.lumiyaviewer.lumiya.dao.GroupMemberList
import com.lumiyaviewer.lumiya.dao.GroupMemberListDao
import com.lumiyaviewer.lumiya.dao.GroupRoleMember
import com.lumiyaviewer.lumiya.dao.GroupRoleMemberDao
import com.lumiyaviewer.lumiya.dao.GroupRoleMemberList
import com.lumiyaviewer.lumiya.dao.GroupRoleMemberListDao
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler
import com.lumiyaviewer.lumiya.react.DisposeHandler
import com.lumiyaviewer.lumiya.react.RateLimitRequestHandler
import com.lumiyaviewer.lumiya.react.RequestProcessor
import com.lumiyaviewer.lumiya.react.RequestSource
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.react.Subscribable
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import de.greenrobot.dao.query.LazyList
import java.util.Iterator
import java.util.Set
import java.util.UUID
import java.util.concurrent.atomic.AtomicReference

open class GroupManager {

    private var chatterList: ChatterList = null
    private var groupMemberDao: GroupMemberDao = null
    private var groupMemberDataSetHandler: RateLimitRequestHandler<UUID, UUID> = null
    private var groupMemberListDao: GroupMemberListDao = null
    private var groupRoleMemberDao: GroupRoleMemberDao = null
    private var groupRoleMemberDataSetHandler: RateLimitRequestHandler<UUID, UUID> = null
    private var groupRoleMemberListDao: GroupRoleMemberListDao = null
    private var subscription: Subscription<UUID, AvatarGroupList> = null

    private var userManager: UserManager = null
    private var avatarGroupListRef: AtomicReference<AvatarGroupList> = AtomicReference<>()
    private var groupMemberDataSetPool: SubscriptionPool<UUID, UUID> = SubscriptionPool<>()
    private var groupRoleMemberDataSetPool: SubscriptionPool<UUID, UUID> = SubscriptionPool<>()
    private SubscriptionPool<GroupMembersQuery, LazyList<GroupMember>> groupMembersSubscriptionPool = SubscriptionPool<>()
    private SubscriptionPool<GroupRoleMembersQuery, LazyList<GroupRoleMember>> groupRoleMemberSubscriptionPool = SubscriptionPool<>()
    private SubscriptionPool<GroupMemberRolesQuery, Set<UUID>> groupMemberRolesSubscriptionPool = SubscriptionPool<>()
    private var onGroupListUpdated: OnListUpdated = OnListUpdated() {
        fun onListUpdated() {
            GroupManager.this.chatterList.notifyListUpdated(ChatterListType.Groups)
        }
    }

    abstract class GroupMemberRolesQuery {
        fun create(uuid: UUID, uuid2: UUID, uuid3: UUID): GroupMemberRolesQuery {
            return AutoValue_GroupManager_GroupMemberRolesQuery(uuid, uuid2, uuid3)
        }

        public abstract UUID groupID()

        public abstract UUID memberID()

        public abstract UUID requestID()
    }

    abstract class GroupMembersQuery {
        fun create(uuid: UUID, uuid2: UUID): GroupMembersQuery {
            return AutoValue_GroupManager_GroupMembersQuery(uuid, uuid2)
        }

        public abstract UUID groupID()

        public abstract UUID requestID()
    }

    abstract class GroupRoleMembersQuery {
        fun create(uuid: UUID, uuid2: UUID, uuid3: UUID): GroupRoleMembersQuery {
            return AutoValue_GroupManager_GroupRoleMembersQuery(uuid, uuid2, uuid3)
        }

        public abstract UUID groupID()

        public abstract UUID requestID()

        public abstract UUID roleID()
    }

    constructor(userManager: UserManager, daoSession: DaoSession, chatterList: ChatterList) {
        this.userManager = userManager
        this.chatterList = chatterList
        this.groupMemberDao = daoSession.getGroupMemberDao()
        this.groupMemberListDao = daoSession.getGroupMemberListDao()
        this.groupRoleMemberDao = daoSession.getGroupRoleMemberDao()
        this.groupRoleMemberListDao = daoSession.getGroupRoleMemberListDao()
        this.subscription = userManager.getAvatarGroupLists().getPool().subscribe(userManager.getUserID(), Subscription.OnData() {
            private /* synthetic */ void $m$0(Object obj) {
                GroupManager.this.onAvatarGroupListsReply(obj as AvatarGroupList)
            }
            fun onData(obj: Any) {
                $m$0(obj)
            }
        })
        this.groupMemberDataSetHandler = RateLimitRequestHandler<>(RequestProcessor<UUID, UUID, UUID>(this.groupMemberDataSetPool, userManager.getDatabaseExecutor()) {
            fun processRequest(uuid: UUID): UUID {
                var load: GroupMemberList = GroupManager.this.groupMemberListDao.load(uuid)
                if (load != null) {
                    return load.getRequestID()
                }
        return null
            }
            fun processResult(uuid: UUID, uuid2: UUID): UUID {
                GroupManager.this.groupMemberListDao.insertOrReplace(GroupMemberList(uuid, uuid2))
        return uuid2
            }
        })
        this.groupRoleMemberDataSetHandler = RateLimitRequestHandler<>(RequestProcessor<UUID, UUID, UUID>(this.groupRoleMemberDataSetPool, userManager.getDatabaseExecutor()) {
            fun isRequestComplete(uuid: UUID, uuid2: UUID): Boolean {
                if (GroupManager.this.groupRoleMemberListDao.load(uuid) != null) {
                    return !GroupManager.this.groupRoleMemberListDao.load(uuid).getMustRevalidate()
                }
        return false
            }
            fun processRequest(uuid: UUID): UUID {
                var load: GroupRoleMemberList = GroupManager.this.groupRoleMemberListDao.load(uuid)
                if (load != null) {
                    return load.getRequestID()
                }
        return null
            }
            fun processResult(uuid: UUID, uuid2: UUID): UUID {
                GroupManager.this.groupRoleMemberListDao.insertOrReplace(GroupRoleMemberList(uuid, uuid2, false))
        return uuid2
            }
        })
        this.groupRoleMemberSubscriptionPool.attachRequestHandler(AsyncRequestHandler(userManager.getDatabaseExecutor(), SimpleRequestHandler<GroupRoleMembersQuery>() {
            fun onRequest(groupRoleMembersQuery: GroupRoleMembersQuery) {
                GroupManager.this.groupRoleMemberSubscriptionPool.onResultData(groupRoleMembersQuery, GroupManager.this.groupRoleMemberDao.queryBuilder().where(GroupRoleMemberDao.Properties.GroupID.eq(groupRoleMembersQuery.groupID()), GroupRoleMemberDao.Properties.RoleID.eq(groupRoleMembersQuery.roleID()), GroupRoleMemberDao.Properties.RequestID.eq(groupRoleMembersQuery.requestID())).listLazyUncached())
            }
        }))
        this.groupRoleMemberSubscriptionPool.setDisposeHandler(DisposeHandler() {
            private /* synthetic */ void $m$0(Object obj) {
                (obj as LazyList).close()
            }
            fun onDispose(obj: Any) {
                $m$0(obj)
            }
        }, userManager.getDatabaseExecutor())
        this.groupMembersSubscriptionPool.attachRequestHandler(AsyncRequestHandler(userManager.getDatabaseExecutor(), SimpleRequestHandler<GroupMembersQuery>() {
            fun onRequest(groupMembersQuery: GroupMembersQuery) {
                GroupManager.this.groupMembersSubscriptionPool.onResultData(groupMembersQuery, GroupManager.this.groupMemberDao.queryBuilder().where(GroupMemberDao.Properties.GroupID.eq(groupMembersQuery.groupID()), GroupMemberDao.Properties.RequestID.eq(groupMembersQuery.requestID())).listLazyUncached())
            }
        }))
        this.groupMembersSubscriptionPool.setDisposeHandler(DisposeHandler() {
            private /* synthetic */ void $m$0(Object obj) {
                (obj as LazyList).close()
            }
            fun onDispose(obj: Any) {
                $m$0(obj)
            }
        }, userManager.getDatabaseExecutor())
        this.groupMemberRolesSubscriptionPool.attachRequestHandler(AsyncRequestHandler(userManager.getDatabaseExecutor(), SimpleRequestHandler<GroupMemberRolesQuery>() {
            fun onRequest(groupMemberRolesQuery: GroupMemberRolesQuery) {
                var listLazyUncached: LazyList<GroupRoleMember> = GroupManager.this.groupRoleMemberDao.queryBuilder().where(GroupRoleMemberDao.Properties.GroupID.eq(groupMemberRolesQuery.groupID()), GroupRoleMemberDao.Properties.UserID.eq(groupMemberRolesQuery.memberID()), GroupRoleMemberDao.Properties.RequestID.eq(groupMemberRolesQuery.requestID())).listLazyUncached()
                var builder: ImmutableSet.Builder = ImmutableSet.builder()
                var it: Iterator<GroupRoleMember> = listLazyUncached.iterator()
                while (it.hasNext()) {
                    builder.add(it.next().getRoleID())
                }
                listLazyUncached.close()
                GroupManager.this.groupMemberRolesSubscriptionPool.onResultData(groupMemberRolesQuery, builder.build())
            }
        }))
    }

    fun onAvatarGroupListsReply(avatarGroupList: AvatarGroupList) {
        this.avatarGroupListRef.setthis as avatarGroupList.chatterList.notifyListUpdated(ChatterListType.Groups)
    }

    fun getAvatarGroupList(): AvatarGroupList {
        return this.avatarGroupListRef.get()
    }

    fun getGroupList(): ChatterDisplayDataList {
        return GroupDisplayDataList(this.userManager, this.onGroupListUpdated)
    }

    public RequestSource<UUID, UUID> getGroupMemberDataSetRequestSource() {
        return this.groupMemberDataSetHandler
    }

    public Subscribable<GroupMemberRolesQuery, Set<UUID>> getGroupMemberRoleList() {
        return this.groupMemberRolesSubscriptionPool
    }

    public Subscribable<UUID, UUID> getGroupMembers() {
        return this.groupMemberDataSetPool
    }

    public Subscribable<GroupMembersQuery, LazyList<GroupMember>> getGroupMembersList() {
        return this.groupMembersSubscriptionPool
    }

    public RequestSource<UUID, UUID> getGroupRoleMemberDataSetRequestSource() {
        return this.groupRoleMemberDataSetHandler
    }

    public Subscribable<GroupRoleMembersQuery, LazyList<GroupRoleMember>> getGroupRoleMemberList() {
        return this.groupRoleMemberSubscriptionPool
    }

    public Subscribable<UUID, UUID> getGroupRoleMembers() {
        return this.groupRoleMemberDataSetPool
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_GroupManager_10304, reason: not valid java name */
    /* synthetic */ void m325xee8105e0(UUID uuid) {
        var load: GroupRoleMemberList = this.groupRoleMemberListDao.load(uuid)
        if (load != null) {
            load.setMustRevalidatethis as true.groupRoleMemberListDao.update(load)
        }
        this.groupRoleMemberDataSetPool.requestUpdate(uuid)
    }

    fun requestGroupRoleMembersRefresh(uuid: final UUID) {
        this.userManager.getDatabaseExecutor().execute(Runnable() {
            private /* synthetic */ void $m$0() {
                GroupManager.this.m325xee8105e0(uuid as UUID)
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun requestRefreshMemberList(uuid: UUID) {
        this.groupMemberDataSetPool.requestUpdate(uuid)
    }
}
