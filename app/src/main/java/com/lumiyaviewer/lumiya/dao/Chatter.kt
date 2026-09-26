package com.lumiyaviewer.lumiya.dao

import java.util.UUID

class Chatter {

    var id: Long? = null
    var type: Int = 0
    var uuid: UUID? = null
    var active: Boolean = false
    var muted: Boolean = false
    var unreadCount: Int = 0
    var lastMessageID: Long? = null
    var lastSessionID: UUID? = null

    constructor()

    constructor(id: Long?) {
        this.id = id
    }

    constructor(
        id: Long?,
        type: Int,
        uuid: UUID?,
        active: Boolean,
        muted: Boolean,
        unreadCount: Int,
        lastMessageID: Long?,
        lastSessionID: UUID?
    ) {
        this.id = id
        this.type = type
        this.uuid = uuid
        this.active = active
        this.muted = muted
        this.unreadCount = unreadCount
        this.lastMessageID = lastMessageID
        this.lastSessionID = lastSessionID
    }

    // Preserve getter names for greenDAO compatibility
    fun getActive(): Boolean = active
    fun getMuted(): Boolean = muted
}
