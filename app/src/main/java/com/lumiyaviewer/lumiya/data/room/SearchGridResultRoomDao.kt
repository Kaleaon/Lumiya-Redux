package com.lumiyaviewer.lumiya.data.room

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import java.util.UUID

@Dao
interface SearchGridResultRoomDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insert(entity: SearchGridResultEntity): Long

    @Query("DELETE FROM SearchGridResults WHERE SEARCH_UUID <> :searchUUID")
    fun deleteOtherQueries(searchUUID: UUID)

    @Query("SELECT * FROM SearchGridResults WHERE SEARCH_UUID = :searchUUID ORDER BY LEVENSTEIN_DISTANCE ASC")
    fun loadBySearch(searchUUID: UUID): List<SearchGridResultEntity>
}
