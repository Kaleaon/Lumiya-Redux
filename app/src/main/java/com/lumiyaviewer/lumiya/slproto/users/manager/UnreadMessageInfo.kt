package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent

abstract class UnreadMessageInfo {
    abstract fun lastMessage(): if (SLChatEvent) abstract fun unreadCount() else Int

    companion object {
        @JvmStatic fun create(count: Int, event: if (SLChatEvent) ) else UnreadMessageInfo = AutoValue_UnreadMessageInfo(count, event)
    }
}
