package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import android.view.View
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatEventViewHolder
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatTextBoxViewHolder
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatDialogEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.messages.ScriptDialog
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatEventTimestampUpdater
import com.lumiyaviewer.lumiya.ui.common.TextFieldDialogBuilder
import java.util.UUID

class SLChatTextBoxDialog : SLChatDialogEvent() {
    private var enteredValue: String = ""
    private var textBoxButtonIndex: Int = 0

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.enteredValue = null
        this.textBoxButtonIndex = chatMessage.getTextBoxButtonIndex()
        this.enteredValue = chatMessage.getDialogSelectedOption()
    }

    constructor(scriptDialog: ScriptDialog, uuid: UUID, textBoxButtonIndex: Int) : super(scriptDialog, uuid) {
        this.enteredValue = null
        this.textBoxButtonIndex = textBoxButtonIndex
    }
    fun bindViewHolder(chatEventViewHolder: ChatEventViewHolder, userManager: UserManager, chatEventTimestampUpdater: ChatEventTimestampUpdater) {
        super.bindViewHolder(chatEventViewHolder, userManager, chatEventTimestampUpdater)
        if (chatEventViewHolder is ChatTextBoxViewHolder) {
            var chatTextBoxViewHolder: ChatTextBoxViewHolder = chatEventViewHolder as ChatTextBoxViewHolder
            if (this.enteredValue != null || this.ignored) {
                if (this.ignored) {
                    chatTextBoxViewHolder.dialogResultTextView.setText(R.string.dialog_ignored)
                } else {
                    chatTextBoxViewHolder.dialogResultTextView.setText(chatTextBoxViewHolder.dialogResultTextView.getContext().getString(R.string.text_box_entered, this.enteredValue))
                }
                chatTextBoxViewHolder.dialogResultTextView.setVisibility(View.VISIBLE)
                chatTextBoxViewHolder.dialogButtonsLayout.setVisibility(View.GONE)
            } else {
                chatTextBoxViewHolder.dialogResultTextView.setVisibility(View.GONE)
                chatTextBoxViewHolder.dialogButtonsLayout.setVisibility(View.VISIBLE)
            }
            chatTextBoxViewHolder.setTextBoxEvent(this)
        }
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.TextBoxDialog
    }
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_TEXTBOX
    }
    fun isObjectPopup(): Boolean {
        return true
    }
    fun onDialogIgnored(userManager: UserManager) {
        super.onDialogIgnoreduserManage(r)
        userManager.getObjectPopupsManager().cancelObjectPopup(this)
    }

    fun onEnteredText(userManager: UserManager, enteredValue: String) {
        this.enteredValue = enteredValue
        var sourceUUID: UUID = this.source.getSourceUUID()
        var activeAgentCircuit: SLAgentCircuit = userManager.getActiveAgentCircuit()
        if (sourceUUID != null && activeAgentCircuit != null) {
            activeAgentCircuit.SendScriptDialogReply(sourceUUID, this.chatChannel, this.textBoxButtonIndex, enteredValue)
        }
        userManager.getObjectPopupsManager().cancelObjectPopup(this)
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setTextBoxButtonIndex(this.textBoxButtonIndex)
        chatMessage.setDialogSelectedOption(this.enteredValue)
    }
    fun showDialog(context: Context, userManager: UserManager) {
        TextFieldDialogBuilder(context).setTitle(this.text).setOnTextEnteredListener(TextFieldDialogBuilder.OnTextEnteredListener() {
            private /* synthetic */ void $m$0(String str) {
                SLChatTextBoxDialog.this.onEnteredText(userManager as UserManager, str)
            }
            fun onTextEntered(str: String) {
                $m$0(str)
            }
        }).setOnTextCancelledListener(TextFieldDialogBuilder.OnTextCancelledListener() {
            private /* synthetic */ void $m$0() {
                SLChatTextBoxDialog.this.onDialogIgnored(userManager as UserManager)
            }
            fun onTextCancelled() {
                $m$0()
            }
        }).show()
    }
}
