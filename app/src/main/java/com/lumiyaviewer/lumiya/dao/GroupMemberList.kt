package com.lumiyaviewer.lumiya.dao

import java.util.UUID

class GroupMemberList {
    private var groupID: UUID? = null
    private var requestID: UUID? = null

    constructor()

    constructor(uuid: UUID?) {
        this.groupID = uuid
    }

    constructor(uuid: UUID?, requestID: UUID?) {
        this.groupID = uuid
        this.requestID = requestID
    }

    fun getGroupID(): UUID? = groupID

    fun getRequestID(): UUID? = requestID

    fun setGroupID(uuid: UUID?) {
        this.groupID = uuid
    }

    fun setRequestID(uuid: UUID?) {
        this.requestID = uuid
    }
}
