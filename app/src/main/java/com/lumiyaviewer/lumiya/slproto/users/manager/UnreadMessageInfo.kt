package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent

abstract class UnreadMessageInfo {
    abstract fun lastMessage(): SLChatEvent?
    abstract fun unreadCount(): Int

    companion object {
        @JvmStatic fun create(count: Int, event: SLChatEvent?): UnreadMessageInfo = AutoValue_UnreadMessageInfo(count, event)
    }
}
