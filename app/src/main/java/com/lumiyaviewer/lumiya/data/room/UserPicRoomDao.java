package com.lumiyaviewer.lumiya.data.room;

import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;

@Dao
public interface UserPicRoomDao {
    @Query("SELECT * FROM USER_PIC WHERE UUID = :uuid LIMIT 1")
    UserPicEntity loadByUuid(String uuid);

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    long insertOrReplace(UserPicEntity entity);
}
