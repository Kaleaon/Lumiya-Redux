package com.lumiyaviewer.lumiya.cloud.common

import android.os.Bundle
import com.google.common.base.Strings
import java.util.UUID

class LogFlushMessages : Bundleable {
    @JvmField val agentUUID: UUID
    @JvmField val agentName: String?
    @JvmField val chatterName: String?

    constructor(bundle: Bundle) {
        this.agentUUID = UUID.fromString(bundle.getString("agentUUID"))
        this.agentName = Strings.nullToEmpty(bundle.getString("agentName"))
        this.chatterName = bundle.getString("chatterName")
    }

    constructor(uuid: UUID, agentName: String?, chatterName: String?) {
        this.agentUUID = uuid
        this.agentName = agentName
        this.chatterName = chatterName
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putString("agentUUID", agentUUID.toString())
        putString("agentName", agentName)
        putString("chatterName", chatterName)
    }
}
