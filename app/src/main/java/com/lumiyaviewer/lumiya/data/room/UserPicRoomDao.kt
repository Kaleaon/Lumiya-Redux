package com.lumiyaviewer.lumiya.data.room

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query

@Dao
interface UserPicRoomDao {
    @Query("SELECT * FROM USER_PIC WHERE UUID = :uuid LIMIT 1")
    fun loadByUuid(uuid: String): UserPicEntity?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insertOrReplace(entity: UserPicEntity): Long
}
