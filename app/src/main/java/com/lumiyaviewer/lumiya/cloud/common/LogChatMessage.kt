package com.lumiyaviewer.lumiya.cloud.common

import android.os.Bundle
import java.util.UUID

class LogChatMessage : Bundleable {
    @JvmField val chatterType: Int
    @JvmField val chatterUUID: UUID?
    @JvmField val messageID: Long
    @JvmField val chatterName: String
    @JvmField val messageText: String

    constructor(chatterType: Int, uuid: UUID?, messageID: Long, chatterName: String, messageText: String) {
        this.chatterType = chatterType
        this.chatterUUID = uuid
        this.messageID = messageID
        this.chatterName = chatterName
        this.messageText = messageText
    }

    constructor(bundle: Bundle) {
        this.chatterType = bundle.getInt("chatterType")
        this.chatterUUID = if (!bundle.containsKey("chatterUUID")) null else UUID.fromString(bundle.getString("chatterUUID"))
        this.messageID = bundle.getLong("messageID")
        this.chatterName = bundle.getString("chatterName")!!
        this.messageText = bundle.getString("messageText")!!
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putInt("chatterType", chatterType)
        chatterUUID?.let { putString("chatterUUID", it.toString()) }
        putLong("messageID", messageID)
        putString("chatterName", chatterName)
        putString("messageText", messageText)
    }
}
