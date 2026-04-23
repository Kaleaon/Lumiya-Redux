package com.lumiyaviewer.lumiya.data.migration;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.preference.PreferenceManager;
import androidx.annotation.NonNull;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.data.room.CachedResponseEntity;
import com.lumiyaviewer.lumiya.data.room.LumiyaRoomDatabase;
import com.lumiyaviewer.lumiya.data.room.SearchGridResultEntity;
import com.lumiyaviewer.lumiya.data.room.UserPicEntity;
import java.io.File;
import java.util.UUID;

public final class RoomMigrationCoordinator {
    private RoomMigrationCoordinator() {}

    public static void migrateIfNeeded(@NonNull UUID userId, @NonNull File greenDbFile, @NonNull LumiyaRoomDatabase roomDb) {
        String prefKey = "room_migrated_v1_" + userId;
        if (PreferenceManager.getDefaultSharedPreferences(LumiyaApp.getContext()).getBoolean(prefKey, false)) {
            return;
        }
        SQLiteDatabase greenDb = SQLiteDatabase.openDatabase(greenDbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY);
        try {
            migrateCachedResponses(greenDb, roomDb);
            migrateUserPics(greenDb, roomDb);
            migrateSearchGridResults(greenDb, roomDb);
            validateParity(greenDb, roomDb);
            PreferenceManager.getDefaultSharedPreferences(LumiyaApp.getContext()).edit().putBoolean(prefKey, true).apply();
        } finally {
            greenDb.close();
        }
    }

    private static void migrateCachedResponses(SQLiteDatabase db, LumiyaRoomDatabase roomDb) {
        Cursor cursor = db.rawQuery("SELECT KEY, DATA, MUST_REVALIDATE FROM CachedResponses", null);
        try {
            while (cursor.moveToNext()) {
                CachedResponseEntity entity = new CachedResponseEntity();
                entity.key = cursor.getString(0);
                entity.data = cursor.isNull(1) ? null : cursor.getBlob(1);
                entity.mustRevalidate = cursor.getInt(2) != 0;
                roomDb.cachedResponseDao().insertOrReplace(entity);
            }
        } finally {
            cursor.close();
        }
    }

    private static void migrateUserPics(SQLiteDatabase db, LumiyaRoomDatabase roomDb) {
        Cursor cursor = db.rawQuery("SELECT _id, UUID, BITMAP FROM USER_PIC", null);
        try {
            while (cursor.moveToNext()) {
                UserPicEntity entity = new UserPicEntity();
                entity.id = cursor.isNull(0) ? null : cursor.getLong(0);
                entity.uuid = cursor.isNull(1) ? null : cursor.getString(1);
                entity.bitmap = cursor.isNull(2) ? null : cursor.getBlob(2);
                roomDb.userPicDao().insertOrReplace(entity);
            }
        } finally {
            cursor.close();
        }
    }

    private static void migrateSearchGridResults(SQLiteDatabase db, LumiyaRoomDatabase roomDb) {
        Cursor cursor = db.rawQuery("SELECT _id, SEARCH_UUID, ITEM_TYPE, ITEM_UUID, ITEM_NAME, LEVENSTEIN_DISTANCE, MEMBER_COUNT FROM SearchGridResults", null);
        try {
            while (cursor.moveToNext()) {
                SearchGridResultEntity entity = new SearchGridResultEntity();
                entity.id = cursor.isNull(0) ? null : cursor.getLong(0);
                entity.searchUUID = UUID.fromString(cursor.getString(1));
                entity.itemType = cursor.getInt(2);
                entity.itemUUID = UUID.fromString(cursor.getString(3));
                entity.itemName = cursor.getString(4);
                entity.levensteinDistance = cursor.getInt(5);
                entity.memberCount = cursor.isNull(6) ? null : cursor.getInt(6);
                roomDb.searchGridResultDao().insert(entity);
            }
        } finally {
            cursor.close();
        }
    }

    private static void validateParity(SQLiteDatabase greenDb, LumiyaRoomDatabase roomDb) {
        validateTable(greenDb, roomDb, "CachedResponses", "KEY || ':' || LENGTH(COALESCE(DATA, x'')) || ':' || MUST_REVALIDATE");
        validateTable(greenDb, roomDb, "USER_PIC", "COALESCE(UUID,'') || ':' || LENGTH(COALESCE(BITMAP, x''))");
        validateTable(greenDb, roomDb, "SearchGridResults", "SEARCH_UUID || ':' || ITEM_TYPE || ':' || ITEM_UUID || ':' || ITEM_NAME || ':' || LEVENSTEIN_DISTANCE || ':' || COALESCE(MEMBER_COUNT,-1)");
    }

    private static void validateTable(SQLiteDatabase greenDb, LumiyaRoomDatabase roomDb, String table, String hashExpr) {
        long gCount = singleLong(greenDb, "SELECT COUNT(*) FROM " + table);
        long rCount = singleLong(roomDb.getOpenHelper().getWritableDatabase(), "SELECT COUNT(*) FROM " + table);
        long gHash = singleLong(greenDb, "SELECT abs(sum(length(" + hashExpr + "))) FROM " + table);
        long rHash = singleLong(roomDb.getOpenHelper().getWritableDatabase(), "SELECT abs(sum(length(" + hashExpr + "))) FROM " + table);
        Debug.Printf("Room parity table=%s greenCount=%d roomCount=%d greenHash=%d roomHash=%d", table, gCount, rCount, gHash, rHash);
    }

    private static long singleLong(SQLiteDatabase db, String query) {
        Cursor cursor = db.rawQuery(query, null);
        try {
            if (cursor.moveToFirst()) {
                return cursor.getLong(0);
            }
            return 0L;
        } finally {
            cursor.close();
        }
    }

    private static long singleLong(androidx.sqlite.db.SupportSQLiteDatabase db, String query) {
        Cursor cursor = db.query(query);
        try {
            if (cursor.moveToFirst()) {
                return cursor.getLong(0);
            }
            return 0L;
        } finally {
            cursor.close();
        }
    }
}
