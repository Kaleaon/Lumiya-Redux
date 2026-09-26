package com.lumiyaviewer.lumiya.dao

import java.util.UUID

class GroupRoleMemberList {
    private var groupID: UUID? = null
    private var mustRevalidate: Boolean = false
    private var requestID: UUID? = null

    constructor()

    constructor(groupID: UUID?) {
        this.groupID = groupID
    }

    constructor(groupID: UUID?, requestID: UUID?, mustRevalidate: Boolean) {
        this.groupID = groupID
        this.requestID = requestID
        this.mustRevalidate = mustRevalidate
    }

    fun getGroupID(): UUID? = groupID

    fun getMustRevalidate(): Boolean = mustRevalidate

    fun getRequestID(): UUID? = requestID

    fun setGroupID(groupID: UUID?) {
        this.groupID = groupID
    }

    fun setMustRevalidate(mustRevalidate: Boolean) {
        this.mustRevalidate = mustRevalidate
    }

    fun setRequestID(requestID: UUID?) {
        this.requestID = requestID
    }
}
