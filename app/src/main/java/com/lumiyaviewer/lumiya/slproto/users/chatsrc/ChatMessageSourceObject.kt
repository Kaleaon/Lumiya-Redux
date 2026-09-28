package com.lumiyaviewer.lumiya.slproto.users.chatsrc

import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

open class ChatMessageSourceObject : ChatMessageSource() {
    var name: String = ""

    var uuid: UUID? = null

    constructor(chatMessage: ChatMessage) {
        this.uuid = chatMessage.getSenderUUID()
        this.name = chatMessage.getSenderName()
    }

    constructor(uuid: UUID, name: String) {
        this.uuid = uuid
        this.name = name
    }
    fun getDefaultChatter(uuid: UUID): ChatterID {
        return ChatterID.getLocalChatterID(uuid)
    }
    fun getSourceName(userManager: UserManager): String {
        return this.name
    }
    fun getSourceType(): ChatMessageSource.ChatMessageSourceType {
        return ChatMessageSource.ChatMessageSourceType.Object
    }
    fun getSourceUUID(): UUID {
        return this.uuid
    }
    fun serializeTo(chatMessage: ChatMessage) {
        super.serializeTochatMessag(e)
        chatMessage.setSenderUUID(this.uuid)
        chatMessage.setSenderName(this.name)
    }
}
