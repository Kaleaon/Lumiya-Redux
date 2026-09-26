package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.messages.LoadURL
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

open class SLChatTextEvent : SLChatEvent() {
    protected var text: String = ""

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.text = chatMessage.getMessageText()
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, improvedInstantMessage: ImprovedInstantMessage, text: String) : super(improvedInstantMessage, uuid, chatMessageSource) {
        if (text != null) {
            this.text = text
        } else if (improvedInstantMessage != null) {
            this.text = SLMessage.stringFromVariableUTF(improvedInstantMessage.MessageBlock_Field.Message)
        } else {
            this.text = null
        }
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, loadURL: LoadURL) : super(chatMessageSource, uuid) {
        this.text = SLMessage.stringFromVariableUTF(loadURL.Data_Field.Message) + ": " + SLMessage.stringFromVariableUTF(loadURL.Data_Field.URL)
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, text: String) : super(chatMessageSource, uuid) {
        this.text = text
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.Text
    }

    fun getRawText(): String {
        return (this.text == null || !this.text.startsWith("/me ")) ? this.text : this.text.substring(4)
    }
    fun getText(context: Context, userManager: UserManager): String {
        return (this.text == null || !this.text.startsWith("/me ")) ? this.text : this.text.substring(4)
    }
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_NORMAL
    }
    protected fun isActionMessage(userManager: UserManager): Boolean {
        return this.text != null && this.text.startsWith("/me ")
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setMessageText(this.text)
    }
}
