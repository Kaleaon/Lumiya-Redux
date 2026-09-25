package com.lumiyaviewer.lumiya.cloud.common

import android.os.Bundle
import java.util.UUID

class LogSyncStart : Bundleable {
    @JvmField val appVersionCode: Int
    @JvmField val agentUUID: UUID

    constructor(appVersionCode: Int, uuid: UUID) {
        this.appVersionCode = appVersionCode
        this.agentUUID = uuid
    }

    constructor(bundle: Bundle) {
        this.appVersionCode = bundle.getInt("appVersionCode")
        this.agentUUID = UUID.fromString(bundle.getString("agentUUID"))
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putInt("appVersionCode", appVersionCode)
        putString("agentUUID", agentUUID.toString())
    }
}
