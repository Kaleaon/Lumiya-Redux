package com.lumiyaviewer.lumiya.dao

import com.lumiyaviewer.lumiya.utils.Identifiable
import java.util.Date
import java.util.UUID

class ChatMessage : Identifiable<Long> {

    var accepted: Boolean? = null
    var assetType: Int? = null
    var chatChannel: Int? = null
    var chatterID: Long = 0
    var dialogButtons: ByteArray? = null
    var dialogIgnored: Boolean? = null
    var dialogSelectedOption: String? = null
    var eventState: Int? = null
    private var id: Long? = null
    var isOffline: Boolean? = null
    var itemID: UUID? = null
    var itemName: String? = null
    var messageText: String? = null
    var messageType: Int = 0
    var newBalance: Int? = null
    var objectName: String? = null
    var origIMType: Int? = null
    var origTimestamp: Date? = null
    var questionMask: Int? = null
    var senderLegacyName: String? = null
    var senderName: String? = null
    var senderType: Int? = null
    var senderUUID: UUID? = null
    var sessionID: UUID? = null
    var syncedToGoogleDrive: Boolean = false
    var textBoxButtonIndex: Int? = null
    var timestamp: Date? = null
    var transactionAmount: Int? = null
    var userID: UUID? = null
    var viewType: Int = 0

    constructor()

    constructor(id: Long?) {
        this.id = id
    }

    constructor(
        id: Long?,
        chatterID: Long,
        timestamp: Date?,
        viewType: Int,
        origTimestamp: Date?,
        isOffline: Boolean?,
        senderUUID: UUID?,
        senderType: Int?,
        senderName: String?,
        senderLegacyName: String?,
        messageText: String?,
        messageType: Int,
        eventState: Int?,
        origIMType: Int?,
        sessionID: UUID?,
        itemID: UUID?,
        itemName: String?,
        assetType: Int?,
        transactionAmount: Int?,
        newBalance: Int?,
        chatChannel: Int?,
        dialogIgnored: Boolean?,
        accepted: Boolean?,
        userID: UUID?,
        objectName: String?,
        questionMask: Int?,
        dialogButtons: ByteArray?,
        dialogSelectedOption: String?,
        textBoxButtonIndex: Int?,
        syncedToGoogleDrive: Boolean
    ) {
        this.id = id
        this.chatterID = chatterID
        this.timestamp = timestamp
        this.viewType = viewType
        this.origTimestamp = origTimestamp
        this.isOffline = isOffline
        this.senderUUID = senderUUID
        this.senderType = senderType
        this.senderName = senderName
        this.senderLegacyName = senderLegacyName
        this.messageText = messageText
        this.messageType = messageType
        this.eventState = eventState
        this.origIMType = origIMType
        this.sessionID = sessionID
        this.itemID = itemID
        this.itemName = itemName
        this.assetType = assetType
        this.transactionAmount = transactionAmount
        this.newBalance = newBalance
        this.chatChannel = chatChannel
        this.dialogIgnored = dialogIgnored
        this.accepted = accepted
        this.userID = userID
        this.objectName = objectName
        this.questionMask = questionMask
        this.dialogButtons = dialogButtons
        this.dialogSelectedOption = dialogSelectedOption
        this.textBoxButtonIndex = textBoxButtonIndex
        this.syncedToGoogleDrive = syncedToGoogleDrive
    }

    override fun getId(): Long? = id

    fun setId(id: Long?) {
        this.id = id
    }
}
