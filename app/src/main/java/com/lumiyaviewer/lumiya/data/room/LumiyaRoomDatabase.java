package com.lumiyaviewer.lumiya.data.room;

import android.content.Context;
import androidx.annotation.NonNull;
import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;
import androidx.room.TypeConverters;
import java.io.File;

@Database(
        entities = {CachedResponseEntity.class, UserPicEntity.class, SearchGridResultEntity.class},
        version = 1,
        exportSchema = false
)
@TypeConverters(RoomConverters.class)
public abstract class LumiyaRoomDatabase extends RoomDatabase {

    public abstract CachedResponseRoomDao cachedResponseDao();

    public abstract UserPicRoomDao userPicDao();

    public abstract SearchGridResultRoomDao searchGridResultDao();

    @NonNull
    public static LumiyaRoomDatabase open(@NonNull Context context, @NonNull File dbFile) {
        return Room.databaseBuilder(context, LumiyaRoomDatabase.class, dbFile.getName())
                .fallbackToDestructiveMigration()
                .build();
    }
}
