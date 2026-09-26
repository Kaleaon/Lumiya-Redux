package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.slproto.users.manager.GroupManager
import java.util.UUID

class AutoValue_GroupManager_GroupMembersQuery : GroupManager.GroupMembersQuery() {
    private var groupID: UUID = null
    private var requestID: UUID = null

    constructor(uuid: UUID, requestID: UUID) {
        if (uuid == null) {
            throw NullPointerException("Null groupID")
        }
        this.groupID = uuid
        if (requestID == null) {
            throw NullPointerException("Null requestID")
        }
        this.requestID = requestID
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is GroupManager.GroupMembersQuery)) {
        return false
        }
        var groupMembersQuery: GroupManager.GroupMembersQuery = (GroupManager.GroupMembersQuery) obj
        if (this.groupID.equals(groupMembersQuery.groupID())) {
            return this.requestID.equals(groupMembersQuery.requestID())
        }
        return false
    }
    fun groupID(): UUID {
        return this.groupID
    }

    fun hashCode(): Int {
        return ((this.groupID.hashCode() ^ 1000003) * 1000003) ^ this.requestID.hashCode()
    }
    fun requestID(): UUID {
        return this.requestID
    }

    fun toString(): String {
        return "GroupMembersQuery{groupID=" + this.groupID + ", requestID=" + this.requestID + "}"
    }
}
