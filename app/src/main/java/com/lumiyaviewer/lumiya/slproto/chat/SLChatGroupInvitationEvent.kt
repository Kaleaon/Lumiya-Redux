package com.lumiyaviewer.lumiya.slproto.chat

import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.UUID

class SLChatGroupInvitationEvent : SLChatYesNoEvent() {
    private var groupID: UUID = null
    private var joinFee: Int = 0
    private var sessionID: UUID = null

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.joinFee = chatMessage.getTransactionAmount()
        this.sessionID = chatMessage.getSessionID()
        this.groupID = chatMessage.getItemID()
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, improvedInstantMessage: ImprovedInstantMessage) : super(chatMessageSource, uuid, improvedInstantMessage, null) {
        this.groupID = improvedInstantMessage.AgentData_Field.AgentID
        this.sessionID = improvedInstantMessage.MessageBlock_Field.ID
        if (improvedInstantMessage.MessageBlock_Field.BinaryBucket.length < 4) {
            this.joinFee = 0
            return
        }
        var wrap: ByteBuffer = ByteBuffer.wrap(improvedInstantMessage.MessageBlock_Field.BinaryBucket)
        wrap.order(ByteOrder.BIG_ENDIAN)
        this.joinFee = wrap.getInt()
    }

    private fun DoAcceptGroupInvite(uuid: UUID, uuid2: UUID, z: Boolean) {
        var activeAgentCircuit: SLAgentCircuit = null
        var userManager: UserManager = UserManager.getUserManager(this.agentUUID)
        if (userManager == null || (activeAgentCircuit = userManager.getActiveAgentCircuit()) == null) {
            return
        }
        activeAgentCircuit.getModules().groupManager.AcceptGroupInvite(uuid, uuid2, z)
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.GroupInvitation
    }
    fun getNoButton(context: Context): String {
        return context.getString(R.string.join_group_no)
    }
    fun getNoMessage(context: Context): String {
        return context.getString(R.string.join_group_declined)
    }
    fun getQuestion(context: Context): String {
        return if (this.joinFee == 0) context.getString(R.string.join_group_question_free) else context.getString(R.string.join_group_question_not_free, this.joinFee)
    }
    fun getYesButton(context: Context): String {
        return context.getString(R.string.join_group_yes)
    }
    fun getYesMessage(context: Context): String {
        return context.getString(R.string.join_group_accepted)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_chat_SLChatGroupInvitationEvent_3561, reason: not valid java name */
    /* synthetic */ void m153x2b58eb32(DialogInterface dialogInterface, int i) {
        dialogInterface.dismiss()
        DoAcceptGroupInvite(this.groupID, this.sessionID, true)
    }
    protected fun onNoAction(context: Context, userManager: UserManager) {
        super.onNoAction(context, userManager)
        DoAcceptGroupInvite(this.groupID, this.sessionID, false)
    }
    fun onYesAction(context: Context, userManager: UserManager) {
        super.onYesAction(context, userManager)
        if (this.joinFee == 0) {
            DoAcceptGroupInvite(this.groupID, this.sessionID, true)
            return
        }
        var builder: AlertDialog.Builder = AlertDialog.Builderbuilder as context.setMessage(context.getString(R.string.join_group_confirm, this.joinFee)).setCancelable(true).setPositiveButton("Yes", DialogInterface.OnClickListener() {
            private /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                SLChatGroupInvitationEvent.this.m153x2b58eb32(dialogInterface, i)
            }
            fun onClick(dialogInterface: DialogInterface, i: Int) {
                $m$0(dialogInterface, i)
            }
        }).setNegativeButton("No", DialogInterface.OnClickListener() {
            private /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel()
            }
            fun onClick(dialogInterface: DialogInterface, i: Int) {
                $m$0(dialogInterface, i)
            }
        })
        builder.create().show()
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setTransactionAmount(this.joinFee)
        chatMessage.setSessionID(this.sessionID)
        chatMessage.setItemID(this.groupID)
    }
}
