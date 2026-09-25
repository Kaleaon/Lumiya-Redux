package com.lumiyaviewer.lumiya.cloud.common

import android.os.Bundle
import com.google.common.collect.ImmutableList
import com.google.common.primitives.Longs
import java.util.UUID

class LogMessagesFlushed : Bundleable {
    @JvmField val agentUUID: UUID
    @JvmField val messageIDs: ImmutableList<Long>

    constructor(bundle: Bundle) {
        this.agentUUID = UUID.fromString(bundle.getString("agentUUID"))
        val longArray = bundle.getLongArray("messageIDs") ?: LongArray(0)
        this.messageIDs = ImmutableList.copyOf(Longs.asList(*longArray))
    }

    constructor(uuid: UUID, collection: Collection<Long>) {
        this.agentUUID = uuid
        this.messageIDs = ImmutableList.copyOf(collection)
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putString("agentUUID", agentUUID.toString())
        putLongArray("messageIDs", Longs.toArray(messageIDs))
    }
}
