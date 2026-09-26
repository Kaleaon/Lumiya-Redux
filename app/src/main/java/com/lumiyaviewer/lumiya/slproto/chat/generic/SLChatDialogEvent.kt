package com.lumiyaviewer.lumiya.slproto.chat.generic

import android.content.Context
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.chat.SLChatTextEvent
import com.lumiyaviewer.lumiya.slproto.messages.ScriptDialog
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceObject
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

abstract class SLChatDialogEvent : SLChatTextEvent() {
    protected var chatChannel: Int = 0
    protected var ignored: Boolean = false

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.ignored = false
        this.chatChannel = chatMessage.getChatChannel()
        this.ignored = chatMessage.getDialogIgnored()
    }

    constructor(scriptDialog: ScriptDialog, uuid: UUID) : super(ChatMessageSourceObject(scriptDialog.Data_Field.ObjectID, SLMessage.stringFromVariableOEM(scriptDialog.Data_Field.ObjectName)), uuid, sanitizeDialogText(SLMessage.stringFromVariableUTF(scriptDialog.Data_Field.Message))) {
        this.ignored = false
        this.chatChannel = scriptDialog.Data_Field.ChatChannel
    }

    private fun sanitizeDialogText(str: String): String {
        while (str.contains("\n\n")) {
            str = str.replace("\n\n", "\n")
        }
        return str.trim()
    }

    protected fun onDialogIgnored(userManager: UserManager) {
        this.ignored = true
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setChatChannel(this.chatChannel)
        chatMessage.setDialogIgnored(this.ignored)
    }

    public abstract void showDialog(Context context, UserManager userManager)
}
