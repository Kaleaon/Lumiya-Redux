package com.lumiyaviewer.lumiya.data.room

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import java.io.File

@Database(
    entities = [CachedResponseEntity::class, UserPicEntity::class, SearchGridResultEntity::class],
    version = 1,
    exportSchema = false
)
@TypeConverters(RoomConverters::class)
abstract class LumiyaRoomDatabase : RoomDatabase() {

    abstract fun cachedResponseDao(): CachedResponseRoomDao

    abstract fun userPicDao(): UserPicRoomDao

    abstract fun searchGridResultDao(): SearchGridResultRoomDao

    companion object {
        @JvmStatic
        fun open(context: Context, dbFile: File): LumiyaRoomDatabase {
            return Room.databaseBuilder(context, LumiyaRoomDatabase::class.java, dbFile.name)
                .fallbackToDestructiveMigration()
                .build()
        }
    }
}
