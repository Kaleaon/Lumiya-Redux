package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.slproto.users.manager.GroupManager
import java.util.UUID

class AutoValue_GroupManager_GroupRoleMembersQuery : GroupManager.GroupRoleMembersQuery() {
    private var groupID: UUID = null
    private var requestID: UUID = null
    private var roleID: UUID = null

    constructor(uuid: UUID, roleID: UUID, requestID: UUID) {
        if (uuid == null) {
            throw NullPointerException("Null groupID")
        }
        this.groupID = uuid
        if (roleID == null) {
            throw NullPointerException("Null roleID")
        }
        this.roleID = roleID
        if (requestID == null) {
            throw NullPointerException("Null requestID")
        }
        this.requestID = requestID
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is GroupManager.GroupRoleMembersQuery)) {
        return false
        }
        var groupRoleMembersQuery: GroupManager.GroupRoleMembersQuery = (GroupManager.GroupRoleMembersQuery) obj
        if (this.groupID.equals(groupRoleMembersQuery.groupID()) && this.roleID.equals(groupRoleMembersQuery.roleID())) {
            return this.requestID.equals(groupRoleMembersQuery.requestID())
        }
        return false
    }
    fun groupID(): UUID {
        return this.groupID
    }

    fun hashCode(): Int {
        return ((((this.groupID.hashCode() ^ 1000003) * 1000003) ^ this.roleID.hashCode()) * 1000003) ^ this.requestID.hashCode()
    }
    fun requestID(): UUID {
        return this.requestID
    }
    fun roleID(): UUID {
        return this.roleID
    }

    fun toString(): String {
        return "GroupRoleMembersQuery{groupID=" + this.groupID + ", roleID=" + this.roleID + ", requestID=" + this.requestID + "}"
    }
}
