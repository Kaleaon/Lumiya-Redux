package com.lumiyaviewer.lumiya.dao

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper
import android.util.Log
import de.greenrobot.dao.AbstractDaoMaster
import de.greenrobot.dao.identityscope.IdentityScopeType

class DaoMaster(sqLiteDatabase: SQLiteDatabase) : AbstractDaoMaster(sqLiteDatabase, SCHEMA_VERSION) {

    init {
        registerDaoClass(CachedResponseDao::class.java)
        registerDaoClass(CachedAssetDao::class.java)
        registerDaoClass(MoneyTransactionDao::class.java)
        registerDaoClass(MuteListCachedDataDao::class.java)
        registerDaoClass(SearchGridResultDao::class.java)
        registerDaoClass(GroupMemberDao::class.java)
        registerDaoClass(GroupMemberListDao::class.java)
        registerDaoClass(GroupRoleMemberDao::class.java)
        registerDaoClass(GroupRoleMemberListDao::class.java)
        registerDaoClass(UserDao::class.java)
        registerDaoClass(FriendDao::class.java)
        registerDaoClass(UserNameDao::class.java)
        registerDaoClass(UserPicDao::class.java)
        registerDaoClass(ChatMessageDao::class.java)
        registerDaoClass(ChatterDao::class.java)
    }

    override fun newSession(): DaoSession {
        return DaoSession(db, IdentityScopeType.Session, daoConfigMap)
    }

    override fun newSession(identityScopeType: IdentityScopeType): DaoSession {
        return DaoSession(db, identityScopeType, daoConfigMap)
    }

    abstract class OpenHelper(context: Context, name: String?, factory: SQLiteDatabase.CursorFactory?) :
        SQLiteOpenHelper(context, name, factory, SCHEMA_VERSION) {

        override fun onCreate(sqLiteDatabase: SQLiteDatabase) {
            Log.i("greenDAO", "Creating tables for schema version $SCHEMA_VERSION")
            createAllTables(sqLiteDatabase, false)
        }
    }

    open class DevOpenHelper(context: Context, name: String?, factory: SQLiteDatabase.CursorFactory?) :
        OpenHelper(context, name, factory) {

        override fun onUpgrade(sqLiteDatabase: SQLiteDatabase, oldVersion: Int, newVersion: Int) {
            Log.i("greenDAO", "Upgrading schema from version $oldVersion to $newVersion by dropping all tables")
            dropAllTables(sqLiteDatabase, true)
            onCreate(sqLiteDatabase)
        }
    }

    companion object {
        const val SCHEMA_VERSION = 71

        @JvmStatic
        fun createAllTables(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            CachedResponseDao.createTable(sqLiteDatabase, ifNotExists)
            CachedAssetDao.createTable(sqLiteDatabase, ifNotExists)
            MoneyTransactionDao.createTable(sqLiteDatabase, ifNotExists)
            MuteListCachedDataDao.createTable(sqLiteDatabase, ifNotExists)
            SearchGridResultDao.createTable(sqLiteDatabase, ifNotExists)
            GroupMemberDao.createTable(sqLiteDatabase, ifNotExists)
            GroupMemberListDao.createTable(sqLiteDatabase, ifNotExists)
            GroupRoleMemberDao.createTable(sqLiteDatabase, ifNotExists)
            GroupRoleMemberListDao.createTable(sqLiteDatabase, ifNotExists)
            UserDao.createTable(sqLiteDatabase, ifNotExists)
            FriendDao.createTable(sqLiteDatabase, ifNotExists)
            UserNameDao.createTable(sqLiteDatabase, ifNotExists)
            UserPicDao.createTable(sqLiteDatabase, ifNotExists)
            ChatMessageDao.createTable(sqLiteDatabase, ifNotExists)
            ChatterDao.createTable(sqLiteDatabase, ifNotExists)
        }

        @JvmStatic
        fun dropAllTables(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            CachedResponseDao.dropTable(sqLiteDatabase, ifExists)
            CachedAssetDao.dropTable(sqLiteDatabase, ifExists)
            MoneyTransactionDao.dropTable(sqLiteDatabase, ifExists)
            MuteListCachedDataDao.dropTable(sqLiteDatabase, ifExists)
            SearchGridResultDao.dropTable(sqLiteDatabase, ifExists)
            GroupMemberDao.dropTable(sqLiteDatabase, ifExists)
            GroupMemberListDao.dropTable(sqLiteDatabase, ifExists)
            GroupRoleMemberDao.dropTable(sqLiteDatabase, ifExists)
            GroupRoleMemberListDao.dropTable(sqLiteDatabase, ifExists)
            UserDao.dropTable(sqLiteDatabase, ifExists)
            FriendDao.dropTable(sqLiteDatabase, ifExists)
            UserNameDao.dropTable(sqLiteDatabase, ifExists)
            UserPicDao.dropTable(sqLiteDatabase, ifExists)
            ChatMessageDao.dropTable(sqLiteDatabase, ifExists)
            ChatterDao.dropTable(sqLiteDatabase, ifExists)
        }
    }
}
