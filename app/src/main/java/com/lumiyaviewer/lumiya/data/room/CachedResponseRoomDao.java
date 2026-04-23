package com.lumiyaviewer.lumiya.data.room;

import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;

@Dao
public interface CachedResponseRoomDao {
    @Query("SELECT * FROM CachedResponses WHERE `KEY` = :key LIMIT 1")
    CachedResponseEntity load(String key);

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    void insertOrReplace(CachedResponseEntity entity);

    @Update
    void update(CachedResponseEntity entity);
}
