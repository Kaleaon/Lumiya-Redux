package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import android.content.SharedPreferences
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent
import com.lumiyaviewer.lumiya.slproto.messages.ChatFromSimulator
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceObject
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLEnableRLVOfferEvent : SLChatYesNoEvent() {
    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
    }

    constructor(chatFromSimulator: ChatFromSimulator, uuid: UUID) : super(ChatMessageSourceObject(chatFromSimulator.ChatData_Field.SourceID, SLMessage.stringFromVariableOEM(chatFromSimulator.ChatData_Field.FromName)), uuid, SLMessage.stringFromVariableUTF(chatFromSimulator.ChatData_Field.Message)) {
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.EnableRLVOffer
    }
    fun getNoButton(context: Context): String {
        return context.getString(R.string.enable_rlv_no)
    }
    fun getNoMessage(context: Context): String {
        return context.getString(R.string.enable_rlv_declined)
    }
    fun getQuestion(context: Context): String {
        return context.getString(R.string.enable_rlv_question)
    }
    fun getText(context: Context, userManager: UserManager): String {
        return context.getString(R.string.rlv_enable_chat_message)
    }
    fun getYesButton(context: Context): String {
        return context.getString(R.string.enable_rlv_yes)
    }
    fun getYesMessage(context: Context): String {
        return context.getString(R.string.enable_rlv_accepted)
    }
    fun isObjectPopup(): Boolean {
        return true
    }
    protected fun onNoAction(context: Context, userManager: UserManager) {
        super.onNoAction(context, userManager)
        userManager.getObjectPopupsManager().cancelObjectPopup(this)
    }
    fun onYesAction(context: Context, userManager: UserManager) {
        super.onYesAction(context, userManager)
        var edit: SharedPreferences.Editor = LumiyaApp.getDefaultSharedPreferences().edit()
        edit.putBoolean("rlv_enabled", true)
        edit.apply()
        userManager.getObjectPopupsManager().cancelObjectPopup(this)
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObject(chatMessage)
    }
}
