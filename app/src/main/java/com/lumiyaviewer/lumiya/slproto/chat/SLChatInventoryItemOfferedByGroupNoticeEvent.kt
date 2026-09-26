package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLChatInventoryItemOfferedByGroupNoticeEvent : SLChatInventoryItemOfferedEvent() {
    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, improvedInstantMessage: ImprovedInstantMessage, str: String, assetType: SLAssetType) : super(chatMessageSource, uuid, improvedInstantMessage, str, extractItemID(improvedInstantMessage), assetType) {
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.InventoryItemOfferedByGroupNotice
    }
    fun getText(context: Context, userManager: UserManager): String {
        return context.getString(R.string.group_notice_attachment_format, getItemName())
    }
}
