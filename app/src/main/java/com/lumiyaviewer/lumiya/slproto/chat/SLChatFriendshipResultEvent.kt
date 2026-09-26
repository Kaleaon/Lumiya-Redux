package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLChatFriendshipResultEvent : SLChatEvent() {
    private var accepted: Boolean = false

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.accepted = chatMessage.getAccepted()
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, improvedInstantMessage: ImprovedInstantMessage) : super(improvedInstantMessage, uuid, chatMessageSource) {
        this.accepted = improvedInstantMessage.MessageBlock_Field.Dialog == 39
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.FriendshipResult
    }
    protected fun getText(context: Context, userManager: UserManager): String {
        return context.getString(if (this.accepted) R.string.friendship_accepted else R.string.friendship_declined)
    }
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_NORMAL
    }
    protected fun isActionMessage(userManager: UserManager): Boolean {
        return true
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setAccepted(this.accepted)
    }
}
