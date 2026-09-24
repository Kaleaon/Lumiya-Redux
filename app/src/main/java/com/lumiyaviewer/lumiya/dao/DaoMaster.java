package com.lumiyaviewer.lumiya.dao;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import de.greenrobot.dao.AbstractDaoMaster;
import de.greenrobot.dao.identityscope.IdentityScopeType;

public class DaoMaster extends AbstractDaoMaster {
    public static final int SCHEMA_VERSION = 71;

    public static class DevOpenHelper extends OpenHelper {
        public DevOpenHelper(Context context, String str, SQLiteDatabase.CursorFactory cursorFactory) {
            super(context, str, cursorFactory);
        }

        @Override
        public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i2) {
            Log.i("greenDAO", "Upgrading schema from version " + i + " to " + i2 + " by dropping all tables");
            DaoMaster.dropAllTables(sqLiteDatabase, true);
            onCreate(sqLiteDatabase);
        }
    }

    public static abstract class OpenHelper extends SQLiteOpenHelper {
        public OpenHelper(Context context, String str, SQLiteDatabase.CursorFactory cursorFactory) {
            super(context, str, cursorFactory, 71);
        }

        @Override
        public void onCreate(SQLiteDatabase sqLiteDatabase) {
            Log.i("greenDAO", "Creating tables for schema version 71");
            DaoMaster.createAllTables(sqLiteDatabase, false);
        }
    }

    public DaoMaster(SQLiteDatabase sqLiteDatabase) {
        super(sqLiteDatabase, 71);
        registerDaoClass(CachedResponseDao.class);
        registerDaoClass(CachedAssetDao.class);
        registerDaoClass(MoneyTransactionDao.class);
        registerDaoClass(MuteListCachedDataDao.class);
        registerDaoClass(SearchGridResultDao.class);
        registerDaoClass(GroupMemberDao.class);
        registerDaoClass(GroupMemberListDao.class);
        registerDaoClass(GroupRoleMemberDao.class);
        registerDaoClass(GroupRoleMemberListDao.class);
        registerDaoClass(UserDao.class);
        registerDaoClass(FriendDao.class);
        registerDaoClass(UserNameDao.class);
        registerDaoClass(UserPicDao.class);
        registerDaoClass(ChatMessageDao.class);
        registerDaoClass(ChatterDao.class);
    }

    public static void createAllTables(SQLiteDatabase sqLiteDatabase, boolean z) {
        CachedResponseDao.createTable(sqLiteDatabase, z);
        CachedAssetDao.createTable(sqLiteDatabase, z);
        MoneyTransactionDao.createTable(sqLiteDatabase, z);
        MuteListCachedDataDao.createTable(sqLiteDatabase, z);
        SearchGridResultDao.createTable(sqLiteDatabase, z);
        GroupMemberDao.createTable(sqLiteDatabase, z);
        GroupMemberListDao.createTable(sqLiteDatabase, z);
        GroupRoleMemberDao.createTable(sqLiteDatabase, z);
        GroupRoleMemberListDao.createTable(sqLiteDatabase, z);
        UserDao.createTable(sqLiteDatabase, z);
        FriendDao.createTable(sqLiteDatabase, z);
        UserNameDao.createTable(sqLiteDatabase, z);
        UserPicDao.createTable(sqLiteDatabase, z);
        ChatMessageDao.createTable(sqLiteDatabase, z);
        ChatterDao.createTable(sqLiteDatabase, z);
    }

    public static void dropAllTables(SQLiteDatabase sqLiteDatabase, boolean z) {
        CachedResponseDao.dropTable(sqLiteDatabase, z);
        CachedAssetDao.dropTable(sqLiteDatabase, z);
        MoneyTransactionDao.dropTable(sqLiteDatabase, z);
        MuteListCachedDataDao.dropTable(sqLiteDatabase, z);
        SearchGridResultDao.dropTable(sqLiteDatabase, z);
        GroupMemberDao.dropTable(sqLiteDatabase, z);
        GroupMemberListDao.dropTable(sqLiteDatabase, z);
        GroupRoleMemberDao.dropTable(sqLiteDatabase, z);
        GroupRoleMemberListDao.dropTable(sqLiteDatabase, z);
        UserDao.dropTable(sqLiteDatabase, z);
        FriendDao.dropTable(sqLiteDatabase, z);
        UserNameDao.dropTable(sqLiteDatabase, z);
        UserPicDao.dropTable(sqLiteDatabase, z);
        ChatMessageDao.dropTable(sqLiteDatabase, z);
        ChatterDao.dropTable(sqLiteDatabase, z);
    }

    @Override
    public DaoSession newSession() {
        return new DaoSession(this.db, IdentityScopeType.Session, this.daoConfigMap);
    }

    @Override
    public DaoSession newSession(IdentityScopeType identityScopeType) {
        return new DaoSession(this.db, identityScopeType, this.daoConfigMap);
    }
}
