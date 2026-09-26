package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUnknown
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLChatInventoryItemOfferedByYouEvent : SLChatEvent() {
    private var itemName: String = ""

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.itemName = chatMessage.getItemName()
    }

    constructor(uuid: UUID, itemName: String) : super(ChatMessageSourceUnknown.getInstance(), uuid) {
        this.itemName = itemName
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.InventoryItemOfferedByYou
    }
    protected fun getText(context: Context, userManager: UserManager): String {
        return context.getString(R.string.chat_inventory_own_offer_format, this.itemName)
    }
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_NORMAL
    }
    protected fun isActionMessage(userManager: UserManager): Boolean {
        return false
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setItemName(this.itemName)
    }
}
