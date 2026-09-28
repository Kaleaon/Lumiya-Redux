package com.lumiyaviewer.lumiya.slproto.modules.mutelist

import java.util.UUID

open class MuteListKey {
    var muteType: MuteType? = null
    var uuid: UUID? = null

    constructor(muteListEntry: MuteListEntry) {
        this.muteType = muteListEntry.type
        this.uuid = muteListEntry.uuid
    }

    constructor(muteType: MuteType, uuid: UUID) {
        this.muteType = muteType
        this.uuid = uuid
    }

    fun equals(obj: Any): Boolean {
        if (!(obj is MuteListKey)) {
        return false
        }
        var muteListKey: MuteListKey = obj as MuteListKey
        if (this.muteType != muteListKey.muteType) {
        return false
        }
        if ((this.uuid == null) != (muteListKey.uuid == null)) {
        return false
        }
        return this.uuid == null || this.uuid.equals(muteListKey.uuid)
    }

    fun hashCode(): Int {
        var hashCode: Int = if (this.muteType != null) this.muteType.hashCode() + 0 else 0
        return if (this.uuid != null) hashCode + this.uuid.hashCode() else hashCode
    }
}
