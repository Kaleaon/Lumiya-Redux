package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity
import com.lumiyaviewer.lumiya.ui.inventory.InventorySaveInfo
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.UUID

open class SLChatInventoryItemOfferedEvent : SLChatYesNoEvent() {
    private var assetType: SLAssetType? = null
    private var itemID: UUID? = null
    private var itemName: String = ""
    private var origIMType: Int = 0
    private var sessionID: UUID? = null

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.origIMType = chatMessage.getOrigIMType()
        this.sessionID = chatMessage.getSessionID()
        this.itemID = chatMessage.getItemID()
        this.itemName = chatMessage.getItemName()
        this.assetType = SLAssetType.getByType(chatMessage.getAssetType())
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, improvedInstantMessage: ImprovedInstantMessage) : super(chatMessageSource, uuid, improvedInstantMessage, SLMessage.stringFromVariableUTF(improvedInstantMessage.MessageBlock_Field.Message)) {
        this.itemName = SLMessage.stringFromVariableUTF(improvedInstantMessage.MessageBlock_Field.Message)
        this.origIMType = improvedInstantMessage.MessageBlock_Field.Dialog
        this.sessionID = improvedInstantMessage.MessageBlock_Field.ID
        this.itemID = extractItemIDthis as improvedInstantMessage.assetType = extractAssetType(improvedInstantMessage)
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, improvedInstantMessage: ImprovedInstantMessage, itemName: String, itemID: UUID, assetType: SLAssetType) : super(chatMessageSource, uuid, improvedInstantMessage, itemName) {
        this.itemName = itemName
        this.origIMType = improvedInstantMessage.MessageBlock_Field.Dialog
        this.sessionID = improvedInstantMessage.MessageBlock_Field.ID
        this.itemID = itemID
        this.assetType = assetType
    }

    protected fun extractAssetType(improvedInstantMessage: ImprovedInstantMessage): SLAssetType {
        return if (improvedInstantMessage.MessageBlock_Field.BinaryBucket.length >= 1) SLAssetType.getByType(improvedInstantMessage.MessageBlock_Field.BinaryBucket[0]) else SLAssetType.AT_UNKNOWN
    }

    protected fun extractItemID(improvedInstantMessage: ImprovedInstantMessage): UUID {
        if (improvedInstantMessage.MessageBlock_Field.BinaryBucket.length < 17) {
        return null
        }
        var wrap: ByteBuffer = ByteBuffer.wrap(improvedInstantMessage.MessageBlock_Field.BinaryBucket)
        wrap.order(ByteOrder.BIG_ENDIAN)
        wrap.get()
        return UUID(wrap.getLong(), wrap.getLong())
    }

    fun getAssetType(): SLAssetType {
        return this.assetType
    }

    fun getItemID(): UUID {
        return this.itemID
    }

    fun getItemName(): String {
        return this.itemName
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.InventoryItemOffered
    }
    fun getNoButton(context: Context): String {
        return context.getString(R.string.inv_offer_no)
    }
    fun getNoMessage(context: Context): String {
        return context.getString(R.string.inv_offer_declined)
    }
    fun getQuestion(context: Context): String {
        return context.getString(R.string.inv_offer_question)
    }
    fun getText(context: Context, userManager: UserManager): String {
        return context.getString(R.string.chat_inventory_other_offer_format, this.itemName)
    }
    fun getYesButton(context: Context): String {
        return context.getString(R.string.inv_offer_yes)
    }
    fun getYesMessage(context: Context): String {
        return context.getString(R.string.inv_offer_accepted)
    }
    protected fun isActionMessage(userManager: UserManager): Boolean {
        return true
    }
    protected fun onNoAction(context: Context, userManager: UserManager) {
        super.onNoAction(context, userManager)
        var sourceUUID: UUID = this.source.getSourceUUID()
        var activeAgentCircuit: SLAgentCircuit = userManager.getActiveAgentCircuit()
        if (sourceUUID == null || activeAgentCircuit == null) {
            return
        }
        activeAgentCircuit.AcceptInventoryOffer(this.origIMType, false, sourceUUID, this.sessionID, null)
        if (this.itemID != null) {
            activeAgentCircuit.getModules().inventory.DeleteInventoryItemRaw(this.itemID)
        }
    }

    fun onOfferAccepted(context: Context, userManager: UserManager, uuid: UUID) {
        super.onYesAction(context, userManager)
        var activeAgentCircuit: SLAgentCircuit = userManager.getActiveAgentCircuit()
        if (activeAgentCircuit != null) {
            activeAgentCircuit.AcceptInventoryOffer(this.origIMType, true, this.source.getSourceUUID(), this.sessionID, uuid)
            if (this.itemID != null) {
                activeAgentCircuit.getModules().inventory.MoveInventoryItemRaw(this.itemID, this.itemName, uuid)
            }
        }
    }
    fun onYesAction(context: Context, userManager: UserManager) {
        if (this.dbMessage != null) {
            context.startActivity(InventoryActivity.makeSaveItemIntent(context, this.agentUUID, InventorySaveInfo(InventorySaveInfo.InventorySaveType.InventoryOffer, this.itemID, getItemName(), null, this.assetType, this.dbMessage.getId())))
        }
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setOrigIMType(this.origIMType)
        chatMessage.setSessionID(this.sessionID)
        chatMessage.setItemID(this.itemID)
        chatMessage.setItemName(this.itemName)
        chatMessage.setAssetType(if (this.assetType != null) this.assetType.getTypeCode() else null)
    }
}
