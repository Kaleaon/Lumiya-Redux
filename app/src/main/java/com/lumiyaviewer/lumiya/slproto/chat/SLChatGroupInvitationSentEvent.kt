package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLChatGroupInvitationSentEvent : SLChatEvent() {
    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID) : super(chatMessageSource, uuid) {
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.GroupInvitationSent
    }
    protected fun getText(context: Context, userManager: UserManager): String {
        var sourceName: String = this.source.getSourceName(userManager)
        var objArr: Array<Any> = arrayOfNulls<Object>(1)
        if (sourceName == null) {
            sourceName = "(unknown)"
        }
        objArr[0] = sourceName
        return context.getString(R.string.invitation_sent_text, objArr)
    }
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_NORMAL
    }
    protected fun isActionMessage(userManager: UserManager): Boolean {
        return false
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObject(chatMessage)
    }
}
