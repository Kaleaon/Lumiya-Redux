package com.lumiyaviewer.lumiya.slproto.users.chatsrc

import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

open class ChatMessageSourceSystem : ChatMessageSource() {
    constructor() {
    }
    fun getDefaultChatter(uuid: UUID): ChatterID {
        return ChatterID.getLocalChatterID(uuid)
    }
    fun getSourceName(userManager: UserManager): String {
        return null
    }
    fun getSourceType(): ChatMessageSource.ChatMessageSourceType {
        return ChatMessageSource.ChatMessageSourceType.System
    }
    fun getSourceUUID(): UUID {
        return null
    }
}
