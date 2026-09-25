package com.lumiyaviewer.lumiya.cloud.common

import android.os.Bundle
import androidx.core.os.BundleCompat
import com.google.common.collect.ImmutableList
import java.util.UUID

class LogMessageBatch : Bundleable {
    @JvmField val agentUUID: UUID
    @JvmField val agentName: String
    @JvmField val lastMessageID: Long
    @JvmField val messages: ImmutableList<LogChatMessage>

    constructor(bundle: Bundle) {
        this.agentUUID = UUID.fromString(bundle.getString("agentUUID"))
        this.agentName = bundle.getString("agentName")!!
        this.lastMessageID = bundle.getLong("lastMessageID")
        val parcelableArray = BundleCompat.getParcelableArray(bundle, "messages", Bundle::class.java)
        val builder = ImmutableList.builder<LogChatMessage>()
        parcelableArray?.forEach { parcelable ->
            if (parcelable is Bundle) {
                builder.add(LogChatMessage(parcelable))
            }
        }
        this.messages = builder.build()
    }

    constructor(uuid: UUID, agentName: String, list: List<LogChatMessage>, lastMessageID: Long) {
        this.agentUUID = uuid
        this.agentName = agentName
        this.messages = ImmutableList.copyOf(list)
        this.lastMessageID = lastMessageID
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putString("agentUUID", agentUUID.toString())
        putString("agentName", agentName)
        putLong("lastMessageID", lastMessageID)
        val bundleArr = Array(messages.size) { messages[it].toBundle() }
        putParcelableArray("messages", bundleArr)
    }
}
