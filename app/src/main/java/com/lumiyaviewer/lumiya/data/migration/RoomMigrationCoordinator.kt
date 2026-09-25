package com.lumiyaviewer.lumiya.data.migration

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import androidx.preference.PreferenceManager
import androidx.sqlite.db.SupportSQLiteDatabase
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.data.room.CachedResponseEntity
import com.lumiyaviewer.lumiya.data.room.LumiyaRoomDatabase
import com.lumiyaviewer.lumiya.data.room.SearchGridResultEntity
import com.lumiyaviewer.lumiya.data.room.UserPicEntity
import java.io.File
import java.util.UUID

class RoomMigrationCoordinator private constructor() {
    companion object {
        @JvmStatic
        fun migrateIfNeeded(userId: UUID, greenDbFile: File, roomDb: LumiyaRoomDatabase) {
            val preferenceKey = "room_migrated_v1_$userId"
            val preferences = PreferenceManager.getDefaultSharedPreferences(LumiyaApp.getContext())
            if (preferences.getBoolean(preferenceKey, false)) return

            SQLiteDatabase.openDatabase(
                greenDbFile.absolutePath,
                null,
                SQLiteDatabase.OPEN_READONLY
            ).use { greenDb ->
                migrateCachedResponses(greenDb, roomDb)
                migrateUserPics(greenDb, roomDb)
                migrateSearchGridResults(greenDb, roomDb)
                validateParity(greenDb, roomDb)
            }
            preferences.edit().putBoolean(preferenceKey, true).apply()
        }

        private fun migrateCachedResponses(db: SQLiteDatabase, roomDb: LumiyaRoomDatabase) {
            db.rawQuery("SELECT KEY, DATA, MUST_REVALIDATE FROM CachedResponses", null).use { cursor ->
                while (cursor.moveToNext()) {
                    roomDb.cachedResponseDao().insertOrReplace(CachedResponseEntity().also { entity ->
                        entity.key = cursor.getString(0)
                        entity.data = cursor.blobOrNull(1)
                        entity.mustRevalidate = cursor.getInt(2) != 0
                    })
                }
            }
        }

        private fun migrateUserPics(db: SQLiteDatabase, roomDb: LumiyaRoomDatabase) {
            db.rawQuery("SELECT _id, UUID, BITMAP FROM USER_PIC", null).use { cursor ->
                while (cursor.moveToNext()) {
                    roomDb.userPicDao().insertOrReplace(UserPicEntity().also { entity ->
                        entity.id = cursor.longOrNull(0)
                        entity.uuid = cursor.stringOrNull(1)
                        entity.bitmap = cursor.blobOrNull(2)
                    })
                }
            }
        }

        private fun migrateSearchGridResults(db: SQLiteDatabase, roomDb: LumiyaRoomDatabase) {
            val query = "SELECT _id, SEARCH_UUID, ITEM_TYPE, ITEM_UUID, ITEM_NAME, " +
                "LEVENSTEIN_DISTANCE, MEMBER_COUNT FROM SearchGridResults"
            db.rawQuery(query, null).use { cursor ->
                while (cursor.moveToNext()) {
                    roomDb.searchGridResultDao().insert(SearchGridResultEntity().also { entity ->
                        entity.id = cursor.longOrNull(0)
                        entity.searchUUID = UUID.fromString(cursor.getString(1))
                        entity.itemType = cursor.getInt(2)
                        entity.itemUUID = UUID.fromString(cursor.getString(3))
                        entity.itemName = cursor.getString(4)
                        entity.levensteinDistance = cursor.getInt(5)
                        entity.memberCount = cursor.intOrNull(6)
                    })
                }
            }
        }

        private fun validateParity(greenDb: SQLiteDatabase, roomDb: LumiyaRoomDatabase) {
            validateTable(
                greenDb,
                roomDb,
                "CachedResponses",
                "KEY || ':' || LENGTH(COALESCE(DATA, x'')) || ':' || MUST_REVALIDATE"
            )
            validateTable(
                greenDb,
                roomDb,
                "USER_PIC",
                "COALESCE(UUID,'') || ':' || LENGTH(COALESCE(BITMAP, x''))"
            )
            validateTable(
                greenDb,
                roomDb,
                "SearchGridResults",
                "SEARCH_UUID || ':' || ITEM_TYPE || ':' || ITEM_UUID || ':' || ITEM_NAME || ':' || " +
                    "LEVENSTEIN_DISTANCE || ':' || COALESCE(MEMBER_COUNT,-1)"
            )
        }

        private fun validateTable(
            greenDb: SQLiteDatabase,
            roomDb: LumiyaRoomDatabase,
            table: String,
            hashExpression: String
        ) {
            val roomDatabase = roomDb.openHelper.writableDatabase
            val greenCount = greenDb.singleLong("SELECT COUNT(*) FROM $table")
            val roomCount = roomDatabase.singleLong("SELECT COUNT(*) FROM $table")
            val greenHash = greenDb.singleLong("SELECT abs(sum(length($hashExpression))) FROM $table")
            val roomHash = roomDatabase.singleLong("SELECT abs(sum(length($hashExpression))) FROM $table")
            Debug.Printf(
                "Room parity table=%s greenCount=%d roomCount=%d greenHash=%d roomHash=%d",
                table,
                greenCount,
                roomCount,
                greenHash,
                roomHash
            )
        }

        private fun SQLiteDatabase.singleLong(query: String): Long =
            rawQuery(query, null).use { it.firstLongOrZero() }

        private fun SupportSQLiteDatabase.singleLong(query: String): Long =
            query(query).use { it.firstLongOrZero() }

        private fun Cursor.firstLongOrZero(): Long = if (moveToFirst()) getLong(0) else 0L

        private fun Cursor.longOrNull(column: Int): Long? = if (isNull(column)) null else getLong(column)

        private fun Cursor.intOrNull(column: Int): Int? = if (isNull(column)) null else getInt(column)

        private fun Cursor.stringOrNull(column: Int): String? = if (isNull(column)) null else getString(column)

        private fun Cursor.blobOrNull(column: Int): ByteArray? = if (isNull(column)) null else getBlob(column)
    }
}
