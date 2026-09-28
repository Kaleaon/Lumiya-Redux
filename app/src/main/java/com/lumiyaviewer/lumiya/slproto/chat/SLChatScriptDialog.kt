package com.lumiyaviewer.lumiya.slproto.chat

import android.app.Dialog
import android.content.Context
import android.content.DialogInterface
import android.util.TypedValue
import android.view.View
import android.widget.Button
import android.widget.TextView
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatEventViewHolder
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatScriptDialogViewHolder
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatDialogEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.messages.ScriptDialog
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatEventTimestampUpdater
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.io.IOException
import java.io.ObjectInputStream
import java.io.ObjectOutputStream
import java.util.UUID

class SLChatScriptDialog : SLChatDialogEvent() {
    @JvmStatic private var dialogButtonIds: IntArray = {R.id.buttonDialog1, R.id.buttonDialog2, R.id.buttonDialog3, R.id.buttonDialog4, R.id.buttonDialog5, R.id.buttonDialog6, R.id.buttonDialog7, R.id.buttonDialog8, R.id.buttonDialog9, R.id.buttonDialog10, R.id.buttonDialog11, R.id.buttonDialog12}
    private var buttons: Array<String>? = null
    private var selectedOption: String = ""

    open class ScriptDialogDialog : Dialog(), View.OnClickListener, DialogInterface.OnCancelListener {
        private UserManager userManager

        fun ScriptDialogDialog(context: Context, userManager: UserManager, str: String, str2: String): public {
            superthis as context.userManager = userManager
            setContentView(R.layout.script_dialog)
            setCancelable(true)
            setTitle(str)
            ((TextView) findViewById(R.id.dialogQuestionText)).setText(str2)
            for (int i = 0; i < SLChatScriptDialog.dialogButtonIds.length; i++) {
                if (i < SLChatScriptDialog.this.buttons.length) {
                    ((Button) findViewById(SLChatScriptDialog.dialogButtonIds[i])).setText(SLChatScriptDialog.this.buttons[i])
                    findViewById(SLChatScriptDialog.dialogButtonIds[i]).setOnClickListener(this)
                    findViewById(SLChatScriptDialog.dialogButtonIds[i]).setVisibility(View.VISIBLE)
                } else {
                    findViewById(SLChatScriptDialog.dialogButtonIds[i]).setVisibility(View.GONE)
                }
            }
            setOnCancelListener(this)
        }
        fun onCancel(dialogInterface: DialogInterface) {
            SLChatScriptDialog.this.onDialogIgnored(this.userManager)
            dismiss()
        }
        fun onClick(view: View) {
            var i: Int = 0
            while (true) {
                if (i >= SLChatScriptDialog.dialogButtonIds.length) {

                }
                if (view.getId() == SLChatScriptDialog.dialogButtonIds[i]) {
                    SLChatScriptDialog.this.onDialogButton(this.userManager, i)

                }
                i++
            }
            dismiss()
        }
    }

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        var strArr: Array<String>? = null
        this.selectedOption = null
        this.selectedOption = chatMessage.getDialogSelectedOption()
        try {
            strArr = (Array<String>) ObjectInputStream(ByteArrayInputStream(chatMessage.getDialogButtons())).readObject()
        } catch (IOException | ClassNotFoundException e) {
            Debug.Warning(e)
            strArr = null
        }
        this.buttons = strArr
    }

    constructor(scriptDialog: ScriptDialog, uuid: UUID, buttons: Array<String>) : super(scriptDialog, uuid) {
        this.selectedOption = null
        this.buttons = buttons
    }
    fun bindViewHolder(chatEventViewHolder: ChatEventViewHolder, userManager: UserManager, chatEventTimestampUpdater: ChatEventTimestampUpdater) {
        super.bindViewHolder(chatEventViewHolder, userManager, chatEventTimestampUpdater)
        if (chatEventViewHolder is ChatScriptDialogViewHolder) {
            var chatScriptDialogViewHolder: ChatScriptDialogViewHolder = chatEventViewHolder as ChatScriptDialogViewHolder
            chatScriptDialogViewHolder.setDialogEvent(this)
            if (this.selectedOption != null || this.ignored) {
                if (this.ignored) {
                    chatScriptDialogViewHolder.dialogResultTextView.setText(R.string.dialog_ignored)
                } else {
                    chatScriptDialogViewHolder.dialogResultTextView.setText(chatScriptDialogViewHolder.dialogResultTextView.getContext().getString(R.string.dialog_selected_format, this.selectedOption))
                }
                chatScriptDialogViewHolder.dialogResultTextView.findViewById(R.id.dialogResultTextView).setVisibility(View.VISIBLE)
                chatScriptDialogViewHolder.dialogButtonsLayout.findViewById(R.id.dialogButtonsLayout).setVisibility(View.GONE)
                chatScriptDialogViewHolder.cardView.setCardElevation(0.0f)
                return
            }
            chatScriptDialogViewHolder.dialogResultTextView.findViewById(R.id.dialogResultTextView).setVisibility(View.GONE)
            for (int i = 0; i < chatScriptDialogViewHolder.dialogButtons.length; i++) {
                if (i < this.buttons.length) {
                    chatScriptDialogViewHolder.dialogButtons[i].setText(this.buttons[i])
                    chatScriptDialogViewHolder.dialogButtons[i].setVisibility(View.VISIBLE)
                } else {
                    chatScriptDialogViewHolder.dialogButtons[i].setVisibility(View.GONE)
                }
            }
            chatScriptDialogViewHolder.dialogButtonsLayout.setVisibility(View.VISIBLE)
            chatScriptDialogViewHolder.cardView.setCardElevation(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 4.0f, chatScriptDialogViewHolder.cardView.getResources().getDisplayMetrics()))
        }
    }

    fun getButtons(): Array<String> {
        return this.buttons
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.ScriptDialog
    }
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_DIALOG
    }
    fun isObjectPopup(): Boolean {
        return true
    }

    fun onDialogButton(userManager: UserManager, i: Int) {
        if (i < 0 || i >= this.buttons.length) {
            return
        }
        this.selectedOption = this.buttons[i]
        var sourceUUID: UUID = this.source.getSourceUUID()
        var activeAgentCircuit: SLAgentCircuit = userManager.getActiveAgentCircuit()
        if (sourceUUID != null && activeAgentCircuit != null) {
            activeAgentCircuit.SendScriptDialogReply(sourceUUID, this.chatChannel, i, this.selectedOption)
        }
        userManager.getObjectPopupsManager().cancelObjectPopup(this)
    }
    fun onDialogIgnored(userManager: UserManager) {
        super.onDialogIgnoreduserManage(r)
        userManager.getObjectPopupsManager().cancelObjectPopup(this)
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObject(chatMessage)
        try {
            var byteArrayOutputStream: ByteArrayOutputStream = ByteArrayOutputStream()
            ObjectOutputStream(byteArrayOutputStream).writeObject(this.buttons)
            chatMessage.setDialogButtons(byteArrayOutputStream.toByteArray())
        } catch (e: IOException) {
            Debug.Warning(e)
        }
        chatMessage.setDialogSelectedOption(this.selectedOption)
    }
    fun showDialog(context: Context, userManager: UserManager) {
        ScriptDialogDialog(context, userManager, this.source.getSourceName(userManager), this.text).show()
    }
}
