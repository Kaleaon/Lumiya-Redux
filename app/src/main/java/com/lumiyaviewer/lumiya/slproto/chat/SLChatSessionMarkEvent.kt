package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.text.DateFormat
import java.util.UUID

open class SLChatSessionMarkEvent : SLChatEvent() {

    private var description: String = ""

    private var sessionMarkType: SessionMarkType? = null

    enum class SessionMarkType {
        NewSession,
        Teleport

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<SessionMarkType> {
            return values()
        }
    }

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.sessionMarkType = SessionMarkType.values()[chatMessage.getChatChannel()]
        this.description = chatMessage.getMessageText()
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, sessionMarkType: SessionMarkType, description: String) : super(chatMessageSource, uuid) {
        this.sessionMarkType = sessionMarkType
        this.description = description
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.SessionMark
    }
    protected fun getText(context: Context, userManager: UserManager): String {
        return this.sessionMarkType == if (SessionMarkType.Teleport) context.getString(R.string.teleport_complete_format, this.description) else context.getString(R.string.new_session_mark_format, DateFormat.getDateTimeInstance(3, 3).format(getTimestamp()))
    }
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_SESSION_MARK
    }
    protected fun isActionMessage(userManager: UserManager): Boolean {
        return true
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setMessageText(this.description)
        chatMessage.setChatChannel(this.sessionMarkType.ordinal())
    }
}
