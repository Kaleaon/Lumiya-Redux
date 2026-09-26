package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLChatLureRequestEvent : SLChatYesNoEvent() {
    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, improvedInstantMessage: ImprovedInstantMessage) : super(chatMessageSource, uuid, improvedInstantMessage, null) {
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.LureRequest
    }
    fun getNoButton(context: Context): String {
        return context.getString(R.string.teleport_lure_request_no)
    }
    fun getNoMessage(context: Context): String {
        return context.getString(R.string.teleport_lure_request_declined)
    }
    fun getQuestion(context: Context): String {
        return context.getString(R.string.teleport_lure_request_question)
    }
    fun getText(context: Context, userManager: UserManager): String {
        var string: String = context.getString(R.string.teleport_lure_request_message)
        return !if (Strings.isNullOrEmpty(this.text)) string + " else " + this.text : string + "."
    }
    fun getYesButton(context: Context): String {
        return context.getString(R.string.teleport_lure_request_yes)
    }
    fun getYesMessage(context: Context): String {
        return context.getString(R.string.teleport_lure_request_accepted)
    }
    protected fun isActionMessage(userManager: UserManager): Boolean {
        return true
    }
    fun onYesAction(context: Context, userManager: UserManager) {
        super.onYesAction(context, userManager)
        var sourceUUID: UUID = this.source.getSourceUUID()
        var activeAgentCircuit: SLAgentCircuit = userManager.getActiveAgentCircuit()
        if (sourceUUID == null || activeAgentCircuit == null) {
            return
        }
        var regionName: String = activeAgentCircuit.getRegionName()
        if (Strings.isNullOrEmpty(regionName)) {
            regionName = context.getString(R.string.unknown_region_name)
        }
        activeAgentCircuit.OfferTeleport(sourceUUID, context.getString(R.string.join_me_in_region, regionName))
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObject(chatMessage)
    }
}
