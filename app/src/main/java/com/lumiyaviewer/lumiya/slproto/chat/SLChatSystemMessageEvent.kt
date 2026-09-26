package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLChatSystemMessageEvent : SLChatEvent() {

    private var text: String = ""

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.text = chatMessage.getMessageText()
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, text: String) : super(chatMessageSource, uuid) {
        this.text = text
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.SystemMessage
    }
    protected fun getText(context: Context, userManager: UserManager): String {
        return this.text
    }
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_PLAIN
    }
    protected fun isActionMessage(userManager: UserManager): Boolean {
        return true
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setMessageText(this.text)
    }
}
