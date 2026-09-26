package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLChatFriendshipOfferedEvent : SLChatYesNoEvent() {
    var sessionID: UUID = null

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.sessionID = chatMessage.getSessionID()
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, improvedInstantMessage: ImprovedInstantMessage) : super(chatMessageSource, uuid, improvedInstantMessage, null) {
        this.sessionID = improvedInstantMessage.MessageBlock_Field.ID
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.FriendshipOffered
    }
    fun getNoButton(context: Context): String {
        return context.getString(R.string.friendship_request_no)
    }
    fun getNoMessage(context: Context): String {
        return context.getString(R.string.friendship_request_declined)
    }
    fun getQuestion(context: Context): String {
        return context.getString(R.string.friendship_request_question)
    }
    fun getYesButton(context: Context): String {
        return context.getString(R.string.friendship_request_yes)
    }
    fun getYesMessage(context: Context): String {
        return context.getString(R.string.friendship_request_accepted)
    }
    fun onYesAction(context: Context, userManager: UserManager) {
        super.onYesAction(context, userManager)
        var sourceUUID: UUID = this.source.getSourceUUID()
        var activeAgentCircuit: SLAgentCircuit = userManager.getActiveAgentCircuit()
        if (sourceUUID == null || activeAgentCircuit == null) {
            return
        }
        activeAgentCircuit.AcceptFriendship(sourceUUID, this.sessionID)
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setSessionID(this.sessionID)
    }
}
