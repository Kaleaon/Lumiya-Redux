package com.lumiyaviewer.lumiya.dao;

import com.lumiyaviewer.lumiya.GlobalOptions;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.data.migration.RoomMigrationCoordinator;
import com.lumiyaviewer.lumiya.data.room.LumiyaRoomDatabase;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Nullable;

/* loaded from: classes.dex */
public class DaoManager {
    private static final Object lock = new Object();
    private static final Map<UUID, DaoSession> userDaoSessions = new HashMap();
    private static final Map<UUID, LumiyaRoomDatabase> userRoomDatabases = new HashMap();
    private static final Map<DaoSession, LumiyaRoomDatabase> roomBySession = new HashMap();

    @Nullable
    public static DaoSession getUserDaoSession(@Nullable UUID uuid) {
        DaoSession daoSession;
        if (uuid == null) {
            return null;
        }
        synchronized (lock) {
            daoSession = userDaoSessions.get(uuid);
            if (daoSession == null) {
                File dbDir = GlobalOptions.getInstance().getCacheDir("database");
                File greenDbFile = new File(dbDir, "userdb-" + uuid.toString() + ".db");
                daoSession = new DaoMaster(new DBOpenHelper(LumiyaApp.getContext(), greenDbFile.getAbsolutePath(), null).getWritableDatabase()).newSession();
                LumiyaRoomDatabase roomDb = userRoomDatabases.get(uuid);
                if (roomDb == null) {
                    roomDb = LumiyaRoomDatabase.open(LumiyaApp.getContext(), new File(dbDir, "userdb-room-" + uuid.toString() + ".db"));
                    userRoomDatabases.put(uuid, roomDb);
                    RoomMigrationCoordinator.migrateIfNeeded(uuid, greenDbFile, roomDb);
                }
                roomBySession.put(daoSession, roomDb);
                userDaoSessions.put(uuid, daoSession);
            }
        }
        return daoSession;
    }

    @Nullable
    public static LumiyaRoomDatabase getRoomDatabase(@Nullable DaoSession daoSession) {
        synchronized (lock) {
            return roomBySession.get(daoSession);
        }
    }
}

