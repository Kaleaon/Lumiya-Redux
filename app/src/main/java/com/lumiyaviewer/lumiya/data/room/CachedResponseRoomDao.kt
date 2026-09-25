package com.lumiyaviewer.lumiya.data.room

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update

@Dao
interface CachedResponseRoomDao {
    @Query("SELECT * FROM CachedResponses WHERE `KEY` = :key LIMIT 1")
    fun load(key: String): CachedResponseEntity?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insertOrReplace(entity: CachedResponseEntity)

    @Update
    fun update(entity: CachedResponseEntity)
}
