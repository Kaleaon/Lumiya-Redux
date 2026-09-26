package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLChatOnlineOfflineEvent : SLChatEvent() {
    private var wentOnline: Boolean = false

    constructor(chatMessage: ChatMessage, uuid: UUID, wentOnline: Boolean) : super(chatMessage, uuid) {
        this.wentOnline = wentOnline
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, wentOnline: Boolean) : super(chatMessageSource, uuid) {
        this.wentOnline = wentOnline
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return if (this.wentOnline) SLChatEvent.ChatMessageType.WentOnline else SLChatEvent.ChatMessageType.WentOffline
    }
    protected fun getText(context: Context, userManager: UserManager): String {
        return context.getString(if (this.wentOnline) R.string.went_online else R.string.went_offline)
    }
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_NORMAL
    }
    protected fun isActionMessage(userManager: UserManager): Boolean {
        return true
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObject(chatMessage)
    }
}
