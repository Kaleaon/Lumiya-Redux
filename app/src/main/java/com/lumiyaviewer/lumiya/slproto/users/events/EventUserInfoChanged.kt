package com.lumiyaviewer.lumiya.slproto.users.events

import java.util.UUID

open class EventUserInfoChanged {
    @JvmStatic var CHANGED_NAME: Int = 2
    @JvmStatic var CHANGED_PROFILE: Int = 4
    var agentUUID: UUID? = null
    var changedMask: Int = 0
    var userUUID: UUID? = null

    constructor(uuid: UUID, userUUID: UUID, changedMask: Int) {
        this.agentUUID = uuid
        this.userUUID = userUUID
        this.changedMask = changedMask
    }

    fun isNameChanged(): Boolean {
        return (this.changedMask & 2) != 0
    }

    fun isProfileChanged(): Boolean {
        return (this.changedMask & 4) != 0
    }
}
