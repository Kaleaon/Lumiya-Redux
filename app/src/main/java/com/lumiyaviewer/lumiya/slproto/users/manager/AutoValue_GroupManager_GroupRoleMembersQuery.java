package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.lumiyaviewer.lumiya.slproto.users.manager.GroupManager;
import java.util.UUID;

final class AutoValue_GroupManager_GroupRoleMembersQuery extends GroupManager.GroupRoleMembersQuery {
    private final UUID groupID;
    private final UUID requestID;
    private final UUID roleID;

    AutoValue_GroupManager_GroupRoleMembersQuery(UUID uuid, UUID roleID, UUID requestID) {
        if (uuid == null) {
            throw new NullPointerException("Null groupID");
        }
        this.groupID = uuid;
        if (roleID == null) {
            throw new NullPointerException("Null roleID");
        }
        this.roleID = roleID;
        if (requestID == null) {
            throw new NullPointerException("Null requestID");
        }
        this.requestID = requestID;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof GroupManager.GroupRoleMembersQuery)) {
            return false;
        }
        GroupManager.GroupRoleMembersQuery groupRoleMembersQuery = (GroupManager.GroupRoleMembersQuery) obj;
        if (this.groupID.equals(groupRoleMembersQuery.groupID()) && this.roleID.equals(groupRoleMembersQuery.roleID())) {
            return this.requestID.equals(groupRoleMembersQuery.requestID());
        }
        return false;
    }

    @Override
    public UUID groupID() {
        return this.groupID;
    }

    public int hashCode() {
        return ((((this.groupID.hashCode() ^ 1000003) * 1000003) ^ this.roleID.hashCode()) * 1000003) ^ this.requestID.hashCode();
    }

    @Override
    public UUID requestID() {
        return this.requestID;
    }

    @Override
    public UUID roleID() {
        return this.roleID;
    }

    public String toString() {
        return "GroupRoleMembersQuery{groupID=" + this.groupID + ", roleID=" + this.roleID + ", requestID=" + this.requestID + "}";
    }
}
