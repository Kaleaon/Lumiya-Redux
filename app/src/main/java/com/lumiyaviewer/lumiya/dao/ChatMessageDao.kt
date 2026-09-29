package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig
import java.util.Date
import java.util.UUID

class ChatMessageDao : AbstractDao<ChatMessage, Long> {

    object Properties {
        @JvmField val Id = Property(0, Long::class.javaObjectType, "id", true, "_id")
        @JvmField val ChatterID = Property(1, Long::class.javaPrimitiveType, ChatterFragment.CHATTER_ID_KEY, false, "CHATTER_ID")
        @JvmField val Timestamp = Property(2, Date::class.java, "timestamp", false, "TIMESTAMP")
        @JvmField val ViewType = Property(3, Integer.TYPE, "viewType", false, "VIEW_TYPE")
        @JvmField val OrigTimestamp = Property(4, Date::class.java, "origTimestamp", false, "ORIG_TIMESTAMP")
        @JvmField val IsOffline = Property(5, Boolean::class.javaObjectType, "isOffline", false, "IS_OFFLINE")
        @JvmField val SenderUUID = Property(6, UUID::class.java, "senderUUID", false, "SENDER_UUID")
        @JvmField val SenderType = Property(7, Integer::class.javaObjectType, "senderType", false, "SENDER_TYPE")
        @JvmField val SenderName = Property(8, String::class.java, "senderName", false, "SENDER_NAME")
        @JvmField val SenderLegacyName = Property(9, String::class.java, "senderLegacyName", false, "SENDER_LEGACY_NAME")
        @JvmField val MessageText = Property(10, String::class.java, "messageText", false, "MESSAGE_TEXT")
        @JvmField val MessageType = Property(11, Integer.TYPE, "messageType", false, "MESSAGE_TYPE")
        @JvmField val EventState = Property(12, Integer::class.javaObjectType, "eventState", false, "EVENT_STATE")
        @JvmField val OrigIMType = Property(13, Integer::class.javaObjectType, "origIMType", false, "ORIG_IMTYPE")
        @JvmField val SessionID = Property(14, UUID::class.java, "sessionID", false, "SESSION_ID")
        @JvmField val ItemID = Property(15, UUID::class.java, "itemID", false, "ITEM_ID")
        @JvmField val ItemName = Property(16, String::class.java, "itemName", false, "ITEM_NAME")
        @JvmField val AssetType = Property(17, Integer::class.javaObjectType, "assetType", false, "ASSET_TYPE")
        @JvmField val TransactionAmount = Property(18, Integer::class.javaObjectType, "transactionAmount", false, "TRANSACTION_AMOUNT")
        @JvmField val NewBalance = Property(19, Integer::class.javaObjectType, "newBalance", false, "NEW_BALANCE")
        @JvmField val ChatChannel = Property(20, Integer::class.javaObjectType, "chatChannel", false, "CHAT_CHANNEL")
        @JvmField val DialogIgnored = Property(21, Boolean::class.javaObjectType, "dialogIgnored", false, "DIALOG_IGNORED")
        @JvmField val Accepted = Property(22, Boolean::class.javaObjectType, "accepted", false, "ACCEPTED")
        @JvmField val UserID = Property(23, UUID::class.java, "userID", false, "USER_ID")
        @JvmField val ObjectName = Property(24, String::class.java, "objectName", false, "OBJECT_NAME")
        @JvmField val QuestionMask = Property(25, Integer::class.javaObjectType, "questionMask", false, "QUESTION_MASK")
        @JvmField val DialogButtons = Property(26, ByteArray::class.java, "dialogButtons", false, "DIALOG_BUTTONS")
        @JvmField val DialogSelectedOption = Property(27, String::class.java, "dialogSelectedOption", false, "DIALOG_SELECTED_OPTION")
        @JvmField val TextBoxButtonIndex = Property(28, Integer::class.javaObjectType, "textBoxButtonIndex", false, "TEXT_BOX_BUTTON_INDEX")
        @JvmField val SyncedToGoogleDrive = Property(29, java.lang.Boolean.TYPE, "syncedToGoogleDrive", false, "SYNCED_TO_GOOGLE_DRIVE")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, chatMessage: ChatMessage) {
        sqLiteStatement.clearBindings()
        val id = chatMessage.getId()
        if (id != null) {
            sqLiteStatement.bindLong(1, id)
        }
        sqLiteStatement.bindLong(2, chatMessage.chatterID)
        sqLiteStatement.bindLong(3, chatMessage.timestamp!!.time)
        sqLiteStatement.bindLong(4, chatMessage.viewType.toLong())
        val origTimestamp = chatMessage.origTimestamp
        if (origTimestamp != null) {
            sqLiteStatement.bindLong(5, origTimestamp.time)
        }
        val isOffline = chatMessage.isOffline
        if (isOffline != null) {
            sqLiteStatement.bindLong(6, if (isOffline) 1L else 0L)
        }
        val senderUUID = chatMessage.senderUUID
        if (senderUUID != null) {
            sqLiteStatement.bindString(7, senderUUID.toString())
        }
        val senderType = chatMessage.senderType
        if (senderType != null) {
            sqLiteStatement.bindLong(8, senderType.toLong())
        }
        val senderName = chatMessage.senderName
        if (senderName != null) {
            sqLiteStatement.bindString(9, senderName)
        }
        val senderLegacyName = chatMessage.senderLegacyName
        if (senderLegacyName != null) {
            sqLiteStatement.bindString(10, senderLegacyName)
        }
        val messageText = chatMessage.messageText
        if (messageText != null) {
            sqLiteStatement.bindString(11, messageText)
        }
        sqLiteStatement.bindLong(12, chatMessage.messageType.toLong())
        val eventState = chatMessage.eventState
        if (eventState != null) {
            sqLiteStatement.bindLong(13, eventState.toLong())
        }
        val origIMType = chatMessage.origIMType
        if (origIMType != null) {
            sqLiteStatement.bindLong(14, origIMType.toLong())
        }
        val sessionID = chatMessage.sessionID
        if (sessionID != null) {
            sqLiteStatement.bindString(15, sessionID.toString())
        }
        val itemID = chatMessage.itemID
        if (itemID != null) {
            sqLiteStatement.bindString(16, itemID.toString())
        }
        val itemName = chatMessage.itemName
        if (itemName != null) {
            sqLiteStatement.bindString(17, itemName)
        }
        val assetType = chatMessage.assetType
        if (assetType != null) {
            sqLiteStatement.bindLong(18, assetType.toLong())
        }
        val transactionAmount = chatMessage.transactionAmount
        if (transactionAmount != null) {
            sqLiteStatement.bindLong(19, transactionAmount.toLong())
        }
        val newBalance = chatMessage.newBalance
        if (newBalance != null) {
            sqLiteStatement.bindLong(20, newBalance.toLong())
        }
        val chatChannel = chatMessage.chatChannel
        if (chatChannel != null) {
            sqLiteStatement.bindLong(21, chatChannel.toLong())
        }
        val dialogIgnored = chatMessage.dialogIgnored
        if (dialogIgnored != null) {
            sqLiteStatement.bindLong(22, if (dialogIgnored) 1L else 0L)
        }
        val accepted = chatMessage.accepted
        if (accepted != null) {
            sqLiteStatement.bindLong(23, if (accepted) 1L else 0L)
        }
        val userID = chatMessage.userID
        if (userID != null) {
            sqLiteStatement.bindString(24, userID.toString())
        }
        val objectName = chatMessage.objectName
        if (objectName != null) {
            sqLiteStatement.bindString(25, objectName)
        }
        val questionMask = chatMessage.questionMask
        if (questionMask != null) {
            sqLiteStatement.bindLong(26, questionMask.toLong())
        }
        val dialogButtons = chatMessage.dialogButtons
        if (dialogButtons != null) {
            sqLiteStatement.bindBlob(27, dialogButtons)
        }
        val dialogSelectedOption = chatMessage.dialogSelectedOption
        if (dialogSelectedOption != null) {
            sqLiteStatement.bindString(28, dialogSelectedOption)
        }
        val textBoxButtonIndex = chatMessage.textBoxButtonIndex
        if (textBoxButtonIndex != null) {
            sqLiteStatement.bindLong(29, textBoxButtonIndex.toLong())
        }
        sqLiteStatement.bindLong(30, if (chatMessage.syncedToGoogleDrive) 1L else 0L)
    }

    override fun getKey(chatMessage: ChatMessage?): Long? {
        return chatMessage?.getId()
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): ChatMessage {
        val isOffline: Boolean? = if (cursor.isNull(offset + 5)) null else cursor.getShort(offset + 5).toInt() != 0
        val dialogIgnored: Boolean? = if (cursor.isNull(offset + 21)) null else cursor.getShort(offset + 21).toInt() != 0
        val accepted: Boolean? = if (cursor.isNull(offset + 22)) null else cursor.getShort(offset + 22).toInt() != 0

        return ChatMessage(
            if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0),
            cursor.getLong(offset + 1),
            Date(cursor.getLong(offset + 2)),
            cursor.getInt(offset + 3),
            if (cursor.isNull(offset + 4)) null else Date(cursor.getLong(offset + 4)),
            isOffline,
            if (cursor.isNull(offset + 6)) null else UUID.fromString(cursor.getString(offset + 6)),
            if (cursor.isNull(offset + 7)) null else cursor.getInt(offset + 7),
            if (cursor.isNull(offset + 8)) null else cursor.getString(offset + 8),
            if (cursor.isNull(offset + 9)) null else cursor.getString(offset + 9),
            if (cursor.isNull(offset + 10)) null else cursor.getString(offset + 10),
            cursor.getInt(offset + 11),
            if (cursor.isNull(offset + 12)) null else cursor.getInt(offset + 12),
            if (cursor.isNull(offset + 13)) null else cursor.getInt(offset + 13),
            if (cursor.isNull(offset + 14)) null else UUID.fromString(cursor.getString(offset + 14)),
            if (cursor.isNull(offset + 15)) null else UUID.fromString(cursor.getString(offset + 15)),
            if (cursor.isNull(offset + 16)) null else cursor.getString(offset + 16),
            if (cursor.isNull(offset + 17)) null else cursor.getInt(offset + 17),
            if (cursor.isNull(offset + 18)) null else cursor.getInt(offset + 18),
            if (cursor.isNull(offset + 19)) null else cursor.getInt(offset + 19),
            if (cursor.isNull(offset + 20)) null else cursor.getInt(offset + 20),
            dialogIgnored,
            accepted,
            if (cursor.isNull(offset + 23)) null else UUID.fromString(cursor.getString(offset + 23)),
            if (cursor.isNull(offset + 24)) null else cursor.getString(offset + 24),
            if (cursor.isNull(offset + 25)) null else cursor.getInt(offset + 25),
            if (cursor.isNull(offset + 26)) null else cursor.getBlob(offset + 26),
            if (cursor.isNull(offset + 27)) null else cursor.getString(offset + 27),
            if (cursor.isNull(offset + 28)) null else cursor.getInt(offset + 28),
            cursor.getShort(offset + 29).toInt() != 0
        )
    }

    override fun readEntity(cursor: Cursor, chatMessage: ChatMessage, offset: Int) {
        chatMessage.setId(if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0))
        chatMessage.chatterID = cursor.getLong(offset + 1)
        chatMessage.timestamp = Date(cursor.getLong(offset + 2))
        chatMessage.viewType = cursor.getInt(offset + 3)
        chatMessage.origTimestamp = if (cursor.isNull(offset + 4)) null else Date(cursor.getLong(offset + 4))
        chatMessage.isOffline = if (cursor.isNull(offset + 5)) null else cursor.getShort(offset + 5).toInt() != 0
        chatMessage.senderUUID = if (cursor.isNull(offset + 6)) null else UUID.fromString(cursor.getString(offset + 6))
        chatMessage.senderType = if (cursor.isNull(offset + 7)) null else cursor.getInt(offset + 7)
        chatMessage.senderName = if (cursor.isNull(offset + 8)) null else cursor.getString(offset + 8)
        chatMessage.senderLegacyName = if (cursor.isNull(offset + 9)) null else cursor.getString(offset + 9)
        chatMessage.messageText = if (cursor.isNull(offset + 10)) null else cursor.getString(offset + 10)
        chatMessage.messageType = cursor.getInt(offset + 11)
        chatMessage.eventState = if (cursor.isNull(offset + 12)) null else cursor.getInt(offset + 12)
        chatMessage.origIMType = if (cursor.isNull(offset + 13)) null else cursor.getInt(offset + 13)
        chatMessage.sessionID = if (cursor.isNull(offset + 14)) null else UUID.fromString(cursor.getString(offset + 14))
        chatMessage.itemID = if (cursor.isNull(offset + 15)) null else UUID.fromString(cursor.getString(offset + 15))
        chatMessage.itemName = if (cursor.isNull(offset + 16)) null else cursor.getString(offset + 16)
        chatMessage.assetType = if (cursor.isNull(offset + 17)) null else cursor.getInt(offset + 17)
        chatMessage.transactionAmount = if (cursor.isNull(offset + 18)) null else cursor.getInt(offset + 18)
        chatMessage.newBalance = if (cursor.isNull(offset + 19)) null else cursor.getInt(offset + 19)
        chatMessage.chatChannel = if (cursor.isNull(offset + 20)) null else cursor.getInt(offset + 20)
        chatMessage.dialogIgnored = if (cursor.isNull(offset + 21)) null else cursor.getShort(offset + 21).toInt() != 0
        chatMessage.accepted = if (cursor.isNull(offset + 22)) null else cursor.getShort(offset + 22).toInt() != 0
        chatMessage.userID = if (cursor.isNull(offset + 23)) null else UUID.fromString(cursor.getString(offset + 23))
        chatMessage.objectName = if (cursor.isNull(offset + 24)) null else cursor.getString(offset + 24)
        chatMessage.questionMask = if (cursor.isNull(offset + 25)) null else cursor.getInt(offset + 25)
        chatMessage.dialogButtons = if (cursor.isNull(offset + 26)) null else cursor.getBlob(offset + 26)
        chatMessage.dialogSelectedOption = if (cursor.isNull(offset + 27)) null else cursor.getString(offset + 27)
        chatMessage.textBoxButtonIndex = if (cursor.isNull(offset + 28)) null else cursor.getInt(offset + 28)
        chatMessage.syncedToGoogleDrive = cursor.getShort(offset + 29).toInt() != 0
    }

    override fun readKey(cursor: Cursor, offset: Int): Long? {
        return if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
    }

    override fun updateKeyAfterInsert(chatMessage: ChatMessage, rowId: Long): Long {
        chatMessage.setId(rowId)
        return rowId
    }

    companion object {
        const val TABLENAME = "CHAT_MESSAGE"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val str = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${str}'CHAT_MESSAGE' ('_id' INTEGER PRIMARY KEY ,'CHATTER_ID' INTEGER NOT NULL ,'TIMESTAMP' INTEGER NOT NULL ,'VIEW_TYPE' INTEGER NOT NULL ,'ORIG_TIMESTAMP' INTEGER,'IS_OFFLINE' INTEGER,'SENDER_UUID' TEXT,'SENDER_TYPE' INTEGER,'SENDER_NAME' TEXT,'SENDER_LEGACY_NAME' TEXT,'MESSAGE_TEXT' TEXT,'MESSAGE_TYPE' INTEGER NOT NULL ,'EVENT_STATE' INTEGER,'ORIG_IMTYPE' INTEGER,'SESSION_ID' TEXT,'ITEM_ID' TEXT,'ITEM_NAME' TEXT,'ASSET_TYPE' INTEGER,'TRANSACTION_AMOUNT' INTEGER,'NEW_BALANCE' INTEGER,'CHAT_CHANNEL' INTEGER,'DIALOG_IGNORED' INTEGER,'ACCEPTED' INTEGER,'USER_ID' TEXT,'OBJECT_NAME' TEXT,'QUESTION_MASK' INTEGER,'DIALOG_BUTTONS' BLOB,'DIALOG_SELECTED_OPTION' TEXT,'TEXT_BOX_BUTTON_INDEX' INTEGER,'SYNCED_TO_GOOGLE_DRIVE' INTEGER NOT NULL );")
            sqLiteDatabase.execSQL("CREATE INDEX ${str}IDX_CHAT_MESSAGE_CHATTER_ID ON CHAT_MESSAGE (CHATTER_ID);")
            sqLiteDatabase.execSQL("CREATE INDEX ${str}IDX_CHAT_MESSAGE__id_SYNCED_TO_GOOGLE_DRIVE ON CHAT_MESSAGE (_id,SYNCED_TO_GOOGLE_DRIVE);")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val str = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${str}'CHAT_MESSAGE'")
        }
    }
}
