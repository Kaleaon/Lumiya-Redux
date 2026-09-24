package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.google.common.collect.ImmutableSet;
import com.lumiyaviewer.lumiya.dao.DaoSession;
import com.lumiyaviewer.lumiya.dao.GroupMember;
import com.lumiyaviewer.lumiya.dao.GroupMemberDao;
import com.lumiyaviewer.lumiya.dao.GroupMemberList;
import com.lumiyaviewer.lumiya.dao.GroupMemberListDao;
import com.lumiyaviewer.lumiya.dao.GroupRoleMember;
import com.lumiyaviewer.lumiya.dao.GroupRoleMemberDao;
import com.lumiyaviewer.lumiya.dao.GroupRoleMemberList;
import com.lumiyaviewer.lumiya.dao.GroupRoleMemberListDao;
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler;
import com.lumiyaviewer.lumiya.react.DisposeHandler;
import com.lumiyaviewer.lumiya.react.RateLimitRequestHandler;
import com.lumiyaviewer.lumiya.react.RequestProcessor;
import com.lumiyaviewer.lumiya.react.RequestSource;
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler;
import com.lumiyaviewer.lumiya.react.Subscribable;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionPool;
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList;
import de.greenrobot.dao.query.LazyList;
import java.util.Iterator;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class GroupManager {

    @Nonnull
    private final ChatterList chatterList;
    private final GroupMemberDao groupMemberDao;
    private final RateLimitRequestHandler<UUID, UUID> groupMemberDataSetHandler;
    private final GroupMemberListDao groupMemberListDao;
    private final GroupRoleMemberDao groupRoleMemberDao;
    private final RateLimitRequestHandler<UUID, UUID> groupRoleMemberDataSetHandler;
    private final GroupRoleMemberListDao groupRoleMemberListDao;
    private final Subscription<UUID, AvatarGroupList> subscription;

    @Nonnull
    private final UserManager userManager;
    private final AtomicReference<AvatarGroupList> avatarGroupListRef = new AtomicReference<>();
    private final SubscriptionPool<UUID, UUID> groupMemberDataSetPool = new SubscriptionPool<>();
    private final SubscriptionPool<UUID, UUID> groupRoleMemberDataSetPool = new SubscriptionPool<>();
    private final SubscriptionPool<GroupMembersQuery, LazyList<GroupMember>> groupMembersSubscriptionPool = new SubscriptionPool<>();
    private final SubscriptionPool<GroupRoleMembersQuery, LazyList<GroupRoleMember>> groupRoleMemberSubscriptionPool = new SubscriptionPool<>();
    private final SubscriptionPool<GroupMemberRolesQuery, Set<UUID>> groupMemberRolesSubscriptionPool = new SubscriptionPool<>();
    private final OnListUpdated onGroupListUpdated = new OnListUpdated() {
        @Override
        public void onListUpdated() {
            GroupManager.this.chatterList.notifyListUpdated(ChatterListType.Groups);
        }
    };

    public static abstract class GroupMemberRolesQuery {
        public static GroupMemberRolesQuery create(UUID uuid, UUID uuid2, UUID uuid3) {
            return new AutoValue_GroupManager_GroupMemberRolesQuery(uuid, uuid2, uuid3);
        }

        public abstract UUID groupID();

        public abstract UUID memberID();

        public abstract UUID requestID();
    }

    public static abstract class GroupMembersQuery {
        public static GroupMembersQuery create(UUID uuid, UUID uuid2) {
            return new AutoValue_GroupManager_GroupMembersQuery(uuid, uuid2);
        }

        public abstract UUID groupID();

        public abstract UUID requestID();
    }

    public static abstract class GroupRoleMembersQuery {
        public static GroupRoleMembersQuery create(UUID uuid, UUID uuid2, UUID uuid3) {
            return new AutoValue_GroupManager_GroupRoleMembersQuery(uuid, uuid2, uuid3);
        }

        public abstract UUID groupID();

        public abstract UUID requestID();

        public abstract UUID roleID();
    }

    GroupManager(@Nonnull UserManager userManager, @Nonnull DaoSession daoSession, @Nonnull ChatterList chatterList) {
        this.userManager = userManager;
        this.chatterList = chatterList;
        this.groupMemberDao = daoSession.getGroupMemberDao();
        this.groupMemberListDao = daoSession.getGroupMemberListDao();
        this.groupRoleMemberDao = daoSession.getGroupRoleMemberDao();
        this.groupRoleMemberListDao = daoSession.getGroupRoleMemberListDao();
        this.subscription = userManager.getAvatarGroupLists().getPool().subscribe(userManager.getUserID(), new Subscription.OnData() {
            private final /* synthetic */ void $m$0(Object obj) {
                GroupManager.this.onAvatarGroupListsReply((AvatarGroupList) obj);
            }

            @Override
            public final void onData(Object obj) {
                $m$0(obj);
            }
        });
        this.groupMemberDataSetHandler = new RateLimitRequestHandler<>(new RequestProcessor<UUID, UUID, UUID>(this.groupMemberDataSetPool, userManager.getDatabaseExecutor()) {
            @Override
            @Nullable
            public UUID processRequest(@Nonnull UUID uuid) {
                GroupMemberList load = GroupManager.this.groupMemberListDao.load(uuid);
                if (load != null) {
                    return load.getRequestID();
                }
                return null;
            }

            @Override
            public UUID processResult(@Nonnull UUID uuid, UUID uuid2) {
                GroupManager.this.groupMemberListDao.insertOrReplace(new GroupMemberList(uuid, uuid2));
                return uuid2;
            }
        });
        this.groupRoleMemberDataSetHandler = new RateLimitRequestHandler<>(new RequestProcessor<UUID, UUID, UUID>(this.groupRoleMemberDataSetPool, userManager.getDatabaseExecutor()) {
            @Override
            public boolean isRequestComplete(@Nonnull UUID uuid, UUID uuid2) {
                if (GroupManager.this.groupRoleMemberListDao.load(uuid) != null) {
                    return !GroupManager.this.groupRoleMemberListDao.load(uuid).getMustRevalidate();
                }
                return false;
            }

            @Override
            @Nullable
            public UUID processRequest(@Nonnull UUID uuid) {
                GroupRoleMemberList load = GroupManager.this.groupRoleMemberListDao.load(uuid);
                if (load != null) {
                    return load.getRequestID();
                }
                return null;
            }

            @Override
            public UUID processResult(@Nonnull UUID uuid, UUID uuid2) {
                GroupManager.this.groupRoleMemberListDao.insertOrReplace(new GroupRoleMemberList(uuid, uuid2, false));
                return uuid2;
            }
        });
        this.groupRoleMemberSubscriptionPool.attachRequestHandler(new AsyncRequestHandler(userManager.getDatabaseExecutor(), new SimpleRequestHandler<GroupRoleMembersQuery>() {
            @Override
            public void onRequest(@Nonnull GroupRoleMembersQuery groupRoleMembersQuery) {
                GroupManager.this.groupRoleMemberSubscriptionPool.onResultData(groupRoleMembersQuery, GroupManager.this.groupRoleMemberDao.queryBuilder().where(GroupRoleMemberDao.Properties.GroupID.eq(groupRoleMembersQuery.groupID()), GroupRoleMemberDao.Properties.RoleID.eq(groupRoleMembersQuery.roleID()), GroupRoleMemberDao.Properties.RequestID.eq(groupRoleMembersQuery.requestID())).listLazyUncached());
            }
        }));
        this.groupRoleMemberSubscriptionPool.setDisposeHandler(new DisposeHandler() {
            private final /* synthetic */ void $m$0(Object obj) {
                ((LazyList) obj).close();
            }

            @Override
            public final void onDispose(Object obj) {
                $m$0(obj);
            }
        }, userManager.getDatabaseExecutor());
        this.groupMembersSubscriptionPool.attachRequestHandler(new AsyncRequestHandler(userManager.getDatabaseExecutor(), new SimpleRequestHandler<GroupMembersQuery>() {
            @Override
            public void onRequest(@Nonnull GroupMembersQuery groupMembersQuery) {
                GroupManager.this.groupMembersSubscriptionPool.onResultData(groupMembersQuery, GroupManager.this.groupMemberDao.queryBuilder().where(GroupMemberDao.Properties.GroupID.eq(groupMembersQuery.groupID()), GroupMemberDao.Properties.RequestID.eq(groupMembersQuery.requestID())).listLazyUncached());
            }
        }));
        this.groupMembersSubscriptionPool.setDisposeHandler(new DisposeHandler() {
            private final /* synthetic */ void $m$0(Object obj) {
                ((LazyList) obj).close();
            }

            @Override
            public final void onDispose(Object obj) {
                $m$0(obj);
            }
        }, userManager.getDatabaseExecutor());
        this.groupMemberRolesSubscriptionPool.attachRequestHandler(new AsyncRequestHandler(userManager.getDatabaseExecutor(), new SimpleRequestHandler<GroupMemberRolesQuery>() {
            @Override
            public void onRequest(@Nonnull GroupMemberRolesQuery groupMemberRolesQuery) {
                LazyList<GroupRoleMember> listLazyUncached = GroupManager.this.groupRoleMemberDao.queryBuilder().where(GroupRoleMemberDao.Properties.GroupID.eq(groupMemberRolesQuery.groupID()), GroupRoleMemberDao.Properties.UserID.eq(groupMemberRolesQuery.memberID()), GroupRoleMemberDao.Properties.RequestID.eq(groupMemberRolesQuery.requestID())).listLazyUncached();
                ImmutableSet.Builder builder = ImmutableSet.builder();
                Iterator<GroupRoleMember> it = listLazyUncached.iterator();
                while (it.hasNext()) {
                    builder.add(it.next().getRoleID());
                }
                listLazyUncached.close();
                GroupManager.this.groupMemberRolesSubscriptionPool.onResultData(groupMemberRolesQuery, builder.build());
            }
        }));
    }

    public void onAvatarGroupListsReply(AvatarGroupList avatarGroupList) {
        this.avatarGroupListRef.set(avatarGroupList);
        this.chatterList.notifyListUpdated(ChatterListType.Groups);
    }

    @Nullable
    public AvatarGroupList getAvatarGroupList() {
        return this.avatarGroupListRef.get();
    }

    ChatterDisplayDataList getGroupList() {
        return new GroupDisplayDataList(this.userManager, this.onGroupListUpdated);
    }

    public RequestSource<UUID, UUID> getGroupMemberDataSetRequestSource() {
        return this.groupMemberDataSetHandler;
    }

    public Subscribable<GroupMemberRolesQuery, Set<UUID>> getGroupMemberRoleList() {
        return this.groupMemberRolesSubscriptionPool;
    }

    public Subscribable<UUID, UUID> getGroupMembers() {
        return this.groupMemberDataSetPool;
    }

    public Subscribable<GroupMembersQuery, LazyList<GroupMember>> getGroupMembersList() {
        return this.groupMembersSubscriptionPool;
    }

    public RequestSource<UUID, UUID> getGroupRoleMemberDataSetRequestSource() {
        return this.groupRoleMemberDataSetHandler;
    }

    public Subscribable<GroupRoleMembersQuery, LazyList<GroupRoleMember>> getGroupRoleMemberList() {
        return this.groupRoleMemberSubscriptionPool;
    }

    public Subscribable<UUID, UUID> getGroupRoleMembers() {
        return this.groupRoleMemberDataSetPool;
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_GroupManager_10304, reason: not valid java name */
    /* synthetic */ void m325xee8105e0(UUID uuid) {
        GroupRoleMemberList load = this.groupRoleMemberListDao.load(uuid);
        if (load != null) {
            load.setMustRevalidate(true);
            this.groupRoleMemberListDao.update(load);
        }
        this.groupRoleMemberDataSetPool.requestUpdate(uuid);
    }

    public void requestGroupRoleMembersRefresh(final UUID uuid) {
        this.userManager.getDatabaseExecutor().execute(new Runnable() {
            private final /* synthetic */ void $m$0() {
                GroupManager.this.m325xee8105e0((UUID) uuid);
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    public void requestRefreshMemberList(UUID uuid) {
        this.groupMemberDataSetPool.requestUpdate(uuid);
    }
}
