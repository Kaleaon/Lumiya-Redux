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
import com.lumiyaviewer.lumiya.ui.common.TeleportProgressDialog
import java.util.UUID

class SLChatLureEvent : SLChatYesNoEvent() {
    private var lureID: UUID = null

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.lureID = chatMessage.getSessionID()
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, improvedInstantMessage: ImprovedInstantMessage) : super(chatMessageSource, uuid, improvedInstantMessage, null) {
        this.lureID = improvedInstantMessage.MessageBlock_Field.ID
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.Lure
    }
    fun getNoButton(context: Context): String {
        return context.getString(R.string.teleport_lure_no)
    }
    fun getNoMessage(context: Context): String {
        return context.getString(R.string.teleport_lure_declined)
    }
    fun getQuestion(context: Context): String {
        return context.getString(R.string.teleport_lure_question)
    }
    fun getYesButton(context: Context): String {
        return context.getString(R.string.teleport_lure_yes)
    }
    fun getYesMessage(context: Context): String {
        return context.getString(R.string.teleport_lure_accepted)
    }
    fun onYesAction(context: Context, userManager: UserManager) {
        super.onYesAction(context, userManager)
        var activeAgentCircuit: SLAgentCircuit = userManager.getActiveAgentCircuit()
        if (activeAgentCircuit != null) {
            TeleportProgressDialog(context, userManager, R.string.teleporting_progress_message).show()
            activeAgentCircuit.TeleportToLure(this.lureID)
        }
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setSessionID(this.lureID)
    }
}
