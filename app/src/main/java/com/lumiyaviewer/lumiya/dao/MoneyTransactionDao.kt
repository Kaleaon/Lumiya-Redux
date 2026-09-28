package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig
import java.util.Date
import java.util.UUID

class MoneyTransactionDao : AbstractDao<MoneyTransaction, Long> {

    object Properties {
        @JvmField val Id = Property(0, Long::class.javaObjectType, "id", true, "_id")
        @JvmField val Timestamp = Property(1, Date::class.java, "timestamp", false, "TIMESTAMP")
        @JvmField val AgentUUID = Property(2, UUID::class.java, "agentUUID", false, "AGENT_UUID")
        @JvmField val TransactionAmount = Property(3, Integer.TYPE, "transactionAmount", false, "TRANSACTION_AMOUNT")
        @JvmField val NewBalance = Property(4, Integer.TYPE, "newBalance", false, "NEW_BALANCE")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, moneyTransaction: MoneyTransaction) {
        sqLiteStatement.clearBindings()
        val id = moneyTransaction.id
        if (id != null) {
            sqLiteStatement.bindLong(1, id)
        }
        sqLiteStatement.bindLong(2, moneyTransaction.timestamp!!.time)
        val agentUUID = moneyTransaction.agentUUID
        if (agentUUID != null) {
            sqLiteStatement.bindString(3, agentUUID.toString())
        }
        sqLiteStatement.bindLong(4, moneyTransaction.transactionAmount.toLong())
        sqLiteStatement.bindLong(5, moneyTransaction.newBalance.toLong())
    }

    override fun getKey(moneyTransaction: MoneyTransaction?): Long? {
        return moneyTransaction?.id
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): MoneyTransaction {
        return MoneyTransaction(
            if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0),
            Date(cursor.getLong(offset + 1)),
            if (cursor.isNull(offset + 2)) null else UUID.fromString(cursor.getString(offset + 2)),
            cursor.getInt(offset + 3),
            cursor.getInt(offset + 4)
        )
    }

    override fun readEntity(cursor: Cursor, moneyTransaction: MoneyTransaction, offset: Int) {
        moneyTransaction.id = if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
        moneyTransaction.timestamp = Date(cursor.getLong(offset + 1))
        moneyTransaction.agentUUID = if (cursor.isNull(offset + 2)) null else UUID.fromString(cursor.getString(offset + 2))
        moneyTransaction.transactionAmount = cursor.getInt(offset + 3)
        moneyTransaction.newBalance = cursor.getInt(offset + 4)
    }

    override fun readKey(cursor: Cursor, offset: Int): Long? {
        return if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
    }

    override fun updateKeyAfterInsert(moneyTransaction: MoneyTransaction, rowId: Long): Long {
        moneyTransaction.id = rowId
        return rowId
    }

    companion object {
        const val TABLENAME = "MONEY_TRANSACTION"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val ifStr = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${ifStr}'MONEY_TRANSACTION' ('_id' INTEGER PRIMARY KEY ,'TIMESTAMP' INTEGER NOT NULL ,'AGENT_UUID' TEXT,'TRANSACTION_AMOUNT' INTEGER NOT NULL ,'NEW_BALANCE' INTEGER NOT NULL );")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val ifStr = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${ifStr}'MONEY_TRANSACTION'")
        }
    }
}
