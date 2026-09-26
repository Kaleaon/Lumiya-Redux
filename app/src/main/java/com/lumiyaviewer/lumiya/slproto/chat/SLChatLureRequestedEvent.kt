package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUnknown
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLChatLureRequestedEvent : SLChatEvent() {
    private var message: String = ""

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.message = chatMessage.getMessageText()
    }

    constructor(message: String, uuid: UUID) : super(ChatMessageSourceUnknown.getInstance(), uuid) {
        this.message = message
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.LureRequested
    }
    protected fun getText(context: Context, userManager: UserManager): String {
        return if (Strings.isNullOrEmpty(this.message)) context.getString(R.string.chat_teleport_requested_no_message) else context.getString(R.string.chat_teleport_requested_message, this.message)
    }
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_NORMAL
    }
    protected fun isActionMessage(userManager: UserManager): Boolean {
        return false
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setMessageText(this.message)
    }
}
