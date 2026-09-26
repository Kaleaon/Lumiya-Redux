package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

open class SLChatBalanceChangedEvent : SLChatEvent() {
    private var newBalance: Int = 0
    private var transactionAmount: Int = 0
    private var transactionAmountValid: Boolean = false

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.transactionAmountValid = chatMessage.getTransactionAmount() != null
        this.transactionAmount = if (chatMessage.getTransactionAmount() != null) chatMessage.getTransactionAmount() else 0
        this.newBalance = chatMessage.getNewBalance()
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, transactionAmountValid: Boolean, transactionAmount: Int, newBalance: Int) : super(chatMessageSource, uuid) {
        this.transactionAmountValid = transactionAmountValid
        this.transactionAmount = transactionAmount
        this.newBalance = newBalance
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.BalanceChanged
    }

    fun getNewBalance(): Int {
        return this.newBalance
    }
    protected fun getText(context: Context, userManager: UserManager): String {
        if (!this.transactionAmountValid) {
            return context.getString(R.string.your_account_balance_is_now, this.newBalance)
        }
        val sourceName: String? = this.source.getSourceName(userManager)
        return if (sourceName != null) {
            if (this.transactionAmount >= 0) context.getString(R.string.you_were_paid_by_agent, this.transactionAmount, getNewBalance())
            else context.getString(R.string.you_have_paid_to_agent, -this.transactionAmount, sourceName, getNewBalance())
        } else {
            if (this.transactionAmount >= 0) context.getString(R.string.you_were_paid, this.transactionAmount, this.newBalance)
            else context.getString(R.string.you_have_paid, -this.transactionAmount, this.newBalance)
        }
    }

    fun getTransactionAmount(): Int {
        return this.transactionAmount
    }

    fun getTransactionAmountValid(): Boolean {
        return this.transactionAmountValid
    }
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_NORMAL
    }
    protected fun isActionMessage(userManager: UserManager): Boolean {
        return this.transactionAmountValid && this.source.getSourceName(userManager) != null && getTransactionAmount() >= 0
    }
    fun opensNewChatter(): Boolean {
        return false
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObject(chatMessage)
        chatMessage.setTransactionAmount(if (this.transactionAmountValid) this.transactionAmount else null)
        chatMessage.setNewBalance(this.newBalance)
    }
}
