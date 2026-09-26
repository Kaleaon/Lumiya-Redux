package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.slproto.users.manager.GroupManager
import java.util.UUID

class AutoValue_GroupManager_GroupMemberRolesQuery : GroupManager.GroupMemberRolesQuery() {
    private var groupID: UUID = null
    private var memberID: UUID = null
    private var requestID: UUID = null

    constructor(uuid: UUID, memberID: UUID, requestID: UUID) {
        if (uuid == null) {
            throw NullPointerException("Null groupID")
        }
        this.groupID = uuid
        if (memberID == null) {
            throw NullPointerException("Null memberID")
        }
        this.memberID = memberID
        if (requestID == null) {
            throw NullPointerException("Null requestID")
        }
        this.requestID = requestID
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is GroupManager.GroupMemberRolesQuery)) {
        return false
        }
        var groupMemberRolesQuery: GroupManager.GroupMemberRolesQuery = (GroupManager.GroupMemberRolesQuery) obj
        if (this.groupID.equals(groupMemberRolesQuery.groupID()) && this.memberID.equals(groupMemberRolesQuery.memberID())) {
            return this.requestID.equals(groupMemberRolesQuery.requestID())
        }
        return false
    }
    fun groupID(): UUID {
        return this.groupID
    }

    fun hashCode(): Int {
        return ((((this.groupID.hashCode() ^ 1000003) * 1000003) ^ this.memberID.hashCode()) * 1000003) ^ this.requestID.hashCode()
    }
    fun memberID(): UUID {
        return this.memberID
    }
    fun requestID(): UUID {
        return this.requestID
    }

    fun toString(): String {
        return "GroupMemberRolesQuery{groupID=" + this.groupID + ", memberID=" + this.memberID + ", requestID=" + this.requestID + "}"
    }
}
