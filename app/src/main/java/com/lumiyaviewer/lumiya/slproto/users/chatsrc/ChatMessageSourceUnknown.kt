package com.lumiyaviewer.lumiya.slproto.users.chatsrc

import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

open class ChatMessageSourceUnknown : ChatMessageSource() {
    @JvmStatic private var Instance: ChatMessageSourceUnknown = ChatMessageSourceUnknown()

    fun ChatMessageSourceUnknown(): private {
    }

    fun getInstance(): ChatMessageSourceUnknown {
        return Instance
    }
    fun getDefaultChatter(uuid: UUID): ChatterID {
        return ChatterID.getLocalChatterID(uuid)
    }
    fun getSourceName(userManager: UserManager): String {
        return null
    }
    fun getSourceType(): ChatMessageSource.ChatMessageSourceType {
        return ChatMessageSource.ChatMessageSourceType.Unknown
    }
    fun getSourceUUID(): UUID {
        return null
    }
}
