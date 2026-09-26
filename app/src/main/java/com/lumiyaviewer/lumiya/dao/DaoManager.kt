package com.lumiyaviewer.lumiya.dao

import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.data.migration.RoomMigrationCoordinator
import com.lumiyaviewer.lumiya.data.room.LumiyaRoomDatabase
import java.io.File
import java.util.UUID

object DaoManager {
    private val lock = Any()
    private val userDaoSessions = HashMap<UUID, DaoSession>()
    private val userRoomDatabases = HashMap<UUID, LumiyaRoomDatabase>()
    private val roomBySession = HashMap<DaoSession, LumiyaRoomDatabase>()

    @JvmStatic
    fun getUserDaoSession(uuid: UUID?): DaoSession? {
        if (uuid == null) {
            return null
        }
        synchronized(lock) {
            var daoSession = userDaoSessions[uuid]
            if (daoSession == null) {
                val dbDir = GlobalOptions.getInstance().getCacheDir("database")
                val greenDbFile = File(dbDir, "userdb-$uuid.db")
                daoSession = DaoMaster(
                    DBOpenHelper(LumiyaApp.getContext(), greenDbFile.absolutePath, null).writableDatabase
                ).newSession()
                var roomDb = userRoomDatabases[uuid]
                if (roomDb == null) {
                    roomDb = LumiyaRoomDatabase.open(LumiyaApp.getContext(), File(dbDir, "userdb-room-$uuid.db"))
                    userRoomDatabases[uuid] = roomDb
                    RoomMigrationCoordinator.migrateIfNeeded(uuid, greenDbFile, roomDb)
                }
                roomBySession[daoSession] = roomDb
                userDaoSessions[uuid] = daoSession
            }
            return daoSession
        }
    }

    @JvmStatic
    fun getRoomDatabase(daoSession: DaoSession?): LumiyaRoomDatabase? {
        synchronized(lock) {
            return roomBySession[daoSession]
        }
    }
}
