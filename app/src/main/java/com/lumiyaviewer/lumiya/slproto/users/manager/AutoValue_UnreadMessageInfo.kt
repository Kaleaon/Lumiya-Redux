package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent

class AutoValue_UnreadMessageInfo : UnreadMessageInfo() {
    private var lastMessage: SLChatEvent = null
    private var unreadCount: Int = 0

    constructor(unreadCount: Int, chatEvent: SLChatEvent) {
        this.unreadCount = unreadCount
        this.lastMessage = chatEvent
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is UnreadMessageInfo)) {
        return false
        }
        var unreadMessageInfo: UnreadMessageInfo = obj as UnreadMessageInfo
        if (this.unreadCount == unreadMessageInfo.unreadCount()) {
            return if (this.lastMessage == null) unreadMessageInfo.lastMessage() == null else this.lastMessage.equals(unreadMessageInfo.lastMessage())
        }
        return false
    }

    fun hashCode(): Int {
        return (if (this.lastMessage == null) 0 else this.lastMessage.hashCode()) ^ (1000003 * (this.unreadCount ^ 1000003))
    }
    fun lastMessage(): SLChatEvent {
        return this.lastMessage
    }

    fun toString(): String {
        return "UnreadMessageInfo{unreadCount=" + this.unreadCount + ", lastMessage=" + this.lastMessage + "}"
    }
    fun unreadCount(): Int {
        return this.unreadCount
    }
}
