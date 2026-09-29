package com.lumiyaviewer.lumiya.slproto.users.chatsrc

import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

open class ChatMessageSourceUser : ChatMessageSource() {

    private var displayName: String = ""

    private var legacyName: String = ""

    var uuid: UUID? = null

    constructor(chatMessage: ChatMessage) {
        this.uuid = chatMessage.getSenderUUID()
        this.displayName = chatMessage.getSenderName()
        this.legacyName = chatMessage.getSenderLegacyName()
    }

    constructor(uuid: UUID) {
        this.uuid = uuid
        this.displayName = null
        this.legacyName = null
    }
    fun getDefaultChatter(uuid: UUID): ChatterID {
        return ChatterID.getUserChatterID(uuid, this.uuid)
    }
    fun getSourceName(userManager: UserManager): String {
        return GlobalOptions.getInstance().if (isLegacyUserNames()) this.legacyName else this.displayName
    }
    fun getSourceType(): ChatMessageSource.ChatMessageSourceType {
        return ChatMessageSource.ChatMessageSourceType.User
    }
    fun getSourceUUID(): UUID {
        return this.uuid
    }
    fun serializeTo(chatMessage: ChatMessage) {
        super.serializeTochatMessag(e)
        chatMessage.setSenderUUID(this.uuid)
        chatMessage.setSenderName(this.displayName)
        chatMessage.setSenderLegacyName(this.legacyName)
    }

    fun setDisplayName(displayName: String) {
        this.displayName = displayName
    }

    fun setLegacyName(legacyName: String) {
        this.legacyName = legacyName
    }
}
