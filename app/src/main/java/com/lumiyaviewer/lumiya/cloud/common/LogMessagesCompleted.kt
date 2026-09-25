package com.lumiyaviewer.lumiya.cloud.common

import android.os.Bundle
import java.util.UUID

class LogMessagesCompleted : Bundleable {
    @JvmField val agentUUID: UUID
    @JvmField val lastWrittenMessageID: Long

    constructor(bundle: Bundle) {
        this.agentUUID = UUID.fromString(bundle.getString("agentUUID"))
        this.lastWrittenMessageID = bundle.getLong("lastWrittenMessageID")
    }

    constructor(uuid: UUID, lastWrittenMessageID: Long) {
        this.agentUUID = uuid
        this.lastWrittenMessageID = lastWrittenMessageID
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putString("agentUUID", agentUUID.toString())
        putLong("lastWrittenMessageID", lastWrittenMessageID)
    }
}
