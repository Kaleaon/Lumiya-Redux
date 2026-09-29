package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLMissedVoiceCallEvent : SLChatYesNoEvent() {
    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, str: String) : super(chatMessageSource, uuid, str) {
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.MissedVoiceCall
    }
    fun getNoButton(context: Context): String {
        return context.getString(R.string.missed_voice_call_no)
    }
    fun getNoMessage(context: Context): String {
        return context.getString(R.string.missed_voice_call_declined)
    }
    fun getQuestion(context: Context): String {
        return context.getString(R.string.missed_voice_call_question)
    }
    fun getYesButton(context: Context): String {
        return context.getString(R.string.missed_voice_call_yes)
    }
    fun getYesMessage(context: Context): String {
        return ""
    }
    fun onYesAction(context: Context, userManager: UserManager) {
        var modules: SLModules? = null
        super.onYesAction(context, userManager)
        var activeAgentCircuit: SLAgentCircuit = userManager.getActiveAgentCircuit()
        if (activeAgentCircuit == null || (modules = activeAgentCircuit.getModules()) == null) {
            return
        }
        modules.voice.userVoiceChatRequest(this.source.getSourceUUID())
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObject(chatMessage)
    }
}
